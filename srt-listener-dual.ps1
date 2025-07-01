$port = 9001
$passphrase = "Khanh20252025"
$output = "received.mp4"
$mode = "play"  # "play" hoặc "record"

$srtOptions = @(
    "mode=listener",
    "passphrase=$passphrase", 
    "timeout=10000000",
    "latency=120",
    "rcvbuf=8192",
    "sndbuf=8192",
    "mss=1500"
)
∂
while ($true) {
    Write-Host "�� Đang lắng nghe SRT trên cổng $port ..."
    
    $srtUrl = "srt://0.0.0.0:$port?" + ($srtOptions -join "&")
    
    if ($mode -eq "play") {
        Write-Host "�� Phát stream với FFplay..."
        & ffplay -v info -i $srtUrl -sync ext -fflags +genpts
    } else {
        Write-Host "�� Ghi stream với FFmpeg..."
        & ffmpeg -v info -i $srtUrl -c copy -y $output
    }
    
    Write-Host "⚠️ Stream kết thúc."
    Start-Sleep -Seconds 5
}