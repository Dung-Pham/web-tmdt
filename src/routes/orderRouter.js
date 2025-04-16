const express = require("express");
const router = express.Router();

// import controller
const orderController = require('../controllers/customer/orderController.js')
const authMiddleware = require('../middleware/authMiddleware.js')
const shippingController = require('../controllers/customer/shippingController.js')
router.get('/cart', authMiddleware.isLoggedIn, orderController.cart)
router.post('/cart/delete', authMiddleware.isLoggedIn, orderController.deleteCart)
router.post('/addCart', authMiddleware.getLoggedIn, orderController.addCart)
router.post('/updateCart', authMiddleware.getLoggedIn, orderController.updateCart)

router.get('/information', authMiddleware.isLoggedIn, orderController.information)
router.post('/information', authMiddleware.isLoggedIn, orderController.informationPost)
router.post('/calculate-shipping-fee', shippingController.calculateShippingFee)
router.get('/provinces', shippingController.getProvinces);
router.get('/districts/:provinceId', shippingController.getDistricts);
router.get('/wards/:districtId', shippingController.getWards);

router.get('/payment', authMiddleware.isLoggedIn, orderController.payment);
// router.get('/payment-status', orderController.checkPayment); //ko xoa
router.post('/casso-webhook', orderController.cassoWebhook);
router.post('/cancel_order', authMiddleware.isLoggedIn, orderController.cancelOrder)

// router.post('/payment-notification' , orderController.paymentNotification);  //ko xoa
module.exports = router;
