all: xmodem.rom

xmodem.rom: xmodem.tal
	uxnasm xmodem.tal xmodem.rom

.PHONY: run clean

run-sender: xmodem.rom
	socat -d -v -x pty,rawer,link=vsp EXEC:"sx xmodem.rom",pty,rawer

run: xmodem.rom
	uxnemu xmodem.rom > vsp < vsp

clean:
	rm -f xmodem.rom *.log
