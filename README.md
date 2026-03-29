# 🎓 TOEIC Flashcards Mastery 2026 - ETS 2024 Specialized

<p align="center">
  <img src="https://capsule-render.vercel.app/render?type=soft&color=auto&height=200&section=header&text=TOEIC%20Flashcards%20Mastery&fontSize=60&animation=fadeIn&fontAlignY=45" alt="TOEIC Flashcards Mastery Banner" />
</p>

<p align="center">
  <img src="https://img.shields.io/github/last-commit/duynamo/Toeic?style=for-the-badge&color=orange&logo=github" alt="GitHub last commit" />
  <img src="https://img.shields.io/github/repo-size/duynamo/Toeic?style=for-the-badge&color=blue&logo=github" alt="GitHub repo size" />
  <img src="https://img.shields.io/github/languages/top/duynamo/Toeic?style=for-the-badge&color=yellow&logo=javascript" alt="GitHub top language" />
  <img src="https://img.shields.io/github/license/duynamo/Toeic?style=for-the-badge&color=green&logo=github" alt="License" />
</p>

<p align="center">
  <h3>🎯 Dự án chuyên sâu về từ vựng TOEIC dựa trên bộ đề ETS 2024 mới nhất.</h3>
</p>

---

## 🚀 Đề xuất trải nghiệm

👉 **Học ngay tại:** [https://duynamo.github.io/Toeic/Toeic-Web-App/](https://duynamo.github.io/Toeic/Toeic-Web-App/)

---

## ✨ Tính năng nổi bật 

* **🎯 Kho dữ liệu ETS 2024:** * 🎧 **Listening (LC):** Từ vựng Part 1, 2, 3, 4.
  * 📖 **Reading (RC):** Từ vựng Part 5, 6, đặc biệt là **Part 7**.
* **🔊 Giọng đọc AI đa dạng:** Tích hợp **Google TTS**, **AWS Polly**, **Microsoft Azure TTS**... giúp luyện nghe giọng Mỹ, Anh, Úc chuẩn xác.
* **⚡ Chế độ "Khô Máu" (Hardcore):** Tăng cường khả năng ghi nhớ nhanh thông qua các vòng lặp từ vựng áp lực cao.
* **📱 Giao diện Responsive:** Hiển thị tối ưu trên mọi thiết bị (PC, Máy tính bảng, Điện thoại).
* **📊 Phân loại thông minh:** Dữ liệu JSON được phân chia rõ ràng theo từng chủ đề.

---

## 🛠️ Công nghệ & Ngôn ngữ (Sử dụng Icon cho đẹp)

<p align="left">
  <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/html5/html5-original.svg" alt="html5" width="40" height="40"/> &nbsp;
  <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/css3/css3-original.svg" alt="css3" width="40" height="40"/> &nbsp;
  <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/javascript/javascript-original.svg" alt="javascript" width="40" height="40"/> &nbsp;
  <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/python/python-original.svg" alt="python" width="40" height="40"/> &nbsp;
  <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/powershell/powershell-original.svg" alt="powershell" width="40" height="40"/> &nbsp;
</p>

* **Front-end:** HTML5, CSS3, JavaScript (Core logic).
* **Data Processing:** Python (Scripts cào, xử lý CSV/JSON).
* **Automation:** PowerShell (Tối ưu luồng công việc).
* **AI TTS:** Các API/dịch vụ giọng đọc thông minh.

---

## 📂 Cấu trúc dự án

<details open>
  <summary>📂 Danh mục file quan trọng</summary>

```text
├── Toeic-Web-App/
│   ├── index.html          # Giao diện chính của ứng dụng
│   ├── style.css           # Định dạng giao diện (Dark mode & Animations)
│   ├── app.js              # Logic điều khiển Flashcards và giọng đọc
│   └── data.js             # File cầu nối dữ liệu
├── scripts/                # Các script hỗ trợ (Python, PowerShell)
└── data/                   # Dữ liệu từ vựng (CSV, JSON) từ ETS 2024
