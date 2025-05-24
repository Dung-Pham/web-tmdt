document.addEventListener('DOMContentLoaded', function () {
    // Select the delete button (will hide in DB) and checkboxes
    const deleteButton = document.querySelector('.btn-outline-danger');
    const checkboxes = document.querySelectorAll('.checkbox');
    const checkAllCheckbox = document.querySelector('.table__heading .checkbox');
    const tabs = document.querySelectorAll('.main-header__tabs .nav__item');

    // Function to get selected product IDs
    function getSelectedProductIds() {
        const selectedIds = [];
        checkboxes.forEach(checkbox => {
            if (checkbox.checked && checkbox.closest('tr.employeeDetails')) {
                const row = checkbox.closest('tr.employeeDetails');
                const idCell = row.querySelector('td:nth-child(2)').textContent.trim();
                if (idCell !== 'Null') {
                    selectedIds.push(idCell);
                }
            }
        });
        return selectedIds;
    }

    // Handle "Select All" checkbox
    if (checkAllCheckbox) {
        checkAllCheckbox.addEventListener('change', function () {
            checkboxes.forEach(checkbox => {
                checkbox.checked = checkAllCheckbox.checked;
            });
        });
    }

    // Handle delete button click (hides products in DB)
    if (deleteButton) {
        deleteButton.addEventListener('click', async function (e) {
            e.preventDefault();
            const selectedIds = getSelectedProductIds();

            if (selectedIds.length === 0) {
                alert('Vui lòng chọn ít nhất một sản phẩm để xóa.');
                return;
            }

            if (!confirm(`Bạn có chắc chắn muốn xóa ${selectedIds.length} sản phẩm?`)) {
                return;
            }

            try {
                // Send PUT request to backend to hide products
                const response = await fetch('/admin/products_admin/delete', {
                    method: 'PUT',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    credentials: 'include', // Gửi cookie adminSaveS
                    body: JSON.stringify({ productVariantIds: selectedIds }),
                });

                const result = await response.json();

                if (response.ok) {
                    // Remove hidden rows from the table
                    checkboxes.forEach(checkbox => {
                        if (checkbox.checked && checkbox.closest('tr.employeeDetails')) {
                            const row = checkbox.closest('tr.employeeDetails');
                            row.remove();
                        }
                    });

                    // Update total row count in header
                    const totalRowBadge = document.querySelector('.main-header__badge');
                    let totalRow = parseInt(totalRowBadge.textContent);
                    totalRow -= selectedIds.length;
                    totalRowBadge.textContent = totalRow;
                    checkboxes.forEach(checkbox => {
                        checkbox.checked = false;
                    });
                    if (checkAllCheckbox) {
                        checkAllCheckbox.checked = false;
                    }
                    alert('Xóa sản phẩm thành công!');
                } else {
                    alert(`Lỗi: ${result.message || 'Không thể xóa sản phẩm.'}`);
                }
            } catch (error) {
                console.error('Lỗi khi xóa sản phẩm:', error);
                alert('Đã xảy ra lỗi khi xóa sản phẩm. Vui lòng thử lại.');
            }
        });
    }
    const editButtons = document.querySelectorAll('.edit-btn');
    editButtons.forEach(button => {
        button.addEventListener('click', function () {
            const productVariantId = this.getAttribute('data-id');
            window.location.href = `/admin/products_admin/edit/${productVariantId}`;
        });
    });
});