# Toeic
# 🎓 TOEIC Flashcards Mastery 2026

![GitHub last commit](https://img.shields.io/github/last-commit/duynamo/Toeic?style=for-the-badge&color=orange)
![GitHub repo size](https://img.shields.io/github/repo-size/duynamo/Toeic?style=for-the-badge&color=blue)
![License](https://img.shields.io/github/license/duynamo/Toeic?style=for-the-badge&color=green)

**TOEIC Flashcards Mastery** là một ứng dụng web học từ vựng thông minh, được thiết kế tối ưu để giúp người học chinh phục các kỳ thi TOEIC (đặc biệt là bộ đề **ETS 2024**) một cách hiệu quả nhất.

🚀 **Dùng thử ngay tại:** [https://duynamo.github.io/Toeic/Toeic-Web-App/](https://duynamo.github.io/Toeic/Toeic-Web-App/)

---

## ✨ Tính năng nổi bật

* **🎯 Kho dữ liệu ETS 2024:** Tích hợp sẵn bộ từ vựng mới nhất từ các đề thi ETS 2024 (LC & RC).
* **🔊 Giọng đọc AI đa dạng:** Hỗ trợ nhiều giọng đọc (Eric, Emma...) giúp luyện kỹ năng Listening chuẩn xác.
* **📱 Giao diện Responsive:** Hiển thị mượt mà trên cả điện thoại và máy tính.
* **⚡ Chế độ "Khô Máu" (Hardcore):** Giúp tăng cường khả năng ghi nhớ thông qua các vòng lặp từ vựng nhanh.
* **📊 Phân loại thông minh:** Từ vựng được chia theo chủ đề: Listening, Reading, Part 7, v.v.

---

## 🛠️ Công nghệ sử dụng

Dự án được xây dựng dựa trên sự kết hợp giữa sức mạnh của Python (xử lý dữ liệu) và Web Front-end hiện đại:

* **Front-end:** HTML5, CSS3 (Modern UI), JavaScript (ES6+).
* **Data Processing:** Python (Scripts cào dữ liệu và chuyển đổi CSV/JSON).
* **Automation:** PowerShell scripts giúp tối ưu hóa luồng làm việc.
* **Icons:** Font Awesome 6.

---

## 📂 Cấu trúc dự án

```text
├── Toeic-Web-App/
│   ├── index.html          # Giao diện chính của ứng dụng
│   ├── style.css           # Định dạng giao diện (Dark mode & Animations)
│   ├── app.js              # Logic điều khiển Flashcards và giọng đọc
│   └── data.js             # File cầu nối dữ liệu
├── scripts/                # Các script hỗ trợ (Python, PowerShell)
└── data/                   # Dữ liệu từ vựng (CSV, JSON) từ ETS 2024
