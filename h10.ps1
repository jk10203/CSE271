Set-StrictMode -Version latest

@'
Q1: List and describe the various execution policies
A1: Some execution policies can be AllSigned, Bypass,Default, RemoteSigned, Restricted,
Undefined, and Unrestricted.AllSigned policy means that scripts are allowed to run, but it
requires that “all scripts and configuration files be signed by a trusted publisher, including
scripts that you write on the local computer." And if they are not trusted or are not
classified as so, a prompt is given to the user. Bypass means “nothing is blocked,” and thus, 
there are no prompts/warnings shown when running anything. Default means that the default
execution policy is set, which means that it is Restricted for Windows clients, but
RemoteSigned for Windows servers. RemoteSigned means that scripts RemoteSigned means that
scripts that were created on the local machine/system is able to run without restrictions,
but if a script is downloaded from the internet, it will need to be digitally signed by a
trusted publisher. Restricted means that no scripts can be run, but individual commands can
be done. Undefined means that there is no execution policy currently deployed. By default,
it will be Restricted for Windows clients and RemoteSigned for Windows servers. Finally,
unrestricted means that unsigned scripts can run, and a warning is shown "before running
scripts and configuration files that are not from the local intranet zone."
 – https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/
about_execution_policies?view=powershell-7.3 
  (All quotes are from this website)

Q2: List and describe the various PS profiles
A2: The various PS profiles, in which there are 4 in total, all users all host, all users 
current host, current user all hosts, and current user current host. All users, all host
can basically be overridden by the other 3 profile scripts and applies to all users and 
hosts on the local machine. This is basically executed when any user starts a powershell
session. All users, current host applies to all users, but only the current host being used
to interact with the PowerShell. Current user, all hosts means it affects the current user
on all hosts on the local machine. Its basically executed when the current user starts a
session on any host. Current user current host refers to the current user on the specific
host being used to interact with PowerShell. It is executed when the current user is using
the current specific host on the local machine. 

Q3: What happened when you tried to create the other profiles?
A3: So at first, I tried to test-path each profile, but I found that it wasn’t quite working. 
So I found that I could use $PROFILE.(current/all users current\all hosts) in order to find 
the profile script that corresponds to the 4 PS profiles and created it then. So even with 
attempting to create the other profiles (I tried to create it in the My Documents folder, but
found it probably wasn’t correct), I’ve found that there were already profile script locations
existing for the 4 PS profiles, so all I had to do was create them.

Q4:Compare and contrast Out-File with Tee-Object with >/>>.
A4:Out-File is done when you want to send a command’s output to a file. Whereas Tee-Object 
will send the command’s output to a file and also show the output on the screen. Both Out-File 
and Tee-Object will overwrite an existing file’s content. > is when you want to redirect the 
command’s output to a file, whereas >> also redirects the command’s output to a file, but adds 
on to it or appends it to the end of the file. >> does not overwrite the file with new 
content, but adds on to it.

Q5:What are the various Streams available in PowerShell and what is each typically used for?
A5:The various streams available in PowerShell is the Success, Error, Warning, Verbose, 
Debug, and Information Stream. The success stream is typically like the stdout stream where it
is basically the default output stream for commands that have executed successfully. Error 
stream is also typically like the stderr stream and is used to convey error messages when a 
command fails to execute. The warning stream is generally for warning the user of potential 
problems that could affect the command’s behavior. The Verbose stream tells you more 
information regarding a command’s execution. It is commonly associated with debugging 
purposes. The Debug stream tells the user more debugging information. The information stream 
is used for general information that doesn’t include debugging, warning, or error messages.

Q6:Why are we using single quotes for the string in the example append operation above? 
A6:We are using single quotes for the append operation above because we do not want to do 
variable expansion on $psISE.Options.ConsolePaneBackgroundColor, and we want to append 
this exactly as is (with the $) to the end of the profile file.

Q7:Why are there two single quotes before and after black in the above operation?
A7:There are two single quotes before and after black in the above operation because we want 
‘black’ with just one single quote to be appended into the file. We are not using double 
quotes here because that would just output black with no single quotes which defeats the whole 
purpose of trying to set a background setting to the color black (string literals need to be
in single quotes, and any special characters are treated as regular characters).

'@
Read-Host -Prompt "Press Enter to exit"