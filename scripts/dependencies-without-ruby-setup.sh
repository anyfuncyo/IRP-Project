#!/usr/bin/env bash
set -e

export PATH=${PATH}:/usr/local/bin 
export LC_ALL="en_US.UTF-8" 
readonly SCRIPTS_DIR="${BASH_SOURCE[0]%/*}"

cd "${SCRIPTS_DIR}/.."
readonly BUNDLER_VERSION_SPEC='~>1.17.2'

# Check if Homebrew is installed
if [ -z "$(command -v brew)" ]; then
  echo "--- 🚫 brew not found. Homebrew is not installed"
  exit 1
fi

# install a specific version of the bundler
if ! gem list -i bundler -v "$BUNDLER_VERSION_SPEC" >/dev/null; then 
  echo "--- ⚠️  Installing bundler (version '$BUNDLER_VERSION_SPEC')..."
  gem install bundler -v "$BUNDLER_VERSION_SPEC"
else
  echo "--- ✅  bundler gem (version '$BUNDLER_VERSION_SPEC') already installed"
fi

# use bundler to install the gems specified in your Gemfile
bundle install

# Check Xcode version on Azure agent
echo "--- 🛠️  Force Xcode to use system SSH keys when accessing the git repositories"
defaults write com.apple.dt.Xcode IDEPackageSupportUseBuiltinSCM YES

echo "--- 🛠️  Verifying you have the correct version of Xcode installed.."
PROJECT_XCODE_VERSION=$(cat .xcode-version)
INSTALLED_XCODE_VERSION=$(/usr/bin/xcodebuild -version | sed -En 's/Xcode[[:space:]]+([0-9\.]*)/\1/p')

if [ "$PROJECT_XCODE_VERSION" = "$INSTALLED_XCODE_VERSION" ]; then
  echo "--- ✅ Correct Xcode version currently in use (${PROJECT_XCODE_VERSION})"
else
  echo "--- 🚫 The installed Xcode version (${INSTALLED_XCODE_VERSION}) does not match the project version (${PROJECT_XCODE_VERSION}). If this version is already installed on your machine, use xcode-select to manually point to that version."
fi

echo "--- 🫡 Setup complete"