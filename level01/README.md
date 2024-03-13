#Level01

Once again, empty home directory. No file owned by flag01 this time.
However when looking at /etc/password, we have access to flag01's hashed password

	level01@SnowCrash:~$ cat /etc/passwd | grep flag01
	flag01:42hDRfypTqqnw:3001:3001::/home/flag/flag01:/bin/bash

We save the hashed password in a file called 'hash'.

We can now use a tool called johntheripper to crack the hash

	➜  level01 john hash
	Loaded 1 password hash (descrypt, traditional crypt(3) [DES 256/256 AVX2])
	No password hashes left to crack (see FAQ)

	➜  level01 john --show hash
	?:abcdefg

	1 password hash cracked, 0 left

Let's try with this password

	level01@SnowCrash:~$ su flag01
	Password: abcdefg
	Don't forget to launch getflag !
	flag01@SnowCrash:~$ getflag
	Check flag.Here is your token : f2av5il02puano7naaf6adaaf

