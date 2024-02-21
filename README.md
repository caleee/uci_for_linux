[toc]

## deb包安装

> 适用于debian系Linux x86发行版；如：Ubuntu

### 建立包目录

```bash
mkdir -p ~/package/mosdns && cd ~/package/mosdns
```

### 获取最新 deb 包

#### 直连 github 获取

```bash
curl -s https://api.github.com/repos/caleee/uci_for_linux/releases/latest | grep -o "https://github.com/caleee/uci_for_linux/releases/download/.*/uci-linux_.*_amd64.deb" | xargs curl -LO
```

#### 代理 github 链接获取（国内网络首选）

```bash
curl -s https://api.github.com/repos/caleee/uci_for_linux/releases/latest | grep -o "https://github.com/caleee/uci_for_linux/releases/download/.*/uci-linux_.*_amd64.deb" | sed 's#//#//gh-proxy.com/https://#' | xargs curl -LO
```

### 安装

> 注意修改<version>

```bash
sudo dpkg -i uci-linux_<version>_amd64.deb
```

### 安装验证

```bash
uci get test.config.success
#返回 yes
```

### 卸载

```bash
sudo apt remove -y uci-linux
```

## 脚本安装

> 适用于debian系Linux x86发行版；**可能**适用其他 x86 架构下的Linux发行版（未验证）
>
> ps：脚本在包里，暂未作一键链接脚本安装

### 建立包目录

```bash
mkdir -p ~/package/mosdns && cd ~/package/mosdns
```

### 获取最新 gz 包

#### 直连 github 获取

```bash
curl -s https://api.github.com/repos/caleee/uci_for_linux/releases/latest | grep -o "https://github.com/caleee/uci_for_linux/releases/download/.*/uci-linux_.*.tar.gz" | xargs curl -LO
```

#### 代理 github 链接获取（国内网络首选）

```bash
curl -s https://api.github.com/repos/caleee/uci_for_linux/releases/latest | grep -o "https://github.com/caleee/uci_for_linux/releases/download/.*/uci-linux_.*.tar.gz" | sed 's#//#//gh-proxy.com/https://#' | xargs curl -LO
```

### 安装

> 注意修改<version>

```bash
# 解压
tar -xzvf uci-linux_.<version>.tar.gz && cd uci-linux_.<version>

# 赋权
chmod +x setup.sh

# 执行 install 参数
sudo ./setup.sh install

# 更新共享库缓存
sudo ldconfig
```

### 安装验证

```bash
uci get test.config.success
#返回 yes
```

### 卸载

```bash
# 执行 remove 参数
sudo ./setup.sh remove
```

## 安装清单

### uci_install_manifest

```bash
/usr/include/uci.h
/usr/include/uci_config.h
/usr/include/uci_blob.h
/usr/include/ucimap.h
/usr/lib/libuci.so
/usr/lib/libubox.so
/usr/bin/uci
/usr/lib/uci.sh
/usr/lib/lua/5.1/uci.so
/etc/config/test
```

### 查看所有文件

```bash
cat << 'EOF' | tee uci_install_manifest
/usr/include/uci.h
/usr/include/uci_config.h
/usr/include/uci_blob.h
/usr/include/ucimap.h
/usr/lib/libuci.so
/usr/lib/libubox.so
/usr/bin/uci
/usr/lib/uci.sh
/usr/lib/lua/5.1/uci.so
/etc/config/test
EOF
sudo cat uci_install_manifest | xargs ls -l
```

---

end
