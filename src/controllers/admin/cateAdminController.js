const general = require('../../models/general.model')
const cate = require('../../models/admin/cateAdmin.model')
const product = require('../../models/admin/productAdmin.model')
const cateAdminController = () => { }
const path = require('path');
const fs = require('fs').promises;
const uploadDirCategories = path.join(__dirname, '..', '..', 'public', 'imgs', 'categories');
const uploadDirProductsBase = path.join(__dirname, '..', '..', 'public', 'imgs', 'product_image');

fs.mkdir(uploadDirCategories, { recursive: true }).catch(console.error);
fs.mkdir(uploadDirProductsBase, { recursive: true }).catch(console.error);
// [GET] /categories_admin/searchkey=?&page=?
cateAdminController.getCategories = async (req, res) => {
    const title = 'QUẢN LÝ DANH MỤC SẢN PHẨM'
    // lấy từ khóa searchKey=?
    let admin = req.admin
    let searchKey = req.query.searchKey
    let page = req.query.page ? req.query.page : 1
    let limit = 10

    let categories = await cate.getCategories(searchKey, page, limit)
    let formatFunction = await general.formatFunction()

    res.status(200).render('admin/pages/cate_admin', {
        title: title,
        admin: admin,
        data: categories,
        formatFunction: formatFunction,
    })
}

// [GET] /categories_admin/searchkey=?&page=?
cateAdminController.getProducts = async (req, res) => {
    const title = 'QUẢN LÝ SẢN PHẨM'
    // lấy từ khóa searchKey=?
    let admin = req.admin
    let searchKey = req.query.searchKey
    let page = req.query.page ? req.query.page : 1
    let limit = 10

    let products = await cate.getProducts(searchKey, page, limit)
    let formatFunction = await general.formatFunction()

    res.status(200).render('admin/pages/product_admin', {
        title: title,
        admin: admin,
        data: products,
        formatFunction: formatFunction,
    })
}
// [GET] /categories_admin/add
cateAdminController.showaddCategories = async (req, res) => {
    try {
        const title = 'Thêm danh mục sản phẩm';
        const admin = req.admin || {}; // Lấy thông tin admin nếu có

        res.status(200).render('admin/pages/cate_view_admin', {
            title: title,
            admin: admin,
            breadcrumb: [
                { text: 'Danh mục sản phẩm', link: '/admin/categories_admin' },
                { text: 'Thêm', link: '#' }
            ]
        });
    } catch (error) {
        console.error('Lỗi:', error);
        res.status(500).json({ message: 'Lỗi server khi hiển thị trang thêm danh mục' });
    }
}
// [POST] /categories_admin/add
cateAdminController.addCategories = async (req, res) => {
    try {
        const { category_name, category_type } = req.body;
        let category_img = null;

        if (!category_name || !category_type) {
            return res.status(400).json({ message: 'Tên danh mục và loại danh mục là bắt buộc' });
        }

        if (req.file) {
            const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
            const fileExtension = path.extname(req.file.originalname);
            category_img = `${uniqueSuffix}${fileExtension}`;
            await fs.writeFile(path.join(uploadDirCategories, category_img), req.file.buffer);
        }

        const categoryId = await cate.addCategory(category_name, category_type, category_img || null);

        res.status(200).json({ message: 'Thêm danh mục thành công', category_id: categoryId });
    } catch (error) {
        console.error('Lỗi:', error);
        res.status(500).json({ message: 'Lỗi server khi thêm danh mục' });
    }
}
// [GET] /products_admin/add
cateAdminController.showaddProducts = async (req, res) => {
    try {
        const title = 'Thêm sản phẩm';
        const admin = req.admin || {};
        const categories = await general.getCates(); // Lấy danh sách danh mục để hiển thị trong dropdown

        res.status(200).render('admin/pages/product_view_admin', {
            title: title,
            admin: admin,
            categories: categories,
            breadcrumb: [
                { text: 'Sản phẩm', link: '/admin/products_admin' },
                { text: 'Thêm', link: '#' }
            ]
        });
    } catch (error) {
        console.error('Lỗi:', error);
        res.status(500).json({ message: 'Lỗi server khi hiển thị trang thêm sản phẩm' });
    }
};
// [POST] /products_admin/add
cateAdminController.addProducts = async (req, res) => {
    try {
        // Lấy dữ liệu từ req.body và req.files
        const { productName, categoryId, description, variants, details } = req.body;
        const images = req.files || [];
        console.log('uploadDirProductsBase:', uploadDirProductsBase);
        console.log(req.body);
        console.log(req.files);
        // Kiểm tra các trường bắt buộc
        if (!productName || !categoryId || !description) {
            return res.status(400).json({ success: false, message: 'Tên sản phẩm, danh mục và mô tả là bắt buộc!' });
        }
        if (images.length === 0) {
            return res.status(400).json({ success: false, message: 'Phải có ít nhất một ảnh sản phẩm!' });
        }
        // Parse variants và details từ chuỗi JSON
        let parsedVariants, parsedDetails;
        try {
            parsedVariants = JSON.parse(variants);
            parsedDetails = JSON.parse(details);
        } catch (error) {
            return res.status(400).json({ success: false, message: 'Dữ liệu variants hoặc details không hợp lệ!' });
        }

        // Kiểm tra dữ liệu variants
        if (!Array.isArray(parsedVariants) || parsedVariants.length === 0) {
            return res.status(400).json({ success: false, message: 'Phải có ít nhất một biến thể!' });
        }
        for (const variant of parsedVariants) {
            if (!variant.name || !variant.price || !variant.stock || variant.price < 0 || variant.stock < 0) {
                return res.status(400).json({ success: false, message: 'Dữ liệu biến thể không hợp lệ!' });
            }
        }

        // Kiểm tra dữ liệu details
        if (!Array.isArray(parsedDetails) || parsedDetails.length === 0) {
            return res.status(400).json({ success: false, message: 'Phải có ít nhất một thông số chi tiết!' });
        }
        for (const detail of parsedDetails) {
            if (!detail.spec_name || !detail.spec_value) {
                return res.status(400).json({ success: false, message: 'Dữ liệu chi tiết sản phẩm không hợp lệ!' });
            }
        }

        // Lưu ảnh vào thư mục tạm
        const tempDir = path.join(uploadDirProductsBase, 'temp'); // Sử dụng thư mục tạm
        console.log('Tạo thư mục tạm:', tempDir);
        await fs.mkdir(tempDir, { recursive: true });

        const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
        const imagePaths = [];
        for (let i = 0; i < images.length; i++) {
            const file = images[i];
            const fileExtension = path.extname(file.originalname);
            const filename = `${i === 0 ? 'avatar' : 'image'}-temp-${i}-${uniqueSuffix}${fileExtension}`;
            const filePath = path.join(tempDir, filename);

            if (!file.buffer || file.buffer.length === 0) {
                throw new Error(`File buffer rỗng cho ảnh ${file.originalname}`);
            }

            console.log(`Lưu file: ${filePath}`);
            await fs.writeFile(filePath, file.buffer);

            try {
                await fs.access(filePath);
                console.log(`File ${filePath} đã được lưu thành công`);
            } catch {
                throw new Error(`Không thể lưu file ${filePath}`);
            }

            imagePaths.push(`temp/${filename}`);
        }

        // Thêm sản phẩm để lấy productId
        const productId = await product.addProduct({
            productName,
            categoryId: parseInt(categoryId), // Chuyển thành số nếu cần
            description,
            mainImage: null
        });

        // Thêm tiền tố 'P' vào productId
        const productDirName = `P${productId}`; // Ví dụ: P61
        const productDir = path.join(uploadDirProductsBase, productDirName);
        console.log('Tạo thư mục sản phẩm:', productDir);
        await fs.mkdir(productDir, { recursive: true });

        const finalImagePaths = [];
        for (let i = 0; i < images.length; i++) {
            const oldPath = path.join(uploadDirProductsBase, imagePaths[i]);
            const filename = `${productDirName}_${i === 0 ? 'avt' : i}${path.extname(images[i].originalname)}`; // Ví dụ: P61_avt.jpg, P61_1.jpg
            const newPath = path.join(productDir, filename);

            try {
                await fs.access(oldPath);
                console.log(`File ${oldPath} tồn tại, đổi tên sang ${newPath}`);
            } catch {
                throw new Error(`File ${oldPath} không tồn tại`);
            }

            await fs.rename(oldPath, newPath);
            finalImagePaths.push(`${productDirName}/${filename}`); // Ví dụ: P61/P61_avt.jpg
        }

        // Trích xuất chỉ tên file từ finalImagePaths
        const finalImageFilenames = finalImagePaths.map(path => path.split('/').pop()); // Lấy tên file cuối cùng, ví dụ: P61_avt.jpg, P61_1.jpg

        // Cập nhật mainImage cho sản phẩm
        await product.updateProductAvatar(productId, finalImageFilenames[0]); // Sử dụng P61_avt.jpg

        // Thêm tất cả ảnh vào bảng product_img
        await product.addProductImages(productId, finalImageFilenames); // Sử dụng danh sách tên file: [P61_avt.jpg, P61_1.jpg, ...]

        // Thêm biến thể và chi tiết
        await product.addProductVariants(productId, parsedVariants);
        await product.addProductDetails(productId, parsedDetails);

        // Xóa thư mục tạm
        console.log('Xóa thư mục tạm:', tempDir);
        await fs.rm(tempDir, { recursive: true, force: true });

        res.status(200).json({ success: true, message: 'Thêm sản phẩm thành công', productId });
    } catch (error) {
        console.error('Lỗi khi thêm sản phẩm:', error);
        res.status(500).json({ success: false, message: 'Lỗi server khi thêm sản phẩm' });
    }
};
// [POST] /categories_admin/delete
cateAdminController.deleteCategory = async (req, res) => {
    const { categoryIds } = req.body;

    //Kiểm tra categoryIds có tồn tại và là mảng không
    if (!Array.isArray(categoryIds) || categoryIds.length === 0) {
        return res.status(400).json({
            success: false,
            message: 'Danh sách ID category không hợp lệ hoặc rỗng.'
        });
    }
    try {
        const affectedRows = await cate.deleteCategory(categoryIds);
        if (affectedRows === 0) {
            return res.status(404).json({
                success: false,
                message: 'Không tìm thấy danh mục sản phẩm để xóa'
            })
        }
        return res.status(200).json({
            success: true,
            message: `Đã xóa ${affectedRows} danh mục sản phẩm thành công.`
        });
    } catch (error) {
        console.error('Lỗi khi xóa sản phẩm:', error);
        return res.status(500).json({
            success: false,
            message: 'Đã xảy ra lỗi khi xóa danh mục sản phẩm. Vui lòng thử lại.'
        });
    }
}

// [POST] //admin/products_admin/delete
cateAdminController.deleteProduct = async (req, res) => {
    const { productVariantIds } = req.body;

    //Kiểm tra productIds có tồn tại và là mảng không
    if (!Array.isArray(productVariantIds) || productVariantIds.length === 0) {
        return res.status(400).json({
            success: false,
            message: 'Danh sách ID sản phẩm không hợp lệ hoặc rỗng.'
        });
    }
    try {
        const affectedRows = await product.deleteProduct(productVariantIds);
        if (affectedRows === 0) {
            return res.status(404).json({
                success: false,
                message: 'Không tìm thấy sản phẩm để xóa'
            })
        }
        return res.status(200).json({
            success: true,
            message: `Đã xóa ${affectedRows} sản phẩm thành công.`
        });
    } catch (error) {
        console.error('Lỗi khi xóa sản phẩm:', error);
        return res.status(500).json({
            success: false,
            message: 'Đã xảy ra lỗi khi xóa sản phẩm. Vui lòng thử lại.'
        });
    }
};
// [GET] admin/products_admin/edit/:id
cateAdminController.getProductEdit = async (req, res) => {
    try {
        const title = 'Chỉnh sửa sản phẩm';
        const admin = req.admin || {};
        const productVariantId = req.params.id;
        console.log(productVariantId);
        const productVariant = await general.getVariantProduct(productVariantId);
        console.log(productVariant);
        res.status(200).render('admin/pages/product_edit', {
            title: title,
            admin: admin,
            productVariant: productVariant
        });
    } catch (error) {
        console.error('Lỗi:', error);
        res.status(500).json({ message: 'Lỗi server khi hiển thị trang thêm sản phẩm' });
    }
}
//[POST] admin/products_admin/edit/:id
cateAdminController.editProduct = async (req, res) => {
    try {

        const { product_variant_id, product_name, product_variant_name, product_variant_available, product_variant_price } = req.body;
        console.log(product_variant_id);
        // Kiểm tra dữ liệu đầu vào
        if (!product_name || !product_variant_name || !product_variant_available || !product_variant_price) {
            return res.status(400).json({ success: false, message: 'Vui lòng điền đầy đủ các trường bắt buộc' });
        }
        // Lấy product_id và product_avt_img từ cơ sở dữ liệu
        const product_id = await product.getProductIdByVariantId(product_variant_id);
        const product_avt_img = await product.getProductAvatarByProductId(product_id);
        const productName = await product.updateProductName(product_name, product_id);
        // Xử lý file ảnh nếu có
        if (req.file) {
            if (!currentImage) {
                return res.status(400).json({ success: false, message: 'Sản phẩm hiện tại không có ảnh để ghi đè' });
            }
            const filePath = path.join(uploadDirProductsBase, `P${product_id}`, currentImage);
            await fs.mkdir(path.dirname(filePath), { recursive: true });
            await fs.writeFile(filePath, req.file.buffer);
            // Không cần cập nhật product_avt_img trong bảng products vì tên file không đổi
        }
        const updates = {
            product_variant_name,
            product_variant_available: parseInt(product_variant_available),
            product_variant_price: parseFloat(product_variant_price)
        };
        const result = await product.updateProductVariant(product_variant_id, updates);
        if (result === 0) {
            return res.status(404).json({ success: false, message: 'Không tìm thấy biến thể sản phẩm với ID này' });
        }

        res.status(200).json({ success: true, message: 'Cập nhật sản phẩm thành công' });
    } catch (error) {
        console.error('Lỗi khi cập nhật sản phẩm:', error);
        res.status(500).json({ success: false, message: error.message || 'Lỗi server khi cập nhật sản phẩm' });
    }
}
module.exports = cateAdminController