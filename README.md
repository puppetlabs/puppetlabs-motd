# motd

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with the motd module](#setup)
    * [Beginning with the motd module](#beginning-with-the-motd-module)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
6. [Limitations - OS compatibility, etc.](#limitations)
7. [Development - Guide for contributing to the module](#development)

## Module Description

The motd module configures a system message of the day. The module includes a default message template. Alternatively, you can specify a different template or a static string.

## Setup

### Beginning with the motd module

To configure motd on your system, include the `motd` class: `include motd`.

## Usage

The motd module configures the message of the day on a wide variety of systems. The module populates either `/etc/motd`, `/etc/issue` and `/etc/issue.net` (on POSIX systems) or a registry key (on Windows systems) with the contents of a basic template file.

By default, the module populates motd using the included template. Alternatively, you can specify a different template or a static string. For example, to use a custom template you would set the template parameter:

```puppet
class { 'motd':
  template => 'mymodule/mytemplate.erb',
}
```

To specify a string as the message of the day:

```puppet
class { 'motd':
  content => "Hello world!/n",
}
```


## Reference
See [REFERENCE.md](https://github.com/puppetlabs/puppetlabs-motd/blob/master/REFERENCE.md)

#### Public classes

* `motd`: Configures the message of the day.

#### Parameters

The following parameters are available in `motd`. All parameters are optional.

##### `template`

Specifies a custom EPP template. A template take precedence over `content`. Valid options:  '/mymodule/mytemplate.epp'. Default: 'undef'.

##### `content`

Specifies a static string as the motd content. Valid options: A string, such as "Hello!\n", or "Please lock workstations when not in use\n". Default: 'undef'.

##### `dynamic_motd`

Enables or disables dynamic motd on Debian systems. Valid options:  true or false. Default: true.

##### `issue_template`

Specifies a custom EPP template to process and save to `/etc/issue`. A template take precedence over `issue_content`. Valid options:  '/mymodule/mytemplate.epp'. Default: 'undef'.

##### `issue_content`

Specifies a static string as the `/etc/issue` content. Valid options: A string, such as "Hello!\n", or "Please lock workstations when not in use\n". Default: 'undef'.

##### `issue_net_template`

Specifies a custom EPP template to process and save to `/etc/issue.net`. A template take precedence over `issue_net_content`. Valid options:  '/mymodule/mytemplate.epp'. Default: 'undef'.

##### `issue_net_content`

Specifies a static string as the `/etc/issue.net` content. Valid options: A string, such as "Hello!\n", or "Please lock workstations when not in use\n". Default: 'undef'.

## Limitations

For an extensive list of supported operating systems, see [metadata.json](https://github.com/puppetlabs/puppetlabs-motd/blob/master/metadata.json)

Disabling dynamic motd is supported only on Debian.

### A note on Windows

On Windows systems, the motd module populates the contents of `HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\policies\system\legalnoticetext` and `HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\policies\system\legalnoticecaption`. The `legalnoticetext` registry key is shown before login on a Windows system.

## Development

Puppet Labs modules on the Puppet Forge are open projects, and community contributions are essential for keeping them great. We can’t access the huge number of platforms and myriad hardware, software, and deployment configurations that Puppet is intended to serve. We want to keep it as easy as possible to contribute changes so that our modules work in your environment. There are a few guidelines that we need contributors to follow so that we can have a chance of keeping on top of things. For more information, see our [module contribution guide.](https://docs.puppetlabs.com/forge/contributing.html)

## Contributors

The list of contributors can be found at: [https://github.com/puppetlabs/puppetlabs-motd/graphs/contributors](https://github.com/puppetlabs/puppetlabs-motd/graphs/contributors).
