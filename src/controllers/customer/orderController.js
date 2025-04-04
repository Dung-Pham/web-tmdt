const { promisify } = require("util")
const index = require("../../models/customer/index.model")
const order = require("../../models/customer/order.model")
const general = require("../../models/general.model")
const account = require("../../models/customer/account.model")
const qs = require("qs");
const axios = require("axios");
const { env } = require("process")
require("dotenv").config();
const orderController = () => { }

// [POST] /order/addCart
orderController.addCart = async (req, res) => {
	let customer_id = 0

	if (req.user) {
		customer_id = req.user.customer_id
	} else {
		return res.status(401).json({
			status: "NotAuth",
		})
	}

	let product_variant_id = req.body.product_variant_id
	let cart_quantity = req.body.cart_quantity

	let result = await order.addCart(
		customer_id,
		product_variant_id,
		cart_quantity
	)

	if (result) {
		return res.json({
			status: "success",
		})
	} else {
		return res.json({
			status: "error",
		})
	}
}

// [GET] /order/cart
orderController.cart = async (req, res) => {
	customer_id = req.user.customer_id
	let header_user = await index.header_user(req)
	let header = await index.header(req)
	let detailCart = await order.getDetailCart(customer_id)
	let formatFunction = await general.formatFunction()

	res.render("./pages/order/cart", {
		header: header,
		user: header_user,
		detailCart: detailCart,
		formatFunction: formatFunction,
	})
}

// [POST] /order/cart/delete
orderController.deleteCart = async (req, res) => {
	let customer_id = req.user.customer_id
	let productsCartDelete = req.body

	order.deleteCart(customer_id, productsCartDelete, function (err, success) {
		if (success) {
			return res.status(200).json({
				status: "success",
			})
		} else {
			return res.status(404).json({
				status: "error",
			})
		}
	})
}

// [POST] /order/cart/update
orderController.updateCart = async (req, res) => {
	let customer_id = req.user.customer_id
	let productsCartUpdate = req.body.productsCartUpdate
	let productsCartUpdateOld = req.body.productsCartUpdateOld

	await order.deleteCart(customer_id, productsCartUpdate, function (err, success) { })
	await order.deleteCart(customer_id, productsCartUpdateOld, function (err, success) { })

	await order.updateCart(customer_id, productsCartUpdate, function (err, success) {
		if (success) {
			return res.status(200).json({
				status: "success",
			})
		} else {
			return res.status(404).json({
				status: "error",
			})
		}
	})
}

// [GET] /order/information
orderController.information = async (req, res) => {
	let header_user = await index.header_user(req)
	let header = await index.header(req)
	let formatFunction = await general.formatFunction()

	res.render("./pages/order/information", {
		header: header,
		user: header_user,
		formatFunction: formatFunction,
	})
}

// [POST] /order/information
orderController.informationPost = async (req, res) => {
	let orderInformation = req.body

	let customer_id = req.user.customer_id
	let orderInfo = orderInformation.orderInfo
	let orderDetails = orderInformation.orderDetails

	order.insertOrder(
		customer_id,
		orderInfo,
		orderDetails,
		function (err, success, order_id, paying_method_id) {
			if (err) {
				return res.status(404).json({
					status: "error",
				})
			} else if (success) {
				order.deleteCart(customer_id, orderDetails, function (err, success) { })
				res.status(200).json({
					status: "success",
					order_id: order_id,
					paying_method_id: orderInfo.paying_method_id,
				})
			}
		}
	)
}

// [GET] /order/payment?paying_method_id=x&order_id=y
orderController.payment = async (req, res) => {
	console.log("DA GOI DC TOI ORDER PAYMENT")
	let paying_method_id = req.query.paying_method_id
	let order_id = req.query.order_id

	let customer_id = req.user.customer_id
	let header_user = await index.header_user(req)
	let header = await index.header(req)
	let formatFunction = await general.formatFunction()
	console.log(paying_method_id)
	console.log(order_id)
	console.log(customer_id)
	console.log(header_user)
	console.log(header)
	console.log(formatFunction)
	let purchase = await account.getPurchaseHistory(customer_id, 0, order_id)
	console.log(purchase)
	if (paying_method_id == 1) {
		res.render("./pages/order/momo", {
			header: header,
			user: header_user,
			formatFunction: formatFunction,
			purchase: purchase[0],
		})
	} else if (paying_method_id == 2) {
		try {
			const amount = purchase[0].order_total_after;
			const bank = process.env.BANK_CODE;
			const account = process.env.BANK_ACCOUNT;
			const descrip = `Thanh toan don hang ${order_id}`;
			const accountName = "Do Thi Quynh";
			const qrImageUrl = `https://img.vietqr.io/image/${bank}-${account}-compact.png?amount=${amount}&addInfo=${order_id}&accountName=${encodeURIComponent(accountName)}`;
			res.render("./pages/order/atm", {
				order_id,
				amount,
				descrip,
				qrImageUrl
			})
		} catch (error) {
			console.error('Lỗi tạo VietQR:', error);
			res.status(500).send('Lỗi tạo VietQR');
		}
	} else if (paying_method_id == 3) {
		res.render("./pages/order/credit", {
			header: header,
			user: header_user,
			formatFunction: formatFunction,
			purchase: purchase[0],
		});
	}
	else {
		return res.status(400).json({ error: "Phương thức thanh toán không hợp lệ" });
	}
}

orderController.paymentNotification = async (req, res) => {
	console.log('Nhận được dữ liệu SMS:', req.body);
	const { message, sender, time, parsed } = req.body;
	
	res.json({
		success: true,
		message: 'Dữ liệu SMS Banking đã được xử lý'
	  });

	
}


orderController.cancelOrder = async (req, res) => {
	let order_id = req.body.order_id;

	await order.updateCancelOrder(order_id, function (err, success) {
		if (err) {
			res.status(404).json({
				status: 'error',
			})
		} else {
			res.status(200).json({
				status: 'success',
			})
		}
	})
}
orderController.checkPayment = async (req, res) => {
	try {
		const customer_id = req.user.customer_id;
		const order_id = req.query.order_id;
		let purchase = await account.getPurchaseHistory(customer_id, 0, order_id);
		const amount = purchase[0].order_total_after;
		const response = await axios.get('https://api.casso.io/v2/transactions', {
			headers: { 'Authorization': `Apikey ${process.env.API_key}` }
		});

		const transactions = response.data.data;
		const paidTransaction = transactions.find(t => t.description.includes(order_id) && t.amount == amount);

		res.render('./pages/order/payment-status', {
			order_id,
			status: paidTransaction ? 'Thanh toán thành công!' : 'Chưa nhận được thanh toán!',
			isSuccess: !!paidTransaction
		});
	} catch (error) {
		console.error('Lỗi kiểm tra thanh toán:', error);
		res.status(500).send('Lỗi kiểm tra thanh toán');
	}
};

// Webhook tự động cập nhật trạng thái thanh toán
orderController.cassoWebhook = async (req, res) => {
	try {
		const { transactions } = req.body;
		transactions.forEach(t => {
			console.log(`Nhận thanh toán: ${t.description} - ${t.amount} VND`);
		});
		res.sendStatus(200);
	} catch (error) {
		console.error('Lỗi webhook Casso:', error);
		res.sendStatus(500);
	}
};


module.exports = orderController
