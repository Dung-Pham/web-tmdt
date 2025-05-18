const inputs = document.querySelectorAll(".register__input-field");
const toggle_btn = document.querySelectorAll(".register__toggle");
const main = document.querySelector("main");
const images = document.querySelectorAll(".register__image");

inputs.forEach((inp) => {
    inp.addEventListener("focus", () => {
        inp.classList.add("active");
    });
    inp.addEventListener("blur", () => {
        if (inp.value != "") return;
        inp.classList.remove("active");
    });
});

function moveSlider() {
    let index = 1;

    function transitionSlide() {
        let currentImage = document.querySelector(`.register__img-${index}`);
        images.forEach((img) => img.classList.remove("show"));
        currentImage.classList.add("show");

        index = (index % images.length) + 1;
    }

    return transitionSlide;
}

const autoSlide = moveSlider();

function startAutoSlide() {
    autoSlide();
    setTimeout(startAutoSlide, 3000); //tự động chuyển slide mỗi 3 giây
}

startAutoSlide();

const passwordInput = document.getElementById("password");
const togglePasswordButton = document.getElementById("togglePassword");

togglePasswordButton.addEventListener("click", function () {
    const isVisible = togglePasswordButton.getAttribute("data-visible") === "true";

    if (isVisible) {
        passwordInput.type = "password"; // Ẩn mật khẩu
        togglePasswordButton.setAttribute("data-visible", "false");
        togglePasswordButton.querySelector(".material-symbols-outlined").textContent = "visibility";


    } else {
        passwordInput.type = "text"; // Hiển thị mật khẩu
        togglePasswordButton.setAttribute("data-visible", "true");
        togglePasswordButton.querySelector(".material-symbols-outlined").textContent = "visibility_off";

    }
});

const passwordInputN = document.getElementById("passwordRepeat");
const togglePasswordButtonN = document.getElementById("togglePasswordN");

togglePasswordButtonN.addEventListener("click", function () {
    const isVisible = togglePasswordButtonN.getAttribute("data-visible") === "true";

    if (isVisible) {
        passwordInputN.type = "password"; // Ẩn mật khẩu
        togglePasswordButtonN.setAttribute("data-visible", "false");
        togglePasswordButtonN.querySelector(".material-symbols-outlined").textContent = "visibility";


    } else {
        passwordInputN.type = "text"; // Hiển thị mật khẩu
        togglePasswordButtonN.setAttribute("data-visible", "true");
        togglePasswordButtonN.querySelector(".material-symbols-outlined").textContent = "visibility_off";

    }
});


const form = document.getElementById('form');



document.getElementById('registerForm').addEventListener('submit', async function (e) {
    e.preventDefault();
    await validateInput(); // Dòng 90 có thể ở đây hoặc trong validateInput
});


const setError = (element, message) => {
    const inputControl = element.parentElement;
    const errorDisplay = inputControl.querySelector(`.register__error`);

    errorDisplay.innerText = message;
    inputControl.classList.add('error');
    inputControl.classList.remove('error');
}

const setSuccess = element => {
    const inputControl = element.parentElement;
    const errorDisplay = inputControl.querySelector(`.register__error`);

    errorDisplay.innerText = '';
    inputControl.classList.add('success');
    inputControl.classList.remove('error');
}

const isValidPhoneNumber = phoneNumber => {
    const re = /^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$/;
    return re.test(String(phoneNumber).trim());
}
//trường họ tên
document.getElementById('userName').addEventListener('input', function (e) {
    const userName = e.target.value.trim();
    const errorDiv = e.target.parentElement.querySelector('.register__error');
    const validPattern = /^[a-zA-ZÀ-ỹ\s]{2,50}$/;

    if (validPattern.test(userName)) {
        setSuccess(errorDiv);
        e.target.style.borderColor = '#ccc';
        return;
    }
    if (!userName) {
        setError(errorDiv, 'Vui lòng nhập họ tên');
    } else if (userName.length < 2) {
        setError(errorDiv, 'Họ tên phải có ít nhất 2 ký tự');
    } else if (!validPattern.test(userName)) {
        setError(errorDiv, 'Họ tên chỉ chứa chữ cái và dấu cách');
    }

});
document.getElementById('userName').addEventListener('blur', function (e) {
    const userName = e.target.value.trim();
    const errorDiv = e.target.parentElement.querySelector('.register__error');
    const validPattern = /^[a-zA-ZÀ-ỹ\s]{2,50}$/;

    if (validPattern.test(userName)) {
        setSuccess(errorDiv);
        e.target.style.borderColor = '#ccc';
        return;
    }
    if (!userName) {
        setError(errorDiv, 'Vui lòng nhập họ tên');
    } else if (userName.length < 2) {
        setError(errorDiv, 'Họ tên phải có ít nhất 2 ký tự');
    } else if (!validPattern.test(userName)) {
        setError(errorDiv, 'Họ tên chỉ chứa chữ cái và dấu cách');
    }

});
// trường số điện thoại
document.getElementById('phoneNumber').addEventListener('input', function (e) {
    const phoneInput = e.target.value;
    const errorDiv = e.target.parentElement.querySelector('.register__error');
    const numberOnlyPattern = /^[0-9]*$/; // Chỉ chứa số
    const validPattern = /^[0-9]{10}$/; // Chính xác 10 chữ số


    if (!phoneInput) {
        setError(errorDiv, 'Số điện thoại không được để trống');
        return;
    }

    if (!numberOnlyPattern.test(phoneInput)) {
        setError(errorDiv, 'Chỉ được nhập số!');
    } else if (phoneInput.length > 0 && phoneInput.length < 10) {
        setError(errorDiv, 'Số điện thoại không được để trống');
    } else {
        setSuccess(errorDiv); // Xóa lỗi nếu đúng 10 số
    }
});
document.getElementById('phoneNumber').addEventListener('blur', function (e) {
    const phoneInput = e.target.value;
    const errorDiv = e.target.parentElement.querySelector('.register__error');
    const numberOnlyPattern = /^[0-9]*$/; // Chỉ chứa số
    const validPattern = /^[0-9]{10}$/; // Chính xác 10 chữ số


    if (!phoneInput) {
        setError(errorDiv, 'Số điện thoại không được để trống');
        return;
    }

    if (!numberOnlyPattern.test(phoneInput)) {
        setError(errorDiv, 'Chỉ được nhập số!');
    } else if (phoneInput.length > 0 && phoneInput.length < 10) {
        setError(errorDiv, 'Số điện thoại không được để trống');
    } else {
        setSuccess(errorDiv); // Xóa lỗi nếu đúng 10 số
    }
});
document.getElementById('password').addEventListener('input', function (e) {
    const passwordInput = e.target.value;
    const errorDiv = e.target.parentElement.querySelector('.register__error');
    const validPattern = /^[a-zA-Z0-9!@#$%^&*]{8,20}$/;

    if (!passwordInput) {
        setError(errorDiv, 'Mật khẩu không được để trống!');
    } else if (!validPattern.test(passwordInput)) {
        setError(errorDiv, 'Mật khẩu không hợp lệ (8-20 ký tự, chữ cái, số, ký tự đặc biệt)!');
    } else {
        setSuccess(errorDiv);
        e.target.style.borderColor = '#ccc';
    }
});
//trường mật khẩu
document.getElementById('password').addEventListener('blur', function (e) {
    const passwordInput = e.target.value;
    const errorDiv = e.target.parentElement.querySelector('.register__error');
    const validPattern = /^[a-zA-Z0-9!@#$%^&*]{8,20}$/;

    if (!passwordInput) {
        setError(errorDiv, 'Mật khẩu không được để trống!');
    } else if (!validPattern.test(passwordInput)) {
        setError(errorDiv, 'Mật khẩu không hợp lệ (8-20 ký tự, chữ cái, số, ký tự đặc biệt)!');
    } else {
        setSuccess(errorDiv);
        e.target.style.borderColor = '#ccc';
    }
});

//trường xác nhận mật khẩu
document.getElementById('passwordRepeat').addEventListener('input', function (e) {
    const passwordRepeat = e.target.value;
    const passwordInput = document.getElementById('password').value;
    const errorDiv = e.target.parentElement.querySelector('.register__error');
    const validPattern = /^[a-zA-Z0-9!@#$%^&*]{8,20}$/;

    if (!passwordRepeat) {
        setError(errorDiv, 'Mật khẩu xác nhận không được để trống!');
    } else if (!validPattern.test(passwordRepeat)) {
        setError(errorDiv, 'Mật khẩu không hợp lệ (8-20 ký tự, chữ cái, số, ký tự đặc biệt)!');
    } else if (passwordInput !== passwordRepeat) {
        setError(errorDiv, 'Mật khẩu xác nhận không khớp');
    }
    else {
        setSuccess(errorDiv);
        e.target.style.borderColor = '#ccc';
    }
});
document.getElementById('passwordRepeat').addEventListener('blur', function (e) {
    const passwordRepeat = e.target.value;
    const passwordInput = document.getElementById('password').value;
    const errorDiv = e.target.parentElement.querySelector('.register__error');
    const validPattern = /^[a-zA-Z0-9!@#$%^&*]{8,20}$/;

    if (!passwordRepeat) {
        setError(errorDiv, 'Mật khẩu xác nhận không được để trống!');
    } else if (!validPattern.test(passwordRepeat)) {
        setError(errorDiv, 'Mật khẩu không hợp lệ (8-20 ký tự, chữ cái, số, ký tự đặc biệt)!');
    } else if (passwordInput !== passwordRepeat) {
        setError(errorDiv, 'Mật khẩu xác nhận không khớp');
    }
    else {
        setSuccess(errorDiv);
        e.target.style.borderColor = '#ccc';
    }
});

const validateInput = async () => {
    // Lấy giá trị của các trường thông tin
    const nameInput = document.getElementById('userName').value.trim();
    const phoneInput = document.getElementById('phoneNumber').value;
    const passwordInput = document.getElementById('password').value;
    const confirmPasswordInput = document.getElementById('passwordRepeat').value;
    const nameErrorDiv = document.getElementById('userName').parentElement.querySelector('.register__error');
    const phoneErrorDiv = document.getElementById('phoneNumber').parentElement.querySelector('.register__error');
    const passwordErrorDiv = document.getElementById('password').parentElement.querySelector('.register__error');
    const confirmErrorDiv = document.getElementById('passwordRepeat').parentElement.querySelector('.register__error');
    const namePattern = /^[a-zA-ZÀ-ỹ\s]{2,50}$/;
    const phonePattern = /^[0-9]{10}$/;
    const passwordPattern = /^[a-zA-Z0-9!@#$%^&*]{8,20}$/;

    let isAllValid = true;

    if (!nameInput) {
        // nameErrorDiv.textContent = 'Vui lòng nhập Họ tên!';
        // nameErrorDiv.classList.add('show');
        isAllValid = false;
    } else if (nameInput.length < 2) {
        // nameErrorDiv.textContent = 'Họ tên phải có ít nhất 2 ký tự!';
        // nameErrorDiv.classList.add('show');
        isAllValid = false;
    } else if (!namePattern.test(nameInput)) {
        // nameErrorDiv.textContent = 'Họ tên chỉ chứa chữ cái và dấu cách!';
        // nameErrorDiv.classList.add('show');
        isAllValid = false;
    }
    // } else {
    //     nameErrorDiv.classList.remove('error');
    // }

    if (!phonePattern.test(phoneInput)) {
        // phoneErrorDiv.textContent = 'Vui lòng nhập đúng 10 chữ số!';
        // phoneErrorDiv.classList.add('show');
        isAllValid = false;
    }
    // else {
    //     phoneErrorDiv.classList.remove('error');
    // }

    if (!passwordPattern.test(passwordInput)) {
        // passwordErrorDiv.textContent = 'Mật khẩu không hợp lệ (8-20 ký tự, chữ cái, số, ký tự đặc biệt)!';
        // passwordErrorDiv.classList.add('show');
        isAllValid = false;
    }
    // else {
    //     passwordErrorDiv.classList.remove('error');
    // }

    if (!confirmPasswordInput) {
        // confirmErrorDiv.textContent = 'Vui lòng nhập lại mật khẩu!';
        // confirmErrorDiv.classList.add('show');
        isAllValid = false;
    } else if (confirmPasswordInput !== passwordInput) {
        // confirmErrorDiv.textContent = 'Mật khẩu xác nhận không khớp!';
        // confirmErrorDiv.classList.add('show');
        isAllValid = false;
    } else if (!passwordPattern.test(confirmPasswordInput)) {
        // confirmErrorDiv.textContent = 'Mật khẩu xác nhận không hợp lệ (8-20 ký tự, chữ cái, số, ký tự đặc biệt)!';
        // confirmErrorDiv.classList.add('show');
        isAllValid = false;
    }
    // else {
    //     confirmErrorDiv.classList.remove('error');
    // }
    // Nếu tất cả các trường thông tin hợp lệ, thì gửi form
    if (isAllValid) {
        const register = {
            user_login_name: userName.value.trim(),
            user_phone: phoneNumber.value.trim(),
            user_password: password.value.trim(),
            captchaResponse: captchaResponse // Thêm captcha response vào dữ liệu gửi đi
        };

        await fetch("/auth/register", {
            method: "POST",
            body: JSON.stringify(register),
            headers: {
                "Content-Type": "application/json"
            }
        }).then(res => res.json())
            .then(async back => {
                if (back.status == "error") {
                    setError(phoneNumber, back.error);
                }
                else if (back.status == "captcha_error") {
                    setCustomError('captcha-error', back.error);
                    // Reset captcha khi xác thực thất bại
                    grecaptcha.reset();
                }
                else {
                    const login = {
                        phoneNumber: phoneNumber.value.trim(),
                        password: password.value.trim()
                    }

                    await fetch('/auth/login', {
                        method: 'POST',
                        body: JSON.stringify(login),
                        headers: {
                            "Content-Type": "application/json"
                        }
                    })
                    // location.reload()
                    window.location.href = '/auth/login'
                }
            })
    }
};