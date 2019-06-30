<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="java.util.*" import="jdbcfunction.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	JDBCConnection jc=new JDBCConnection();
	Connection conn=jc.getConn();
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	Statement stmt=conn.createStatement();
%>
<title>注册页面</title>
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
	background:#3299cc;
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
    bgcolor:
    text-align:center; text-align-last:center;
}
</style>
<script>
	function registered()
	{
		var username=document.getElementById("username").value;
		var password=document.getElementById("password").value;
		var selectValue=document.getElementById('select').value;
		/* var temp=document.createElement("from");
		temp.action="registered.jsp";
		temp.method="post";
		temp.style.display="none";
		var opt=document.createElement("textarea");
		opt.name=k1;
		opt.value=username;
		var opt2=document.createElement("textarea");
		opt2.name=k2;
		opt2.value=password;
		temp.appendChild(opt);
		temp.appendChild(opt2);
		document.body.appendChild(temp);
		temp.submit(); */
		if(username==""||password=="")
		{alert("账号或密码不能为空！");}
		else if(selectValue=="renter")
		{
		<%
		/* String username=request.getParameter("username");
		String password=request.getParameter("password"); */
// 		Statement stmt=conn.createStatement();
 		String sql="INSERT INTO renter (Renter_Code,Password) VALUES('"+username+"','"+password+"') ;";
		try{
		stmt.executeUpdate(sql);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		%>
		alert("注册成功");
		}else if(selectValue=="owner")
		{
		<%
		String sql2="INSERT INTO owner (Owner_Code,Password) VALUES('"+username+"','"+password+"') ;";
		try{
		stmt.executeUpdate(sql2);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		%>
			alert("注册成功");
		}else if(selectValue=="manager")
		{
			<%
			String sql3="INSERT INTO manager (Manager_Code,Password) VALUES('"+username+"','"+password+"') ;";
		try{
			stmt.executeUpdate(sql3);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		%>
			alert("注册成功");
		}
		<%		stmt.close(); %>
	}
	
</script>
</head>
<body>
<br>
<br>
<h1 align="center" style="color:white">请进行用户注册</h1>
<form id="regist" method="post" action="register.jsp" >
<table width="308" height="209" border="0" align="center" bgcolor=#d9d9f3>
  <tr>
    <td width="68" height="59" align="center">用户名</td>
    <td width="114"><input id="username" type="text" name="username"></td>
  </tr>
  <tr>
    <td height="57" align="center" valign="middle">密码</td>
    <td><input type="password" id="password" name="password"></td>
  </tr>
  <tr>
    <td height="81" colspan="2"><table width="310" border="0">
      <tr>
        <td height="36" colspan="2" align="center">身份选择：
          <label for="select"></label>
          <select id="select" name="select" size="1" id="select"  >
            <option  value="renter">租用者</option>
            <option  value="owner">车主</option>
            <option value="manager">车辆管理员</option>
          </select></td>
        </tr>
      <tr>
        <td width="151" height="35" align="center"><input type="reset" value="重置" style="background-color: #007fff;width: 76px;height: 36px;color: #FFFFFF" /></td>
        <td width="149" align="center"><input type="submit"  value="注册" style="background-color: #007fff;width: 76px;height: 36px;color: #FFFFFF" onclick="registered()" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
<script>
function test()
{
	alert("hello");
}
	function login()
	{
	
		document.getElementById("test").value="hello";
		
	}	
</script>
<!-- <input type="button" id="b2" value="测试" onclick="registered()">
<input type="text" id="test" value=""> -->
</body>
</html>