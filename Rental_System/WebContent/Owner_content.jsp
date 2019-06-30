<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="java.util.*"
	import="jdbcfunction.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录页面</title>
</head>
<%
	ResultSet rs = new select_table().read_owner();
	JDBCConnection jc = new JDBCConnection();
	Connection conn = jc.getConn();
	Statement stmt = conn.createStatement();
	String code = request.getParameter("username");
	//out.print(" code=" + code);
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	//out.print(" name=" + name);
	//	int age=0;Byte gender=0;
	String phone_num = "0";
	String gender = "0";
	try {
		//	int age=Integer.parseInt(request.getParameter("age"));
		phone_num = request.getParameter("phone_num");
	//	out.print(" age=" + phone_num);
		//	Byte gender=Byte.parseByte(request.getParameter("gender"));
		gender = request.getParameter("gender");
	//	out.print(" gender=" + gender);
	} catch (Exception e) {
		e.printStackTrace();
	}
	String address = request.getParameter("address");
	//out.print("address=" + address);
	String carcode = request.getParameter("carcode");
	String ownercode = request.getParameter("ownercode");
	String note = request.getParameter("note");
	String model = request.getParameter("model");
	String managercode = request.getParameter("managercode");
	String rent = request.getParameter("rent");
	String manager = request.getParameter("manager");
	String owner = request.getParameter("owner");
	String rentercode = request.getParameter("rentercode");
%>
<script type="text/javascript">
	function modify_Message() {
		
<%try {

				String sql = "update owner set Password='" + password + "',Name='" + name + "',Phone_num=" + phone_num
						+ ",Gender=b'" + gender + "',Address='" + address + "'  where Owner_Code='" + code + "';";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.executeUpdate();
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}%>
			alert("修改成功");
	}
</script>
<script>
function feedback()
{
	<%
	String carcode2=request.getParameter("carcode");
	String note2=request.getParameter("note");
	new update_table().update_carnote(carcode2, note2);
	%>	
	alert("反馈成功");
}
</script>
<body>
	<%-- <% String code=request.getParameter("username");
	String password=request.getParameter("password");
	out.print("用户账号为"+code);
	out.print("密码为"+password);%>
 <%
 ResultSet rs=new select_table().read_car();
	out.print("<table border=2 align=center >") ;
	out.print("<tr><td>车辆编号</td><td>车型</td><td>车辆租赁状态（0/1）</td><td>管理员编号</td><td>异常描述</td></tr>");
	while(rs.next()){
		String car_code=rs.getString("Car_Code");
		String model=rs.getString("Model");
		String rent=rs.getString("Rent");
		String manager=rs.getString("Manager_Code");
		String note=rs.getString("note");
		out.print("<tr><td>"+car_code+"</td>");
	    out.print("<td>"+model+"</td>");
	    out.print("<td align = center >"+rent+"</td>"); 
	    out.print("<td>"+manager+"</td>");
	    out.print("<td>"+note+"</td></tr>");
		
		
	}
    out.print("</table>") ;
%>
 --%>
	<%
		int selectvalue = 1;
		try {
			selectvalue = Integer.parseInt(request.getParameter("value"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (selectvalue == 1) {
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
			out.print("<table width=470 border=2 align=center >");
			out.print("<tr><td>车辆编号</td><td>车型</td><td>车辆租赁状态（0/1）</td><td>管理员编号</td><td>异常描述</td></tr>");
			while (rs.next()) {
				String car_code = rs.getString(1);
				model = rs.getString(2);
				rent = rs.getString(3);
				manager = rs.getString(4);
				owner = rs.getString(5);
				note = rs.getString(6);
				if (owner.equals(code)) {
					out.print("<tr><td>" + car_code + "</td>");
					out.print("<td>" + model + "</td>");
					out.print("<td align = center >" + rent + "</td>");
					out.print("<td>" + manager + "</td>");
					//  out.print("<td>"+owner+"</td>");
					out.print("<td>" + note + "</td></tr>");
				}
			}
			out.print("</table>");
		} else if (selectvalue == 2) {
	%>
	<form id="modify" method="post"
		action="Owner_index.jsp?username=<%=code%>">
		<h1 align="center">请修改您的信息</h1>
		<%
		while (rs.next()) {
			if (rs.getString(1).equals(code)) {		
		%>
		<table width="300" border="2" align="center">
			<tr>
				<%out.print("<tr><td  align = center >原密码：</td><td  align = center >" + rs.getString("Password") + "</td></tr>");%>
				<th width="100" scope="row">新密码：</th>
				<td width="101"><input id="t1" type="text" name="password" /></td>
			</tr>
			<tr>
				<%out.print("<tr><td  align = center >原名称：</td><td  align = center >" + rs.getString("Name") + "</td></tr>");%>
				<th scope="row">新名称：</th>
				<td><input id="t2" type="text" name="name" /></td>
			</tr>
			<tr>
				<%out.print("<tr><td  align = center >原电话：</td><td align = center >" + rs.getString(5) + "</td></tr>");%>
				<th scope="row">新电话：</th>
				<td><input id="t3" type="text" name="phone_num" /></td>
			</tr>
			<tr>
				<%out.print("<tr><td  align = center >原性别：</td><td  align = center >" + rs.getByte("Gender") + "</td></tr>");%>
				<th scope="row">新性别：</th>
				<td><input id="t4" type="text" name="gender" /></td>
			</tr>
			<tr>
				<%out.print("<tr><td  align = center >原地址：</td><td  align = center >" + rs.getString("Address") + "</td></tr>");%>
				<th scope="row">新地址:</th>
				<td><input id="t5" type="text" name="address" /></td>
			</tr>
			<tr>
				<th colspan="2" scope="row"><input type="submit" style="background-color: #ababab;width: 76px;height: 36px;color: #FFFFFF" value="提交"
					onclick="modify_Message()" /></th>
			</tr>
		</table>
	</form>
	<%
			}
		}
		} else if (selectvalue == 4) {
	%>
	<%
		rs = new select_table().read_car();
			out.print("<table border=2 align=center >");
			out.print("<tr><td>车辆编号</td><td>车型</td><td>车辆租赁状态（0/1）</td><td>管理员编号</td><td>异常描述</td></tr>");
			while (rs.next()) {
				String car_code = rs.getString("Car_Code");
				model = rs.getString("Model");
				rent = rs.getString("Rent");
				manager = rs.getString("Manager_Code");
				note = rs.getString("note");
				out.print(code + "+");
				out.print(manager + " ");
				out.print("<tr><td>" + car_code + "</td>");
				out.print("<td>" + model + "</td>");
				out.print("<td align= center >" + rent + "</td>");
				out.print("<td>" + manager + "</td>");
				out.print("<td>" + note + "</td></tr>");

			}
			out.print("</table>");
	%>
	<form id="bill" action="" method="get"
		action="Renter_index.jsp?username=<%=code%>">
		<table width="291" border="0" align="center">
			<tr>
				<td width="116" height="38">所选择车辆：</td>
				<td width="168"><input type="text" name="car_code" /></td>
			</tr>
			<tr>
				<td height="44">预计使用时长：</td>
				<td><input type="text" name="order_time" /></td>
			</tr>
			<tr>
				<td height="37" colspan="2"><table width="303" border="0">
						<tr>
							<td height="31" align="center"><input type="reset"
								value="重置" /></td>
							<td align="left"><input type="submit" value="提交" /></td>
						</tr>
					</table></td>
			</tr>
		</table>
	</form>

	<%
		java.util.Date date = new java.util.Date();
			Timestamp starttime = new Timestamp(date.getTime());
			out.print(starttime);
			rent = "1";
			String car_code = request.getParameter("car_code");
			if((car_code!=null)&&(!car_code.equals(""))){
			try {
				String sql = "update car set rent=b'" + rent + "' where Car_Code='" + car_code + "';";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.executeUpdate();
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				String sql = "INSERT INTO `order` (Car_Code,Start_time,Renter_Code)" + " VALUES('" + car_code
						+ "','" + starttime + "','" + code + "') ;";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.executeUpdate();
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				String sql = "INSERT INTO bill (Order_Code)" + " VALUES('123') ;";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.executeUpdate();
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			}
	%>
	<%
		} else if (selectvalue == 5) {
			rs = new select_table().read_order();
			out.print("<table width=400 border=2 align=center >");
			out.print("<tr><td>订单号</td><td>车辆编号</td><td>租用开始时间</td><td>租用结束时间</td><td>异常描述</td></tr>");
			while (rs.next()) {
				if (rs.getString(6).equals(code)) {
					out.print("<tr><td  align = center >" + rs.getString(1) + "</td>");
					out.print("<td  align = center >" + rs.getString(2) + "</td>");
					out.print("<td align = center >" + rs.getString(3) + "</td>");
					out.print("<td  align = center >" + rs.getString(4) + "</td>");
					out.print("<td  align = center >" + rs.getString(5) + "</td></tr>");
				}
			}
			out.print("</table>");

		} else if (selectvalue == 6) {
			rs = new select_table().read_bill_view();
			out.print("<h2>账单表</h2>");
			out.print("<table width=800 border=2 align=center >");
			out.print(
					"<tr><td>账单号</td><td>订单号</td><td>租用者编号</td><td>车辆编号</td><td>租用开始时间</td>"
					+"<td>租用结束时间</td><td>预计时间</td><td>实际使用时间</td><td>时间费率</td><td>超时费率</td><td>费用</td><td>异常描述</td></tr>");
			while (rs.next()) {

				ResultSet rs2 = new select_table().read_carcode(code);
				while (rs2.next()) {
					if (rs.getString(3).equals(rs2.getString(1))) {
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
				}
			}
			out.print("</table>");
		} else if (selectvalue == 7) {
			float remain = new select_table().read_remain(code);
			out.print("<h2>尊敬的用户</h2><p><h2>您当前的余额为：" + remain+"￥</h2>");
		} else if (selectvalue == 8) {
			float add = 0;
			try {
				add = Integer.parseInt(request.getParameter("addremain"));
			} catch (Exception e) {
				e.printStackTrace();
			}
			float remain = new update_table().update_remain(add, code);
			//out.print("余额为：" + remain);
	%>
	
	<form id="addremain" action="" method="post"
		action="Renter_index.jsp?username=<%=code%>">
		<table width="456" border="0" align="center">
			<tr height=70>
				<td width="166">
					<div align="right"><font size="5">当前余额为：</font></div>
				</td>
				<td width="170" align="left"><font size="5">&nbsp;&nbsp;&nbsp;&nbsp;<%=remain %>￥</font></td>
			</tr>
			<tr height=70>
				<td><div align="right"><font size="5">你所充值的金额为：</font></div></td>
				<td><input type="text" name="addremain"  /><font size="5">元</font></td>
			</tr>
			<tr height=70>
				<td colspan="2"><div align="center">
						<input type="submit" value="确认" style="background-color: #8f8fbd;width: 76px;height: 36px;color: #FFFFFF"  />
					</div></td>
			</tr>
		</table>
	</form>
	<%
		}
		else if(selectvalue==9)
		 {
			 %>	 
			 <form id="insetcar"  method="post" action="Owner_index.jsp?username=<%=code%>&value=9">
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
		    <th scope="row">管理员号码：</th>
		    <td><input id="t8" type="text" name="managercode" /></td>
		  </tr>
		  <tr>
		    <th scope="row">备注：</th>
		    <td><input id="t9" type="text" name="note" /></td>
		  </tr>
		  <tr>
		    <th colspan="2" scope="row"><input id='s1' type="submit" value="提交" style="background-color: #8f8fbd;width: 76px;height: 36px;color: #FFFFFF" /></th>
		  </tr>
		</table>
		</form>
			<%
			try{
				java.sql.CallableStatement cstmt = conn.prepareCall("{call proc_CarInsert(?,?,?,?)}");
				cstmt.setString(1, carcode);
				cstmt.setString(2, model);
				cstmt.setString(3, managercode);
				cstmt.setString(4, code);
				cstmt.executeQuery();
				cstmt.close();
			}
			catch(Exception e){
				e.printStackTrace();
			}%>


			 <%
		 }else if(selectvalue==10)
		 {
			 %>
			  <form id="modify"  method="post" action="Owner_index.jsp?username=<%=code %>&value=10">
			<h2 align="center">请输入所要更改的车辆信息</h2>
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
		    <th scope="row">更改后的管理员号码：</th>
		    <td><input id="t12" type="text" name="managercode" /></td>
		  </tr>
		  <tr>
		    <th scope="row">更改后的备注：</th>
		    <td><input id="t13" type="text" name="note" /></td>
		  </tr>
		  <tr>
		    <th colspan="2" scope="row"><input type="submit" value="提交" style="background-color: #8f8fbd;width: 76px;height: 36px;color: #FFFFFF" /></th>
		  </tr>
		</table>
		</form>
			<%
				try{
					/* java.sql.CallableStatement cstmt = conn.prepareCall("{call proc_CarUpdate(?,?,?,?)}");
					cstmt.setString(1, model);
					cstmt.setString(2, ownercode);
					cstmt.setString(3, note);
					cstmt.setString(4, carcode); */
					String sql="update Car set Model='"+model+"',Manager_Code='"+managercode+"',note='"+note+"' where Car_code='"+carcode+"';"; 
					PreparedStatement pstmt=conn.prepareStatement(sql);
					pstmt.executeUpdate();
					pstmt.close();
					/* cstmt.executeQuery();
					cstmt.close(); */
				}
				catch(Exception e){
					e.printStackTrace();
				}
			%>
			 <%
			 
		 }else if(selectvalue==11)
		 {
			 %>
			 <form id="deletecar"  method="post" action="Owner_index.jsp?username=<%=code %>&value=11">
				<h1 align="center">请输入所要删除的的车辆编号</h1>
				<br>
			<table width="300" border="0" align="center">
			  <tr>
			    <th width="100" scope="row">车辆编号：</th>
			    <td width="101"><input id="t1" type="text" name="carcode" /></td>
			  </tr>
			  <tr> <th colspan="2" scope="row"><br></th></tr>
			  <tr>
			    <th colspan="2" scope="row"><input id = 's2' type="submit" value="提交" style="background-color: #8f8fbd;width: 76px;height: 36px;color: #FFFFFF" /></th>
			  </tr>
			  
			</table>
			</form>
			<%
			String sql="delete from Car where Car_code='"+carcode+"';"; 
		     PreparedStatement pstmt=conn.prepareStatement(sql);
		     pstmt.executeUpdate();
		     pstmt.close();
		     //carcode = request.getParameter("carcode");
			%>
			<%
		 }else if(selectvalue==12)
		 {
			 %>
			 <form id="addnote" action="" method="post" action="Renter_index.jsp?username=<%=code%>">
		<table width="361" border="0" align="center">
  <tr>
    <td width="169">您要申诉的车辆编号：</td>
    <td width="182"><input type="text" name="carcode"></td>
  </tr>
  <tr>
    <td height="211" colspan="2" align="center"><h3>申诉信息</h3>

        <textarea name="note" id="textarea" cols="45" rows="10"></textarea>

    <p>&nbsp;</p></td>
  </tr>
  <tr>
    <td align="center"><input type="reset" value="重置" style="background-color: #545454;width: 76px;height: 36px;color: #FFFFFF"/></td>
    <td align="center"><input type="submit" style="background-color: #545454;width: 76px;height: 36px;color: #FFFFFF" value="提交" onclick=feedback() /></td>
  </tr>
</table>
</form>	
			 <%
		 }else if(selectvalue==13){
			 
			 float cut = 0;
				try {
					cut = Integer.parseInt(request.getParameter("cutremain"));
				} catch (Exception e) {
					e.printStackTrace();
				}
				float remain2 = new update_table().update_remain3(cut, code);
				//out.print("余额为：" + remain);
		%>
		
		<form id="addremain" action="" method="post"
			action="Renter_index.jsp?username=<%=code%>">
			<table width="456" border="0" align="center">
				<tr height=70>
					<td width="166">
						<div align="right"><font size="5">当前余额为：</font></div>
					</td>
					<td width="170" align="left"><font size="5">&nbsp;&nbsp;&nbsp;&nbsp;<%=remain2 %>￥</font></td>
				</tr>
				<tr height=70>
					<td><div align="right"><font size="5">你所提现的金额为：</font></div></td>
					<td><input type="text" name="cutremain"  /><font size="5">元</font></td>
				</tr>
				<tr height=70>
					<td colspan="2"><div align="center">
							<input type="submit" value="确认" style="background-color: #8f8fbd;width: 76px;height: 36px;color: #FFFFFF"  />
						</div></td>
				</tr>
			</table>
		</form>	 
		<% 	 
		 }
	%>
</body>
</html>