<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="java.util.*" import="jdbcfunction.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- <script src="change.js" type="text/javascript">
</script>  -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
input{
                border: 1px solid #ccc;
                padding: 7px 0px;
                border-radius: 3px;
                padding-left:5px;
                -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
                box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
                -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
                -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
                transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s
            }
            input:focus{
                    border-color: #66afe9;
                    outline: 0;
                    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
                    box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)
            }
body {
	 background-image: url(picture/bg.gif) ;
	 background-size:cover;
	}
select {   
	width: auto;
	padding: 0 2%;
	margin: 0;
    background: transparent;   
    font-size: 16px;   
    font-color:#ffffff;
    border: 1px solid #ccc;   
    height: 34px;   
    -webkit-appearance: none; 
    bgcolor:;
    text-align:center; text-align-last:center;
}
</style>
<title>电动汽车租用送达系统</title>
<%	
	//连接数据库
	JDBCConnection jc=new JDBCConnection();
	Connection b=jc.getConn();
//	if(b!=null)
	out.print("<br>");//成功连接数据库
	ResultSet rs=new select_table().read_renter();
%>
<%-- <% 	//获取账户和密码信息
	while(rs.next()){
		String username=rs.getString("Renter_code");
		String password=rs.getString("Password");
		out.print(username+password+"<br>");
	}
%> --%>
<script type="text/javascript">
	//实现表单form的action变换
	function changeAction(){
	//document.getElementById("test").value="hello";
	var selectValue=document.getElementById('select').value;
	document.forms[0].action=selectValue;
//	document.getElementById("test").value="success";
	
	}
</script>

<%--  <script type="text/javascript">
	//检查账户和密码的正确性
	<% String a="11111111" ;%>
	function checkPassword(){
		var password=document.getElementById("password").value;
		if(password==<%=a%>){
		return true;//返回true提交表单
		}else{
		return false;//返回false阻止提交表单
		}
	}
</script>  --%>
<script>
	//检查账户和密码的正确性
	function checkPassword(){
		var username=document.getElementById("username").value;
		var password=document.getElementById("password").value;
		var selectValue=document.getElementById('select').value;
		//return false;
		//alert("?");
		if(selectValue=="Renter_index.jsp")
		{
	<%	//获取账户和密码信息
		 rs=new select_table().read_renter();
		while(rs.next()){
		String username=rs.getString("Renter_Code");
		String password=rs.getString("Password");
		%>
			if((username==<%=username%>)&&(password==<%=password%>))
				return true;
		<%
			}
		%>
		}else if(selectValue=="Owner_index.jsp")
		{
		<%	//获取账户和密码信息
		 rs=new select_table().read_owner();
		while(rs.next()){
			String username=rs.getString("Owner_Code");
			String password=rs.getString("Password");
		%>
			if((username==<%=username%>)&&(password==<%=password%>))
			return true;
		<%
			}
		%>
		}else if(selectValue=="Manager_index.jsp")
		{
		<%	//获取账户和密码信息
			 rs=new select_table().read_manager();
		while(rs.next()){
			String username=rs.getString("Manager_Code");
			String password=rs.getString("Password");
		%>
			if((username==<%=username%>)&&(password==<%=password%>))
			return true;
		<%
			}
		%>
		}
		alert("账号或密码错误");
		return false;
	}
</script>
</head>
<body>
<form id="login" action="Renter_index.jsp" method="get"  onsubmit="return checkPassword()">
<table width="345" height="209" border="0" align="center"  bgcolor="#0066FF">
  <tr>
    <td align="center" bgcolor="#0066FF">
    <p><font color=white size=4>欢迎登陆电动汽车租用送达系统</font></p>
    <hr /></td>
  </tr>
  <tr height=100>
    <td  height=270><img src="picture/cup.jpg" width=100% height=100% />
 </td>
  </tr>
  <tr>
    <td><table width="313" border="0">
      <tr>
        <td width="82" align="center"><font color=white size=4>用户名</font></td>
        <td width="175"><input id="username" type="text" name="username"></td>
      </tr>
      <tr>
        <td align="center"><font color=white size=4>密码</font></td>
        <td><input id="password" type="password" name="password" ></td>
      </tr>
      <tr>
        <td colspan="2" align="center"><label for="select"></label>
          <select name="select" size="1" id="select" onchange="changeAction();" >
            <option id="1" value="Renter_index.jsp">租用者</option>
            <option id="2" value="Owner_index.jsp">车主</option>
            <option id="3" value="Manager_index.jsp">车辆管理员</option>
          </select></td>
        </tr>
      <tr>
        <td colspan="2"><table width="281" border="0" align="center">
          <tr>
      <td width="100" align="center">&nbsp;&nbsp;<input type="reset" value="重置" style="background-color: #007fff;width: 76px;height: 36px;color: #FFFFFF"/></td>
      <td width="100" align="center">&nbsp;&nbsp;<input type="submit" value="登录" style="background-color: #007fff;width: 76px;height: 36px;color: #FFFFFF"/></td>
      <td width="100" align="center">&nbsp;&nbsp;<input type="button" style="background-color: #007fff;width: 76px;height: 36px;color: #FFFFFF"  value="注册" onclick="javascript:window.location.href='register.jsp' "/></td>
    </tr>
</table></td>
        </tr>
    </table></td>
  </tr>
  <tr>

    <td align="center" bgcolor="#0066FF"><hr />
      <p>
  <p>
  <font color=white size=4>  中国石油大学（北京）</font></td>
  </tr>
</table>
</form>
<script>
	function login()
	{
		var v = document.getElementById("select").value;
		if(v=="Renter_index.jsp")
			document.getElementById("test").value="hello";
		else
			document.getElementById("test").value="erro!";
		out.print("success!!!");
		out.print(v);
		
	}	
</script>
<!-- <input type="button" id="b2" value="测试" onclick="login()">
<input type="text" id="test" value="">
 -->
</body>
</html>