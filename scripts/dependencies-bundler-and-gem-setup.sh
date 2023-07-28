#!/usr/bin/env bash
set -e

export PATH=${PATH}:/usr/local/bin 
export LC_ALL="en_US.UTF-8" 
readonly SCRIPTS_DIR="${BASH_SOURCE[0]%/*}"

cd "${SCRIPTS_DIR}/.."
readonly BUNDLER_VERSION_SPEC='~>1.17.2'

# install a specific version of the bundler
if ! gem list -i bundler -v "$BUNDLER_VERSION_SPEC" >/dev/null; then 
  echo "--- ⚠️  Installing bundler (version '$BUNDLER_VERSION_SPEC')..."
  gem install bundler -v "$BUNDLER_VERSION_SPEC"
else
  echo "--- ✅  bundler gem (version '$BUNDLER_VERSION_SPEC') already installed"
fi

# use bundler to install the gems specified in your Gemfile
bundle install