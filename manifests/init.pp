# Class: motd
#
# This module manages the /etc/motd file using a template. Using the input parameter appgroup, the same module can be
# used for N number of different applications in your environment.
#
# Parameters: $appgroup
#
# Actions:
#
# Requires:
#
# Sample Usage:
#  class { 'motd': appgroup => 'app1' }
#
# [Remember: No empty lines between comments and class definition]
class motd ($appgroup=undef) {

$templatefile = $appgroup ? {
    'app1' => 'app1.erb',
    'app2' => 'app2.erb',
		'app3' => 'app3.erb'
    }

if $::kernel == 'Linux' {
    file { '/etc/motd':
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      backup  => false,
      content => template("motd/${templatefile}")
    }
  }
}
