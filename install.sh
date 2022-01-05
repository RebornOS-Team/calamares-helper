#! /usr/bin/env sh

# Install the created calamares packages (currently for Arch Linux)

SCRIPT_DIRECTORY="$(dirname -- "$(readlink -f -- "$0")")"

CONFIGURATION_SCRIPT_PATH="$SCRIPT_DIRECTORY/calamares-configuration/scripts/install_archlinux_package.sh"
BRANDING_SCRIPT_PATH="$SCRIPT_DIRECTORY/calamares-branding/scripts/install_archlinux_package.sh"
CORE_SCRIPT_PATH="$SCRIPT_DIRECTORY/calamares-core/scripts/install_archlinux_package.sh"

run_install_script() {
    PACKAGE_NAME="$1"
    SCRIPT_PATH="$2"
    shift 2

    echo ""
    echo "Installing the $PACKAGE_NAME package..."
    echo ""
    if [ ! -f "$SCRIPT_PATH" ];then
        >&2 echo "Please re-trace the cloning instructions in the README. The submodules have not been initialized and/or updated correctly."
        exit 1
    fi
    set -o xtrace
    sh "$SCRIPT_PATH" "$@"
    set +o xtrace
}

run_install_script "Calamares configuration" "$CONFIGURATION_SCRIPT_PATH" "$@"
run_install_script "Calamares branding" "$BRANDING_SCRIPT_PATH" "$@"
run_install_script "Calamares core" "$CORE_SCRIPT_PATH" "$@"