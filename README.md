# 运行该程序

在 HBuilder X 中打开 luckin-coffee 文件夹，使用工具 Navicat for MySQL 导入 luckin.sql,在 sever 文件夹下的 dome 选择打开终端，输入 npm start 运行后台数据库。

# luckin-coffee

基于 uniapp 和 vue2 实现的瑞幸咖啡小程序，使用 HBuilder X 编辑器进行开发，用 MySQL 写接口，在设备 iPhone 6/7/8 中进行展示，实现了登录，购物车，商品分类等功能

## 首页

![image](https://github.com/chengdaosen/luckin-coffee/blob/main/reademe-image/Snipaste_2023-07-12_22-18-38.png)

## 订单

点击不同商品进入该商品详情页，并可以·实现商品分类效果
![image](https://github.com/chengdaosen/luckin-coffee/blob/main/reademe-image/Snipaste_2023-07-12_22-41-48.png)

## 详情页

点击加入购物车，未登录则不可以加入

![image](https://github.com/chengdaosen/luckin-coffee/blob/main/reademe-image/Snipaste_2023-07-12_22-43-24.png)

## 登录界面

没有账号可以注册，账号密码必须正确且必须同意协议，否则无法登录，不同账号显示不同用户名以及头像

![image](https://github.com/chengdaosen/luckin-coffee/blob/main/reademe-image/Snipaste_2023-07-12_23-13-08.png)
![image](https://github.com/chengdaosen/luckin-coffee/blob/main/reademe-image/Snipaste_2023-07-12_23-15-27.png)
![image](https://github.com/chengdaosen/luckin-coffee/blob/main/reademe-image/Snipaste_2023-07-12_23-19-01.png)

## 注册

如果账号已经存在 login 表中则显示已经注册，需要重新注册

## 购物车

商品为空显示去购买

![image](https://github.com/chengdaosen/luckin-coffee/blob/main/reademe-image/Snipaste_2023-07-12_23-20-05.png)
自动计算总价，全选以及反选功能

![image](https://github.com/chengdaosen/luckin-coffee/blob/main/reademe-image/Snipaste_2023-07-12_23-21-20.png)

## MySQL 数据表

![image](https://github.com/chengdaosen/luckin-coffee/blob/main/reademe-image/Snipaste_2023-07-12_23-23-43.png)
