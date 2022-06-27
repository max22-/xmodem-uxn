all: xmodem.rom

xmodem.rom: xmodem.tal
	uxnasm xmodem.tal xmodem.rom

.PHONY: run clean

run: xmodem.rom
	socat -d -v -x pty,rawer,link=vsp EXEC:"uxnemu xmodem.rom",pty,rawer 2> log.txt

clean:
	rm -f xmodem.rom *.log
