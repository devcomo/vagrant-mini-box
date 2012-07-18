import 'mysql'
import 'apache'

node default {
  include users
  include db
  include apache_server

  exec {"apt-update":
    command => "apt-get update",
    path    => "/usr/bin"
  }

  package{ "make":
    ensure   => present,
  }
  package{ "ruby-shadow":
    ensure   => present,
    provider => gem
  }
  package{ "vim":
    ensure => present
  }
  package {"git-core":
    ensure => present
  }

  file { "/var/www":
    owner   => 'www-deploy',
    group   => 'www-data',
    mode    => 770,
    recurse => true
  }
}

class { 'mysql::server':
    config_hash => { 'root_password' =>'foo'}
}

class { 'apache': 
}
class { 'apache::php': 
}
class apache_server {
  apache::vhost { 'my.example.com':
    priority        => '10',
    port            => '80',
    docroot         => '/var/www/current/',
    serveraliases   => ['example.com',],
  }
}
class db {
  mysql::db { 'shipping':
    user     => 'myuser',
    password => 'mypass',
    host     => 'localhost',
    grant    => ['all'],
  }

}
class users {
  user { 'www-deploy':
   ensure     => present,
   password   => '$6$5S4dhKry$kZBhdJHcGHrEdK.bnscoCi3owU4lxpuV9X.SSxlVj1cESKrXMPb9EKZn7me1ghuNMKYxZ2N7gNZeO0/sl79/p.',
   groups     => 'www-data',
   managehome => true,
  }


}

