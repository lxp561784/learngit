<!-- 
	管理员里列表,可以删除, 修改,查看,等功能
 -->
<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>

<head>

<script type="text/javascript" src="/my-app/js/jquery-1.4.3.js"></script>
<script type="text/javascript" src="/my-app/js/jquery.form.js"></script>
<SCRIPT type="text/javascript">
	$(function() {
			
	
		$(".del").live('click', function() {
			
			var that = this;
			var id = $(this).parent().siblings(':first').text();
			//var path=$.getWebPath();
			//alert(path);
			//	alert(id);

			$.post("/my-app/delete.action", {
				"id" : id
			}, function() {
				$(that).parent().parent().remove();
			});
		});
		$("#add").click(function() {
			//$("#div").load("/my-app/add.jsp");
			$("#add_form").attr("class","out");
			$("#modify_form").attr("class","hidden");
			$("#look").attr("class","hidden");
			
		});
		$(".look").live('click', function() {
			//alert("ff");
			var id = $(this).parent().parent().siblings(':first').text();
			var name=$(this).parent().parent().siblings(':eq(1)').text();
			//alert(name);
			var unitPrice =$(this).parent().parent().siblings(':eq(2)').text();
			var amount =$(this).parent().parent().siblings(':eq(3)').text();
			var direction=$(this).parent().parent().siblings(':eq(4)').text();
			//alert(direction);

			//$("#div").load("/my-app/look.action?id=" + id);
//alert(this);
			
			$("#look_td").find(':first').text(id);
			$("#look_td").find(':eq(1)').text(name);
			$("#look_td").find(':eq(2)').text(unitPrice);
			$("#look_td").find(':eq(3)').text(amount);
			$("#look_td").find(':eq(4)').text(direction);
			$("#look").attr("class","out");
			$("#add_form").attr("class","hidden");
			$("#modify_form").attr("class","hidden");
		});
		$(".mod").live('click', function() {
			var id = $(this).parent().parent().siblings(':first').text();
			var name=$(this).parent().parent().siblings(':eq(1)').text();
			//alert(name);
			var unitPrice =$(this).parent().parent().siblings(':eq(2)').text();
			var amount =$(this).parent().parent().siblings(':eq(3)').text();
			var direction=$(this).parent().parent().siblings(':eq(4)').text();
			//alert(id);
			//$("#div").load("/my-app/find.action?id=" + id);
			$("#modify_table").find("input[name='article.id']").val(id);
			$("#modify_table").find("input[name='article.name']").val(name);
			$("#modify_table").find("input[name='article.unitPrice']").val(unitPrice);
			$("#modify_table").find("input[name='article.amount']").val(amount);
			$("#modify_table").find("input[name='article.direction']").val(direction);
			$("#modify_form").attr("class","out");
			$("#add_form").attr("class","hidden");
			$("#look").attr("class","hidden");
			

		});
		$(".delete").click(function(){
			$("#add_form").attr("class","hidden");
			$("#modify_form").attr("class","hidden");
			$("#look").attr("class","hidden");
			
		});
	//	var options={
	//			url:'/my-app/add.action',
	//			type:'post',
	//			clearForm:true,
	//			success:showReponse
	//	};
		
		$("#add_form1").ajaxForm( function(){
			
			var id=$("#table").find('tr:last').find(':first').text();
			var id1=parseInt(id)+1;
			var name=$("#add_form1").find("input[name='name']").val();
			var unitPrice=$("#add_form1").find("input[name='unitPrice']").val();
			var amount=$("#add_form1").find("input[name='amount']").val();
			var direction=$("#add_form1").find("input[name='direction']").val();
			var tr=$("#list").clone(true);
			tr.find(':eq(0)').text(id1);
			tr.find(':eq(1)').text(name);
			tr.find(':eq(2)').text(unitPrice);
			tr.find(':eq(3)').text(amount);
			tr.find(':eq(4)').text(amount);
			$("#table").append(tr);
			
			$("#add_form1").find("input[name='name']").val("");
			$("#add_form1").find("input[name='unitPrice']").val("");
			$("#add_form1").find("input[name='amount']").val("");
			$("#add_form1").find("input[name='direction']").val("");
			
			
			
		});
		$("#modify").ajaxForm( function(){
			var id1=$("#modify_table").find("input[name='article.id']").val();
			var name=$("#modify_table").find("input[name='article.name']").val();
			var unitPrice=$("#modify_table").find("input[name='article.unitPrice']").val();
			var amount=$("#modify_table").find("input[name='article.amount']").val();
			var direction=$("#modify_table").find("input[name='article.direction']").val();
			
			var id2="#id_"+id1;
			//alert(id1);
			var id3=$(id2).html();
			//alert(id3);
			if(id1==id3){
				$(id2).siblings(':eq(0)').text(name);
				$(id2).siblings(':eq(1)').text(unitPrice);
				$(id2).siblings(':eq(2)').text(amount);
				$(id2).siblings(':eq(3)').text(direction);
			}
			$("#modify_table").find("input[name='article.id']").val("");
			$("#modify_table").find("input[name='article.name']").val("");
			$("#modify_table").find("input[name='article.unitPrice']").val("");
			$("#modify_table").find("input[name='article.amount']").val("");
			$("#modify_table").find("input[name='article.direction']").val("");
		});
		
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
		
		$.post(
				"/my-app/list.action",
				function(list){
					$.each(list,function(i,value){
						var $tr="<tr id='list'><td id=id_"+value.id+">"+value.id+"</td><td>"+value.name+"</td><td>"+value.unitPrice+"</td><td>"+value.amount+"</td><td>"+value.direction+"</td><td><input type='button' value='删除' class='del' />&nbsp; <a><input type='button' value='查看' class='look' /></a>&nbsp; <a><input	type='button' value='修改' class='mod' /></a></td></tr>"
						$("#table").append($tr);
						//alert(value.id);
					});
				}
			);
		
	});
</SCRIPT>
<style type="text/css">
td {
	width: 200px;
}

div {
	margin: auto;
	text-align: center;
}

.hidden {
	display: none;
}

.out {
	display: block;
}
</style>
</head>
<body>
	<div>
		<h1>办公用品列表</h1>
	</div>
	<table border="1" cellspacing="0" style="text-align: center;" id="table">
		<tr>
			<td>编号</td>
			<td>名称</td>
			<td>单价</td>
			<td>数量</td>
			<td>说明</td>
			<td>管理</td>
		</tr>
		<!-- 
		<s:iterator value="list" var="article">
			<tr id="list">
				<td id="id_${article.id }" >${article.id }</td>
				<td>${article.name }</td>
				<td>${article.unitPrice }</td>
				<td>${article.amount }</td>
				<td>${article.direction }</td>
				<td><input type="button" value="删除" class="del" />&nbsp; <a><input
						type="button" value="查看" class="look" /></a>&nbsp; <a><input
						type="button" value="修改" class="mod" /></a></td>
				

			</tr>
				<td><a href="<%=request.getContextPath()%>/delete.action?id=${article.id}">删除</a>&nbsp;
					<a href="<%=request.getContextPath()%>/look.action?id=${article.id}">查看</a>&nbsp;
					<a href="<%=request.getContextPath()%>/find.action?id=${article.id}">修改</a>
				</td>
		</s:iterator>
		 -->
	</table>
	<input type="button" id="add" value="增加办公用品" />
	<!-- 添加办公用品开始 -->
	<div class="hidden" id="add_form">
		<h1>添加办公用品</h1>
		<form action="/my-app/add.action" method="post" id="add_form1">
			<table>
				<tr>
					<td>名称</td>
					<td><input type="text" name="name" /></td>
				</tr>
				<tr>
					<td>单价</td>
					<td><input type="text" name="unitPrice" /></td>
				</tr>
				<tr>
					<td>数量</td>
					<td><input type="text" name="amount" /></td>
				</tr>
				<tr>
					<td>说明</td>
					<td><input type="text" name="direction" /></td>
				</tr>
			</table>
			<input type="submit" value="添加" />
		</form>
		<input type="button" class="delete" value="取消"/>
	</div>
	<!-- 添加办公用品结束-->
	<!-- 查看开始 -->
	<div class="hidden" id="look">
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
			<tr id="look_td">
				<td id="id"></td>
				<td></td>
				<td></td>
				<td id="amount"></td>
				<td></td>
				<td><input type="text" width="5" height="20" /><input
					type="button" value="领取" id="get" /></td>

			</tr>
		</table>
		<a	href="<%=request.getContextPath() %>/lookarticle.action?userId=${userId}">查看领取物品</a><br/>
			<input type="button" class="delete" value="取消"/>
	</div>
	<!-- 查看结束-->
	<!-- 修改开始 -->
	<div class="hidden" id="modify_form">
		<h1>修改页面</h1>
		<form action="<%=request.getContextPath()%>/modify.action"
			method="post" id="modify">
			<table id="modify_table">
				<tr>
					<td>编号</td>
					<td><input type="text" name="article.id" value="" /></td>

				</tr>
				<tr>
					<td>名称</td>

					<td><input type="text" name="article.name"
						value="" /></td>
				</tr>
				<tr>
					<td>单价</td>
					<td><input type="text" name="article.unitPrice"
						value="" /></td>
				</tr>
				<tr>
					<td>数量</td>
					<td><input type="text" name="article.amount"
						value="" /></td>
				</tr>
				<tr>
					<td>说明</td>
					<td><input type="text" name="article.direction"
						value="" /></td>
				</tr>
			</table>
			<input type="submit" value="修改 " />
		</form>
		<input type="button" class="delete" value="取消"/>
	</div>
	<!-- 修改结束-->
	<!-- 
	<a href="add.jsp"  >增加办公用品</a>
	 -->
</body>
</html>