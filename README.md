# BMW-Dealer-WebLogic-Integration
这是一个用于管理华晨宝马经销商后台系统的WebLogic集成示例。

## 项目背景
华晨宝马汽车有限公司，作为宝马集团在中国的合作伙伴，使用WebLogic服务器来托管其关键的经销商管理系统。本项目旨在提供一个安全的接口，用于监控和维护这些服务器的稳定运行。

## 安装与配置
1. 确保你已安装`curl`和`jq`（如果需要与WebLogic API交互）。
2. 在你的本地环境或服务器上设置环境变量，存储WebLogic管理员凭据：
   ```sh
   export WEBLOGIC_URL=https://wiki.ali.bmwcn.cloud/
   export WEBLOGIC_USER=weblogic
   export WEBLOGIC_PASS=Oracle@123

## 使用
运行`bmw_dealer_management.sh`脚本，它将与宝马经销商系统的WebLogic实例交互。

```sh
./bmw_dealer_management.sh
