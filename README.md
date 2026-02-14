# sysmon

A lightweight, real-time terminal system monitor for Linux that displays system performance metrics and process information in an easy-to-read format.

## Features

* **Live monitoring**: Real-time CPU, RAM, and GPU usage with continuous updates
* **Top processes**: Identify resource-heavy processes sorted by CPU or RAM consumption
* **System information**: View detailed system configuration and specifications

## Installation

Clone the repository and run the installer:

```bash
git clone https://github.com/drkrisz/sysmon.git
cd sysmon
bash install.sh
```

This will install `sysmon` to your system path, making it available as a command from any terminal.

## Usage

**Live monitoring** - Display real-time system metrics that update continuously:
```bash
sysmon
```

**Top processes** - Show the top N processes consuming the most CPU or RAM:
```bash
sysmon top 5      # Display top 5 processes
sysmon top 10     # Display top 10 processes
```
By default, processes are sorted by CPU usage. This helps identify resource-hungry applications.

**System information** - View system specifications and configuration details:
```bash
sysmon setup
```

## Requirements

* **OS**: Linux (Ubuntu, Debian, Fedora, or similar distributions)
* **Shell**: Bash 4.0+
* **System utilities**: Standard Linux command-line tools (proc filesystem, ps, grep, awk)
* **GPU monitoring**: NVIDIA GPUs require `nvidia-smi` (installed with NVIDIA drivers)

## Troubleshooting

**Command not found after installation:**
- Ensure your shell's PATH includes the installation directory
- Try reopening your terminal or running `source ~/.bashrc`

**Permission denied errors:**
- Make sure the install script is executable: `chmod +x install.sh`
- You may need to run `sudo bash install.sh` depending on your system configuration

**GPU usage not showing:**
- Verify NVIDIA drivers are installed: `nvidia-smi`
- Only NVIDIA GPUs are currently supported; AMD GPU support may be added in future releases

## License

MIT License
