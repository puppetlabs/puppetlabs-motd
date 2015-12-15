Test Levels
===========================

This folder contains tests at the acceptance and integration level for the "puppetlabs-motd" module. The unit
tests are in repository-level-folder/tests/beaker/tests directory.

## Config Folder

The "config" folder contains Beaker host configuration files for the various test platforms used by the test suites
under 'repository-level-fold/tests' directory.

## File Folder

The 'file' folder contains ERB template files used by the test suites under 'repository-level-fold/tests' directory.

## Library Folder

The "lib" folder contains Beaker helper library that assist in automated testing.

## Pre-suite Folder

The "pre-suite" folder contains Beaker pre-suite scripts for setting up environments for
'repository-level-folder/tests/beaker/tests' test suite.

## Running Tests

Included in the sub-folders is the "test_run_scripts" sub-folder for simple Bash scripts that will run suites of
Beaker tests. These scripts utilize environment variables for specifying test infrastructure. For security
reasons we do not provide examples from the Puppet Labs testing environment. Hopefully in the near future we will
be able to provide necessary infrastructure to the community to allow for contributors to run the test.

### Running Tests

To run tests use the "run_test_with_ankeny.sh" test run script.

**Example: Run with RHEL6**
```
./run_test_with_ankeny.sh redhat-6-64mda
```

**Example: Run with RHEL7**
```
./run_test_with_ankeny.sh redhat-7-64mda
```

**Example: Run with UBUNTU 12.04**
```
./run_test_with_ankeny.sh ubuntu-1204-64mda
```

**Example: Run with UBUNTU 14.04**
```
./run_test_with_ankeny.sh ubuntu-1404-64mda
```
