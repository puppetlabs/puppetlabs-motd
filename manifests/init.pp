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
# [Remember: No empty lines between comments and class definition]
class motd (
  $template = undef,
  $content = undef,
) {
  if $template {
    if $content {
        warning('Both $template and $content parameters passed to motd, ignoring content')
      }
      $motd_content = template($template)
    }
    elsif $content {
      $motd_content = $content
    }
    else {
      $motd_content = template('motd/motd.erb')
    }


  if $::kernel == 'Linux' {
    file { '/etc/motd':
      ensure  => file,
      backup  => false,
      content => $motd_content,
    }
  } elsif $::kernel == 'windows' {
    registry_value { 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\policies\system\legalnoticecaption':
      ensure => present,
      type   => string,
      data   => 'Message of the day',
    }
    registry_value { 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\policies\system\legalnoticetext':
      ensure => present,
      type   => string,
      data   => $motd_content,
    }
  }
}
