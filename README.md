# XMODEM for Uxn virtual machine
This rom receives a file on [Uxn](https://wiki.xxiivv.com/site/uxn.html)'s console device, using the [XMODEM](https://en.wikipedia.org/wiki/XMODEM) protocol. It writes it to "output.rom". It shouldn't be difficult to modify it to write directly into ram, and execute a received rom.

# What for ?
To be able to send a rom to a microcontroller that runs uxn, via the serial port, for example.

# How to test it

If you are on linux, you can use socat (to create a virtual serial port), [lrzsz](https://ohse.de/uwe/software/lrzsz.html), and the Makefile included in this repo.

```
sudo apt install socat lrzsz
make run-sender
```

Then in another terminal:

```
make run
```

This will send xmodem.rom, so you'll have a copy of it in output.rom, with some extra 0x1a bytes at the end.
You need an an uxn emulator with a screen device, because the screen vector is used to measure time.

# Warning
XMODEM doesn't handle file size, so the last packet is padded to 128 bytes. (All packets are 128 bytes in size). The lrzsz implementation of XMODEM pads using 0x1a bytes, which corresponds to the MUL uxn opcode.

# Extra
A small Lua script is included, which i have used for some tests. It sends 3 dummy packets.

