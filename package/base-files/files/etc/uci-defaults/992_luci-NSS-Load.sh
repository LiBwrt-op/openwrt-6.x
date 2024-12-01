#!/bin/sh

# 指定luci文件所在目录
luci_dir="/usr/share/rpcd/ucode/luci"

# 对luci文件做修改，添加NSS Load相关显示
sed -i "s#const fd = popen('top -n1 | awk \\\'/^CPU/ {printf(\"%d%\", 100 - \$8)}\\\'')#const cpuUsageCommand = access('/sbin/cpuusage') ? '/sbin/cpuusage' : \"top -n1 | awk \\'/^CPU/ {printf(\"%d%\", 100 - \$8)}\\'\"#g" $luci_dir
sed -i '/cpuUsageCommand/a \\t\t\tconst fd = popen(cpuUsageCommand);' $luci_dir

exit 0