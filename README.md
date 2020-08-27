# Running the PE Quick Data Bolt Plan
This repository contains code that helps you run the [pe_quick_data](https://forge.puppet.com/puppetlabs/pe_quick_data) bolt plan to collect Puppet-specific information about your Puppet Enterprise environment. This is purely for support reasons.

# Requirements
1. The pe_quick_data bolt only works with [Puppet Enterprise (PE) 2018 or later](https://puppet.com/misc/version-history/)
2. Collect the following information first:
   - *PE-FQDN*: Fully qualified name of the node that Puppet Enterprise (PE) 2018+ is running on.
   - *PE node user name*: User name with **sudo access permissions** for that node
   - *PE node ssh private key file path*: File path to SSH Private Key to remotely access the PE node. 
3. Pick a *work-machine* (laptop/desktop/VM) to install Bolt on. This *work-machines* needs to have:
   - *Connection to the internet* to download Bolt & later the pe_quick_data module from the Puppet forge.
   - The *ssh private key file* & connectivity to remotely connect to the PE node.
4. Check if the collected information is correct & your *work-machine* can remotely connect to the PE node: 
   - Type: `ssh -i <PE node ssh private key file path> <PE node user name>@<PE-FQDN> 'hostname'`
   - Eg:   `ssh -i  ~/keys/pe2018.pem centos@pe2018.example.com 'hostname'` 
5. Install Bolt : https://puppet.com/docs/bolt/latest/bolt_installing.html on your *work-machine*.
6. Execute the *run.sh* script as: 
   - `$ run.sh <PE-FQDN> <PE node user name> <PE node ssh private key file path>`
   - Example: `$ run.sh pe2018.example.com centos ~/keys/pe2018.pem`
