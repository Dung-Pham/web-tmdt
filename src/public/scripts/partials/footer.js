
document.addEventListener('DOMContentLoaded', function () {
    // Đảm bảo chat container ẩn khi trang tải xong
    document.getElementById('chat-container').style.display = 'none';
    const chatBox = document.getElementById('chat-box');
    const chatHistory = JSON.parse(sessionStorage.getItem('chatHistory')) || [];
    // Làm sạch nội dung chatBox trước khi hiển thị lại
    chatBox.innerHTML = '';
    // Duyệt qua lịch sử và hiển thị tin nhắn
    chatHistory.forEach(entry => {
        const messageClass = entry.sender === 'user' ? 'user-message' : 'bot-message';
        chatBox.innerHTML += `<div class="${messageClass}">${entry.text}</div>`;
    });
});
function toggleChat() {
    // const chatContainer = document.getElementById('chat-container');
    // chatContainer.style.display = chatContainer.style.display === 'flex' ? 'none' : 'flex';

    const chatContainer = document.getElementById('chat-container');
    if (chatContainer.style.display === 'none' || chatContainer.style.display === '') {
        chatContainer.style.display = 'block';
    } else {
        chatContainer.style.display = 'none';
    }
}

async function sendMessage() {
    const input = document.getElementById('chat-input');
    const message = input.value.trim(); // Loại bỏ khoảng trắng đầu/cuối
    if (!message) return;

    const chatBox = document.getElementById('chat-box');
    chatBox.innerHTML += `<div class="user-message">${message}</div>`; // Thêm tin nhắn người dùng
    // Lưu tin nhắn vào sessionStorage
    let chatHistory = JSON.parse(sessionStorage.getItem('chatHistory')) || [];
    chatHistory.push({ sender: 'user', text: message });
    sessionStorage.setItem('chatHistory', JSON.stringify(chatHistory));
    try {
        const response = await fetch('/chatbot', { // Đường dẫn đầy đủ
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ message })
        });

        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }

        const data = await response.json();
        // Kiểm tra trường "res" từ phản hồi của Django
        const botReply = data.res || 'No response from bot';
        chatBox.innerHTML += `<div class="bot-message">${botReply}</div>`;
        chatHistory.push({ sender: 'bot', text: botReply });
        sessionStorage.setItem('chatHistory', JSON.stringify(chatHistory));
    } catch (error) {
        console.error('Error:', error);
        chatBox.innerHTML += `<div class="error-message">Lỗi: ${error.message}</div>`;
    }

    input.value = ''; // Xóa input
}
function logout() {
    // Xóa lịch sử tin nhắn khi đăng xuất
    sessionStorage.removeItem('chatHistory');

    // Chuyển hướng đến trang đăng nhập (nếu cần)
    window.location.href = '/';
}
document.getElementById('btn-dropdown-logout')?.addEventListener('click', logout);
// Gắn sự kiện cho nút gửi (giả sử có button với id="send-button")
document.getElementById('send-button')?.addEventListener('click', sendMessage);

// Gắn sự kiện Enter
document.getElementById('chat-input')?.addEventListener('keypress', (e) => {
    if (e.key === 'Enter') sendMessage();
});