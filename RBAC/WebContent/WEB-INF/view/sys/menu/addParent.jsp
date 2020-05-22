<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html!>
<html>
<base href="<%=basePath%>" />
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>父菜单添加</title>
<meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
<meta name="description"
	content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">
<link rel="shortcut icon" href="favicon.ico">
<link href="resource/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="resource/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="resource/css/animate.css" rel="stylesheet">
<link href="resource/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
<div class="wrapper wrapper-content">
	<form action="sys/menu/addParent" method="post" id="myForm">
		<div class="row">
			<div class="col-lg-4">
				<div class="form-group">
						<label class="col-lg-4 control-label">父菜单名称</label>
						<input type="text" name="menuName" class="form-control"
							placeholder="请输入父菜单名称"> 
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-4">
				<div class="form-group">
					<button type="button" class="btn btn-md btn-primary" id="add">确定添加</button>
					<button type="button" class="btn btn-md btn-warning" onclick="javascript:window.location.href='sys/menu/list'">取消</button>
				</div>
					<span id="msg" style="font-size:18px;color:#f00">${requestScope.msg}</span>
			</div>
		</div>
	</form>
	</div>

	<!-- 全局js -->
	<script src="resource/js/jquery.min.js?v=2.1.4"></script>
	<script src="resource/js/bootstrap.min.js?v=3.3.6"></script>

	<!-- 自定义js -->
	<script src="resource/js/content.js?v=1.0.0"></script>
	<script type="text/javascript">
		$("#add").bind("click",function(){
			//校验父菜单名称是否为空
			var menuName=$.trim($("input[name='menuName']").val());
			if(!menuName){
				$("#msg").html("请输入父菜单名称!");
				$("input[name='menuName']").focus();
				return false;
			}			
			
			//校验菜单名称是否重复
			$.get("sys/menu/isMenuNameUnique",{"menuName":menuName},function(data){
				if(data.flag){
					$("#myForm").submit();
				}else{
					$("#msg").html(data.msg);
					$("input[name='menuName']").focus();
					return false;
				}
			},"json")
			
			
			
		});
	</script>

</body>

</html>