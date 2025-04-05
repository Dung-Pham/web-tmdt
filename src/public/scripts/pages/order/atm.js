// document.addEventListener("DOMContentLoaded", function () {
// 	// Mặc định hiển thị thông tin của Vietcombank
// 	document.getElementById("bank-vietcombank").style.borderColor =
// 		"var(--primary-color-1)";
// 	document.getElementById("pay_info-vietcombank").style.display = "block";
// 	document.getElementById("pay_info-bidv").style.display = "none";

// 	// Xử lý sự kiện khi chọn Vietcombank
// 	document
// 		.getElementById("bank-vietcombank")
// 		.addEventListener("click", function () {
// 			document.getElementById("pay_info-vietcombank").style.display = "block";
// 			document.getElementById("pay_info-bidv").style.display = "none";
// 			document.getElementById("bank-vietcombank").style.borderColor =
// 				"var(--primary-color-1)";
// 			document.getElementById("bank-bidv").style.borderColor =
// 				"var(--outline-gray)";
// 		});

// 	// Xử lý sự kiện khi chọn BIDV
// 	document.getElementById("bank-bidv").addEventListener("click", function () {
// 		document.getElementById("pay_info-vietcombank").style.display = "none";
// 		document.getElementById("pay_info-bidv").style.display = "block";
// 		document.getElementById("bank-bidv").style.borderColor =
// 			"var(--primary-color-1)";
// 		document.getElementById("bank-vietcombank").style.borderColor =
// 			"var(--outline-gray)";
// 	});

// 	// Thêm xử lý sự kiện khi nhấn nút Xác nhận
// 	document.getElementById("btn-submit").addEventListener("click", function () {
// 		// Thêm logic xác nhận đơn hàng tại đây (nếu cần)
// 		alert("Xác nhận đơn hàng thành công!");
// 	});

// 	// Thêm xử lý sự kiện khi nhấn nút Trở lại trang chủ
// 	document
// 		.getElementById("btn-home-page")
// 		.addEventListener("click", function () {
// 			// Chuyển hướng về trang chủ tại đây
// 			window.location.href = "/";
// 		});

// });

// const btnHomePage = document.querySelector("#btn-home-page");

// btnHomePage.addEventListener("click", function () {
// 	window.location.href = "http://localhost:3000/account/purchase?order_status=Ch%E1%BB%9D%20thanh%20to%C3%A1n";
// });    

// const axios = require('axios');


document.addEventListener('DOMContentLoaded', function() {
	// Hiển thị trạng thái chờ
	// const statusContainer = document.getElementById('status-container');
	// statusContainer.style.display = 'block';
	
	// Lấy order_id từ trang
	const orderIdElement = document.getElementById('order-id');
  const orderId = orderIdElement ? orderIdElement.textContent.trim() : '';
	// Bắt đầu smart polling
	pollingCheckPayment(orderId);
});
// Hàm để chuyển đổi giao diện khi thanh toán thành công
function showPaymentSuccess() {
  document.getElementById('payment-info').style.display = 'none';
  document.getElementById('payment-success').style.display = 'block';
}

function checkSession(orderId){
  // Kiểm tra nếu đã có kết quả trong sessionStorage (trường hợp tải lại trang)
  const cachedResult = sessionStorage.getItem(`payment_${orderId}`);
  if (cachedResult) {
    try {
      const parsedResult = JSON.parse(cachedResult);
      if (parsedResult.order_is_paid === 1) {
        // Đã có kết quả cuối - hiển thị ngay không cần poll
        console.log('da co kq cuoi tu session va xac nhan thanh toan thanh cong: ', parsedResult)
        showPaymentSuccess(orderId);
        return true;
      }
    }catch (e){
      console.error('Lỗi khi xử lý dữ liệu từ sessionStorage:', e);
    }
  }
  return false;
}

// Polling thích ứng thay đổi tần suất theo thời gian
function pollingCheckPayment(orderId) {
    let attempts = 0;
    let interval = 5000; // Bắt đầu với 2 giây
    let pollingTimer;
    let paymentStatus;
    let message;
    
    // Lưu thời điểm bắt đầu để kiểm soát tổng thời gian
    const startTime = Date.now();
    const maxDuration = 5 * 60 * 1000; // 5 phút
    console.log('pass1')
    function poll() {
		// Chuẩn bị dữ liệu theo định dạng backend yêu cầu
		const url = `/order/payment-status?order_id=${orderId}&_t=${Date.now()}`;

        fetch(url)
        // Sử dụng POST thay vì GET và gửi đúng định dạng dữ liệu
        // fetch(`/order/payment-status?customer_id=${customerId}&order_id=${orderId}&_t=${Date.now()}`)

    //   fetch(`/api/payment-status/${orderId}?_t=${Date.now()}`) // Thêm timestamp tránh cache trình duyệt
        .then(res => res.json())
        .then(data => {
          attempts++;
          message = data.message
          paymentStatus = data.paymentStatus
          // Hiển thị trạng thái
          console.log('ket qua sau moi lan poll: ' , message, paymentStatus);
          // Lưu trạng thái vào sessionStorage để dùng khi tải lại trang
          sessionStorage.setItem(`payment_${orderId}`, JSON.stringify(paymentStatus));
          // Trường hợp 1: Thanh toán hoàn tất
          if (paymentStatus.order_is_paid === 1) {
            clearTimeout(pollingTimer);
            // Hiển thị kết quả cuối
            console.log('THANH TOAN THANH CONG:' , message, paymentStatus)
            checkSession(orderId);
            return;
          }
          
          // Trường hợp 2: Đạt giới hạn thời gian
          if (Date.now() - startTime > maxDuration) {
            clearTimeout(pollingTimer);
            console.log('het thoi gian polling:' , message , paymentStatus)
            
          }
           // Lên lịch cho lần poll tiếp theo
          //  interval = Math.min(interval * 1.5, maxInterval); // Tăng khoảng thời gian (backoff)
           pollingTimer = setTimeout(poll, interval);
          console.log(`Sẽ kiểm tra lại sau ${interval/1000} giây`);
        })
        .catch(error => {
          console.error('Polling error:', error);
          // Vẫn tiếp tục poll dù có lỗi
          interval = interval * 1.5;
          pollingTimer = setTimeout(poll, interval);
        });
    }

    const alreadyPaid = checkSession(orderId);
    // Nếu đã thanh toán thành công, dừng lại ngay
    if (alreadyPaid) return; // Dừng hàm tại đây
    
    
    // Bắt đầu polling
    poll();
    // Trả về hàm để dừng polling khi cần
    return {
      stop: () => clearTimeout(pollingTimer)
    };
  }
