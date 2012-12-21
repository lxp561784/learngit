<!-- 
	登陆页面 用户登陆
 -->
<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
	
</head>
<body>
	
	<form action="<%=request.getContextPath() %>/login.action" method="post">
		<div><h1>&nbsp;&nbsp;&nbsp;登陆页面</h1></div>
		
		<table>
			<tr>
			
				<td>用户名:</td>
				<td><input type="text" name="username"/></td>
			</tr>
			<tr>
				<td>密码：</td>
				<td><input type="password" name="password"/></td>
			</tr>
		</table>
		
		<input type="submit" value="用户登录"/>
		<input type="submit" value="管理员登陆"/>
	
	
	</form>
	
</body>
</html>