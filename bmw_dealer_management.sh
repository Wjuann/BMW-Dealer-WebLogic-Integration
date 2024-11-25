#!/bin/bash

# 检查环境变量
if [ -z "$WEBLOGIC_URL" ] || [ -z "$WEBLOGIC_USER" ] || [ -z "$WEBLOGIC_PASS" ]; then
    echo "请确保已设置WEBLOGIC_URL, WEBLOGIC_USER和WEBLOGIC_PASS环境变量。"
    exit 1
fi

# 获取WebLogic服务器信息
# 使用WLST (WebLogic Scripting Tool) 进行管理
echo "正在获取WebLogic服务器信息..."
wlst.sh -connect "$WEBLOGIC_USER:$WEBLOGIC_PASS@$WEBLOGIC_URL" -c 'printDomainInfo(); disconnect()'

# 启动WebLogic域
startWebLogic() {
    echo "启动WebLogic域mydomain的AdminServer..."
    nohup ./startWebLogic.sh -username "$WEBLOGIC_USER" -password "$WEBLOGIC_PASS" -domainName wiki.ali.bmwcn.cloud -serverName AdminServer &
}

# 停止WebLogic域
stopWebLogic() {
    echo "停止WebLogic域mydomain的AdminServer..."
    ./stopWebLogic.sh -username "$WEBLOGIC_USER" -password "$WEBLOGIC_PASS" -domainName wiki.ali.bmwcn.cloud -serverName AdminServer
}

# 根据需要调用上述函数
startWebLogic
# stopWebLogic

# 示例：其他管理任务，例如检查服务器状态
checkServerStatus() {
    echo "检查服务器状态..."
    ./checkServerStatus.sh -username "$WEBLOGIC_USER" -password "$WEBLOGIC_PASS" -url "$WEBLOGIC_URL" -serverName AdminServer
}

checkServerStatus
