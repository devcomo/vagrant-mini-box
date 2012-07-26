# Simple Apache/PHP/Mysql Server
Apache server setup for capistrano deployment demonstration at
comorichweb. Nothing special that enables capistrano, just a typical
setup so I had a server to go against.

## Setup
Run local_setup.sh to add an entry to your /etc/hosts file for
my.example.com. 

## Users
aside from vagrant, there is a www-deploy user that belongs to the
www-data group. His password is 'password'.

## Running
* install [Oracle Virtual Box](https://www.virtualbox.org/)
* install [vagrant](http://vagrantup.com/)
* clone this repo
* type vagrant up from the base directory
* run ``vagrant up && vagrant provision``
* profit

## Additional Setup
If you need to change the IP address used simply update the Vagrantfile with a different ip. 




