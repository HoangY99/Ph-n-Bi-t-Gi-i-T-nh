# Phan-Biet-Gioi-Tinh
Phân biệt giới tính (nam/nữ) dựa vào tín hiệu giọng nói (phát âm các nguyên âm "a", "e", "i", "o", "u");
Sử dụng biến đổi nhanh fourier (FFT) để tìm tần số F0 cơ bản, rồi đưa sang bộ lọc:

tần số F0 <= 160 Hz => Nam.

tần số F0 > 160Hz => Nữ.
