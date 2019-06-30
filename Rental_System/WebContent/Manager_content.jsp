<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="java.util.*"
	import="jdbcfunction.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	ResultSet rs = new select_table().read_manager();
	JDBCConnection jc = new JDBCConnection();
	Connection conn = jc.getConn();
	String code = request.getParameter("username");
	//out.print(" code="+code);
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	//out.print(" name="+name);
	//	int age=0;Byte gender=0;
	String phone_num = request.getParameter("phone_num");
	String gender = "0";
	try {
		//	int age=Integer.parseInt(request.getParameter("age"));
		String age = request.getParameter("age");
		//out.print(" age="+age);
		//	Byte gender=Byte.parseByte(request.getParameter("gender"));
		gender = request.getParameter("gender");
		//out.print(" gender="+gender);
	} catch (Exception e) {
		e.printStackTrace();
	}
	String address = request.getParameter("address");
	//out.print("address="+address);
	String carcode = request.getParameter("carcode");
	//String carmodel =request.getParameter("carmodel");
	String ownercode = request.getParameter("ownercode");
	String note = request.getParameter("note");
	String model = request.getParameter("model");
	String rent = request.getParameter("rent");
	String manager = request.getParameter("manager");
	String owner = request.getParameter("owner");
	String age = request.getParameter("age");
	carcode = request.getParameter("carcode");
	String rentercode = request.getParameter("rentercode");

	//out.print(carcode);
	//out.print(model);
	//out.print(ownercode);
	//out.print(rentercode);
%>

<script type="text/javascript">
	function delete_car() {
<%try {
				//carcode = request.getParameter("carcode");
				java.sql.CallableStatement ctmt = conn.prepareCall("{call proc_CarDelete(?)}");
				ctmt.setString(1, carcode);
				ctmt.executeQuery();
				ctmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}%>
	}
</script>
<script type="text/javascript">
	function insertcar() {
		alert("hello");
<%int a = 4;
			/* try{
				a=Integer.parseInt(request.getParameter("value"));
			}catch(Exception e){
				e.printStackTrace();
			} */
			if (a == 4) {
				try {%>
	alert(
<%=carcode%>
	);
<%/* carcode = "0";
					model ="0";
					code = "0";
					ownercode = "0"; */%>
	alert("insert");
<%java.sql.CallableStatement cstmt = conn.prepareCall("{call proc_CarInsert(?,?,?,?)}");
					cstmt.setString(1, carcode);
					cstmt.setString(2, model);
					cstmt.setString(3, code);
					cstmt.setString(4, ownercode);
					cstmt.executeQuery();
					cstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}%>
	}
</script>
<script type="text/javascript">
	function update_car() {
		//	alert("hello");
<%try {
				/* java.sql.CallableStatement cstmt = conn.prepareCall("{call proc_CarUpdate(?,?,?,?)}");
				cstmt.setString(1, model);
				cstmt.setString(2, ownercode);
				cstmt.setString(3, note);
				cstmt.setString(4, carcode); */
				String sql = "update Car set Model='" + model + "',Owner_Code='" + ownercode + "',note='" + note
						+ "' where Car_code='" + carcode + "';";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.executeUpdate();
				pstmt.close();
				/* cstmt.executeQuery();
				cstmt.close(); */
			} catch (Exception e) {
				e.printStackTrace();
			}%>
	alert("修改成功");
	}
</script>
<script type="text/javascript">
	function modify_Message() {
<%try {
				String sql = "update manager set Password='" + password + "',Name='" + name + "',Phone_num=" + phone_num
						+ ",Gender=b'" + gender + "',Address='" + address + "'  where Manager_Code='" + code + "';";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.executeUpdate();
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}%>
	alert("修改成功");
	}
</script>
<script type="text/javascript">
	function modify_Message2() {
<%
		try{
		
		String sql="update renter set Password='"+password+"',Name='"+name+"',Age="
		+age+",Gender=b'"+gender+"',Address='"+address+"'  where Renter_Code='"+rentercode+"';";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		/* pstmt.setString(1,password);
		pstmt.setString(2,name);
		pstmt.setInt(3,age);
		pstmt.setByte(4,gender);
		pstmt.setString(5,address);
		pstmt.setString(6,code); */
		pstmt.executeUpdate();
		pstmt.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
	%>
	alert("修改成功");
	}
</script>
<script type="text/javascript">
	function modify_Message3() {
<%try {
				String sql = "update owner set Password='" + password + "',Name='" + name + "',Phone_num=" + phone_num
						+ ",Gender=b'" + gender + "',Address='" + address + "'  where Owner_Code='" + ownercode + "';";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.executeUpdate();
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}%>
	alert("修改成功");
	}
</script>

</head>
<body>

	<%
		int selectvalue = 1;
		try {
			selectvalue = Integer.parseInt(request.getParameter("value"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (selectvalue == 1) {//通过rs.getXXX()获取所需信息
			out.print("<table><tr><td align=center>&nbsp;&nbsp;<table width=300 border=0 align=right  valign=top >");
			out.print("<tr><td colspan=2></td></tr>");
			while (rs.next()) {
				if (rs.getString(1).equals(code)) {
					out.print("<tr><td align=right><font size=5 >账号:</font></td><td  align = center ><font size=5 >" + rs.getString(1) + "</font></td></tr>");
					out.print("<tr><td align=right><font size=5 >姓名:</font></td><td  align = center ><font size=5 >" + rs.getString("Name") + "</font></td></tr>");
					out.print("<tr><td align=right><font size=5 >电话:</font></td><td align = center ><font size=5 >" + rs.getString(5) + "</font></td></tr>");
					if(rs.getByte("Gender")==1){
						out.print("<tr><td align=right><font size=5 >性别:</font></td><td  align = center ><font size=5 >男</font></td></tr>");
					}else{
						out.print("<tr><td align=right><font size=5 >性别:</font></td><td  align = center ><font size=5 >女</font></td></tr>");
					}
					out.print("<tr><td align=right><font size=5 >地址:</font></td><td  align = center ><font size=5 >" + rs.getString("Address") + "</font></td></tr>");
					out.print("<tr><td align=right><font size=5 >密码:</font></td><td  align = center ><font size=5 >" + rs.getString("Password") + "</font></td></tr>");
				}
			}
			out.print("</table></td><td align=center>&nbsp;<img src=picture/avatar.jpg width=250 height=250 /></td></tr></table>");
		} else if (selectvalue == 3) {
			rs = new select_table().read_car();
			out.print("<h2>车辆表</h2>");
			out.print("<table border=2 align=center >");
			out.print(
					"<tr><td>车辆编号</td><td>车型</td><td>车辆租赁状态（0/1）</td><td>管理员编号</td><td>车主编号</td><td>异常描述</td></tr>");
			while (rs.next()) {
				carcode = rs.getString(1);
				model = rs.getString(2);
				rent = rs.getString(3);
				manager = rs.getString(4);
				owner = rs.getString(5);
				note = rs.getString(6);
				if (manager.equals(code)) {
					out.print("<tr><td>" + carcode + "</td>");
					out.print("<td>" + model + "</td>");
					out.print("<td align = center >" + rent + "</td>");
					out.print("<td>" + manager + "</td>");
					out.print("<td>" + owner + "</td>");
					out.print("<td>" + note + "</td></tr>");
				}
			}
			out.print("</table>");
		} else if (selectvalue == 2) {
	%>
	<form id="modify" method="post"
		action="Manager_index.jsp?username=<%=code%>">
		<h1 align="center">请修改您的信息</h1>
		<%
		while (rs.next()) {
			if (rs.getString(1).equals(code)) {		
		%>
		<table width="300" border="2" align="center">
			<tr>
				<%out.print("<tr><td  align = center >原密码：</td><td  align = center >" + rs.getString("Password") + "</td></tr>");%>
			</tr>
			<tr>
				<th width="100" scope="row">新密码：</th>
				<td width="101"><input id="t1" type="text" name="password" /></td>
			</tr>
			<tr>
				<%out.print("<tr><td  align = center >原名称：</td><td  align = center >" + rs.getString("Name") + "</td></tr>");%>
			</tr>
			<tr>
				<th scope="row">新名称：</th>
				<td><input id="t2" type="text" name="name" /></td>
			</tr>
			<tr>
				<%out.print("<tr><td  align = center >原电话：</td><td align = center >" + rs.getString(5) + "</td></tr>");%>
			</tr>
			<tr>
				<th scope="row">新电话：</th>
				<td><input id="t3" type="text" name="phone_num" /></td>
			</tr>
			<tr>
				<%out.print("<tr><td  align = center >原性别：</td><td  align = center >" + rs.getByte("Gender") + "</td></tr>");%>
			</tr>
			<tr>
				<th scope="row">新性别：</th>
				<td><input id="t4" type="text" name="gender" /></td>
			</tr>
			<tr>
				<%out.print("<tr><td  align = center >原地址：</td><td  align = center >" + rs.getString("Address") + "</td></tr>");%>
			</tr>
			<tr>
				<th scope="row">新地址:</th>
				<td><input id="t5" type="text" name="address" /></td>
			</tr>
			<tr>
				<th colspan="2" scope="row"><input type="submit"
					style="background-color: #ababab; width: 76px; height: 36px; color: #FFFFFF"
					value="提交" onclick="modify_Message()" /></th>
			</tr>
		</table>
	</form>
	<%
			}
		}
		} else if (selectvalue == 4) {
	%>
	<form id="insetcar" method="post"
		action="Manager_index.jsp?username=<%=code%>&value=4">
		<h1 align="center">请输入车辆信息</h1>
		<table width="300" border="2" align="center">
			<tr>
				<th width="100" scope="row">车辆编号：</th>
				<td width="101"><input id="t6" type="text" name="carcode" /></td>
			</tr>
			<tr>
				<th scope="row">车型：</th>
				<td><input id="t7" type="text" name="model" /></td>
			</tr>
			<tr>
				<th scope="row">车主号码：</th>
				<td><input id="t8" type="text" name="ownercode" /></td>
			</tr>
			<tr>
				<th scope="row">备注：</th>
				<td><input id="t9" type="text" name="note" /></td>
			</tr>
			<tr>
				<th colspan="2" scope="row"><input id='s1' type="submit"
					value="提交" /></th>
			</tr>
		</table>
	</form>
	<%
		try {
				java.sql.CallableStatement cstmt = conn.prepareCall("{call proc_CarInsert(?,?,?,?)}");
				cstmt.setString(1, carcode);
	%>
	<%
				cstmt.setString(2, model);
				cstmt.setString(3, code);
				cstmt.setString(4, ownercode);
				cstmt.executeQuery();
				cstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
	%>


	<%
		} else if (selectvalue == 5) {
	%>
	<form id="modify" method="post"
		action="Manager_index.jsp?username=<%=code%>&value=5">
		<h1 align="center">请输入所要更改的车辆信息</h1>
		<table width="400" border="2" align="center">
			<tr>
				<th width="150" scope="row">所要更改的车辆编号：</th>
				<td width="101"><input id="t10" type="text" name="carcode" /></td>
			</tr>
			<tr>
				<th scope="row">更改后的车型：</th>
				<td><input id="t11" type="text" name="model" /></td>
			</tr>
			<tr>
				<th scope="row">更改后的车主号码：</th>
				<td><input id="t12" type="text" name="ownercode" /></td>
			</tr>
			<tr>
				<th scope="row">更改后的备注：</th>
				<td><input id="t13" type="text" name="note" /></td>
			</tr>
			<tr>
				<th colspan="2" scope="row"><input type="submit" value="提交" /></th>
			</tr>
		</table>
	</form>
	<%
		try {
				/* java.sql.CallableStatement cstmt = conn.prepareCall("{call proc_CarUpdate(?,?,?,?)}");
				cstmt.setString(1, model);
				cstmt.setString(2, ownercode);
				cstmt.setString(3, note);
				cstmt.setString(4, carcode); */
				String sql = "update Car set Model='" + model + "',Owner_Code='" + ownercode + "',note='" + note
						+ "' where Car_code='" + carcode + "';";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.executeUpdate();
				pstmt.close();
				/* cstmt.executeQuery();
				cstmt.close(); */
			} catch (Exception e) {
				e.printStackTrace();
			}
	%>
	<%
		} else if (selectvalue == 6) {
	%>
	<form id="modify" method="post"
		action="Manager_index.jsp?username=<%=code%>&value=6">
		<h1 align="center">请输入所要删除的的车辆编号</h1>
		<table width="300" border="2" align="center">
			<tr>
				<th width="100" scope="row">车辆编号：</th>
				<td width="101"><input id="t1" type="text" name="carcode" /></td>
			</tr>
			<tr>
				<th colspan="2" scope="row"><input id='s2' type="submit"
					value="提交" onclick="delete_car()" /></th>
			</tr>
		</table>
	</form>
	<%
		try {
				//carcode = request.getParameter("carcode");
				java.sql.CallableStatement ctmt = conn.prepareCall("{call proc_CarDelete(?)}");
				ctmt.setString(1, carcode);
				ctmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
	%>
	<%
		} else if (selectvalue == 7) {
			rs = new select_table().read_renter();
			out.print("<h2>租用者信息表</h2>");
			out.print("<table border=2 align=center width=500>");
			out.print("<tr><td>租用者账号</td><td>姓名</td><td>性别</td><td>电话号码</td><td>地址</td></tr>");
			while (rs.next()) {
				carcode = rs.getString(1);
				model = rs.getString(2);
				rent = rs.getString(3);
				owner = rs.getString(5);
				note = rs.getString(6);
					out.print("<tr align=center ><td>" + carcode + "</td>");
					out.print("<td>" + model + "</td>");
					out.print("<td align = center >" + rent + "</td>");
					out.print("<td>" + owner + "</td>");
					out.print("<td>" + note + "</td></tr>");
			}
			out.print("</table>");
		} else if (selectvalue == 8) {
	%>
	<form id="addowner" method="post"
		action="Manager_index.jsp?username=<%=code%>&value=8">
		<h1 align="center">请输入新增用户信息</h1>
		<table width="300" border="2" align="center">
			<tr>
				<th width="100" scope="row">租用者编号：</th>
				<td width="101"><input id="t1" type="text" name="rentercode" /></td>
			</tr>
			<tr>
				<th scope="row">租用者姓名：</th>
				<td><input id="t2" type="text" name="name" /></td>
			</tr>
			<tr>
				<th scope="row">租用者年龄：</th>
				<td><input id="t3" type="text" name="age" /></td>
			</tr>
			<tr>
				<th scope="row">租用者性别：</th>
				<td><input id="t4" type="text" name="gender" /></td>
			</tr>
			<tr>
				<th scope="row">地址：</th>
				<td><input id="t4" type="text" name="address" /></td>
			</tr>
			<tr>
				<th scope="row">密码：</th>
				<td><input id="t4" type="text" name="password" /></td>
			</tr>
			<tr>
				<th colspan="2" scope="row"><input type="submit"
					style="background-color: #8f8fbd; width: 76px; height: 36px; color: #FFFFFF"
					value="提交" onclick="" /></th>
			</tr>
		</table>
	</form>
	<%
	out.print(rentercode+name+age+gender+address+password);
	try {
		String sql = "INSERT INTO renter (`Renter_Code`,`Name`,`Age`,`Gender`,`Address`,`Password`) "
				+"VALUES('"+rentercode+"','"+name+"',"+age+",b'"+gender+"','"+address+"','"+password+"') ;";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
		pstmt.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
	<%
		} else if (selectvalue == 9) {
	%>
	<form id="modify" method="post"
		action="Manager_index.jsp?username=<%=code%>&value=9">
		<h1 align="center">请输入要更改的租用者信息</h1>
		<table width="400" border="2" align="center">
			<tr>
				<th width="150" scope="row">要更改的租用者编号：</th>
				<td width="101"><input id="t1" type="text" name="rentercode" /></td>
			</tr>
			<tr>
				<th scope="row">要更改的租用者姓名：</th>
				<td><input id="t2" type="text" name="name" /></td>
			</tr>
			<tr>
				<th scope="row">要更改的租用者年龄：</th>
				<td><input id="t3" type="text" name="age" /></td>
			</tr>
			<tr>
				<th scope="row">要更改的租用者性别：</th>
				<td><input id="t4" type="text" name="gender" /></td>
			</tr>
			<tr>
				<th scope="row">要更改的租用者地址：</th>
				<td><input id="t4" type="text" name="address" /></td>
			</tr>
			<tr>
				<th scope="row">要更改的租用者密码：</th>
				<td><input id="t4" type="text" name="password" /></td>
			</tr>
			<tr>
				<th colspan="2" scope="row"><input type="submit" value="提交"
					style="background-color: #8f8fbd; width: 76px; height: 36px; color: #FFFFFF"
					onclick="modify_Message2()" /></th>
			</tr>
		</table>
	</form>


	<%
		} else if (selectvalue == 10) {
	%>
	<form id="modify" method="post"
		action="Manager_index.jsp?username=<%=code%>&value=10">
		<h1 align="center">请输入所要删除的租用者信息</h1>
		<table width="300" border="2" align="center">
			<tr>
				<th width="100" scope="row">所要删除的的租用者编号：</th>
				<td width="101"><input id="t1" type="text" name="rentercode" /></td>
			</tr>
			<tr>
				<th colspan="2" scope="row"><input type="submit" value="提交"
					style="background-color: #8f8fbd; width: 76px; height: 36px; color: #FFFFFF"
					onclick="delete_renter()" /></th>
			</tr>
		</table>
	</form>
	<%
		try {
				String sql="delete from renter where Renter_code='"+rentercode+"';"; 
		     	PreparedStatement pstmt=conn.prepareStatement(sql);
		    	 pstmt.executeUpdate();
		    	 pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (selectvalue == 11) {
			rs = new select_table().read_owner();
			out.print("<h2>车主信息表</h2>");
			out.print("<table border=2 align=center width=500>");
			out.print("<tr><td>车主账号</td><td>姓名</td><td>性别</td><td>电话号码</td><td>地址</td></tr>");
	while (rs.next()) {
		carcode = rs.getString(1);
		model = rs.getString(2);
		rent = rs.getString(3);
		owner = rs.getString(5);
		note = rs.getString(6);
			out.print("<tr align=center><td>" + carcode + "</td>");
			out.print("<td>" + model + "</td>");
			out.print("<td align = center >" + rent + "</td>");
			out.print("<td>" + owner + "</td>");
			out.print("<td>" + note + "</td></tr>");
			}
			out.print("</table>");
		} else if (selectvalue == 12) {
	%>
	<form id="addowner" method="post"
		action="Manager_index.jsp?username=<%=code%>&value=12">
		<h1 align="center">请输入新增车主信息</h1>
		<table width="350" border="2" align="center">
			<tr>
				<th width="100" scope="row">车主编号：</th>
				<td width="101"><input id="t1" type="text" name="ownercode" /></td>
			</tr>
			<tr>
				<th scope="row">车主姓名：</th>
				<td><input id="t2" type="text" name="name" /></td>
			</tr>
			<tr>
				<th scope="row">车主电话号码：</th>
				<td><input id="t3" type="text" name="phone_num" /></td>
			</tr>
			<tr>
				<th scope="row">车主性别：</th>
				<td><input id="t4" type="text" name="gender" /></td>
			</tr>
			<tr>
				<th scope="row">车主地址：</th>
				<td><input id="t4" type="text" name="address" /></td>
			</tr>
			<tr>
				<th scope="row">车主密码：</th>
				<td><input id="t4" type="text" name="password" /></td>
			</tr>
			<tr>
				<th colspan="2" scope="row"><input type="submit"
					style="background-color: #8f8fbd; width: 76px; height: 36px; color: #FFFFFF"
					value="提交" onclick="" /></th>
			</tr>
		</table>
	</form>
	<%
	//out.print(ownercode+name+phone_num+gender+address+password);
	try {
		String sql = "INSERT INTO owner (`Owner_Code`,`Name`,`Phone_num`,`Gender`,`Address`,`Password`) "
				+"VALUES('"+ownercode+"','"+name+"',"+phone_num+",b'"+gender+"','"+address+"','"+password+"') ;";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
		pstmt.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
	<%
		} else if (selectvalue == 13) {
	%>
	<form id="modify" method="post"
		action="Manager_index.jsp?username=<%=code%>&value=13">
		<h1 align="center">请输入要更改的车主信息</h1>
		<table width="400" border="2" align="center">
			<tr>
				<th width="150" scope="row">要更改的车主编号：</th>
				<td width="101"><input id="t1" type="text" name="ownercode" /></td>
			</tr>
			<tr>
				<th scope="row">要更改的车主姓名：</th>
				<td><input id="t2" type="text" name="name" /></td>
			</tr>
			<tr>
				<th scope="row">要更改的车主电话号码：</th>
				<td><input id="t3" type="text" name="phone_num" /></td>
			</tr>
			<tr>
				<th scope="row">要更改的车主性别：</th>
				<td><input id="t4" type="text" name="gender" /></td>
			</tr>
			<tr>
				<th scope="row">要更改的车主地址：</th>
				<td><input id="t4" type="text" name="address" /></td>
			</tr>
			<tr>
				<th scope="row">要更改的车主密码：</th>
				<td><input id="t4" type="text" name="password" /></td>
			</tr>
			<tr>
				<th colspan="2" scope="row"><input type="submit" value="提交"
					style="background-color: #8f8fbd; width: 76px; height: 36px; color: #FFFFFF"
					onclick="modify_Message3()" /></th>
			</tr>
		</table>
	</form>

	<%
		} else if (selectvalue == 14) {
	%>
	<form id="deleteowner" method="post"
		action="Manager_index.jsp?username=<%=code%>&value=14">
		<h1 align="center">请输入所要删除的车主信息</h1>
		<table width="400" border="2" align="center">
			<tr>
				<th width="150" scope="row">所要删除的的车主编号：</th>
				<td width="101"><input id="t100" type="text" name=ownercode /></td>
			</tr>
			<tr>
				<th colspan="2" scope="row"><input type="submit" value="提交"  style="background-color: #8f8fbd;width: 76px;height: 36px;color: #FFFFFF"
					onclick="delete_owner()" /></th>
			</tr>
		</table>
	</form>
	<script type="text/javascript">
		
	<%	try {
			String sql="delete from Owner where Owner_code='"+ownercode+"';"; 
		    PreparedStatement pstmt=conn.prepareStatement(sql);
		    pstmt.executeUpdate();
		    pstmt.close();
			//carcode = request.getParameter("carcode");
			/* java.sql.CallableStatement ctmt = conn.prepareCall("{call proc_OwnerDelete(?)}");
			ctmt.setString(1, ownercode);
			ctmt.executeQuery();
			ctmt.close(); */
		} catch (Exception e) {
			e.printStackTrace();
		}%>
		
	</script>
	<%
		} else if (selectvalue == 15) {
			rs = new select_table().read_bill_view();
			out.print("<br><br><h2>账单表</h2>");
			out.print("<table width=780 border=2 align=center >");
			out.print(
					"<tr><td>账单号</td><td>订单号</td><td>租用者编号</td><td>车辆编号</td><td>租用开始时间</td>"
					+"<td>租用结束时间</td><td>预计时间</td><td>实际使用时间</td><td>时间费率</td><td>超时费率</td><td>费用</td><td>异常描述</td></tr>");
			while (rs.next()) {
						out.print("<tr><td  align = center >" + rs.getString(1) + "</td>");
						out.print("<td  align = center >" + rs.getString(2) + "</td>");
						out.print("<td  align = center >" + rs.getString(10) + "</td>");
						out.print("<td  align = center >" + rs.getString(3) + "</td>");
						out.print("<td  align = center >" + rs.getString(4) + "</td>");
						out.print("<td  align = center >" + rs.getString(5) + "</td>");
						out.print("<td align = center >" + rs.getString(6) + "</td>");
						out.print("<td  align = center >" + rs.getString(7) + "</td>");
						out.print("<td  align = center >" + rs.getString(8) + "</td>");
						out.print("<td  align = center >" + rs.getString(11) + "</td>");
						out.print("<td  align = center >" + rs.getString(12) + "</td>");
						out.print("<td  align = center >" + rs.getString(9) + "</td></tr>");
			}
			out.print("</table>");
		} else if (selectvalue == 16) {
	%>
	<form id="modify" method="post"
		action="Manager_index.jsp?username=<%=code%>&value=16">
		<h1 align="center">请输入要更改的订单信息</h1>
		<table width="400" border="2" align="center">
			<tr>
				<th width="150" scope="row">要更改的订单编号：</th>
				<td width="101"><input id="t1" type="text" name="password" /></td>
			</tr>
			<tr>
				<th scope="row">要更改的订单车辆编码：</th>
				<td><input id="t2" type="text" name="name" /></td>
			</tr>
			<tr>
				<th scope="row">要更改的订单起始时间：</th>
				<td><input id="t3" type="text" name="phone_num" /></td>
			</tr>
			<tr>
				<th scope="row">要更改的车主性别：</th>
				<td><input id="t4" type="text" name="gender" /></td>
			</tr>
			<tr>
				<th scope="row">要更改的车主地址：</th>
				<td><input id="t4" type="text" name="gender" /></td>
			</tr>
			<tr>
				<th scope="row">要更改的车主密码：</th>
				<td><input id="t4" type="text" name="gender" /></td>
			</tr>
			<tr>
				<th colspan="2" scope="row"><input type="submit" value="提交"
					onclick="" /></th>
			</tr>
		</table>
	</form>


	<%
		} else if (selectvalue == 17) {
	%>
	<form id="delete_order" method="post"
		action="Manager_index.jsp?username=<%=code%>&value=17">
		<h1 align="center">请输入所要删除的订单信息</h1>
		<table width="400" border="2" align="center">
			<tr>
				<th width="150" scope="row">所要删除的的订单编号：</th>
				<td width="101"><input id="t1" type="text" name="order_code" /></td>
			</tr>
			<tr>
				<th colspan="2" scope="row"><input type="submit" value="提交"  style="background-color: #8f8fbd;width: 76px;height: 36px;color: #FFFFFF"
					onclick="" /></th>
			</tr>
		</table>
	</form>
	<%
		String ordercode=request.getParameter("order_code");
		//out.print(ordercode);
		String sql="DELETE FROM `order` WHERE `Order_Code` = "+ordercode+" ;";
		try{
			Statement stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			stmt.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		} else if (selectvalue == 100) {

		} else if (selectvalue == 118) {

		} else if (selectvalue == 119) {

		}
	%>
</body>
</html>