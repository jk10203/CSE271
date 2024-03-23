#!/bin/bash
unalias -a

# Task 1
ls -altr | tail -n +2 | cut -d " " -f 8-19|awk '{print $2 " " $3 " " $4 " " $5 ": " $1/1000 "kB"}'>h7-1.out

# Task 2
ls -1 /home | awk '!/^[a-z]{3}[0-9]{3}/ {print}' > h7-2.out

# Task 3
cat /etc/wgetrc|grep '^#[^ ]* =' | awk -F"#" '{print $2}'|sort > h7-3.out

# Task 4
grep -oPa "[\x20-\x7f]" "$1" |tr -d '\n' >h7-4.out

# Task 5
cat fakelsfile| awk '{print $3}'| sort | uniq -c | sort -nr | head -n 20|tr -d "    " > h7-5.out

# Task 6
for dir in /home/*; do echo "$(echo "$dir"| cut -c 7-)"; done| xargs finger 2>/dev/null | grep "Never logged in."|wc -l > h7-6.out

# Task 7
<<wow
a) The unalias -a command is for resetting the command names to have their original function and not their assigned 
alias function. Because in our bashrc file there was an alias set for ls to ls -CF and dir to ls -l, it had to be 
unaliased so that ls’s output would no longer be in a columnar format and to get rid of the symbol at the end. 
This would help in being able to parse through the output of ls. Also because dir is used in question 6, it would 
affect the behavior of the for loop.

b) The wget command is a command that is used to download files from websites. And the /etc/wgetrc file is used for 
setting various global settings for the wget command for all users in the system.

c) The /tmp directory is used to store temporary files that can be deleted during system reboots or after about 10 
days. Scripts that automate cleaning of the /tmp directory based on when it was last used, system reboots removing 
/tmp files, or even restrictions on the size of /tmp directory for each user can be used in order to prevent the /tmp 
directory from eventually filling up all the available disk space.

d)THe od command stands for “octal dump” and is used to convert the input file into a octal format. More conversions can 
be listed by using certain flags/arguments. For instance, in the command specified (/usr/bin/od -cxb -Ad filename), the 
c flag indicates output in ascii characters, -x indicates the hexadecimal format, -b indicates octal format (specifically 
in 3 bytes), the -Ad indicates concantenation with d in the hexadecimal format.

e) The commands I did not use from the allowed set of commands are ps and sed. The ps command utilizes the /proc directory 
to list running processes and PIDs along with other information specified by certain flags/arguments. The sed command is used as 
a stream editor which fulfills edits to text like insertion, deletion, and substitution. 

f) An octothrope is the pound symbol (#). It is also used to denote comments and the shebang.

g)An ASCII value is the unique 7-bit binary number that exists for each character (0-127). The ASCII table contains and lists 
all 0-127 of the characters and specifies the character, decimal values, hexadecimal values, octal values, and the html number 
when applicable.

wow
