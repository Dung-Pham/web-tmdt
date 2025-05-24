const db = require('../../config/db/connect');
const util = require('node:util')
const query = util.promisify(db.query).bind(db)

const productAdmin = function () { }

productAdmin.deleteProduct = async (productVariantIds) => {
    const placeholders = productVariantIds.map(() => '?').join(',');
    const sql = `UPDATE product_variants SET product_variant_is_display = 0 WHERE product_variant_id IN (${placeholders})`;
    const result = await query(sql, productVariantIds);
    return result.affectedRows;
}
productAdmin.addProduct = async (productData) => {
    const { productName, categoryId, description, mainImage } = productData;
    const sql = 'INSERT INTO products (category_id,product_name, product_avt_img, product_description) VALUES (?, ?, ?, ?)';
    const productResult = await query(sql, [categoryId, productName, mainImage || null, description || '']);
    const productId = productResult.insertId;
    return productId;
}
productAdmin.updateProductAvatar = async (productId, mainImage) => {
    const sql = 'UPDATE products SET product_avt_img = ? WHERE product_id = ?';
    const result = await query(sql, [mainImage, productId]);
    return result.affectedRows;
}
productAdmin.addProductImages = async (productId, images) => {
    const placeholders = images.map(() => '(?, ?)').join(',');
    const sql = `INSERT INTO product_imgs (product_id, image_name) VALUES ${placeholders}`;
    const params = images.reduce((acc, image) => [...acc, productId, image], []);
    const result = await query(sql, params);
    return result.affectedRows;
}
productAdmin.addProductVariants = async (productId, variants) => {
    const placeholders = variants.map(() => '(?,?,?,?)').join(',');
    const sql = `INSERT INTO product_variants (product_id, product_variant_name, product_variant_price, product_variant_available) VALUES ${placeholders}`;
    const params = variants.reduce((acc, variant) => [
        ...acc,
        productId,
        variant.name,
        variant.price,
        variant.stock
    ], []);
    const result = await query(sql, params);
    return result.affectedRows;
}
productAdmin.addProductDetails = async (productId, details) => {
    const placeholders = details.map(() => '(?, ?, ?)').join(',');
    const sql = `
            INSERT INTO product_details (product_id, product_detail_name, product_detail_value)
            VALUES ${placeholders}
        `;
    const params = details.reduce((acc, detail) => [
        ...acc,
        productId,
        detail.spec_name,
        detail.spec_value
    ], []);
    const result = await query(sql, params);
    return result.affectedRows;
}
//Lấy product_id từ product_variants dựa trên product_variant_id
productAdmin.getProductIdByVariantId = async (productVariantId) => {
    const sql = 'SELECT product_id FROM product_variants WHERE product_variant_id = ?';
    const result = await query(sql, [productVariantId]);
    return result.product_id;
}
// Lấy product_avt_img từ products dựa trên product_id
productAdmin.getProductAvatarByProductId = async (productId) => {
    const sql = 'SELECT product_avt_img FROM products WHERE product_id = ?';
    const result = await query(sql, [productId]);
    return result.product_avt_img;
}
productAdmin.updateProductName = async (productName, productId) => {
    const sql = 'UPDATE products SET product_name = ? where product_id = ?';
    const result = await query(sql, [productName, productId]);
    return result.product_name;
}
productAdmin.updateProductVariant = async (productVariantId, updates) => {
    const sql = 'UPDATE product_variants SET product_variant_name=?, product_variant_price=?, product_variant_available=? WHERE product_variant_id = ?';
    const result = await query(sql, [updates.product_variant_name, updates.product_variant_price, updates.product_variant_available, productVariantId]);
    return result.affectedRows;
}
module.exports = productAdmin; 
