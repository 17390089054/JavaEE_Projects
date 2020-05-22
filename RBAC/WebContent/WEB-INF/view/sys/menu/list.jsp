<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
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


<title>菜单列表</title>
<meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
<meta name="description"
	content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

<link rel="shortcut icon" href="favicon.ico">
<link href="resource/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="resource/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="resource/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="resource/css/animate.css" rel="stylesheet">
<link href="resource/css/style.css?v=4.1.0" rel="stylesheet">
<style type="text/css">
    th{
        text-align:center;/** 设置水平方向居中 */
        vertical-align:middle/** 设置垂直方向居中 */
    }
</style>
</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<h5>菜单列表</h5>
					<div class="ibox-tools">
						<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
						</a> <a class="dropdown-toggle" data-toggle="dropdown"
							href="table_basic.html#"> <i class="fa fa-wrench"></i>
						</a>
						<ul class="dropdown-menu dropdown-user">
							<li><a href="table_basic.html#">选项1</a></li>
							<li><a href="table_basic.html#">选项2</a></li>
						</ul>
						<a class="close-link"> <i class="fa fa-times"></i>
						</a>
					</div>
				</div>
				<div class="ibox-content">

					<table class="table table-striped" style="text-align:center">
						<thead>
							<tr>
								<th>父菜单编号</th>
								<th>菜单名称</th>
								<th>菜单路径</th>
								<th>菜单属性</th>
								<th>操&nbsp;&nbsp;&nbsp;&nbsp;作</th>
							</tr>
						</thead>
						<tbody >
							<c:forEach items="${parentMenuList}" var="parent" varStatus="v">
								<tr>
									<td>${v.count}</td>
									<td><span class="text-navy">${parent.menuName}</span></td>
									<td>${parent.menuUrl}</td>
									<td class="text-navy"> 父菜单</td>
									<td>
										<button class="btn btn-md btn-info" onclick="window.location.href='sys/menu/updateParent?menuId=${parent.menuId}'">编辑</button>
										<button class="btn btn-md btn-danger" onclick="deleteMenu(${parent.menuId})">删除</button>
									</td>
								</tr>
								<c:forEach items="${childMenuList}" var="child">
									<c:if test="${parent.menuId==child.menuParentId}">
										<tr>
											<td></td>
											<td><span class="text-warning">${child.menuName } </span></td>
											<td class="text-warning">${child.menuUrl }</td>
											<td class="text-warning"> 子菜单</td>
											<td>
												<button type="button" class="btn btn-md btn-info" onclick="window.location.href='sys/menu/updateChild?menuId=${child.menuId}'">编辑</button> 
												<button type="button" class="btn btn-md btn-danger" onclick="deleteMenu(${child.menuId})">删除</button>
											</td>
										</tr>
									</c:if>
								</c:forEach>

							</c:forEach>

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<!-- 全局js -->
	<script src="resource/js/jquery.min.js?v=2.1.4"></script>
	<script src="resource/js/bootstrap.min.js?v=3.3.6"></script>
	<!-- Peity -->
	<script src="resource/js/plugins/peity/jquery.peity.min.js"></script>
	<!-- 自定义js -->
	<script src="resource/js/content.js?v=1.0.0"></script>
	<script src="resource/js/plugins/layer/layer.min.js"></script>
	<!-- iCheck -->
	<script src="resource/js/plugins/iCheck/icheck.min.js"></script>
	<!-- Peity -->
	<script src="resource/js/demo/peity-demo.js"></script>
	<script>
		$(document).ready(function() {
			$('.i-checks').iCheck({
				checkboxClass : 'icheckbox_square-green',
				radioClass : 'iradio_square-green',
			});
		});
	</script>
	
	<script>
		function deleteMenu(menuId){
			layer.confirm('确定要删除么？', {
			    btn: ['狠心抛下','我再想想'], //按钮
			    shade: 0.1,
			    shadeClose:true//不显示遮罩
			}, function(){
				//ajax实现删除
				 $.post("sys/menu/delete",{"menuId":menuId,"_method":"DELETE"},function(data){
					if(data.flag){
						layer.msg("删除成功！",{time:1000,end:function(){
							layer.close();
							window.location.reload();
						}});
					}else{
						layer.msg(data.msg);
					}
				},"json");
				
			}, function(){
				layer.close();
			});
		}
	
	</script>


</body>

</html>
