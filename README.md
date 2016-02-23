# Invoke-Infogather
Simple information gathering script in a post exploitation phase

Script developed for my learning of Powershell and quick information gathering of hosts 
during a post exploitation phase. Needs credentials for the hosts which you connect to. 

Runs like:

PS C:\tmp> .\invoke-infogather.ps1 -filePath C:\tmp\hosts.txt

cmdlet Get-Credential at command pipeline position 1
Supply values for the following parameters:
Credential
[+] -- Starting Windows Information Collector
[+] -- Script start: 02/23/2016 09:40:44

[+] --- 10.0.1.105

OS Ver      : Microsoft Windows 7 Enterprise
Arch        : 64-bit
SP          : 1
CPU         : Intel(R) Core(TM) i7-4980HQ CPU @ 2.80GHz
IP-Address  : 10.0.1.105
Domain      : HACKERS
Model       : VMware Virtual Platform
Name        : Hackbox.HACKERS
Last Update : 01/14/2016 00:00:00
