#!/usr/bin/env bash

# Using puppet for connection without password

file { '/etc/ssh/ssh_config':
 ensure -> present,
}

file_line {	'Turn off passwd auth':
 path => '/etc/ssh/ssh_config',
 line => '/passwordAuthentication no',
 match => '^#PasswordAuthentication',
}

file line { 'Declare identity file':
 path => '/etc/ssh/ssh_config',
 line => 'IdentityFile ~/.ssh/school',
 match => '^#IdentityFile',
}
