# Read text file directly and extract just the IP addresses
$ipAddresses = Get-Content "ips.txt" | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne "" }

# Array to store failed IPs
$failedIPs = @()

# Ping each IP address
foreach ($ip in $ipAddresses) {
    Write-Host "Pinging $ip..." -ForegroundColor Yellow
    
    $pingResult = Test-Connection -ComputerName $ip -Count 1 -Quiet
    
    if ($pingResult) {
        Write-Host "[SUCCESS] $ip is reachable" -ForegroundColor Green
    } else {
        Write-Host "[FAILED] $ip is unreachable" -ForegroundColor Red
        $failedIPs += $ip
    }
}

# Print summary of failed IPs
if ($failedIPs.Count -gt 0) {
    Write-Host "`nFailed IP Addresses:" -ForegroundColor Red
    foreach ($failedIP in $failedIPs) {
        Write-Host "  $failedIP" -ForegroundColor Red
    }
} else {
    Write-Host "`nAll IP addresses are reachable!" -ForegroundColor Green
}