# Class: motd
#
# This module manages the /etc/motd file using a template
#
# @param dynamic_motd [Bool] Enable or disable dynamic motd on Debian systems
# @param template [String] Allows for custom template location
# @param content [String] String to be used for motd, priority given to template
#
# @example
#  include motd
#
class motd (
  $dynamic_motd = true,
  $template     = undef,
  $content      = undef,
) {

  if $template {
    if $content {
        warning('Both $template and $content parameters passed to motd, ignoring content')
    }
    $motd_content = template($template)
  } elsif $content {
    $motd_content = $content
  } else {
    $motd_content = template('motd/motd.erb')
  }

  if $::kernel == 'Linux' {
    include '::motd::issue'
    file { '/etc/motd':
      ensure  => file,
      backup  => false,
      content => $motd_content,
    }
    if ($::osfamily == 'Debian') and ($dynamic_motd == false) {
      if $::operatingsystem == 'Debian' and versioncmp($::operatingsystemmajrelease, '7') > 0 {
        $_line_to_remove = 'session    optional     pam_motd.so  motd=/run/motd.dynamic'
      } elsif $::operatingsystem == 'Ubuntu' and versioncmp($::operatingsystemmajrelease, '16.00') > 0 {
        $_line_to_remove = 'session    optional     pam_motd.so  motd=/run/motd.dynamic'
      } else {
        $_line_to_remove = 'session    optional     pam_motd.so  motd=/run/motd.dynamic noupdate'
      }

      file_line { 'dynamic_motd':
        ensure => absent,
        path   => '/etc/pam.d/sshd',
        line   => $_line_to_remove,
      }
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
