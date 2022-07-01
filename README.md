# Micro Kernel for ARMv6
Board used : versatilepb
## Dependencies
<ol>
<li> qemu (qemu-system-arm)
<li> gcc (arm-linux-gnueabi-gcc)
<li> make
</ol>

## Build code
Build the object code
```
make kernel.o
```
## Linking ELF file
This depends on the bootloader and the hardware, memory address while using QEMU:0x10000 (Check LDFLAGS)
```
LD=arm-linux-gnueabi-ld
LDFLAGS=-N -Ttext=your_memory_address
```

After run 
```
make kernel.elf
```

## Setting the stack
Set the SP to 0x07FFFFFF (address of 128MB RAM in QEMU)

BL jump to main function in C

## Running 
We need to specify the machine because there is no default one
```
qemu-system-arm -M versatilepb -cpu arm1176 -nographics -kernel kernel.elf
```
