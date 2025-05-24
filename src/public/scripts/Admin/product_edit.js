document.addEventListener('DOMContentLoaded', () => {
    const form = document.querySelector('.main__form form');
    const fileInput = document.querySelector('#product_avt_img');
    const previewImg = document.querySelector('.form-group img');
    const productVariantId = document.getElementById('product_variant_id');
    // Xử lý preview ảnh khi chọn file
    fileInput.addEventListener('change', (e) => {
        const file = e.target.files[0];
        if (file && file.type.startsWith('image/')) {
            const reader = new FileReader();
            reader.onload = (event) => {
                previewImg.src = event.target.result; // Cập nhật src của thẻ img
                previewImg.style.display = 'block'; // Đảm bảo ảnh hiển thị
            };
            reader.readAsDataURL(file);
        } else if (!file) {
            // Nếu không có file được chọn, giữ nguyên ảnh hiện tại
            previewImg.src = previewImg.src;
        } else {
            alert('Vui lòng chọn một file ảnh hợp lệ!');
        }
    });

    // Xử lý gửi form
    form.addEventListener('submit', async (e) => {
        e.preventDefault(); // Ngăn hành vi gửi form mặc định

        // Thu thập dữ liệu form
        const formData = new FormData(form);

        try {
            const response = await fetch(`/admin/products_admin/edit/${productVariantId}`, {
                method: 'POST',
                body: formData,
            });

            const result = await response.json();

            if (result.success) {
                // Hiển thị thông báo thành công và chuyển hướng
                alert('Cập nhật sản phẩm thành công!');
                window.location.href = '/admin/products_admin';
            } else {
                // Hiển thị thông báo lỗi
                alert(result.message || 'Có lỗi xảy ra khi cập nhật sản phẩm.');
            }
        } catch (error) {
            // Hiển thị lỗi kết nối
            alert('Lỗi: Không thể kết nối tới server.');
            console.error('Lỗi:', error);
        }
    });
});