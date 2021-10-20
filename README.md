# ARM64 Shellcode for macOS

Basic ARM64 assembly programs for null-byte free macOS shellcode.

## Overview
### Shellcode Source

| File Name | Description |
|:----------|:------------|
| [bindshell.s](./bindshell.s) | Create bind shell on 0.0.0.0:4444 |
| [calc.s](./calc.s) | Pop up Calculator.app |
| [reverseshell.s](./reverseshell.s) | Create reverse shell to 127.0.0.1:4444 |
| [shell.s](./shell.s) | Execute /bin/sh |

### Helper

| File Name | Description |
|:----------|:------------|
| [extract.sh](./helper/extract.sh)| Script for extracting shellcode from Mach-O executable or object file |
| [loader.c](./helper/loader.c)| Program for testing shellcode |
