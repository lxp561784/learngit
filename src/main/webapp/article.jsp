<!--
	查看办公用品页面，该页面可领取办公用品！还可查看该用户领取的所有物品
-->
<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>

<head>
<script type="text/javascript" src="/my-app/js/jquery-1.4.3.js"></script>
<SCRIPT type="text/javascript">
	$(function() {
		$("#get").click(function() {
			var id = $("#id").text();
			//alert(id);
			var amount = $(this).siblings().val();
			var amount1 = $("#amount").text();
			var amount2 = amount1 - amount;
			$.post("/my-app/get.action", {
				"id" : id,
				"amount" : amount
			}, function(flag) {
				//alert(flag);
				if (flag == 'true') {
					$("#amount").text(amount2);
					alert("领取用品成功!");
				} else {
					alert("领取用品失败！");
				}
			});
		});	
	});
</SCRIPT>
<style type="text/css">
td {
	width: 210px;
	text-align: center;
}

div {
	margin: auto;
	text-align: center;
}
</style>
</head>
<body>
	<div>
		<h1>办公用品明细</h1>
	</div>
	<table cellspacing="0" border="1">
		<tr>
			<td>编号</td>
			<td>名称</td>
			<td>单价</td>
			<td>数量</td>
			<td>说明</td>
			<td>领取数量</td>
		</tr>
		<tr>
			<td id="id">${article.id }</td>
			<td>${article.name }</td>
			<td>${article.unitPrice }</td>
			<td id="amount">${article.amount }</td>
			<td>${article.direction }</td>
			<td><input type="text" width="5" height="20" /><input
				type="button" value="领取" id="get" /></td>

		</tr>
	</table>
	<a href="<%=request.getContextPath() %>/lookarticle.action?userId=${userId}">查看领取物品</a>
</body>
</html>