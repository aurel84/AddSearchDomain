# AddSearchDomain
Add DNS Search Domains for Mac OSX 

### HOW TO SETUP ###
1.) Open the script, replace the following entries for searchDomain Array (on line 13):
- your.domain.1
- your.domain.2
- your.domain.2

2.) TEST the script on a local computer, with your own search domains added.

3.) Save and exit the script.

### HOW TO DEPLOY ###
1.) Log into your Company's MDM Software, create a test group, and enroll only one computer.
2.) Deploy the script as a policy or a custom script... as an example using VMware AirWatch:
- Go to Devices > Profiles & Recources > Profiles:
- Select Add Profile > Assign Profile to test group > Select Custom Attributes > Paste the contents of the Script >
- Set an event (login/schedule, etc...)
