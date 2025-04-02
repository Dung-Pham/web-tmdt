const express = require('express');
const axios = require('axios');
const router = express.Router();

router.post('/', async (req, res) => {
    // Kiểm tra nếu req.body tồn tại
    if (!req.body || Object.keys(req.body).length === 0) {
        return res.status(400).json({ error: 'No data provided in request body' });
    }

    // Lấy message từ frontend (giả sử frontend gửi object với key là 'message' hoặc 'msg')
    const message = req.body.message || req.body.msg; // Linh hoạt với key 'message' hoặc 'msg'

    if (!message || typeof message !== 'string') {
        return res.status(400).json({ error: 'Invalid message: must be a non-empty string' });
    }

    try {
        // Gửi yêu cầu đến API chatbot
        const response = await axios.post('http://localhost:8000/api', { msg: message });

        // Trả về dữ liệu từ API chatbot
        res.json(response.data);
    } catch (error) {
        console.error('Error calling chatbot API:', error.message);

        if (error.response) {
            // Nếu API chatbot trả về lỗi (status code khác 200)
            return res.status(error.response.status).json({
                error: 'Chatbot API error',
                details: error.response.data
            });
        } else {
            // Lỗi kết nối hoặc khác
            return res.status(500).json({
                error: 'Failed to connect to chatbot API',
                details: error.message
            });
        }
    }
});

module.exports = router;