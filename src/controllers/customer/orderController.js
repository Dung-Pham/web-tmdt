const { promisify } = require("util")
const index = require("../../models/customer/index.model")
const order = require("../../models/customer/order.model")
const general = require("../../models/general.model")
const account = require("../../models/customer/account.model")
const qs = require("qs");
const axios = require("axios");
const { env } = require("process")
const Redis = require("ioredis");
const redis = new Redis(); // Kết nối đến localhost:6379
redis.on('connect', () => {
	console.log('Connected to Redis successfully');
});

redis.on('error', (err) => {
	console.error('Redis connection error:', err);
});

redis.on('ready', () => {
	console.log('Redis client ready');
	// Thử lưu một giá trị test
	redis.set('test:app', 'hello from app').then(() => {
		console.log('Test value saved to Redis');
	}).catch(err => {
		console.error('Failed to save test value:', err);
	});
});
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
// Hàm chuyển đổi từ '14:42 03/04/2025' sang '2025-04-03' (chỉ lấy ngày)
function formatDate(dateTimeStr) {
	try {
		// Tách thời gian và ngày
		const parts = dateTimeStr.split(' ');
		if (parts.length < 2) {
			throw new Error('Định dạng ngày giờ không hợp lệ');
		}

		// Lấy phần ngày
		const dateStr = parts[1]; // Lấy phần "03/04/2025"

		// Tách ngày, tháng, năm
		const [day, month, year] = dateStr.split('/');

		// Kết hợp theo định dạng ngày MySQL (YYYY-MM-DD)
		return `${year}-${month.padStart(2, '0')}-${day.padStart(2, '0')}`;
	} catch (error) {
		console.error('Lỗi khi định dạng ngày tháng:', error);
		// Trả về ngày hiện tại nếu không thể chuyển đổi
		return new Date().toISOString().slice(0, 10);
	}
}

orderController.paymentNotification = async (req, res) => {
	console.log('Nhận được dữ liệu SMS:', req.body);
	let { order_id, amount, timestamp } = req.body.payment;
	const date = formatDate(timestamp);

	console.log('orderID nhan duoc: ', order_id)
	console.log('amount nhan duoc: ', amount)
	console.log('time nhan duoc: ', date)

	try {
		const payment = await account.getPaymentStatus(order_id); // lay tu db de luu vao cache
		amount = payment.order_total_after - amount // so tien con lai phai tra
	} catch (error) {
		console.error('Lỗi get database:', error);
	}
	await account.updatePaymentSMS(order_id, amount, date, function (err, success) {
		if (err) {
			res.status(404).json({
				status: 'error',
			})
		} else {
			res.status(200).json({
				status: 'success',
			})
		}
	});
	paymentCachedUpdate(order_id);

	// res.json({
	// 	success: true,
	// 	message: 'Dữ liệu SMS Banking đã được xử lý'
	//   });
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
		console.log('DAY LA REQ NHAN DUOC', req.query);
		// const customer_id = req.query.customer_id;
		const order_id = req.query.order_id;


		// 1. kiem tra payment trong cache, ko co thi truy van vao DB
		const cacheKey = order_id;
		let paymentStatus = await redis.get(cacheKey);
		console.log('DAY LA LAY TU REDIS TU DAU', paymentStatus)

		if (paymentStatus) {
			console.log('truoc khi json:', paymentStatus)
			paymentStatus = JSON.parse(paymentStatus);
			console.log('sau khi json:', paymentStatus)
			// kiem tra phu thuoc thoi gian 
			const cacheAge = Date.now() - paymentStatus.cached_at;
			console.log('DAY LA Date NOW', Date.now())
			console.log('DAY LA CACHE AT', paymentStatus.cached_at)

			console.log('DAY LA CACHE AGE', cacheAge)
			if (cacheAge < 60000) { // 60s: trong vong 1 phut ma k cos gi thay doi thi check lai db
				// data moi ko can kiem tra lai DB
				console.log('cached data of: ', paymentStatus)
				return res.json({
					message: 'from cache',
					paymentStatus
				});
			}
			else if (paymentStatus.order_is_paid === 0) {
				// check lai tu DB
				paymentStatus = await paymentCachedUpdate(order_id);
				return res.json({
					message: 'from database',
					paymentStatus
				});
			}
		}
		else {
			// luu data vao cache
			paymentStatus = await paymentCachedUpdate(order_id);
			console.log('database check of: ', paymentStatus)
			return res.json({
				message: 'from database',
				paymentStatus
			});
		}
	} catch (error) {
		console.error('Lỗi kiểm tra thanh toán:', error);
		res.status(500).send('Lỗi kiểm tra thanh toán');
	}
};

let paymentCachedUpdate = async (order_id) => {
	try {
		const paymentStatus = await account.getPaymentStatus(order_id); // lay tu db de luu vao cache
		console.log('tai sao ko co kq tra ve: ', paymentStatus)
		paymentStatus.cached_at = Date.now();
		await redis.set(order_id, JSON.stringify(paymentStatus), 'EX', 60); //cache nay ton tai trong 5 phut
		console.log('update cache for: ', paymentStatus)
		return paymentStatus
	} catch (error) {
		console.error('Failed:', error);
	}
}
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
