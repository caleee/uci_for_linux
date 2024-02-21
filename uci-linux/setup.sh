#!/bin/bash

# 脚本路径 uci-linux/setup.sh
# sudo执行 sudo ./setup.sh
# Binaries, headers, libraries and other files are installed from the current directory
CURRENT_DIR=$(dirname "$(readlink -f "$0")")

# Installation directories
INCLUDE_DIR="/usr/include"
LIB_DIR="/usr/lib"
BIN_DIR="/usr/bin"
LUA_LIB_DIR="/usr/lib/lua/5.1"

# create config directory
CONFIG_DIR="/etc/config"

function install {
    # Install the header files
    cp --preserve=timestamps "$CURRENT_DIR"/uci*.h $INCLUDE_DIR/

    # Install the binary
    cp --preserve=timestamps "$CURRENT_DIR"/uci $BIN_DIR/

    # Install the library files
    cp --preserve=timestamps "$CURRENT_DIR"/uci.sh $LIB_DIR/
    cp --preserve=timestamps "$CURRENT_DIR"/libuci.so $LIB_DIR/
    cp --preserve=timestamps "$CURRENT_DIR"/libubox.so $LIB_DIR/

    # Install the lua files
    mkdir -p $LUA_LIB_DIR
    cp --preserve=timestamps "$CURRENT_DIR"/uci.so $LUA_LIB_DIR/

    # Make the binary executable
    chmod +x $BIN_DIR/uci $LIB_DIR/uci.sh

    # Create a configuration file directory
    [ -d $CONFIG_DIR ] || mkdir $CONFIG_DIR
    cp --preserve=timestamps "$CURRENT_DIR"/test $CONFIG_DIR/

    echo "Installation completed."
}

function remove {
    # remove the header files
    rm $INCLUDE_DIR/uci*.h

    # remove the library files
    rm $LIB_DIR/uci.sh
    rm $LIB_DIR/libuci.so
    rm $LIB_DIR/libubox.so

    # remove the binary
    rm $BIN_DIR/uci

    # remove the lua files
    rm $LUA_LIB_DIR/uci.so

    # Ask user if he/she wants to remove configuration file directory
    read -rp "Do you want to remove the configuration file directory? [y/N] " response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
    then
        # remove the configuration file directory
        rm -rf $CONFIG_DIR
        echo "Configuration file directory removed."
    else
        echo "Configuration file directory preserved."
    fi

    echo "Removal completed."
}

case "$1" in
    install)
        install
        ;;
    remove)
        remove
        ;;
    *)
        echo "Unknown argument. Please use './setup.sh install' for installation or './setup.sh remove' for removal."
        ;;
esac