#stdlibplus

##Overview

Adds a standard library of resources for Puppet modules.

##Module Description

This module provides a standard library of resources for the development of Puppet modules. The stdlib module adds the following resources to Puppet:

 * Facts
 * Functions

##Setup

Installing the stdlib module adds the facts, functions of this standard library to Puppet.

## Reference

### Functions

#### `validate_fqdn`

Validates that all passed values are fqdn. Aborts catalog compilation if any value fails this check.

*Type*: statement.

#### `validate_port`

Validates that all passed values are port number. Aborts catalog compilation if any value fails this check.

*Type*: statement.
