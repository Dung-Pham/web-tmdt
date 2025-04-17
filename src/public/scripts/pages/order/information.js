// Biến toàn cục
let isNameValid 
let isPhoneNumberValid 
let cartData = localStorage.getItem('formDataArray') || '[]';
let cartDataString;
try {
    cartDataString = JSON.parse(cartData);
} catch (error) {
    console.error('Lỗi khi parse cartData:', error);
    cartDataString = [];
}
let totalProductPrice = 0;
let totalPayment = 0;
let quantity = 1;
let productDiscount = 0;
let shippingMethods = [];

// Hàm định dạng tiền tệ
const toCurrency = (money) => {
    return money.toFixed(0).replace(/./g, (c, i, a) =>
        i > 0 && c !== "," && (a.length - i) % 3 === 0 ? "." + c : c) + 'đ';
};

// Hàm validate chung
const validate = (event, regex, errorMessages) => {
    const input = event.currentTarget;
    const errorEl = input.nextElementSibling;
    const value = input.value.trim();

    if (!value) {
        errorEl.textContent = errorMessages.empty;
        errorEl.style.display = 'block';
        return false;
    }

    if (!regex.test(value)) {
        errorEl.textContent = errorMessages.invalid;
        errorEl.style.display = 'block';
        return false;
    }

    errorEl.style.display = 'none';
    return true;
};

// Validate tên
function validateName(event) {
    const vietnameseRegex = /^[a-zA-ZđĐáàảãạăắằẳẵặâấầẩẫậéèẻẽẹêếềểễệíìỉĩịóòỏõọôốồổỗộơớờởỡợúùủũụưứừửữựýỳỷỹỵÁÀẢÃẠĂẮẰẲẴẶÂẤẦẨẪẬÉÈẺẼẸÊẾỀỂỄỆÍÌỈĨỊÓÒỎÕỌÔỐỒỔỖỘƠỚỜỞỠỢÚÙỦŨỤƯỨỪỬỮỰÝỲỶỸỴ\s]*$/g
    const name = event.currentTarget
    if (vietnameseRegex.test(name.value) == false) {
        name.nextElementSibling.textContent = 'Họ và tên chỉ bao gồm chữ hoa, chữ thường và dấu cách!'
        name.nextElementSibling.style.display = 'block'
        isNameValid = false
    } else {
        name.nextElementSibling.style.display = 'none'
        isNameValid = true
    }

    if (name.value == '') {
        name.nextElementSibling.textContent = 'Vui lòng điền họ và tên người nhận hàng!'
        name.nextElementSibling.style.display = 'block'
    }
}

// Validate số điện thoại
function validatePhoneNumber(event) {
    const vnPhoneNumberRegex = /^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$/
    const phoneNumber = event.currentTarget
    if (vnPhoneNumberRegex.test(phoneNumber.value) == false) {
        phoneNumber.nextElementSibling.textContent = 'Số điện thoại không hợp lệ!'
        phoneNumber.nextElementSibling.style.display = 'block'
        isPhoneNumberValid = false
    } else {
        phoneNumber.nextElementSibling.style.display = 'none'
        isPhoneNumberValid = true
    }

    if (phoneNumber.value == '') {
        phoneNumber.nextElementSibling.style.display = 'block'
        phoneNumber.nextElementSibling.textContent = 'Vui lòng điền số điện thoại người nhận hàng!'
    }
}

const orderForm = document.querySelector('#order-form')
orderForm.addEventListener('submit', (event) => {
    event.preventDefault()
    if (isNameValid && isPhoneNumberValid == true)

        orderForm.submit()
})


// Gửi form
function submitOrderForm(event) {
    event.preventDefault();
    const orderForm = document.querySelector('#order-form')
    fetchOrderPost()
}



// Gửi đơn hàng
const fetchOrderPost = () => {
    const getValue = selector => document.querySelector(selector)?.value || '';
    const orderInfo = {
        order_name: getValue('input[name="buyerName"]'),
        order_phone: getValue('input[name="buyerPhone"]'),
        order_delivery_address: [
            getValue('input[name="address"]'),
            getValue('select[name="ward"]'),
            getValue('select[name="district"]'),
            getValue('select[name="province"]')
        ].filter(Boolean).join(' '),
        order_note: getValue('textarea[name="note"]'),
        paying_method_id: document.querySelector('input[name="pay-method"]:checked')?.value,
        shipping_method_id: document.getElementById('shipping_method_id')?.value
    };

    fetch('/order/information', {
        method: 'POST',
        body: JSON.stringify({ orderInfo, orderDetails: cartDataString }),
        headers: { 'Content-Type': 'application/json' }
    }).then(res => res.json()).then(back => {
        if (back.status === 'error') alert('Vui lòng thử lại sau');
        else if (back.status === 'success') window.location.href = `/order/payment?paying_method_id=${back.paying_method_id}&order_id=${back.order_id}`;
    }).catch(error => console.error('Lỗi khi gửi đơn hàng:', error));
};

// Tính phí vận chuyển
async function calculateFee() {
    const province = document.querySelector('select[name="province"]').selectedOptions[0]?.text || '';
    const district = document.querySelector('select[name="district"]').selectedOptions[0]?.text || '';
    const ward = document.querySelector('select[name="ward"]').selectedOptions[0]?.text || '';
    const address = document.querySelector('input[name="address"]').value;
    const shippingMethod = document.querySelector('input[name="shipping_method"]:checked')?.value || 'road';
    const weight = cartDataString.reduce((sum, item) => sum + (item.order_detail_quantity || 1) * 1000, 0);

    console.log('cac thanh phan trong body', province, district, ward, address, weight, shippingMethod)
    if (!province || !district || !ward || !weight || !shippingMethod) {
        document.getElementById('shipping-fee').textContent = '0đ';
        updateTotalPayment();
        return;
    }

    try {
        const response = await fetch(
            '/order/calculate-shipping-fee?' +
              new URLSearchParams({
                address,
                province,
                district,
                weight,
                ward,
                transport : shippingMethod,
                
              }).toString(),
            {
              method: "GET",
            }
          );

        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }

        const data = await response.json();
        if (data.success) {
            document.getElementById('shipping-fee').textContent = `${data.fee.toLocaleString()}đ`;
        } else {
            document.getElementById('shipping-fee').textContent = 'Lỗi tính phí: ' + data.message;
        }
        updateTotalPayment();
    } catch (error) {
        console.error('Lỗi khi tính phí vận chuyển:', error);
        document.getElementById('shipping-fee').textContent = 'Lỗi kết nối';
        updateTotalPayment();
    }
}

// Cập nhật tổng thanh toán
function updateTotalPayment() {
    const shippingFee = parseInt(document.getElementById('shipping-fee').textContent.replace('đ', '').replaceAll(',', '')) || 0;
    totalPayment = totalProductPrice + shippingFee;
    document.getElementById('total-payment').textContent = toCurrency(totalPayment);
    cartDataString[0].totalPayment = totalPayment
    console.log('day la cartDataString trong updateTotalPayment', cartDataString)

}

// Cập nhật tổng giá sản phẩm
function updateTotalPrice() {
    console.log('day la total', totalProductPrice)
    // console.log('day la product', product)

    // console.log('day la cac thanh phan', price, quantity, discount, finalPrice)
    cartDataString[0].totalProductPrice = totalProductPrice
    console.log('day la cartDataString trong updateTotalPrice', cartDataString)
    document.getElementById('total-product-price').textContent = toCurrency(totalProductPrice);
    document.getElementById('total-product-price').dataset.value = totalProductPrice;

}

// Tải danh sách địa lý
async function loadProvinces() {
    console.log('du lieu tinh1')

    const provinceSelect = document.querySelector('select[name="province"]');

    try {
        const response = await fetch('https://provinces.open-api.vn/api/p/');

        console.log('du lieu tinh1', response)

        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }
        const data = await response.json();
        console.log('du lieu tinh', data)

        const provinces = Array.isArray(data) ? data : [];
        if (!provinces.length) {
            console.warn('Không có dữ liệu tỉnh nào được trả về từ API.');
            provinceSelect.innerHTML = '<option value="">Không có dữ liệu tỉnh</option>';
            return;
        }

        provinceSelect.innerHTML = '<option value="">Chọn Tỉnh/Thành</option>';
        provinces.forEach(province => {
            let option = document.createElement('option');
            option.value = province.code;
            option.textContent = province.name;
            provinceSelect.appendChild(option);
        });
    } catch (error) {
        console.error('Lỗi khi tải danh sách tỉnh:', error);
        provinceSelect.innerHTML = '<option value="">Lỗi tải dữ liệu</option>';
    }
}

async function loadDistricts(provinceId) {
    const districtSelect = document.querySelector('select[name="district"]');
    try {
        districtSelect.innerHTML = '<option value="">Chọn Quận/Huyện</option>';
        if (!provinceId) return;

        const response = await fetch(`https://provinces.open-api.vn/api/p/${provinceId}?depth=2`);
        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }
        const data = await response.json();
        console.log('danh sach quan huyen tra ve', data)

        const districts = Array.isArray(data.districts) ? data.districts :[];

        if (!districts.length) {
            console.warn('Không có dữ liệu quận/huyện nào được trả về.');
            return;
        }

        districts.forEach(district => {
            const option = document.createElement('option');
            option.value = district.code;
            option.textContent = district.name;
            districtSelect.appendChild(option);
        });
    } catch (error) {
        console.error('Lỗi khi tải danh sách quận/huyện:', error);
        districtSelect.innerHTML = '<option value="">Lỗi tải dữ liệu</option>';
    }
}

async function loadWards(districtId) {
    const wardSelect = document.querySelector('select[name="ward"]');
    try {
        wardSelect.innerHTML = '<option value="">Chọn Phường/Xã</option>';
        if (!districtId) return;

        const response = await fetch(`https://provinces.open-api.vn/api/d/${districtId}?depth=2`);
        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }
        const data = await response.json();
        console.log('danh sach phuong xa tra ve', data)

        const wards = Array.isArray(data.wards) ? data.wards :[];

        if (!wards.length) {
            console.warn('Không có dữ liệu phường/xã nào được trả về.');
            return;
        }

        wards.forEach(ward => {
            const option = document.createElement('option');
            option.value = ward.code;
            option.textContent = ward.name;
            wardSelect.appendChild(option);
        });
    } catch (error) {
        console.error('Lỗi khi tải danh sách phường/xã:', error);
        wardSelect.innerHTML = '<option value="">Lỗi tải dữ liệu</option>';
    }
}

async function loadShippingMethods() {
    shippingMethods = [
        { id: 1, method_name: 'Vận chuyển Tiết kiệm', transport: 'road' },
        { id: 2, method_name: 'Vận chuyển Nhanh', transport: 'fly' }
    ];

    const shippingMethodDiv = document.querySelector('.shipping-method__choose');
    shippingMethodDiv.innerHTML = '';
    shippingMethods.forEach((method, index) => {
        shippingMethodDiv.innerHTML += `
        <div>
          <input type="radio" id="ship${method.id}" name="shipping_method" value="${method.transport}" ${index === 0 ? 'checked' : ''} onchange="calculateFee()">
          <label for="ship${method.id}">${method.method_name}</label>
        </div>
      `;
    });
}

// Khởi tạo khi DOM loaded
document.addEventListener('DOMContentLoaded', async () => {
    let orderProductContent = document.querySelector('.order-product__content');
    if (!orderProductContent) {
        console.error('Không tìm thấy phần tử .order-product__content trong DOM.');
        return;
    }

    if (!cartDataString.length) {
        orderProductContent.innerHTML = '<p>Không có sản phẩm trong giỏ hàng.</p>';
        return;
    }

    const productPromises = cartDataString.map(product => {
        return fetch(`/general/product_variant_info?product_variant_id=${product.product_variant_id}`)
            .then(res => res.json())
            .then(data => {
                const info = data.productVariantInfo[0];
                if (!info) {
                    console.warn(`Không tìm thấy thông tin cho product_variant_id: ${product.product_variant_id}`);
                    return;
                }

                const productId = info.product_id;
                const productAvtImg = info.product_avt_img;
                const productName = info.product_name;
                const productVariantName = info.product_variant_name;
                const productQuantity = product.order_detail_quantity || 1;
                productDiscount = info.discount_amount || 0;
                const productVariantPrice = info.product_variant_price || 0;

                const finalPrice = productVariantPrice - Math.floor(productVariantPrice * productDiscount / 100);

                totalProductPrice = finalPrice
                const elementHidden = document.createElement('div');
                elementHidden.classList.add('product', 'mobile-hidden');
                elementHidden.innerHTML = `
                    <div class="product__view order-product__col-big">
                        <img src="/imgs/product_image/P${productId}/${productAvtImg}" alt="${productName}">
                        <p>${productName}</p>
                    </div>
                    <div class="order-product__col"><p>${productVariantName}</p></div>
                    <div class="order-product__col">
                        <del class="product__unit-price-del">${productDiscount ? toCurrency(productVariantPrice) : ''}</del>
                        <p class="product__unit-price">${toCurrency(finalPrice)}</p>
                    </div>
                    <div class="order-product__col"><p class="product__quantity">${productQuantity}</p></div>
                    <div class="product__price order-product__col"><p>${toCurrency(finalPrice * productQuantity)}</p></div>
                `;

                const elementDisplay = document.createElement('div');
                elementDisplay.classList.add('product', 'mobile-display');
                elementDisplay.innerHTML = `
                    <img src="/imgs/product_image/P${productId}/${productAvtImg}" alt="${productName}">
                    <div class="product__content">
                        <p class="product__name">${productName}</p>
                        <p class="product__variant">Phân loại: ${productVariantName}</p>
                        <div>
                            <p class="product__unit-price">
                                <del class="product__unit-price-del">${productDiscount ? toCurrency(productVariantPrice) : ''}</del>
                                ${toCurrency(finalPrice)}
                            </p>
                            <p>Số lượng: <span class="product__quantity">${productQuantity}</span></p>
                        </div>
                    </div>
                `;

                orderProductContent.appendChild(elementHidden);
                orderProductContent.appendChild(elementDisplay);
            })
            .catch(error => console.error('Lỗi khi tải sản phẩm:', error));
    });

    try {
        await loadProvinces();
        await loadShippingMethods();
        await Promise.all(productPromises);
        updateTotalPrice();
        // calculateFee();

        // Thêm sự kiện cho select
        document.querySelector('select[name="province"]').addEventListener('change', async (e) => {
            console.log('day la tinh duoc chonj',e.target.value )
            await loadDistricts(e.target.value);
        });

        document.querySelector('select[name="district"]').addEventListener('change', async (e) => {
            await loadWards(e.target.value);
        });

        document.querySelector('select[name="ward"]').addEventListener('change', () => calculateFee());
    } catch (error) {
        console.error('Lỗi trong quá trình khởi tạo:', error);
    }
});