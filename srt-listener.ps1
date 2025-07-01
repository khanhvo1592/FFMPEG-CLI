$port = 9001
$passphrase = "Khanh20252025"
$output = "received.mp4"

while ($true) {
    Write-Host "�� Đang lắng nghe SRT trên cổng $port ..."
    
    # Tạo URL SRT với cú pháp chính xác
    $srtUrl = "srt://0.0.0.0:$port?mode=listener&passphrase=$passphrase&timeout=10000000"

    # Sử dụng ffmpeg trực tiếp thay vì Start-Process để tránh lỗi encoding
    & ffmpeg -i $srtUrl -c copy $output

    Write-Host "⚠️ Stream kết thúc hoặc không nhận được tín hiệu."
    Start-Sleep -Seconds 5
}