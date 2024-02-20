#!/bin/bash

# 脚本路径 uci/pack_init.sh
# 赋权 chmod +x pack_init.sh
# sudo执行 sudo ./pack_init.sh
# Binaries, headers, libraries and other files are installed from the current directory

CURRENT_DIR=$(dirname "$(readlink -f "$0")")
SOURCE_DIR="$(realpath "${CURRENT_DIR}/../uci-linux/")"

mkdir -p "${SOURCE_DIR}"

# 复制文件
cp uci.h "${SOURCE_DIR}"
cp uci_config.h "${SOURCE_DIR}"
cp uci_blob.h "${SOURCE_DIR}"
cp ucimap.h "${SOURCE_DIR}"
cp libuci.so "${SOURCE_DIR}"
cp uci "${SOURCE_DIR}"
cp lua/uci.so "${SOURCE_DIR}"
cp pack_init.sh "${SOURCE_DIR}"

# 创建文件
printf "\n%s\n\t%s\n" "config test 'config'" "option success 'yes'" | expand -t8 > "${SOURCE_DIR}"/test
cat << 'EOF' > "${SOURCE_DIR}"/uci_install_manifest
/usr/include/uci.h
/usr/include/uci_config.h
/usr/include/uci_blob.h
/usr/include/ucimap.h
/usr/lib/libuci.so
/usr/bin/uci
/usr/lib/uci.sh
/usr/lib/lua/5.1/uci.so
/etc/config/test
EOF
cat << 'EOF' > "${SOURCE_DIR}"/uci.sh
# Shell script compatibility wrappers for /sbin/uci
#
# Copyright (C) 2008-2010  OpenWrt.org
# Copyright (C) 2008  Felix Fietkau <nbd@nbd.name>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA

CONFIG_APPEND=
# 预先定义一个全局变量，用于加载UCI配置时，若此全局变量有值（通常是1），则在已有配置上追加加载配置。否则会先清除已有配置再加载新配置。

uci_load() {
    # 用于加载指定包的UCI配置

    local PACKAGE="$1"
    #PACKAGE是用户指定的UCI配置包名，它是作为命令行参数从外部传入的

    local DATA
    local RET
    local VAR

    _C=0
    if [ -z "$CONFIG_APPEND" ]; then
        # 如果CONFIG_APPEND为空（默认值为0），则表示加载配置前会先清除已有配置再加载
        # 以下操作就是在清除已有配置

        for VAR in $CONFIG_LIST_STATE; do
            # 遍历CONFIG_LIST_STATE，这是一个保存了所有当前阶段配置状态的列表变量

            export ${NO_EXPORT:+-n} CONFIG_${VAR}=
            export ${NO_EXPORT:+-n} CONFIG_${VAR}_LENGTH=
            # 这两行操作是清除指定配置的当前状态和长度

        done
        export ${NO_EXPORT:+-n} CONFIG_LIST_STATE=
        export ${NO_EXPORT:+-n} CONFIG_SECTIONS=
        export ${NO_EXPORT:+-n} CONFIG_NUM_SECTIONS=0
        export ${NO_EXPORT:+-n} CONFIG_SECTION=
        # 这四行操作分别是清除当前阶段配置列表，当前加载的配置名列表，当前加载的配置数（为0表示没有配置被加载）、当前正在处理的配置名
    fi

    # 执行UCI export命令，获取指定配置包的内容，保存在DATA变量中，如果在执行过程中有错误生产，或者DATA为空，则用RET记录返回值
    DATA="$(/sbin/uci ${UCI_CONFIG_DIR:+-c $UCI_CONFIG_DIR} ${LOAD_STATE:+-P /var/state} -S -n export "$PACKAGE" 2>/dev/null)"
    RET="$?"
    [ "$RET" != 0 -o -z "$DATA" ] || eval "$DATA"
    unset DATA

    # 如果CONFIG_SECTION变量不为空（表示有配置被加载），则调用config_cb回调函数（这个函数通常在主脚本中定义，用于在加载配置后处理数据）
    ${CONFIG_SECTION:+config_cb}
    return "$RET"
}

uci_set_default() {
    # 设置指定UCI配置包到默认状态
    local PACKAGE="$1"
    /sbin/uci ${UCI_CONFIG_DIR:+-c $UCI_CONFIG_DIR} -q show "$PACKAGE" > /dev/null && return 0
    # 如果配置包已经存在，则退出
    /sbin/uci ${UCI_CONFIG_DIR:+-c $UCI_CONFIG_DIR} import "$PACKAGE"
    /sbin/uci ${UCI_CONFIG_DIR:+-c $UCI_CONFIG_DIR} commit "$PACKAGE"
    # 否则，将配置导入并提交
}

uci_revert_state() {
    # 将指定配置项的状态重置
    local PACKAGE="$1"
    local CONFIG="$2"
    local OPTION="$3"
    /sbin/uci ${UCI_CONFIG_DIR:+-c $UCI_CONFIG_DIR} -P /var/state revert "$PACKAGE${CONFIG:+.$CONFIG}${OPTION:+.$OPTION}"
    # revert将配置包或者具体的配置项恢复到上一次commit的状态。
}

uci_set_state() {
    # 设置指定配置项的状态
    local PACKAGE="$1"
    local CONFIG="$2"
    local OPTION="$3"
    local VALUE="$4"
    [ "$#" = 4 ] || return 0  #检查参数是否齐全
    /sbin/uci ${UCI_CONFIG_DIR:+-c $UCI_CONFIG_DIR} -P /var/state set "$PACKAGE.$CONFIG${OPTION:+.$OPTION}=$VALUE"
    # set命令用来设置配置项的值
}

uci_toggle_state() {
    # 切换指定配置项的状态
    uci_revert_state "$1" "$2" "$3"
    uci_set_state "$1" "$2" "$3" "$4"
    # 先恢复到初始状态，再设置为新状态。
}

uci_set() {
    # 设置指定配置项的值
    local PACKAGE="$1"
    local CONFIG="$2"
    local OPTION="$3"
    local VALUE="$4"
    /sbin/uci ${UCI_CONFIG_DIR:+-c $UCI_CONFIG_DIR} set "$PACKAGE.$CONFIG.$OPTION=$VALUE"
    # set命令用来设置配置项的值
}

uci_add_list() {
    # 在指定配置项（必须是列表类型）中添加一个值
    local PACKAGE="$1"
    local CONFIG="$2"
    local OPTION="$3"
    local VALUE="$4"
    /sbin/uci ${UCI_CONFIG_DIR:+-c $UCI_CONFIG_DIR} add_list "$PACKAGE.$CONFIG.$OPTION=$VALUE"
    # add_list用来向列表类型的配置项添加一个值
}

uci_get_state() {
    # 获取指定配置项的状态
    uci_get "$1" "$2" "$3" "$4" "/var/state"
    # get命令用来获取配置项的值,这里将状态保存的目录"/var/state"传递进去，从状态保存的文件中读取状态
}

uci_get() {
    # 获取指定配置项的值
    local PACKAGE="$1"
    local CONFIG="$2"
    local OPTION="$3"
    local DEFAULT="$4"
    local STATE="$5"
    /sbin/uci ${UCI_CONFIG_DIR:+-c $UCI_CONFIG_DIR} ${STATE:+-P $STATE} -q get "$PACKAGE${CONFIG:+.$CONFIG}${OPTION:+.$OPTION}"
    RET="$?"
    [ "$RET" -ne 0 ] && [ -n "$DEFAULT" ] && echo "$DEFAULT"
    # 如果get命令返回非0值，说明出错，这时如果给出了默认值DEFAULT，则输出默认值。
    return "$RET"
}

uci_add() {
    # 添加一个新的UCI配置或者设置已有配置的类型
    local PACKAGE="$1"
    local TYPE="$2"
    local CONFIG="$3"
    if [ -z "$CONFIG" ]; then
        export ${NO_EXPORT:+-n} CONFIG_SECTION="$(/sbin/uci ${UCI_CONFIG_DIR:+-c $UCI_CONFIG_DIR} add "$PACKAGE" "$TYPE")" #-n表示不导出到环境变量
    else
        /sbin/uci ${UCI_CONFIG_DIR:+-c $UCI_CONFIG_DIR} set "$PACKAGE.$CONFIG=$TYPE"
        export ${NO_EXPORT:+-n} CONFIG_SECTION="$CONFIG"
    fi
}

uci_rename() {
    # 重命名一个已有的UCI配置项
    local PACKAGE="$1"
    local CONFIG="$2"
    local OPTION="$3"
    local VALUE="$4"
    /sbin/uci ${UCI_CONFIG_DIR:+-c $UCI_CONFIG_DIR} rename "$PACKAGE.$CONFIG${VALUE:+.$OPTION}=${VALUE:-$OPTION}"
    # 重命名配置项，如果VALUE不为空，将OPTION改名为VALUE，否则将CONFIG改名为OPTION
}

uci_remove() {
    # 删除一个UCI配置项或者配置
    local PACKAGE="$1"
    local CONFIG="$2"
    local OPTION="$3"
    /sbin/uci ${UCI_CONFIG_DIR:+-c $UCI_CONFIG_DIR} del "$PACKAGE.$CONFIG${OPTION:+.$OPTION}"
    # del命令用于删除配置或者配置项，如果OPTION为空，则删除整个CONFIG，否则只删除CONFIG中的OPTION
}

uci_remove_list() {
    # 在指定配置项（必须是列表类型）中删除一个值
    local PACKAGE="$1"
    local CONFIG="$2"
    local OPTION="$3"
    local VALUE="$4"
    /sbin/uci ${UCI_CONFIG_DIR:+-c $UCI_CONFIG_DIR} del_list "$PACKAGE.$CONFIG.$OPTION=$VALUE"
    # del_list用来从列表类型的配置项中删除一个值
}

uci_revert() {
    # 删除对UCI配置或者配置项的未提交修改
    local PACKAGE="$1"
    local CONFIG="$2"
    local OPTION="$3"
    /sbin/uci ${UCI_CONFIG_DIR:+-c $UCI_CONFIG_DIR} revert "$PACKAGE${CONFIG:+.$CONFIG}${OPTION:+.$OPTION}"
    # revert命令用于撤销对配置或配置项的未提交修改，如果CONFIG为空，那么撤销对整个PACKAGE的修改，否则撤销对`${CONFIG}.${OPTION}`的修改
}

uci_commit() {
    # 提交UCI配置的修改
    local PACKAGE="$1"
    /sbin/uci ${UCI_CONFIG_DIR:+-c $UCI_CONFIG_DIR} commit $PACKAGE
    # commit用来将对UCI配置的修改提交，使其生效并保存.
}

EOF
cat << 'EOF' > "${SOURCE_DIR}"/setup.sh
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
    cp "$CURRENT_DIR"/uci*.h $INCLUDE_DIR/

    # Install the binary
    cp "$CURRENT_DIR"/uci $BIN_DIR/
    cp "$CURRENT_DIR"/uci.sh $LIB_DIR/

    # Install the library files
    cp "$CURRENT_DIR"/libuci.so $LIB_DIR/

    # Install the lua files
    mkdir -p $LUA_LIB_DIR
    cp "$CURRENT_DIR"/uci.so $LUA_LIB_DIR/

    # Make the binary executable
    chmod +x $BIN_DIR/uci $LIB_DIR/uci.sh

    # Create a configuration file directory
    [ -d $CONFIG_DIR ] || mkdir $CONFIG_DIR
    cp "$CURRENT_DIR"/test $CONFIG_DIR/

    echo "Installation completed."
}

function remove {
    # remove the header files
    rm $INCLUDE_DIR/uci*.h

    # remove the library files
    rm $LIB_DIR/libuci.so

    # remove the binary
    rm $BIN_DIR/uci
    rm $LIB_DIR/uci.sh

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
EOF
cat << 'EOF' > "${SOURCE_DIR}"/Makefile
# Variables
INCDIR := $(DESTDIR)/usr/include
BINDIR := $(DESTDIR)/usr/bin
LIBDIR := $(DESTDIR)/usr/lib
LUADIR := $(DESTDIR)/usr/lib/lua/5.1
CONDIR := $(DESTDIR)/etc/config

install:
	mkdir -p $(BINDIR) $(INCDIR) $(LUADIR) $(CONDIR)
	cp uci*.h $(INCDIR)
	cp uci $(BINDIR)
	cp uci.sh $(LIBDIR)
	cp libuci.so $(LIBDIR)
	cp uci.so $(LUADIR)
	cp "test" $(CONDIR)

clean:
	rm -f $(BINDIR)/uci $(BINDIR)/uci.sh $(LIBDIR)/libuci.so $(LIBDIR)/uci.so $(INCDIR)/uci*.h

.PHONY: install clean
EOF

# 赋权
chmod +x "${SOURCE_DIR}"/*.sh

# 打印消息
echo "Source files have been collected."