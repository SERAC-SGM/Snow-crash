# Level02

This time, we have a .pcap file in the home directory. This is a packet capture file. We can use wireshark to open it.

It seems to be a communication between a client and a server. The interesting part is here : 

	    000000AE  70 74 73 2f 31 30 29 0d  0a 0a 01 00 77 77 77 62   pts/10). ....wwwb
	    000000BE  75 67 73 20 6c 6f 67 69  6e 3a 20                  ugs logi n:
	000000B2  6c                                                 l
	    000000C9  00 6c                                              .l
	000000B3  65                                                 e
	    000000CB  00 65                                              .e
	000000B4  76                                                 v
	    000000CD  00 76                                              .v
	000000B5  65                                                 e
	    000000CF  00 65                                              .e
	000000B6  6c                                                 l
	    000000D1  00 6c                                              .l
	000000B7  58                                                 X
	    000000D3  00 58                                              .X
	000000B8  0d                                                 .
	    000000D5  01                                                 .
	    000000D6  00 0d 0a 50 61 73 73 77  6f 72 64 3a 20            ...Passw ord:
	000000B9  66                                                 f
	000000BA  74                                                 t
	000000BB  5f                                                 _
	000000BC  77                                                 w
	000000BD  61                                                 a
	000000BE  6e                                                 n
	000000BF  64                                                 d
	000000C0  72                                                 r
	000000C1  7f                                                 .
	000000C2  7f                                                 .
	000000C3  7f                                                 .
	000000C4  4e                                                 N
	000000C5  44                                                 D
	000000C6  52                                                 R
	000000C7  65                                                 e
	000000C8  6c                                                 l
	000000C9  7f                                                 .
	000000CA  4c                                                 L
	000000CB  30                                                 0
	000000CC  4c                                                 L
	000000CD  0d                                                 .
	    000000E3  00 0d 0a                                           ...
	    000000E6  01                                                 .
	    000000E7  00 0d 0a 4c 6f 67 69 6e  20 69 6e 63 6f 72 72 65   ...Login  incorrect

We can see that some '.' characters correspond to the 7f ascii value. This is the "DEL" key, which means that the previous character was removed.
Once we get rid of the removed characters, we get this password:

	ft_waNDReL0L

We can then log to flag02

	level02@SnowCrash:~$ su flag02
	Password: 
	Don't forget to launch getflag !
	flag02@SnowCrash:~$ getflag
	Check flag.Here is your token : kooda2puivaav1idi4f57q8iq
