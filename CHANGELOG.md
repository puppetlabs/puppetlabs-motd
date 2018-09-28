# Change log

All notable changes to this project will be documented in this file. The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](http://semver.org).

## [2.1.1](https://github.com/puppetlabs/puppetlabs-motd/tree/2.1.1) (2018-09-28)

[Full Changelog](https://github.com/puppetlabs/puppetlabs-motd/compare/2.1.0...2.1.1)

### Fixed

- \(fix\) - Changelog Fix [\#171](https://github.com/puppetlabs/puppetlabs-motd/pull/171) ([david22swan](https://github.com/david22swan))

## [2.1.0](https://github.com/puppetlabs/puppetlabs-motd/tree/2.1.0) (2018-09-27)

[Full Changelog](https://github.com/puppetlabs/puppetlabs-motd/compare/2.0.0...2.1.0)

### Added

- pdksync - \(MODULES-6805\) metadata.json shows support for puppet 6 [\#164](https://github.com/puppetlabs/puppetlabs-motd/pull/164) ([tphoney](https://github.com/tphoney))

## [2.0.0](https://github.com/puppetlabs/puppetlabs-motd/tree/2.0.0) (2018-09-17)

[Full Changelog](https://github.com/puppetlabs/puppetlabs-motd/compare/1.9.0...2.0.0)

### Changed

- \[FM-6965\] Removal of unsupported OS from motd [\#131](https://github.com/puppetlabs/puppetlabs-motd/pull/131) ([david22swan](https://github.com/david22swan))

### Added

- \(FM-7310\)- Updating Windows version support [\#156](https://github.com/puppetlabs/puppetlabs-motd/pull/156) ([lionce](https://github.com/lionce))
- \(FM-7306\) - Added Puppet 4 data types and changed templates to .epp [\#152](https://github.com/puppetlabs/puppetlabs-motd/pull/152) ([eimlav](https://github.com/eimlav))
- \(FM-7307\) - added translation functionality [\#150](https://github.com/puppetlabs/puppetlabs-motd/pull/150) ([Lavinia-Dan](https://github.com/Lavinia-Dan))
- \(maint\) removing registry pin, update stdlib bound [\#145](https://github.com/puppetlabs/puppetlabs-motd/pull/145) ([tphoney](https://github.com/tphoney))
- \(FM-7237\) - Addition of support for Ubuntu 18.04 on motd [\#140](https://github.com/puppetlabs/puppetlabs-motd/pull/140) ([david22swan](https://github.com/david22swan))

## 1.9.0
## Summary
This release includes a change that makes this module *compatible* with AIX.

#### Added
- Make MOTD compatible with AIX. ([MODULES-7069](https://tickets.puppetlabs.com/browse/MODULES-7069))
- Parameter `windows_motd_title` to allow users to customize the Windows message of the day title.
- Converted to the latest version of PDK (1.5.0).

## Release 1.8.0
### Summary
This release includes a change that makes this module *compatible* with FreeBSD.

#### Added
- Make MOTD compatible with FreeBSD. ([MODULES-6599](https://tickets.puppetlabs.com/browse/MODULES-6599))

## Release 1.7.0
### Summary
Release for PDK 1.3.2 compatibility.

#### Changed
- Converted to the latest version of PDK. Mainly introduces travis to the release branch.

## Release 1.6.0
### Summary
A release that updates motd to become PDK compatible.

#### Changed
- All changes in this release are the product of PDK convert, the module is now PDK compatible.

## Release 1.5.1
### Summary
This release is to update the formatting of the module, rubocop having been run for all ruby files and been set to run automatically on all future commits.

### Changed
- Rubocop has been implemented.

## Release 1.5.0
### Summary
This release is a rollup of changes.

#### Features:
- Support added for Solaris SunOS.
- Default MOTD message changed to provide greater out of the box usability.
- Removed support for deprecated versions of Ubuntu.
- Added a permissions mode for the file.

#### Bug Fixes:
- Changed fact processor name.

## Release 1.4.0
### Summary
First Puppet Labs supported release of this module! Contains new features and bug fixes for tests.

#### Features:
- New readme file added for tests. Also several new tests added.
- Addition of handling in tests to run with Debian 8.

#### Bug Fixes:
- Tests tweaked to handle several Debian versions.
- Fixed acceptance tests for Windows.


## Release 1.3.0
### Summary
This release adds documentation updates, test improvements, and os support.

#### Features:
- Acceptance testing on Linux platforms.
- Rewritten documentation, inclusion of strings for automated documentation.
- Linting of manifest to conform to style guidelines.
- Adds support for several operating systems:
  - Debian 6, 7
  - CentOS 5, 6, 7
  - Oracle Linux 6, 7
  - Scientific Linux 5, 6, 7

### 2014-10-31 Release 1.2.0
### Summary
- Add content parameter to allow setting static motd content.

## 2014-07-15 Release 1.1.1
###Summary

This release merely updates metadata.json so the module can be uninstalled and
upgraded via the puppet module command.

## 2014-05-28 Release 1.1.0
###Summary

The main feature of this release is support for external templates.
It also includes documentation and testing improvements.

####Features

- Added class parameter to support external templates.
- Updated README documentation.
- Improved Testing.

####Fixes

- Add LICENSE file.

####Known Bugs


\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/skywinder/Github-Changelog-Generator)*
