# == Class: dot_files::params
#
# Full description of class dot_files::params here.
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
#  class { dot_files::params:
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
class dot_files::params {

  $repo_ensure     = 'latest'
  $repo_source     = 'git://github.com/evanstachowiak/dot_files.git'
  $vcs_provider    = 'git'
  $repo_parent_dir = "~/code",
  $repo_dir        = "~/code/dot_files"

  case $::operatingsystem {
    /(?i-mx:debian|ubuntu)/: { }
    /(?i-mx:darwin)/: {}
    default: { fail("The operating system ${::operatingsystem} is not supported by this module") }
  }


}
