const db = require('../../config/db/connect');
const util = require('node:util')
const query = util.promisify(db.query).bind(db)

const cateAdmin = function () { }

cateAdmin.getCategories = async (searchKey, page, limit) => {
    let getRowSQL = "SELECT COUNT(*) as total FROM view_cate_admin"
    let getCateSQL = "SELECT * FROM view_cate_admin where category_is_display=1"
    if (searchKey) {
        getCateSQL += " WHERE view_cate_admin.category_name LIKE '%" + searchKey + "%'"
        getCateSQL += " OR view_cate_admin.category_id LIKE '%" + searchKey + "%'"
        getRowSQL += " WHERE view_cate_admin.category_name LIKE '%" + searchKey + "%'"
        getRowSQL += " OR view_cate_admin.category_id LIKE '%" + searchKey + "%'"
    }

    //truy vấn tính tổng số dòng trong một bảng
    let rowData = await query(getRowSQL)
    let totalRow = rowData[0].total

    // tính số trang thực tế sẽ có
    let totalPage = totalRow > 0 ? Math.ceil(totalRow / limit) : 1
    // Kiểm tra đảm bảo rằng page là số nguyên hợp lệ từ 1 đến totalPage
    page = page > 0 ? Math.floor(page) : 1
    page = page <= totalPage ? Math.floor(page) : totalPage

    let start = (page - 1) * limit

    getCateSQL += " ORDER BY view_cate_admin.category_id LIMIT " + start + "," + limit;

    return new Promise((resolve, reject) => {
        db.query(getCateSQL, (err, cate) => {
            if (err) reject(err);
            let categories = {
                categories: cate,
                searchKey: searchKey,
                totalRow: totalRow,
                totalPage: totalPage,
                page: parseInt(page),
                limit: limit,
            }
            resolve(categories)
        })
    })
}


cateAdmin.getProducts = async (searchKey, page, limit) => {
    let getRowSQL = "SELECT COUNT(*) as total FROM view_product_variants"
    let getProductSQL = "SELECT * FROM view_product_variants where product_variant_is_display=1"
    if (searchKey) {
        getProductSQL += " WHERE view_product_variants.product_name LIKE '%" + searchKey + "%'"
        getProductSQL += " OR view_product_variants.product_id LIKE '%" + searchKey + "%'"
        getRowSQL += " WHERE view_product_variants.product_name LIKE '%" + searchKey + "%'"
        getRowSQL += " OR view_product_variants.product_id LIKE '%" + searchKey + "%'"
    }

    //truy vấn tính tổng số dòng trong một bảng
    let rowData = await query(getRowSQL)
    let totalRow = rowData[0].total

    // tính số trang thực tế sẽ có
    let totalPage = totalRow > 0 ? Math.ceil(totalRow / limit) : 1
    // Kiểm tra đảm bảo rằng page là số nguyên hợp lệ từ 1 đến totalPage
    page = page > 0 ? Math.floor(page) : 1
    page = page <= totalPage ? Math.floor(page) : totalPage

    let start = (page - 1) * limit

    getProductSQL += " ORDER BY view_product_variants.product_id ASC LIMIT " + start + "," + limit;

    return new Promise((resolve, reject) => {
        db.query(getProductSQL, (err, product) => {
            if (err) reject(err);
            let products = {
                products: product,
                searchKey: searchKey,
                totalRow: totalRow,
                totalPage: totalPage,
                page: parseInt(page),
                limit: limit,
            }
            resolve(products)
        })
    })
}
cateAdmin.addCategory = async (category_name, category_type, category_img) => {
    const sql = 'INSERT INTO categories (category_name, categorry_type, category_img) VALUES (?, ?, ?)';
    const result = await query(sql, [category_name, category_type, category_img]);
    return result.insertId;

}
cateAdmin.deleteCategory = async (categoryIds) => {
    const placeholders = categoryIds.map(() => '?').join(',');
    const sql = `UPDATE categories SET category_is_display = 0 WHERE category_id IN (${placeholders})`;
    const result = await query(sql, categoryIds);
    return result.affectedRows;
}
module.exports = cateAdmin