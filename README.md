# IP Ping Script

A PowerShell script that reads IP addresses from a text file and performs connectivity tests using ping.

## Description

This script automates the process of testing network connectivity to multiple IP addresses. It reads IP addresses from a text file, pings each one, and provides a summary of results with color-coded output for easy identification of failed connections.

## Features

- Reads IP addresses from a text file (`ips.txt`)
- Performs ping tests on each IP address
- Color-coded console output:
  - **Yellow**: Currently pinging
  - **Green**: Successful ping
  - **Red**: Failed ping
- Collects and displays a summary of failed IP addresses
- Handles empty lines and whitespace in the input file

## Prerequisites

- Windows PowerShell 5.1 or PowerShell Core 6+
- Appropriate network permissions to ping target addresses

## Usage

### 1. Prepare the IP List

Create a text file named `ips.txt` in the same directory as the script. Add one IP address per line:

```
192.168.1.1
8.8.8.8
1.1.1.1
192.168.1.100
10.0.0.1
```

### 2. Run the Script

Execute the PowerShell script:

```powershell
.\ping-script.ps1
```

### 3. View Results

The script will display real-time results as it pings each IP address and provide a final summary of any failed connections.

## Sample Output

```
Pinging 192.168.1.1...
[SUCCESS] 192.168.1.1 is reachable
Pinging 8.8.8.8...
[SUCCESS] 8.8.8.8 is reachable
Pinging 192.168.1.100...
[FAILED] 192.168.1.100 is unreachable

Failed IP Addresses:
  192.168.1.100
```

## File Structure

```
project-directory/
├── ping-script.ps1
├── ips.txt
└── README.md
```

## Configuration

### Modifying Ping Parameters

You can customize the ping behavior by modifying the `Test-Connection` parameters:

- **Count**: Change `-Count 1` to ping multiple times
- **Timeout**: Add `-TimeoutSeconds X` to set custom timeout
- **Quiet**: The `-Quiet` parameter returns only boolean results

Example with custom parameters:
```powershell
$pingResult = Test-Connection -ComputerName $ip -Count 3 -TimeoutSeconds 5 -Quiet
```

### Custom Input File

To use a different input file, modify the first line:
```powershell
$ipAddresses = Get-Content "your-file.txt" | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne "" }
```

## Error Handling

The script includes basic error handling:
- Trims whitespace from IP addresses
- Filters out empty lines
- Collects failed ping attempts for summary reporting

## Use Cases

- Network troubleshooting
- Infrastructure monitoring
- Pre-deployment connectivity verification
- Regular health checks of critical systems
- Network documentation and auditing

## Contributing

Feel free to submit issues, fork the repository, and create pull requests for any improvements.

## License

This project is open source and available under the [MIT License](LICENSE).

## Support

If you encounter any issues or have questions, please open an issue in the GitHub repository.
