# == Class: dot_files
#
# Full description of class dot_files here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { dot_files:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2011 Your name here, unless otherwise noted.
#
class dot_files (
  repo_ensure     = $::dot_files::params::repo_ensure,
  repo_source     = $::dot_files::params::repo_source,
  repo_parent_dir = $::dot_files::params::repo_parent_dir,
  repo_dir        = $::dot_files::params::repo_dir,
) inherits dot_files::params {


  vcsrepo { $repo_dir:
    ensure   => $repo_ensure,
    provider => 'git',
    source   => $repo_source,
  }

}
