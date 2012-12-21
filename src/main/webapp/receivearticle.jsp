<!-- 
   领取用品
 -->
<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>

<head>

</head>
<body>
	<div style="margin:auto;"><h1>&nbsp;<br></h1><h1>领取用品列表</h1></div>
	<table border="1" cellspacing="0">
		<tr>
			<td>编号</td>
			<td>名称</td>
			<td>单价</td>
			<td>数量</td>
			<td>说明</td>
		</tr>
		<s:iterator value="list" var="article">
			<tr>
				<td>${article.id }</td>
				<td>${article.name }</td>
				<td>${article.unitPrice }</td>
				<td>${article.amount }</td>
				<td>${article.direction }</td>
				
			</tr>
		</s:iterator>
	</table>
</body>
</html>