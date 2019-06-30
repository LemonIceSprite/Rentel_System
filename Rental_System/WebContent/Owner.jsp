<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>欢迎！尊敬的车主！</title>
</head>
<style>
    *{padding: 0;margin: 0;}  /* 先重置一下html，消除HTML标签默认的内外边距 */
    .wrap{width: 800px;margin: 0 auto;}    /* 对导航的内容设置一个主体为800px的宽并使其居中 */
    .clear{clear: both;}  /* 清除浮动 */
    a{text-decoration-line: none;}   /* 去掉默认a标签的下划线 */
    ul,li{list-style: none;}
    nav .level>li{float: left;width: 16.66%;text-align: center;background: AliceBlue;padding: 10px 0;font-size: 16px;transition: .4s;}
    nav .level>li a{color: black;}
    nav .level>li:hover{background: Aquamarine;}   /* 设置鼠标滑过后的样式 */

    nav .two{display: none;margin-top: 10px;}  /* 先使二级菜单的内容隐藏 */
    nav .level>li:hover .two{display: block;}   /* 鼠标滑过一级菜单后的显示二级菜单 */
    nav .two li{padding: 5px 0;transition: .4s;cursor: pointer;}
    nav .two li:hover{background: AliceBlue;}
</style>
<body>
    <nav>
        <div class="wrap">
            <ul class="level">
                <li><a href="">首页</a></li>
                <li>
                    <a href="">个人信息</a>
                    <ul class="two">
                        <li>用户个人信息</li>
                        <li>个人信息修改</li>
                    </ul>
                </li>
                <li>
                    <a href="">车辆信息</a>
                    <ul class="two">
                        <li>车辆信息查询</li>
                        <li>新增车辆信息</li>
                        <li>更改车辆信息</li>
                        <li>删除车辆信息</li>
                        <li>车辆信息申诉</li>
                    </ul>
                </li>
                <li>
                    <a href="">账单信息</a>
                    <ul class="two">
                        <li>账单信息查询</li>
                    </ul>
                </li>
                <li>
                    <a href="">财务信息</a>
                    <ul class="two">
                        <li>个人余额查询</li>
                        <li>个人余额充值</li>
                        <li>个人余额提现</li>
                    </ul>
                </li>
                <li>
                    <a href="">综合查询</a>
                    <ul class="two">
                        <li>公司简介</li>
                        <li>公司位置</li>
                        <li>工作机会</li>
                        <li>联系我们</li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</body>
</html>
