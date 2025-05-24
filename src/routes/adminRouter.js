const express = require('express')
const router = express.Router();
const multer = require('multer');
const upload = multer({
    storage: multer.memoryStorage(),
    limits: { fileSize: 5 * 1024 * 1024 }, // Giới hạn 5MB
    fileFilter: (req, file, cb) => {
        if (file.mimetype.startsWith('image/')) {
            cb(null, true);
        } else {
            cb(new Error('Chỉ chấp nhận file ảnh'));
        }
    }
});
// import controller
const authAdminController = require('../controllers/admin/authAdminController.js')
const dashboardAdminController = require('../controllers/admin/dashboardAdminController.js')
const cateAdminController = require('../controllers/admin/cateAdminController.js')

// import middleware
const adminMiddleware = require('../middleware/adminMiddleware.js')

// // admin auth
router.get('/login', adminMiddleware.checkAuth, authAdminController.getLogin)
router.post('/login', adminMiddleware.checkAuth, authAdminController.postLogin)
router.get('/logout', adminMiddleware.checkUnAuth, authAdminController.getLogout)

// admin dashboard
router.get('/dashboard', adminMiddleware.isLoggedIn, dashboardAdminController.getDashboard)
router.get('/dashboard/getChart', adminMiddleware.isLoggedIn, dashboardAdminController.getChart)
router.get('/', adminMiddleware.isLoggedIn, dashboardAdminController.getDashboard)

// admin cate management
router.get('/categories_admin/add', adminMiddleware.isLoggedIn, cateAdminController.showaddCategories)
router.get('/categories_admin', adminMiddleware.isLoggedIn, cateAdminController.getCategories)
router.put('/categories_admin/delete', adminMiddleware.isLoggedIn, cateAdminController.deleteCategory)
router.post('/categories_admin/add', upload.single('category_img'), cateAdminController.addCategories);
// admin product management
router.get('/products_admin/add', adminMiddleware.isLoggedIn, cateAdminController.showaddProducts)
router.get('/products_admin', adminMiddleware.isLoggedIn, cateAdminController.getProducts)
router.put('/products_admin/delete', adminMiddleware.isLoggedIn, cateAdminController.deleteProduct)
router.post('/products_admin/add', adminMiddleware.isLoggedIn, upload.array('images'), cateAdminController.addProducts)
router.get('/products_admin/edit/:id', adminMiddleware.isLoggedIn, cateAdminController.getProductEdit)
router.post('/products_admin/edit/:id', adminMiddleware.isLoggedIn, upload.single('product_avt_img'), cateAdminController.editProduct)
module.exports = router