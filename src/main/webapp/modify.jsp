<!-- 
	修改页面！ 对相应的条目进行修改
 -->
<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>

</head>
<body>
	<div><h1>修改页面</h1></div>
	<form action="<%=request.getContextPath() %>/modify.action" method="post">
		<table>
			<tr>
				<td>编号</td>
				<td><input type="text" name="article.id" value="${article.id}"/></td>
				
			</tr>
			<tr>
				<td>名称</td>
				
				<td><input type="text" name="article.name" value="${article.name }"/></td>
			</tr>
			<tr>
				<td>单价</td>
				<td><input type="text" name="article.unitPrice" value="${article.unitPrice }"/></td>
			</tr>
			<tr>
				<td>数量</td>
				<td><input type="text" name="article.amount" value="${article.amount }"/></td>
			</tr>
			<tr>
				<td>说明</td>
				<td><input type="text" name="article.direction" value="${article.direction }"/></td>
			</tr>
		</table>
		<input type="submit" value="修改 "/>
	</form>
</body>
</html>