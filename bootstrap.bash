#!/usr/bin/env bash

# Finds the dereferenced directory of the current script
get_script_dir () {
  local SOURCE="${BASH_SOURCE[0]}"
  local DIR="$( dirname "$SOURCE" )"

  while [ -h "$SOURCE" ]; do
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
    DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  done

  local RETVAL="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  if [[ $# = 0 ]]; then
    SCRIPTDIR=$RETVAL
  else
    eval "$1='$RETVAL'"
  fi
}

get_script_dir DOTFILESDIR

# Install puppet
sudo -E gem install puppet --no-ri --no-rdoc

# Install module dependencies
modules_tmp=/tmp/puppet-modules
mkdir -p ${modules_tmp}
puppet module install puppetlabs/vcsrepo --modulepath ${modules_tmp}

# Apply dot_files
puppet apply $DOTFILESDIR/manifests/default.pp --modulepath $DOTFILESDIR/modules:${modules_tmp} --pluginsync
