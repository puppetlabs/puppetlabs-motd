# Class: motd
#
# This module manages the /etc/motd file using a template
#
# @param dynamic_motd [Bool] Enable or disable dynamic motd on Debian systems
# @param template [String] Allows for custom template location
# @param content [String] String to be used for motd, priority given to template
# @param issue_template [String] Allows for custom template location for /etc/issue
# @param issue_content [String] String to be used for /etc/issue, priority given to template
# @param issue_net_template [String] Allows for custom template location for /etc/issue.net
# @param issue_net_content [String] String to be used for /etc/issue.net, priority given to template
#
# @example
#  include motd
#
class motd (
  $dynamic_motd = true,
  $template = undef,
  $content = undef,
  $issue_template = undef,
  $issue_content = undef,
  $issue_net_template = undef,
  $issue_net_content = undef,
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

  if $issue_template {
    if $issue_content {
        warning('Both $issue_template and $issue_content parameters passed to motd, ignoring issue_content')
    }
    $_issue_content = template($issue_template)
  } elsif $issue_content {
    $_issue_content = $issue_content
  } else {
    $_issue_content = false
  }

  if $issue_net_template {
    if $issue_net_content {
        warning('Both $issue_net_template and $issue_net_content parameters passed to motd, ignoring issue_net_content')
    }
    $_issue_net_content = template($issue_net_template)
  } elsif $issue_net_content {
    $_issue_net_content = $issue_net_content
  } else {
    $_issue_net_content = false
  }

  File {
    mode => '0644',
  }

  if ($::kernel == 'Linux') or ($::kernel == 'SunOS') or ($::kernel == 'FreeBSD') {
    file { '/etc/motd':
      ensure  => file,
      backup  => false,
      content => $motd_content,
    }

    if $::kernel != 'FreeBSD' {
      if $_issue_content {
        file { '/etc/issue':
          ensure  => file,
          backup  => false,
          content => $_issue_content,
        }
      }

      if $_issue_net_content {
        file { '/etc/issue.net':
          ensure  => file,
          backup  => false,
          content => $_issue_net_content,
        }
      }
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
