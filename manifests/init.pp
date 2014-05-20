# == Class: openfire
#
# Module to manage openfire
#
class openfire (
  $package            = 'openfire',
  $exec_path          = '/bin:/usr/bin',
  $db_name            = 'openfire',
  $db_host            = 'localhost',
  $db_user            = 'openfire',
  $db_password        = 'specify_something_else_in_hiera',
  $db_grants          = ['SELECT','INSERT','UPDATE','DELETE','CREATE'],
  $sql_file           = '/opt/openfire/resources/database/openfire_mysql.sql',
  $service_name       = 'openfire',
  $service_ensure     = 'running',
  $service_enable     = true,
  $require_32bit_zlib = true,
  $zlib_32bit_package = 'zlib.i686',
) {

  require 'mysql::server'

  if $require_32bit_zlib == true {
    package { '32bit_zlib':
      ensure => present,
      name   => $zlib_32bit_package,
      before => Package['openfire'],
    }
  }

  package { 'openfire':
    ensure => present,
    name   => $package,
  }

  mysql::db { 'openfire':
    user     => $db_user,
    password => $db_password,
    dbname   => $db_name,
    host     => $db_host,
    grant    => $db_grants,
  }

  exec { 'import_openfire_database':
    command     => "mysql ${db_name} < ${sql_file}",
    refreshonly => true,
    path        => $exec_path,
    logoutput   => true,
    environment => "HOME=${::root_home}",
    subscribe   => Mysql::Db['openfire'],
    require     => Package['openfire'],
    notify      => Service['openfire'],
  }

  file { '/var/log/openfire':
    ensure  => link,
    target  => '/opt/openfire/logs',
    require => Package['openfire'],
  }

  service { 'openfire':
    ensure  => $service_ensure,
    name    => $service_name,
    enable  => $service_enable,
    require => [ Package['openfire'],
                Mysql::Db['openfire'],
    ],
  }
}
