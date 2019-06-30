<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="java.util.*" import="jdbcfunction.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>test.html</title>
<script>
	document.write("hello");
</script> 
<script type="text/javascript">
	//实现表单form的action变换
	function changeAction(){
	var selectValue=document.getElementById('select').value;
	document.forms[0].action=selectValue;
	}
	//检查账户和密码的正确性
	function checkPassword(){
		var username=douument.getElementById("username").value;
		var password=document.getElementById("password").value;
		<%	//获取账户和密码信息
		ResultSet rs=new select_table().read_renter();
		while(rs.next()){
			String un=rs.getString("Renter_code");
			String ps=rs.getString("Password");
	%>
			var v1=<%=un%>;
			var v2=<%=ps%>;
			if(v1==username&&v2==password){
				return true;//返回true提交表单
			}else{
				return false;//返回false阻止提交表单
			}
				
	<%
			out.print(un+ps+"<br>");}
	%>
	}
</script>


<script type="text/javascript">
function changeAction(){
//默认是login.action，当select改变时同时改变from的action属性
//我这里直接把列表的value赋值到form的action，你可以根据需要改改
var selectValue=document.getElementById('select').value;
document.forms[0].action=selectValue;
}
</script>
</head>
<body>
<form action="Manager_index.jsp" method="post">
<select id="select" onchange="changeAction();">
<option value="Manager_index.jsp" selected>login</option>
<option value="Owner_index.jsp">search</option>
<option value="Renter_index.jsp">index</option>
</select>
<input type="submit" value="提交"/>
</form>
<div id="Accordion1" class="Accordion" tabindex="0">
    <div class="AccordionPanel">
      <div class="AccordionPanelTab">标签 1</div>
      <div class="AccordionPanelContent">内容 1</div>
    </div>
    <div class="AccordionPanel">
      <div class="AccordionPanelTab">标签 2</div>
      <div class="AccordionPanelContent">内容 2</div>
    </div>
  </div>
</body>
</html>

