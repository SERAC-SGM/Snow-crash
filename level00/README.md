# Level00

First login in the VM, empty home directory. We're looking for something related to flag00

	level00@SnowCrash:~$ find / -name flag00 2>/dev/null
	level00@SnowCrash:~$ 

No file flag00

The subject specifies : "Once logged to the "flagXX" account [...]" which means flag00 is an account

	level00@SnowCrash:~$ find / -user flag00 2>/dev/null
	/usr/sbin/john
	/rofs/usr/sbin/john

Both files belong to flag00

	level00@SnowCrash:~$ cat /usr/sbin/john /rofs/usr/sbin/john
	cdiiddwpgswtgt
	cdiiddwpgswtgt

Looks like caesar encoding, we create a small bash script to try all combinations

	./caesar_decrypt.sh
	[...]
	8 lmrrmmfypbfcpc
	9 mnssnngzqcgdqd
	10 nottoohardhere
	11 opuuppibseifsf
	12 pqvvqqjctfjgtg
	[...]

Number 10 looks nice

	level00@SnowCrash:~$ su flag00
	Password: nottoohardhere
	Don't forget to launch getflag !
	flag00@SnowCrash:~$ getflag
	Check flag.Here is your token : x24ti5gi3x0ol2eh4esiuxias
