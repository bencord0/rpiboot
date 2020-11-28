# USB boot code

This is the USB boot code which should work on the Raspberry Pi model A,
Compute Module, Compute Module 3, and Raspberry Pi Zero.

This version of rpiboot has been modified to work from directories which
contains the ARM kernel. The VideoCore firmware, `bootcode.bin` and `start.elf`
which can be retrieved from [raspberrypi/firmware][1] are embedded in this program.

For more information run 'rpiboot -h'

[1]: https://github.com/raspberrypi/firmware

## Building

Install dependencies

```
$ sudo emerge dev-libs/libusb:1
```

Compile this program
```
$ git clone https://github.com/bencord0/rpiboot
$ cd rpiboot
$ make
$ ./rpiboot
```

## Running your own kernel.img

If you would like to boot the Raspberry Pi with a standard build you just need
to copy the FAT partition files into a subdirectory (it must have at the minimum
`kernel.img`).  If you take a standard firmware release then this will at the
very least boot the linux kernel which will then stop (and possibly crash!) when
it looks for a filesystem.

To provide a filesystem there are many options, you can build an initramfs into
the kernel, add an initramfs to the boot directory or provide some other interface
to the filesystem.

```
$ ./rpiboot -d boot
```

This will serve the boot directory to the Raspberry Pi Device.

