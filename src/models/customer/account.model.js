const db = require('../../config/db/connect')
const util = require('node:util')
const jwt = require('jsonwebtoken')
const query = util.promisify(db.query).bind(db)
const general = require('../general.model')
const index = require('./index.model')


const account = function () { }


account.updateInfo = async (req, res) => {
    const updateInfo = `
        UPDATE users 
        SET 
            user_login_name = ?,
            user_name = ?,
            user_birth = ?,
            user_sex = ?,
            user_email = ?,
            user_phone = ?,
            user_address = ?
        WHERE user_id = ?
    `

    const values = [
        req.body.user_phone,
        req.body.user_name,
        // new Date(req.body.user_birth),
        req.body.user_birth,
        req.body.user_sex,
        req.body.user_email,
        req.body.user_phone,
        req.body.user_address,
        req.user.user_id
    ]

    const result = await query(updateInfo, values)

}


account.checkPassword = async (req, callback) => {
    const user_password = req.body.user_password
    const user_id = req.user.user_id

    db.query('SELECT *  FROM users WHERE user_id = ?', [user_id], async (err, result) => {
        if (err) callback(1, 0, 0)
        if (!await bcrypt.compare(user_password, result[0].user_password)) {
            callback(0, 1, 0)
        } else {
            callback(0, 0, 1)
        }
    })
}
account.getPaymentStatus = async (order_id) => {
    let getPaymentStatus = `SELECT * FROM view_payments WHERE order_id = ${order_id}`

    let paymentStatus = await query(getPaymentStatus)
    console.log('DAY LA PAYMENT STATUS', paymentStatus[0])
    if (!paymentStatus[0]) {
        return 0
    } else {
        return paymentStatus[0]
    }


}
account.updatePaymentSMS = async (order_id, amount, date, callback) => {
    const updateInfo = `
        UPDATE orders 
        SET 
            order_paying_date = ?,
            order_is_paid = ?,
            order_status = ?
        WHERE order_id = ?
    `

    const values = [
        date,
        amount == 0 ? 1 : 0,
        amount == 0 ? 'Đang giao hàng' : 'Chưa thanh toán',
        order_id
    ]

    try {
        // Sử dụng pattern async/await nhất quán
        const result = await query(updateInfo, values);

        // Nếu cập nhật thành công
        if (result && result.affectedRows > 0) {
            callback(0, 1);
        } else {
            callback(1, 0);
        }
    } catch (err) {
        console.error('Lỗi khi cập nhật trạng thái thanh toán:', err);
        callback(1, 0); // Thất bại - có lỗi xảy ra
    }


}
account.getPurchaseHistory = async (customer_id, order_status, order_id) => {
    let getPurchaseHistorys = `SELECT * 
                                FROM view_orders
                                WHERE customer_id = ${customer_id}`

    if (order_id) {
        getPurchaseHistorys += ` AND order_id = ${order_id}`
    }
    if (order_status) {
        getPurchaseHistorys += ` AND order_status = '${order_status}'`
    }

    getPurchaseHistorys += ` ORDER BY order_date DESC, order_id DESC`

    let purchaseHistorys = await query(getPurchaseHistorys)

    return new Promise(async (resolve, reject) => {
        const promises = []
        purchaseHistorys.forEach(async (purchaseHistory) => {
            promises.push(
                account.getDetailPurchaseHistorys(purchaseHistory.order_id, customer_id).then((order_details) => {
                    purchaseHistory.order_details = order_details
                })
            )
        })
        await Promise.all(promises)
        resolve(purchaseHistorys)
    })
}

account.getDetailPurchaseHistorys = async (order_id, customer_id) => {
    let getDetailPurchaseHistorys = `SELECT * FROM view_order_detail WHERE order_id = ${order_id}`
    let detailPurchaseHistorys = await query(getDetailPurchaseHistorys)

    return new Promise(async (resolve, reject) => {
        const promises = []
        detailPurchaseHistorys.forEach(async (detailPurchaseHistory) => {
            promises.push(
                account.viewFeedback(customer_id, detailPurchaseHistory.order_id, detailPurchaseHistory.product_variant_id).then((feedback) => {
                    detailPurchaseHistory.feedback = feedback
                })
            )
        })
        await Promise.all(promises)
        resolve(detailPurchaseHistorys)
    })
}

account.insertFeedback = async (product_variant_id, customer_id, order_id, feedback_rate, feedback_content, callback) => {
    if (feedback_content == '') feedback_content = 'Bạn không để lại lời nhận xét nào'
    let insertFeedback = `INSERT INTO feedbacks (product_variant_id, customer_id, order_id, feedback_rate, feedback_content) VALUES (${product_variant_id}, ${customer_id}, ${order_id}, ${feedback_rate}, ?)`

    db.query(insertFeedback, [feedback_content], (err, result) => {
        if (err) {
            console.log(err)
            callback(1, 0)
        } else {
            callback(0, 1)
        }
    })
}

account.viewFeedback = async (customer_id, order_id, product_variant_id) => {
    let viewFeedback = `SELECT * FROM feedbacks WHERE customer_id = ${customer_id} AND order_id = ${order_id} AND product_variant_id = ${product_variant_id};`
    let feedback = await query(viewFeedback)

    if (!feedback[0]) {
        return 0
    } else {
        return feedback[0]
    }
}

module.exports = account