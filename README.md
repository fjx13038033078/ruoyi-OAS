
# OAS（OA system的缩写）

## 内置功能

1.  用户管理：用户是系统操作者，该功能主要完成系统用户配置。
2.  部门管理：配置系统组织机构（公司、部门、小组），树结构展现支持数据权限。
3.  岗位管理：配置系统用户所属担任职务。
4.  菜单管理：配置系统菜单，操作权限，按钮权限标识等。
5.  角色管理：角色菜单权限分配、设置角色按机构进行数据范围权限划分。
6.  字典管理：对系统中经常使用的一些较为固定的数据进行维护。
7.  参数管理：对系统动态配置常用参数。
8.  通知公告：系统通知公告信息发布维护。

## 部署与启动
1. npm install前需要换源，执行npm config set registry https://registry.npmmirror.com
2. 前端首次启动进入ruoyi-ui目录后，执行npm install即可
3. 如果node版本高于16，在idea终端打开进入ruoyi-ui目录后，执行 $env:NODE_OPTIONS="--openssl-legacy-provider" 后再执行npm run dev
4. 如果在用DBeaver执行数据库脚本时报错，则添加额外的命令参数 --default-character-set=utf8mb4
5. 安装echarts执行 npm install echarts -save

## 联系
1. 需要调试或者部署/需要二次开发/需要需求定制请+v:445981543


