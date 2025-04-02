function toggleChat() {
    const chatContainer = document.getElementById('chat-container');
    chatContainer.style.display = chatContainer.style.display === 'flex' ? 'none' : 'flex';
}

async function sendMessage() {
    const input = document.getElementById('chat-input');
    const message = input.value.trim(); // Loại bỏ khoảng trắng đầu/cuối
    if (!message) return;

    const chatBox = document.getElementById('chat-box');
    chatBox.innerHTML += `<div class="user-message">${message}</div>`; // Thêm tin nhắn người dùng

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
    } catch (error) {
        console.error('Error:', error);
        chatBox.innerHTML += `<div class="error-message">Lỗi: ${error.message}</div>`;
    }

    input.value = ''; // Xóa input
}

// Gắn sự kiện cho nút gửi (giả sử có button với id="send-button")
document.getElementById('send-button')?.addEventListener('click', sendMessage);

// Gắn sự kiện Enter
document.getElementById('chat-input')?.addEventListener('keypress', (e) => {
    if (e.key === 'Enter') sendMessage();
});