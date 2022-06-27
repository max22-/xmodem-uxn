SOH = '\x01' -- Start of header
EOT = '\x04' -- End of transmission

function send_packet(n) -- n is the packet number
	 checksum = 0
	 io.write(SOH)
	 n = n % 256
	 io.write(string.char(n))
	 io.write(string.char(255 - n))
	 d = 0x45 -- we send packets full of 0x45 characters (just for testing)
	 for i=1, 128 do
	     io.write(string.char(d)) 
	     checksum = (checksum + d) % 256 -- it's easy to calculate the checksum !
	 end
	 io.write(string.char(checksum))
end

send_packet(1)
send_packet(2)
send_packet(3)

io.write(EOT)
