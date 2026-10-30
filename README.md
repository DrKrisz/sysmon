# sysmon

A small Bash utility for inspecting CPU, RAM, NVIDIA GPU usage and busy
processes from a Linux terminal. It wraps existing system tools rather than
running a monitoring service or storing historical metrics.

## Stack and requirements

- Bash 4+, Linux, and an interactive terminal.
- `procps` tools (`top`, `ps`, `free`), `lscpu` (util-linux), and standard
  `awk`, `grep`, `sed`, `head`, `sleep` and `clear`.
- Optional: `nvidia-smi` for NVIDIA utilization; `lspci` for fallback GPU identification.

## Try without installing

```bash
git clone https://github.com/DrKrisz/sysmon.git
cd sysmon
LC_ALL=C bash ./sysmon setup
bash ./sysmon help
LC_ALL=C bash ./sysmon
```

Use **Ctrl+C** to stop either continuous mode.

| Command | Behaviour |
| --- | --- |
| `bash ./sysmon` or `bash ./sysmon live` | CPU, RAM and GPU line, roughly once a second |
| `bash ./sysmon top 5` | Both CPU-sorted and RAM-sorted process lists, every two seconds |
| `bash ./sysmon setup` | One-time CPU, memory and GPU information |
| `bash ./sysmon help` | Usage without starting the monitor |

The process count defaults to 5. Non-numeric counts and unknown commands
produce an error and a nonzero exit status.

## Optional user installation

From the repository directory:

```bash
bash install.sh
```

The installer copies `sysmon` into `~/.local/bin`, makes that copy executable,
and appends a PATH entry to `~/.bashrc` if the directory is not already on PATH.
No administrator access is needed. Open a new Bash terminal afterwards.
For another shell, configure its PATH yourself.

To uninstall, remove `~/.local/bin/sysmon`. If the installer added a PATH line,
review it in `~/.bashrc` before removing it; other tools may use that directory.

## Structure and development history

- `sysmon`: argument validation, help, `setup`, `top` and `live` branches.
- `install.sh`: user-local installation.
- `LICENSE`: MIT license.

DrKrisz's [CLI update](https://github.com/DrKrisz/sysmon/commit/30289966adc9bf67b90663e63f325d46efb36185)
records input validation, explicit errors, display formatting and GPU fallbacks.
The script is a compact example for discussing shell pipelines and operational
tradeoffs.

## Validation

Syntax and CLI smoke checks:

```bash
bash -n sysmon
bash -n install.sh
bash sysmon help
bash sysmon top invalid  # expected: count error and exit 1
bash sysmon unknown      # expected: unknown-command error and exit 1
```

On a Linux machine, also try `setup`, `live` and `top 5`; check the displayed
values against the underlying tools. Syntax and argument checks alone do not
validate Linux metrics or hardware support.

## Limits

- Parsing assumes English Linux command output; run with `LC_ALL=C` if necessary.
- GPU utilization is NVIDIA-only and uses the first returned GPU; unsupported
  or missing readings appear as `N/A` (some driver failures may show `N/A%`).
- The CPU sample uses `top` in batch mode; this is a lightweight indication,
  not a precise long-term measurement. Sampling adds to the refresh interval.
- No metrics history, alerts, remote endpoint or automated hardware tests.
- Native Windows and macOS metrics are not supported.

