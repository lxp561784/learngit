<!-- 
	管理员里列表,可以删除, 修改,查看,等功能
 -->
<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
	
<head>

	<script type="text/javascript" src="/my-app/js/jquery-1.4.3.js"></script>
	<SCRIPT type="text/javascript">
		$(function(){
			$(".del").click(function(){
				var that = this;
				var id=$(this).parent().siblings(':first').text();
				//var path=$.getWebPath();
				//alert(path);
				//	alert(id);
			    
				$.post(
				"/my-app/delete.action",
				{"id":id},
				function(){
					$(that).parent().parent().remove();
				}
			);
			});
			$("#add").click(function(){
				$("#div").load("/my-app/add.jsp");
			});
			$(".look").click(function(){
				var id=$(this).parent().parent().siblings(':first').text();
				
				$("#div").load("/my-app/look.action?id="+id);
			});
			$(".mod").click(function(){
				var id=$(this).parent().parent().siblings(':first').text();
				//alert(id);
				$("#div").load("/my-app/find.action?id="+id);
				
			});
		});
	</SCRIPT>
	<style type="text/css">
		td { width:200px;
			
		}
		div {
			margin:auto;
			text-align:center;
		}
	</style>
</head>
<body>
	<div ><h1>办公用品列表</h1></div>
	<table border="1" cellspacing="0" style="text-align:center;">
		<tr>
			<td>编号</td>
			<td>名称</td>
			<td>单价</td>
			<td>数量</td>
			<td>说明</td>
			<td>管理</td>
		</tr>
		<s:iterator value="list" var="article">
			<tr>
				<td>${article.id }</td>
				<td>${article.name }</td>
				<td>${article.unitPrice }</td>
				<td>${article.amount }</td>
				<td>${article.direction }</td>
				<td><input type="button" value="删除" class="del"/>&nbsp;
					<a ><input type="button" value="查看"  class="look"/></a>&nbsp;
					<a><input type="button" value="修改" class="mod" /></a>
				</td>
				<!-- 
				<td><a href="<%=request.getContextPath() %>/delete.action?id=${article.id}">删除</a>&nbsp;
					<a href="<%=request.getContextPath() %>/look.action?id=${article.id}">查看</a>&nbsp;
					<a href="<%=request.getContextPath() %>/find.action?id=${article.id}">修改</a>
				</td>
				 -->
				
			</tr>
		</s:iterator>
	</table>
	<input type="button" id="add" value="增加办公用品"/>
		<div id="div">
			
		</div>
	<!-- 
	<a href="add.jsp"  >增加办公用品</a>
	 -->	
</body>
</html>