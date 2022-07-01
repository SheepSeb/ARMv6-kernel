CC=arm-linux-gnueabi-gcc
CFLAG=-ansi -pedantic -Wall -Wextra -march=armv6 -msoft-float -fPIC -mapcs-frame

LD=arm-linux-gnueabi-ld
LDFLAGS=-N -Ttext=0x10000

kernel.elf: boot.o kernel.o

.SUFFIXES: .s .o .elf
.s.o:
	$(CC) $(CFLAG) -o $@ -c $^
.o.elf:
	$(LD) $(LDFLAGS) -o $@ $^