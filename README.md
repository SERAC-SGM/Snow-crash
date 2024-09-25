# Snow-crash
Introduction to cyber security

![image](https://github.com/SERAC-SGM/Snow-crash/assets/129794461/f158aecf-f6e7-4702-9dfa-126bb8d0ed5e)

<h2>PREAMBLE</h2>

This project is an introduction to cybersecurity. It consists in completing 15 CTF (Capture the Flag) challenges. 

<h2>HOW IT WORKS</h2>

To make this project, we will have to use a VM with an ISO that has been provided with the subject. If the configuration is right, we will get a simple prompt with an IP and a login request. We can always login with user:levelXX password:levelXX. But this user has limited permissions. 

The goal of every exercice is to find the next level's password, also called token. 

The token can be retrieved with the command `getflag`, but only the user `flagXX` that has elevated permission can get an output when launching the command. So either find a way to retrieve the token, or find a way to login as `flagXX` to launch `getflag`.
