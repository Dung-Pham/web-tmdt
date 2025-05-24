document.addEventListener('DOMContentLoaded', () => {
    // Khởi tạo mảng lưu trữ các file ảnh đã chọn
    let files = [];

    // 1. Xử lý tải ảnh
    const imageUpload = document.getElementById('imageUpload');
    const previewContainer = document.querySelector('.dz-preview');
    const fileErrorMessage = document.getElementById('fileErrorMessage');

    if (imageUpload && previewContainer) {
        imageUpload.addEventListener('change', (e) => {
            let hasInvalidFile = false;
            previewContainer.innerHTML = ''; // Xóa các ảnh xem trước cũ
            files = []; // Xóa danh sách file cũ để tránh trùng lặp

            for (let file of e.target.files) {
                if (file.type.startsWith('image/')) {
                    files.push(file);
                    const reader = new FileReader();
                    reader.onload = (e) => {
                        const preview = document.createElement('div');
                        preview.classList.add('dz-image-preview');
                        preview.innerHTML = `
                            <img src="${e.target.result}" alt="${file.name}" title="${file.name}">
                            <button type="button" class="dz-remove">×</button>
                        `;
                        previewContainer.appendChild(preview);
                        preview.querySelector('.dz-remove').addEventListener('click', () => {
                            files = files.filter(f => f !== file); // Xóa file khỏi mảng
                            preview.remove(); // Xóa ảnh xem trước
                        });
                    };
                    reader.readAsDataURL(file);
                } else {
                    hasInvalidFile = true;
                }
            }

            fileErrorMessage.style.display = hasInvalidFile ? 'block' : 'none';
        });
    } else {
        console.error('Không tìm thấy imageUpload hoặc previewContainer');
    }

    // 2. Xử lý thêm/xóa biến thể động
    const addVariantBtn = document.getElementById('addVariantBtn');
    const variantsContainer = document.getElementById('variantsContainer');

    if (addVariantBtn && variantsContainer) {
        addVariantBtn.addEventListener('click', () => {
            const newItem = document.createElement('div');
            newItem.classList.add('card-item');
            newItem.innerHTML = `
                <div>
                    <input type="text" class="form-control" name="variants[name][]" placeholder="Tên biến thể" required>
                </div>
                <div>
                    <input type="number" class="form-control" name="variants[price][]" placeholder="Nhập giá tiền" step="0.01" min="0" required>
                </div>
                <div>
                    <input type="number" class="form-control" name="variants[stock][]" placeholder="Nhập số lượng có sẵn" min="0" required>
                </div>
                <button type="button" class="remove-btn">Xóa</button>
            `;
            variantsContainer.appendChild(newItem);
            newItem.querySelector('.remove-btn').addEventListener('click', () => {
                newItem.remove();
            });
        });
    } else {
        console.error('Không tìm thấy addVariantBtn hoặc variantsContainer');
    }

    // 3. Xử lý thêm/xóa chi tiết sản phẩm động
    const addDetailBtn = document.getElementById('addDetailBtn');
    const detailsContainer = document.getElementById('detailsContainer');

    if (addDetailBtn && detailsContainer) {
        addDetailBtn.addEventListener('click', () => {
            const newItem = document.createElement('div');
            newItem.classList.add('card-item');
            newItem.innerHTML = `
                <input type="text" class="form-control" name="details[spec_name][]" placeholder="Tên thông số" required>
                <input type="text" class="form-control" name="details[spec_value][]" placeholder="Giá trị thông số" required>
                <button type="button" class="remove-btn">Xóa</button>
            `;
            detailsContainer.appendChild(newItem);
            newItem.querySelector('.remove-btn').addEventListener('click', () => {
                newItem.remove();
            });
        });
    } else {
        console.error('Không tìm thấy addDetailBtn hoặc detailsContainer');
    }

    // 4. Xử lý gửi form
    const saveProductBtn = document.getElementById('saveProductBtn');
    const productForm = document.getElementById('productForm');

    if (saveProductBtn && productForm) {
        saveProductBtn.addEventListener('click', async (e) => {
            e.preventDefault(); // Ngăn chặn hành vi mặc định của form

            const formData = new FormData(productForm);

            // Thêm các file ảnh vào FormData
            files.forEach(file => formData.append('images', file));

            // Xác thực dữ liệu
            const productName = formData.get('productName')?.trim();
            const categoryId = formData.get('categoryId'); // Lấy categoryId từ select
            const description = formData.get('description')?.trim();

            if (!productName) {
                alert('Vui lòng nhập tên sản phẩm!');
                return;
            }
            if (!categoryId) {
                alert('Vui lòng chọn danh mục!');
                return;
            }
            if (!description) {
                alert('Vui lòng nhập mô tả sản phẩm!');
                return;
            }
            if (files.length === 0) {
                alert('Vui lòng chọn ít nhất một hình ảnh!');
                return;
            }

            // Chuyển categoryId thành số nếu backend yêu cầu
            formData.set('categoryId', parseInt(categoryId)); // Chỉ làm nếu backend cần số

            // Thu thập và xác thực biến thể
            const variantNames = document.querySelectorAll('input[name="variants[name][]"]');
            const variantPrices = document.querySelectorAll('input[name="variants[price][]"]');
            const variantStocks = document.querySelectorAll('input[name="variants[stock][]"]');
            const variants = [];

            for (let i = 0; i < variantNames.length; i++) {
                const name = variantNames[i].value.trim();
                const price = parseFloat(variantPrices[i].value);
                const stock = parseInt(variantStocks[i].value);

                if (!name || isNaN(price) || price < 0 || isNaN(stock) || stock < 0) {
                    alert('Vui lòng điền đầy đủ và hợp lệ thông tin biến thể!');
                    return;
                }
                variants.push({ name, price, stock });
            }

            // Thêm biến thể dưới dạng JSON
            formData.set('variants', JSON.stringify(variants));

            // Thu thập và xác thực chi tiết sản phẩm
            const specNames = document.querySelectorAll('input[name="details[spec_name][]"]');
            const specValues = document.querySelectorAll('input[name="details[spec_value][]"]');
            const details = [];

            for (let i = 0; i < specNames.length; i++) {
                const specName = specNames[i].value.trim();
                const specValue = specValues[i].value.trim();

                if (!specName || !specValue) {
                    alert('Vui lòng điền đầy đủ thông tin chi tiết sản phẩm!');
                    return;
                }
                details.push({ spec_name: specName, spec_value: specValue });
            }

            // Thêm chi tiết sản phẩm dưới dạng JSON
            formData.set('details', JSON.stringify(details));

            // Gửi dữ liệu lên backend
            try {
                const response = await fetch('/admin/products_admin/add', {
                    method: 'POST',
                    body: formData
                });

                const result = await response.json();
                if (response.ok) {
                    alert('Thêm sản phẩm thành công!');
                    window.location.href = '/admin/products_admin';
                } else {
                    alert(result.message || 'Có lỗi xảy ra khi thêm sản phẩm');
                }
            } catch (err) {
                console.error('Lỗi:', err);
                alert('Lỗi kết nối server');
            }
        });
    } else {
        console.error('Không tìm thấy saveProductBtn hoặc productForm');
    }

    // 5. Gắn sự kiện xóa cho các nút xóa ban đầu
    document.querySelectorAll('.remove-btn').forEach(btn => {
        if (!btn.dataset.eventAttached) {
            btn.addEventListener('click', () => {
                btn.closest('.card-item').remove();
            });
            btn.dataset.eventAttached = 'true';
        }
    });

});