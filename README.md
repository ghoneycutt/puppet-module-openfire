# puppet-module-openfire
===

[![Build Status](https://travis-ci.org/ghoneycutt/puppet-module-openfire.png?branch=master)](https://travis-ci.org/ghoneycutt/puppet-module-openfire)


Manage [Openfire](http://www.igniterealtime.org/projects/openfire/), a XMPP server, from Ignite Realtime (Jive Software)

===

# Compatibility
---------------
This module is built for use with Puppet v3 with Ruby versions 1.8.7, 1.9.3, and 2.0.0 on the following OS families.

* EL 6

===

# Parameters
------------

package
-------
(string) Name of package for openfire.

- *Default*: 'openfire'

exec_path
---------
(string) PATH statement that must include path to mysql.

- *Default*: '/bin:/usr/bin'

db_name
-------
(string) Name of database.

- *Default*: 'openfire'

db_host
-------
(string) Hostname of database.

- *Default*: 'localhost'

db_user
-------
(string) Database username.

- *Default*: 'openfire'

db_password
-----------
(string) Database password.

- *Default*: 'specify_something_else_in_hiera'

db_grants
---------
(array) List of privileges for `$db_user` on `$db_name`.

- *Default*: ['SELECT','INSERT','UPDATE','DELETE','CREATE']

sql_file
--------
(string) Path to file that contains SQL necessary to configure the database.

- *Default*: '/opt/openfire/resources/database/openfire_mysql.sql'

service_name
------------
(string) Name of service.

- *Default*: 'openfire'

service_ensure
--------------
(string) Ensure parameter for service. Valid values are 'stopped' and 'running'.

- *Default*: 'running'

service_enable
--------------
(boolean) Enable parameter for service to determine if it should start at boot time.

- *Default*: true

require_32bit_zlib
------------------
(boolean) Ensure that 32bit zlib package is present. This is necessary for 64bit systems.

- *Default*: true

zlib_32bit_package
------------------
(string) Name of 32bit zlib package.

- *Default*: 'zlib.i686'
