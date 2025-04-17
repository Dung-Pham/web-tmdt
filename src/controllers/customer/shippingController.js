
const axios = require('axios');

exports.getProvinces = async (req, res) => {
    try {
        const response = await axios.get('https://services.giaohangtietkiem.vn/services/location/province', {
            headers: { 'Token': process.env.GHTK_API_TOKEN },
        });
        res.json(response.data);
    } catch (error) {
        res.status(500).json({ success: false, message: 'Lỗi khi lấy danh sách tỉnh/thành' });
    }
};

exports.getDistricts = async (req, res) => {
    const provinceId = req.params.provinceId;
    try {
        const response = await axios.get('https://services.giaohangtietkiem.vn/services/location/district', {
            headers: { 'Token': process.env.GHTK_API_TOKEN },
            params: { provinceid: provinceId },
        });
        res.json(response.data);
    } catch (error) {
        res.status(500).json({ success: false, message: 'Lỗi khi lấy danh sách quận/huyện' });
    }
};

exports.getWards = async (req, res) => {
    const districtId = req.params.districtId;
    try {
        const response = await axios.get('https://services.giaohangtietkiem.vn/services/location/ward', {
            headers: { 'Token': process.env.GHTK_API_TOKEN },
            params: { districtid: districtId },
        });
        res.json(response.data);
    } catch (error) {
        res.status(500).json({ success: false, message: 'Lỗi khi lấy danh sách phường/xã' });
    }
};

exports.calculateShippingFee = async (req, res) => {
    const { province, district, ward, weight, transport, address } = req.query;
    console.log('xem xet dl',req.query)
    console.log('xem xet dl', province, district, ward, weight, transport, address)
    // Giá trị mặc định cho địa chỉ lấy hàng (có thể điều chỉnh theo shop của bạn)
    const pickProvince = 'Hà Nội'; // Thay bằng tỉnh xuất hàng thực tế
    const pickDistrict = 'Quận Hai Bà Trưng'; // Thay bằng quận xuất hàng thực tế
    const pickAddress = 'Địa chỉ kho của bạn'; // Thay bằng địa chỉ kho thực tế

    try {
        const response = await axios.get('https://services.giaohangtietkiem.vn/services/shipment/fee', {
            headers: {
                'Token': process.env.GHTK_API_KEY,
                //'X-Client-Source': 'PARTNER_CODE', // Thay 'PARTNER_CODE' bằng mã đối tác của bạn
                'Content-Type': 'application/json',
            },
            params: {
                pick_province: pickProvince,
                pick_district: pickDistrict,
                pick_address: pickAddress,
                province: province,
                district: district,
                ward: ward || '', // Tùy chọn
                address: address || '', // Tùy chọn
                weight: weight || 1000, // Trọng lượng mặc định (gram)
                deliver_option: 'none', // Mặc định không sử dụng xfast
                transport: transport
            },
        });
        console.log('day la res tu GHTK', response.data)
        if (response.data.success) {
            res.json({ success: true, fee: response.data.fee.fee });
        } else {
            res.json({ success: false, message: response.data.message || 'Lỗi khi tính phí' });
        }
    } catch (error) {
        console.log(error.message)
        res.json({ success: false, message: 'Lỗi khi tính phí vận chuyển: ' + error.message });
    }
};