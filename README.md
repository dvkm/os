# OS

A simple os and bootloader from scratch based on http://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf.

## Getting started
### Prerequisites
```
nasm
qemu
```
### Building
```
nasm boot_sect.asm -f bin -o boot_sect.bin
```
### Running
```
qemu-system-x86_64 -fda boot_sect.bin
```