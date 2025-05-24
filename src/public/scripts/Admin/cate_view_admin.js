
document.addEventListener('DOMContentLoaded', function () {
    const saveButton = document.querySelector('.btn-primary');
    const categoryNameInput = document.querySelector('#product-name-label');
    const categoryTypeSelect = document.querySelector('#categoryLabel-ts-control');
    const imageUpload = document.querySelector('#imageUpload');
    const previewImage = document.querySelector('#previewImage');

    // Xử lý xem trước hình ảnh
    imageUpload.addEventListener('change', function (e) {
        const file = e.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                previewImage.src = e.target.result;
                previewImage.style.display = 'block';
            };
            reader.readAsDataURL(file);
        }
    });

    // Xử lý gửi form
    saveButton.addEventListener('click', async function (e) {
        e.preventDefault();

        // Xác thực dữ liệu
        if (!categoryNameInput.value.trim()) {
            alert('Vui lòng nhập tên danh mục');
            return;
        }

        if (!categoryTypeSelect.value || categoryTypeSelect.value === 'Chọn loại danh mục sản phẩm') {
            alert('Vui lòng chọn loại danh mục');
            return;
        }

        const formData = new FormData();
        formData.append('category_name', categoryNameInput.value.trim());
        formData.append('category_type', categoryTypeSelect.value);
        if (imageUpload.files[0]) {
            formData.append('category_img', imageUpload.files[0]);
        }

        try {
            const response = await fetch('/admin/categories_admin/add', {
                method: 'POST',
                body: formData
            });

            const result = await response.json();

            if (response.ok) {
                alert('Thêm danh mục thành công!');
                window.location.href = '/admin/categories_admin';
            } else {
                alert(result.message || 'Có lỗi xảy ra khi thêm danh mục');
            }
        } catch (error) {
            console.error('Lỗi:', error);
            alert('Lỗi kết nối server');
        }
    });
});

