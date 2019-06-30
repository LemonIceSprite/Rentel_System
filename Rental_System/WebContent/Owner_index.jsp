<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="java.util.*" import="jdbcfunction.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>欢迎！尊敬的车主！</title>
</head>
<style type="text/css">
input {
	border: 1px solid #ccc;
	padding: 7px 0px;
	border-radius: 3px;
	padding-left: 5px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow
		ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out
		.15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s
}

input:focus {
	border-color: #66afe9;
	outline: 0;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgba(102, 175, 233, .6);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgba(102, 175, 233, .6)
}

body {
	background: #3299cc;
}

select {
	width: auto;
	padding: 0 2%;
	margin: 0;
	background: transparent;
	font-size: 16px;
	border: 1px solid #ccc;
	height: 34px;
	-webkit-appearance: none;
	bgcolor: text-align:center;
	text-align-last: center;
}
table {
				background: #FFFFF;
				margin: 10px auto;
				border-collapse: collapse;/*border-collapse:collapse合并内外边距(去除表格单元格默认的2个像素内外边距*/	
			}
</style>
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
<% //获取登陆的账号和密码信息
	String code=request.getParameter("username");
	String password=request.getParameter("password");
	//out.print("用户账号为"+code);
	//out.print("密码为"+password);
%>

<%
ResultSet rs=new select_table().read_car();
%>
<body>
<div align="center">
<table width="800" border="0" align="center" bgcolor=#ffffff>
  <tr>
    <td height="10"  valign="top">  <nav>
        <div class="wrap" style="position:absolute">
            <ul class="level">
                <li><a href="">首页</a></li>
                <li>
                    <a href="">个人信息</a>
                    <ul class="two">
                        <li><a href="Owner_index.jsp?value=1&username=<%=code %>">用户个人信息</a></li>
                        <li><a href="Owner_index.jsp?value=2&username=<%=code %>">个人信息修改</a></li>
                    </ul>
                </li>
                <li>
                    <a href="">车辆信息</a>
                    <ul class="two">
                        <li><a href="Owner_index.jsp?value=3&username=<%=code %>">车辆信息查询</a></li>
                        <li><a href="Owner_index.jsp?value=9&username=<%=code %>">新增车辆信息</a></li>
                        <li><a href="Owner_index.jsp?value=10&username=<%=code %>">更改车辆信息</a></li>
                        <li><a href="Owner_index.jsp?value=11&username=<%=code %>">删除车辆信息</a></li>
                        <li><a href="Owner_index.jsp?value=12&username=<%=code %>">车辆信息申诉</a></li>
                    </ul>
                </li>
                <li>
                    <a href="">账单信息</a>
                    <ul class="two">
                        <li><a href="Owner_index.jsp?value=6&username=<%=code %>">账单信息查询</a></li>
                    </ul>
                </li>
                <li>
                    <a href="">财务信息</a>
                    <ul class="two">
                        <li><a href="Owner_index.jsp?value=7&username=<%=code %>">个人余额查询</a></li>
                        <li><a href="Owner_index.jsp?value=8&username=<%=code %>">个人余额充值</a></li>
                        <li><a href="Owner_index.jsp?value=13&username=<%=code %>">个人余额提现</a></li>
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
    </nav></td>
  </tr>
  <tr>
    <td height="544" align="center"><jsp:include flush="true" page="Owner_content.jsp"></jsp:include>
</td>
  </tr>
</table>
</div>
</body>
</html>