# Class: motd
#
# This module manages the /etc/motd file using a template
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#  include motd
#
# Sample Usage for motd::register:
# == examples:
#   class apache {
#     include apache::install, apache::config, apache::service
#     motd::register{'Apache': }
#   }
#
# [Remember: No empty lines between comments and class definition]
class motd {
  $motd = '/etc/motd'
  motd::register{'motd': }
    if $::kernel == 'Linux' {
    include concat::setup
    concat{$motd:
      backup  => false,
    }
    concat::fragment{'motd_header':
      target  => $motd,
      content => "\nPuppet modules on this server\n\n",
      order   => 10,
    }
    concat::fragment{'machine_info':
      target  => $motd,
      content => template('motd/motd.erb'),
      order   => 01,
    }
  }
}
define motd::register($content='', $order=20) {
  if $content == '' {
    $body = $name
  } else {
    $body = $content
  }
  concat::fragment{"motd_fragment_${name}":
    target  => '/etc/motd',
    content => "    -- ${body}\n",
    order   => $order,
  }
}

