<!-- markdownlint-disable MD024 -->
# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](http://semver.org).

## [v7.1.0](https://github.com/puppetlabs/puppetlabs-motd/tree/v7.1.0) - 2023-06-20

[Full Changelog](https://github.com/puppetlabs/puppetlabs-motd/compare/v7.0.0...v7.1.0)

### Added

- pdksync - (MAINT) - Allow Stdlib 9.x [#487](https://github.com/puppetlabs/puppetlabs-motd/pull/487) ([LukasAud](https://github.com/LukasAud))

### Fixed

- (CONT-860) Update registry dependency [#475](https://github.com/puppetlabs/puppetlabs-motd/pull/475) ([LukasAud](https://github.com/LukasAud))

## [v7.0.0](https://github.com/puppetlabs/puppetlabs-motd/tree/v7.0.0) - 2023-04-05

[Full Changelog](https://github.com/puppetlabs/puppetlabs-motd/compare/v6.3.0...v7.0.0)

### Changed
- (Cont 787) Add Support for Puppet 8 / Drop Support for Puppet 6 [#472](https://github.com/puppetlabs/puppetlabs-motd/pull/472) ([david22swan](https://github.com/david22swan))

### Fixed

- pdksync - (CONT-189) Remove support for RedHat6 / OracleLinux6 / Scientific6 [#456](https://github.com/puppetlabs/puppetlabs-motd/pull/456) ([david22swan](https://github.com/david22swan))
- pdksync - (CONT-130) - Dropping Support for Debian 9 [#450](https://github.com/puppetlabs/puppetlabs-motd/pull/450) ([jordanbreen28](https://github.com/jordanbreen28))

## [v6.3.0](https://github.com/puppetlabs/puppetlabs-motd/tree/v6.3.0) - 2022-10-03

[Full Changelog](https://github.com/puppetlabs/puppetlabs-motd/compare/v6.2.0...v6.3.0)

### Added

- pdksync - (GH-cat-11) Certify Support for Ubuntu 22.04 [#447](https://github.com/puppetlabs/puppetlabs-motd/pull/447) ([david22swan](https://github.com/david22swan))
- pdksync - (GH-cat-12) Add Support for Redhat 9 [#446](https://github.com/puppetlabs/puppetlabs-motd/pull/446) ([david22swan](https://github.com/david22swan))

### Fixed

- (MAINT) Dropped support for Windows Server 2008 R2 and FreeBSD [#448](https://github.com/puppetlabs/puppetlabs-motd/pull/448) ([jordanbreen28](https://github.com/jordanbreen28))

## [v6.2.0](https://github.com/puppetlabs/puppetlabs-motd/tree/v6.2.0) - 2022-05-30

[Full Changelog](https://github.com/puppetlabs/puppetlabs-motd/compare/v6.1.0...v6.2.0)

### Added

- Update motd location for FreeBSD 13 and above [#431](https://github.com/puppetlabs/puppetlabs-motd/pull/431) ([Scnaeg](https://github.com/Scnaeg))
- pdksync - (IAC-1753) - Add Support for AlmaLinux 8 [#428](https://github.com/puppetlabs/puppetlabs-motd/pull/428) ([david22swan](https://github.com/david22swan))
- pdksync - (IAC-1751) - Add Support for Rocky 8 [#427](https://github.com/puppetlabs/puppetlabs-motd/pull/427) ([david22swan](https://github.com/david22swan))

### Fixed

- pdksync - (GH-iac-334) Remove Support for Ubuntu 16.04 [#433](https://github.com/puppetlabs/puppetlabs-motd/pull/433) ([david22swan](https://github.com/david22swan))
- pdksync - (IAC-1787) Remove Support for CentOS 6 [#430](https://github.com/puppetlabs/puppetlabs-motd/pull/430) ([david22swan](https://github.com/david22swan))
- pdksync - (IAC-1598) - Remove Support for Debian 8 [#426](https://github.com/puppetlabs/puppetlabs-motd/pull/426) ([david22swan](https://github.com/david22swan))

## [v6.1.0](https://github.com/puppetlabs/puppetlabs-motd/tree/v6.1.0) - 2021-08-26

[Full Changelog](https://github.com/puppetlabs/puppetlabs-motd/compare/v6.0.0...v6.1.0)

### Added

- pdksync - (IAC-1709) - Add Support for Debian 11 [#420](https://github.com/puppetlabs/puppetlabs-motd/pull/420) ([david22swan](https://github.com/david22swan))

### Fixed

- (IAC-1741) Allow stdlib v8.0.0 [#421](https://github.com/puppetlabs/puppetlabs-motd/pull/421) ([david22swan](https://github.com/david22swan))

## [v6.0.0](https://github.com/puppetlabs/puppetlabs-motd/tree/v6.0.0) - 2021-05-10

[Full Changelog](https://github.com/puppetlabs/puppetlabs-motd/compare/v5.0.0...v6.0.0)

### Fixed

- (IAC-1497) - Removal of unsupported `translate` dependency [#404](https://github.com/puppetlabs/puppetlabs-motd/pull/404) ([david22swan](https://github.com/david22swan))

## [v5.0.0](https://github.com/puppetlabs/puppetlabs-motd/tree/v5.0.0) - 2021-03-01

[Full Changelog](https://github.com/puppetlabs/puppetlabs-motd/compare/v4.3.0...v5.0.0)

### Changed
- Update metadata.json - remove ubuntu 14.04 [#401](https://github.com/puppetlabs/puppetlabs-motd/pull/401) ([daianamezdrea](https://github.com/daianamezdrea))
- pdksync -  Remove SLES 11 support [#399](https://github.com/puppetlabs/puppetlabs-motd/pull/399) ([sanfrancrisko](https://github.com/sanfrancrisko))
- pdksync - Remove RHEL 5 family support [#398](https://github.com/puppetlabs/puppetlabs-motd/pull/398) ([sanfrancrisko](https://github.com/sanfrancrisko))
- pdksync - Remove Puppet 5 from testing and bump minimal version to 6.0.0 [#394](https://github.com/puppetlabs/puppetlabs-motd/pull/394) ([carabasdaniel](https://github.com/carabasdaniel))

## [v4.3.0](https://github.com/puppetlabs/puppetlabs-motd/tree/v4.3.0) - 2020-12-14

[Full Changelog](https://github.com/puppetlabs/puppetlabs-motd/compare/v4.2.0...v4.3.0)

### Added

- pdksync - (feat) - Add support for Puppet 7 [#369](https://github.com/puppetlabs/puppetlabs-motd/pull/369) ([daianamezdrea](https://github.com/daianamezdrea))

## [v4.2.0](https://github.com/puppetlabs/puppetlabs-motd/tree/v4.2.0) - 2020-08-20

[Full Changelog](https://github.com/puppetlabs/puppetlabs-motd/compare/v4.1.1...v4.2.0)

### Added

- (IAC-974) - Removal of inappropriate terminology [#326](https://github.com/puppetlabs/puppetlabs-motd/pull/326) ([david22swan](https://github.com/david22swan))
- pdksync - (IAC-973) - Update travis/appveyor to run on new default branch main [#320](https://github.com/puppetlabs/puppetlabs-motd/pull/320) ([david22swan](https://github.com/david22swan))
- (IAC-746) - Add ubuntu 20.04 support [#309](https://github.com/puppetlabs/puppetlabs-motd/pull/309) ([david22swan](https://github.com/david22swan))

## [v4.1.1](https://github.com/puppetlabs/puppetlabs-motd/tree/v4.1.1) - 2020-05-19

[Full Changelog](https://github.com/puppetlabs/puppetlabs-motd/compare/v4.1.0...v4.1.1)

### Fixed

- (MAINT) Ensure FreeBSD compatibility [#271](https://github.com/puppetlabs/puppetlabs-motd/pull/271) ([dandrzejewski](https://github.com/dandrzejewski))

## [v4.1.0](https://github.com/puppetlabs/puppetlabs-motd/tree/v4.1.0) - 2020-01-21

[Full Changelog](https://github.com/puppetlabs/puppetlabs-motd/compare/v4.0.0...v4.1.0)

### Added

- (MODULES-10242) Add back support for Ubuntu 14.04 [#267](https://github.com/puppetlabs/puppetlabs-motd/pull/267) ([sheenaajay](https://github.com/sheenaajay))
- (FM-8691) - Addition of Support for CentOS 8 [#264](https://github.com/puppetlabs/puppetlabs-motd/pull/264) ([david22swan](https://github.com/david22swan))

### Fixed

- (MODULES-10387) Raise lower bound for puppetlabs-registry dependency to 4.0.0 [#276](https://github.com/puppetlabs/puppetlabs-motd/pull/276) ([daianamezdrea](https://github.com/daianamezdrea))

## [v4.0.0](https://github.com/puppetlabs/puppetlabs-motd/tree/v4.0.0) - 2019-11-11

[Full Changelog](https://github.com/puppetlabs/puppetlabs-motd/compare/v3.1.0...v4.0.0)

### Added

- FM-8405 Debian10 support [#242](https://github.com/puppetlabs/puppetlabs-motd/pull/242) ([lionce](https://github.com/lionce))

### Changed
- pdksync - FM-8499 - remove ubuntu14 support [#262](https://github.com/puppetlabs/puppetlabs-motd/pull/262) ([lionce](https://github.com/lionce))

## [v3.1.0](https://github.com/puppetlabs/puppetlabs-motd/tree/v3.1.0) - 2019-08-01

[Full Changelog](https://github.com/puppetlabs/puppetlabs-motd/compare/v3.0.0...v3.1.0)

### Added

- (MODULES-9653) Add Windows Server 2019 support [#235](https://github.com/puppetlabs/puppetlabs-motd/pull/235) ([eimlav](https://github.com/eimlav))
- FM-8043 - redhat8 support [#222](https://github.com/puppetlabs/puppetlabs-motd/pull/222) ([lionce](https://github.com/lionce))

### Fixed

- (bugfix) allow private keys in ssh testing [#223](https://github.com/puppetlabs/puppetlabs-motd/pull/223) ([tphoney](https://github.com/tphoney))

## [v3.0.0](https://github.com/puppetlabs/puppetlabs-motd/tree/v3.0.0) - 2019-05-20

[Full Changelog](https://github.com/puppetlabs/puppetlabs-motd/compare/2.1.2...v3.0.0)

### Added

- simplistic support for vscode integration to litmus added [#212](https://github.com/puppetlabs/puppetlabs-motd/pull/212) ([abuxton](https://github.com/abuxton))
- (MODULES-8767) Add support for SLES 15 [#205](https://github.com/puppetlabs/puppetlabs-motd/pull/205) ([eimlav](https://github.com/eimlav))
- (FM-7647) use puppet_litmus for acceptance testing [#200](https://github.com/puppetlabs/puppetlabs-motd/pull/200) ([tphoney](https://github.com/tphoney))

### Changed
- pdksync - (MODULES-8444) - Raise lower Puppet bound [#208](https://github.com/puppetlabs/puppetlabs-motd/pull/208) ([david22swan](https://github.com/david22swan))

### Fixed

- (bugfix) remove scientific 5 testing [#217](https://github.com/puppetlabs/puppetlabs-motd/pull/217) ([tphoney](https://github.com/tphoney))
- (FM-8073) litmus block support [#216](https://github.com/puppetlabs/puppetlabs-motd/pull/216) ([tphoney](https://github.com/tphoney))
- (bugfix) changes needed for litmus 0.1.0 release [#214](https://github.com/puppetlabs/puppetlabs-motd/pull/214) ([tphoney](https://github.com/tphoney))
- (MODULES-8758) Change memoryfree to memorysize in template [#204](https://github.com/puppetlabs/puppetlabs-motd/pull/204) ([eimlav](https://github.com/eimlav))

## [2.1.2](https://github.com/puppetlabs/puppetlabs-motd/tree/2.1.2) - 2019-01-24

[Full Changelog](https://github.com/puppetlabs/puppetlabs-motd/compare/2.1.1...2.1.2)

### Fixed

- pdksync - (FM-7655) Fix rubygems-update for ruby < 2.3 [#188](https://github.com/puppetlabs/puppetlabs-motd/pull/188) ([tphoney](https://github.com/tphoney))

## [2.1.1](https://github.com/puppetlabs/puppetlabs-motd/tree/2.1.1) - 2018-09-28

[Full Changelog](https://github.com/puppetlabs/puppetlabs-motd/compare/2.1.0...2.1.1)

### Fixed

- (fix) - Changelog Fix [#171](https://github.com/puppetlabs/puppetlabs-motd/pull/171) ([david22swan](https://github.com/david22swan))

## [2.1.0](https://github.com/puppetlabs/puppetlabs-motd/tree/2.1.0) - 2018-09-28

[Full Changelog](https://github.com/puppetlabs/puppetlabs-motd/compare/2.0.0...2.1.0)

### Added

- pdksync - (MODULES-6805) metadata.json shows support for puppet 6 [#164](https://github.com/puppetlabs/puppetlabs-motd/pull/164) ([tphoney](https://github.com/tphoney))

## [2.0.0](https://github.com/puppetlabs/puppetlabs-motd/tree/2.0.0) - 2018-09-19

[Full Changelog](https://github.com/puppetlabs/puppetlabs-motd/compare/1.9.0...2.0.0)

### Added

- (FM-7310)- Updating Windows version support [#156](https://github.com/puppetlabs/puppetlabs-motd/pull/156) ([lionce](https://github.com/lionce))
- (FM-7306) - Added Puppet 4 data types and changed templates to .epp [#152](https://github.com/puppetlabs/puppetlabs-motd/pull/152) ([eimlav](https://github.com/eimlav))
- (FM-7307) - added translation functionality [#150](https://github.com/puppetlabs/puppetlabs-motd/pull/150) ([Lavinia-Dan](https://github.com/Lavinia-Dan))
- (maint) removing registry pin, update stdlib bound [#145](https://github.com/puppetlabs/puppetlabs-motd/pull/145) ([tphoney](https://github.com/tphoney))
- (FM-7237) - Addition of support for Ubuntu 18.04 on motd [#140](https://github.com/puppetlabs/puppetlabs-motd/pull/140) ([david22swan](https://github.com/david22swan))

### Changed
- [FM-6965] Removal of unsupported OS from motd [#131](https://github.com/puppetlabs/puppetlabs-motd/pull/131) ([david22swan](https://github.com/david22swan))

## [1.9.0](https://github.com/puppetlabs/puppetlabs-motd/tree/1.9.0) - 2018-05-04

[Full Changelog](https://github.com/puppetlabs/puppetlabs-motd/compare/1.8.0...1.9.0)

### Added

- windows_motd_title parameter added [#108](https://github.com/puppetlabs/puppetlabs-motd/pull/108) ([cgpeanut](https://github.com/cgpeanut))

### Other

- (maint) - docs update [#124](https://github.com/puppetlabs/puppetlabs-motd/pull/124) ([pmcmaw](https://github.com/pmcmaw))
- (MODULES-7124) - Release prep for 1.9.0 [#123](https://github.com/puppetlabs/puppetlabs-motd/pull/123) ([pmcmaw](https://github.com/pmcmaw))
- pdksync - Update using 1.5.0 [#122](https://github.com/puppetlabs/puppetlabs-motd/pull/122) ([pmcmaw](https://github.com/pmcmaw))
- (MODULES-7069) Add compatibility for AIX [#115](https://github.com/puppetlabs/puppetlabs-motd/pull/115) ([jarretlavallee](https://github.com/jarretlavallee))
- (MODULES-6881) - Removing duplicaton in .sync.yml [#114](https://github.com/puppetlabs/puppetlabs-motd/pull/114) ([pmcmaw](https://github.com/pmcmaw))

## [1.8.0](https://github.com/puppetlabs/puppetlabs-motd/tree/1.8.0) - 2018-02-20

[Full Changelog](https://github.com/puppetlabs/puppetlabs-motd/compare/1.7.0...1.8.0)

### Added

- (MODULES-6599) Make MOTD compatible with FreeBSD [#104](https://github.com/puppetlabs/puppetlabs-motd/pull/104) ([Q1tum](https://github.com/Q1tum))

## [1.7.0](https://github.com/puppetlabs/puppetlabs-motd/tree/1.7.0) - 2018-01-22

[Full Changelog](https://github.com/puppetlabs/puppetlabs-motd/compare/1.6.0...1.7.0)

### Other

- Release prep 1.7.0 [#101](https://github.com/puppetlabs/puppetlabs-motd/pull/101) ([HelenCampbell](https://github.com/HelenCampbell))
- Conversion using 1.3.2 PDK [#100](https://github.com/puppetlabs/puppetlabs-motd/pull/100) ([HelenCampbell](https://github.com/HelenCampbell))
- Release mergeback 1.6.0 [#98](https://github.com/puppetlabs/puppetlabs-motd/pull/98) ([pmcmaw](https://github.com/pmcmaw))

## [1.6.0](https://github.com/puppetlabs/puppetlabs-motd/tree/1.6.0) - 2018-01-04

[Full Changelog](https://github.com/puppetlabs/puppetlabs-motd/compare/1.5.1...1.6.0)

### Other

- Addition of blacksmith Rake tasks [#97](https://github.com/puppetlabs/puppetlabs-motd/pull/97) ([HelenCampbell](https://github.com/HelenCampbell))
- Add blacksmith for module releases [#96](https://github.com/puppetlabs/puppetlabs-motd/pull/96) ([HelenCampbell](https://github.com/HelenCampbell))
- 1.6.0 Release Prep [#95](https://github.com/puppetlabs/puppetlabs-motd/pull/95) ([HelenCampbell](https://github.com/HelenCampbell))
- (maint) Convert module for PDK Compatibility [#93](https://github.com/puppetlabs/puppetlabs-motd/pull/93) ([bmjen](https://github.com/bmjen))
- (maint) - modulesync 384f4c1 [#92](https://github.com/puppetlabs/puppetlabs-motd/pull/92) ([tphoney](https://github.com/tphoney))
- RubocopFix [#90](https://github.com/puppetlabs/puppetlabs-motd/pull/90) ([david22swan](https://github.com/david22swan))
- Convert module to PDK standards using pdk convert [#89](https://github.com/puppetlabs/puppetlabs-motd/pull/89) ([davinhanlon](https://github.com/davinhanlon))
- (maint) - modulesync 1d81b6a [#88](https://github.com/puppetlabs/puppetlabs-motd/pull/88) ([pmcmaw](https://github.com/pmcmaw))
- 1.5.1 Release mergeback [#87](https://github.com/puppetlabs/puppetlabs-motd/pull/87) ([pmcmaw](https://github.com/pmcmaw))

## [1.5.1](https://github.com/puppetlabs/puppetlabs-motd/tree/1.5.1) - 2017-10-31

[Full Changelog](https://github.com/puppetlabs/puppetlabs-motd/compare/1.5.0...1.5.1)

### Other

- Release Prep for MOTD 1.5.1 [#86](https://github.com/puppetlabs/puppetlabs-motd/pull/86) ([willmeek](https://github.com/willmeek))
- Cleanup ruby code via rubocop [#85](https://github.com/puppetlabs/puppetlabs-motd/pull/85) ([willmeek](https://github.com/willmeek))
- Release mergeback 1.5.0 [#83](https://github.com/puppetlabs/puppetlabs-motd/pull/83) ([pmcmaw](https://github.com/pmcmaw))

## [1.5.0](https://github.com/puppetlabs/puppetlabs-motd/tree/1.5.0) - 2017-10-24

[Full Changelog](https://github.com/puppetlabs/puppetlabs-motd/compare/1.4.0...1.5.0)

### Other

- Release Prep for MOTD 1.5.0 [#82](https://github.com/puppetlabs/puppetlabs-motd/pull/82) ([willmeek](https://github.com/willmeek))
- Add set mode for File [#81](https://github.com/puppetlabs/puppetlabs-motd/pull/81) ([willmeek](https://github.com/willmeek))
- (maint) modulesync 892c4cf [#80](https://github.com/puppetlabs/puppetlabs-motd/pull/80) ([HAIL9000](https://github.com/HAIL9000))
- (MODULES-5501) - Remove unsupported Ubuntu [#79](https://github.com/puppetlabs/puppetlabs-motd/pull/79) ([pmcmaw](https://github.com/pmcmaw))
- (MODULES-5468) msync, added windows as supported platform [#78](https://github.com/puppetlabs/puppetlabs-motd/pull/78) ([8675309](https://github.com/8675309))
- (MODULES-5468) removed 'delete appveyor' code from .sync.yml [#77](https://github.com/puppetlabs/puppetlabs-motd/pull/77) ([8675309](https://github.com/8675309))
- (MODULES-3593) Changes default MOTD to something more useful [#76](https://github.com/puppetlabs/puppetlabs-motd/pull/76) ([8675309](https://github.com/8675309))
- (maint) modulesync 915cde70e20 [#75](https://github.com/puppetlabs/puppetlabs-motd/pull/75) ([glennsarti](https://github.com/glennsarti))
- Added Solaris support to motd [#74](https://github.com/puppetlabs/puppetlabs-motd/pull/74) ([wfsaxton](https://github.com/wfsaxton))
- (MODULES-5187) mysnc puppet 5 and ruby 2.4 [#73](https://github.com/puppetlabs/puppetlabs-motd/pull/73) ([eputnam](https://github.com/eputnam))
- (MODULES-5144) Prep for puppet 5 [#72](https://github.com/puppetlabs/puppetlabs-motd/pull/72) ([hunner](https://github.com/hunner))
- MODULES-4832 updated metadata version [#71](https://github.com/puppetlabs/puppetlabs-motd/pull/71) ([daniel5119](https://github.com/daniel5119))
- [msync] 786266 Implement puppet-module-gems, a45803 Remove metadata.json from locales config [#69](https://github.com/puppetlabs/puppetlabs-motd/pull/69) ([wilson208](https://github.com/wilson208))
- [MODULES-4528] Replace Puppet.version.to_f version comparison from spec_helper.rb [#68](https://github.com/puppetlabs/puppetlabs-motd/pull/68) ([wilson208](https://github.com/wilson208))
- Corrected SLES version [#67](https://github.com/puppetlabs/puppetlabs-motd/pull/67) ([cetanu](https://github.com/cetanu))
- [MODULES-4556] Remove PE requirement from metadata.json [#66](https://github.com/puppetlabs/puppetlabs-motd/pull/66) ([wilson208](https://github.com/wilson208))
- Implement beaker-module_install_helper [#65](https://github.com/puppetlabs/puppetlabs-motd/pull/65) ([wilson208](https://github.com/wilson208))
- (MODULES-4098) Sync the rest of the files [#64](https://github.com/puppetlabs/puppetlabs-motd/pull/64) ([hunner](https://github.com/hunner))
- (MODULES-4097) Sync travis.yml [#63](https://github.com/puppetlabs/puppetlabs-motd/pull/63) ([hunner](https://github.com/hunner))
- add xenial to metadata [#62](https://github.com/puppetlabs/puppetlabs-motd/pull/62) ([eputnam](https://github.com/eputnam))
- (FM-5972) gettext and spec.opts [#61](https://github.com/puppetlabs/puppetlabs-motd/pull/61) ([eputnam](https://github.com/eputnam))
- (#5955) Support for /etc/issue and /etc/issue.net [#60](https://github.com/puppetlabs/puppetlabs-motd/pull/60) ([GeoffWilliams](https://github.com/GeoffWilliams))
- (MODULES-3631) msync Gemfile for 1.9 frozen strings [#57](https://github.com/puppetlabs/puppetlabs-motd/pull/57) ([hunner](https://github.com/hunner))
- Remove useless test file to pass release_checks [#56](https://github.com/puppetlabs/puppetlabs-motd/pull/56) ([DavidS](https://github.com/DavidS))
- (MODULES-3704) Update gemfile template to be identical [#55](https://github.com/puppetlabs/puppetlabs-motd/pull/55) ([hunner](https://github.com/hunner))
- mocha version update [#54](https://github.com/puppetlabs/puppetlabs-motd/pull/54) ([eputnam](https://github.com/eputnam))
- (MODULES-3983) Update parallel_tests for ruby 2.0.0 [#53](https://github.com/puppetlabs/puppetlabs-motd/pull/53) ([pmcmaw](https://github.com/pmcmaw))
- Update modulesync_config [51f469d] [#51](https://github.com/puppetlabs/puppetlabs-motd/pull/51) ([DavidS](https://github.com/DavidS))
- Update modulesync_config [a3fe424] [#50](https://github.com/puppetlabs/puppetlabs-motd/pull/50) ([DavidS](https://github.com/DavidS))
- (maint) Fixes dynamic_motd setting on Debian [#49](https://github.com/puppetlabs/puppetlabs-motd/pull/49) ([bmjen](https://github.com/bmjen))
- (maint) Removes unnecessary test [#48](https://github.com/puppetlabs/puppetlabs-motd/pull/48) ([bmjen](https://github.com/bmjen))
- (MAINT) Update for modulesync_config 72d19f184 [#47](https://github.com/puppetlabs/puppetlabs-motd/pull/47) ([DavidS](https://github.com/DavidS))
- (MODULES-3581) modulesync [067d08a] [#46](https://github.com/puppetlabs/puppetlabs-motd/pull/46) ([DavidS](https://github.com/DavidS))
- {maint} modulesync 0794b2c [#45](https://github.com/puppetlabs/puppetlabs-motd/pull/45) ([tphoney](https://github.com/tphoney))
- Update to newest modulesync_configs [9ca280f] [#44](https://github.com/puppetlabs/puppetlabs-motd/pull/44) ([DavidS](https://github.com/DavidS))
- (maint) fix test to run under strict variables [#43](https://github.com/puppetlabs/puppetlabs-motd/pull/43) ([tphoney](https://github.com/tphoney))
- 1.4.x Mergeback [#42](https://github.com/puppetlabs/puppetlabs-motd/pull/42) ([HelenCampbell](https://github.com/HelenCampbell))
- MODULES-3096 - Update Beaker SUT definitions [#41](https://github.com/puppetlabs/puppetlabs-motd/pull/41) ([borcean](https://github.com/borcean))
- Update metadata to note Debian 8 support [#40](https://github.com/puppetlabs/puppetlabs-motd/pull/40) ([DavidS](https://github.com/DavidS))
- (FM-4046) Update to current msync configs [006831f] [#39](https://github.com/puppetlabs/puppetlabs-motd/pull/39) ([DavidS](https://github.com/DavidS))

## [1.4.0](https://github.com/puppetlabs/puppetlabs-motd/tree/1.4.0) - 2016-01-25

[Full Changelog](https://github.com/puppetlabs/puppetlabs-motd/compare/1.3.0...1.4.0)

### Other

- (FM-4049) update to modulesync_configs [#38](https://github.com/puppetlabs/puppetlabs-motd/pull/38) ([DavidS](https://github.com/DavidS))
- FM-4620: edit motd README [#37](https://github.com/puppetlabs/puppetlabs-motd/pull/37) ([jbondpdx](https://github.com/jbondpdx))
- Changelog and metadata update for 1.4.0 release [#36](https://github.com/puppetlabs/puppetlabs-motd/pull/36) ([HelenCampbell](https://github.com/HelenCampbell))
- Fixes acceptance testing for windows [#35](https://github.com/puppetlabs/puppetlabs-motd/pull/35) ([bmjen](https://github.com/bmjen))
- Fixes tests for debian8 [#34](https://github.com/puppetlabs/puppetlabs-motd/pull/34) ([bmjen](https://github.com/bmjen))
- Fixes acceptance tests. [#33](https://github.com/puppetlabs/puppetlabs-motd/pull/33) ([bmjen](https://github.com/bmjen))
- tweak the tests for debian [#32](https://github.com/puppetlabs/puppetlabs-motd/pull/32) ([tphoney](https://github.com/tphoney))
- (FM-3924) Create Master/Agent automation test for Puppetlabs-motd [#29](https://github.com/puppetlabs/puppetlabs-motd/pull/29) ([phongdly](https://github.com/phongdly))

## [1.3.0](https://github.com/puppetlabs/puppetlabs-motd/tree/1.3.0) - 2015-12-10

[Full Changelog](https://github.com/puppetlabs/puppetlabs-motd/compare/1.2.0...1.3.0)

### Other

- (maint) Update formatting of metadata.json. [#30](https://github.com/puppetlabs/puppetlabs-motd/pull/30) ([bmjen](https://github.com/bmjen))
- Update Travis config [#28](https://github.com/puppetlabs/puppetlabs-motd/pull/28) ([borcean](https://github.com/borcean))
- Cut 1.3.0 release - MODULES-2845 [#27](https://github.com/puppetlabs/puppetlabs-motd/pull/27) ([borcean](https://github.com/borcean))
- Use strings for parameter documentation MODULES-2664 [#26](https://github.com/puppetlabs/puppetlabs-motd/pull/26) ([borcean](https://github.com/borcean))
- Removed trailing whitespace, proper spacing. MODULES-2663 [#25](https://github.com/puppetlabs/puppetlabs-motd/pull/25) ([borcean](https://github.com/borcean))
- Beaker tests modules 2665 [#23](https://github.com/puppetlabs/puppetlabs-motd/pull/23) ([iankronquist](https://github.com/iankronquist))
- Fix for MODULES-2590 [#22](https://github.com/puppetlabs/puppetlabs-motd/pull/22) ([HelenCampbell](https://github.com/HelenCampbell))
- Add missing stdlib fixture [#21](https://github.com/puppetlabs/puppetlabs-motd/pull/21) ([arioch](https://github.com/arioch))
- Added option to disable dynamic motd on Debian based systems [#20](https://github.com/puppetlabs/puppetlabs-motd/pull/20) ([dlactin](https://github.com/dlactin))
- Added logic for Windows Logon Message [#19](https://github.com/puppetlabs/puppetlabs-motd/pull/19) ([ncorrare](https://github.com/ncorrare))
- fixed static string example that would not display MOTD on CentOS [#17](https://github.com/puppetlabs/puppetlabs-motd/pull/17) ([bsnape](https://github.com/bsnape))

## [1.2.0](https://github.com/puppetlabs/puppetlabs-motd/tree/1.2.0) - 2014-11-04

[Full Changelog](https://github.com/puppetlabs/puppetlabs-motd/compare/1.1.1...1.2.0)

### Other

- Add source parameter to motd [#16](https://github.com/puppetlabs/puppetlabs-motd/pull/16) ([adreyer](https://github.com/adreyer))
- Prepare 1.1.1 release. [#15](https://github.com/puppetlabs/puppetlabs-motd/pull/15) ([apenney](https://github.com/apenney))

## [1.1.1](https://github.com/puppetlabs/puppetlabs-motd/tree/1.1.1) - 2014-07-15

[Full Changelog](https://github.com/puppetlabs/puppetlabs-motd/compare/1.1.0...1.1.1)

### Other

- Prepare 1.1.1 release. [#15](https://github.com/puppetlabs/puppetlabs-motd/pull/15) ([apenney](https://github.com/apenney))

## [1.1.0](https://github.com/puppetlabs/puppetlabs-motd/tree/1.1.0) - 2014-05-28

[Full Changelog](https://github.com/puppetlabs/puppetlabs-motd/compare/1.0.1...1.1.0)

### Other

- Prepare for 1.1.0 release. [#14](https://github.com/puppetlabs/puppetlabs-motd/pull/14) ([underscorgan](https://github.com/underscorgan))
- add test and ERB conditional logic for when ::domain not present [#13](https://github.com/puppetlabs/puppetlabs-motd/pull/13) ([nrvale0](https://github.com/nrvale0))
- Little fix on documentation [#12](https://github.com/puppetlabs/puppetlabs-motd/pull/12) ([leopoiroux](https://github.com/leopoiroux))
- Added class parameter for external templates and tests [#7](https://github.com/puppetlabs/puppetlabs-motd/pull/7) ([solarkennedy](https://github.com/solarkennedy))
- Add Apache 2.0 license file. [#6](https://github.com/puppetlabs/puppetlabs-motd/pull/6) ([apenney](https://github.com/apenney))
- fix a deprecation warning introduced by puppet issue 19058 [#5](https://github.com/puppetlabs/puppetlabs-motd/pull/5) ([nagas](https://github.com/nagas))
- Init.pp doesn't meet puppet style guidelines [#2](https://github.com/puppetlabs/puppetlabs-motd/pull/2) ([brianvans](https://github.com/brianvans))
- Created README content, updated extension and deleted extraneous READMEs [#1](https://github.com/puppetlabs/puppetlabs-motd/pull/1) ([lrnrthr](https://github.com/lrnrthr))

## [1.0.1](https://github.com/puppetlabs/puppetlabs-motd/tree/1.0.1) - 2012-03-26

[Full Changelog](https://github.com/puppetlabs/puppetlabs-motd/compare/1.0.0...1.0.1)

## [1.0.0](https://github.com/puppetlabs/puppetlabs-motd/tree/1.0.0) - 2012-03-26

[Full Changelog](https://github.com/puppetlabs/puppetlabs-motd/compare/9702b8126e28be589b9edd9ea2a357f81a22e029...1.0.0)
