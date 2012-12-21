<!-- 
	添加办公用品页面，跳转到列表页面
-->
<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>

</head>
<body>
	<div><h1>增加办公用品</h1></div>
	<form action="<%=request.getContextPath() %>/add.action" method="post">
		<table>
			<tr>
				<td>名称</td>
				<td><input type="text" name="name"/></td>
			</tr>
			<tr>
				<td>单价</td>
				<td><input type="text" name="unitPrice"/></td>
			</tr>
			<tr>
				<td>数量</td>
				<td><input type="text" name="amount"/></td>
			</tr>
			<tr>
				<td>说明</td>
				<td><input type="text" name="direction"/></td>
			</tr>
		</table>
		<input type="submit" value="添加"/>
	</form>
</body>
</html>