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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>消息处理页面</title>
</head>
<body>
	<!-- 全局js -->
	<script src="resource/js/jquery.min.js?v=2.1.4"></script>
	<script src="resource/js/plugins/layer/layer.min.js"></script>
	<script type="text/javascript">
		$(function() {
			var message = "${requestScope.message}";//这段代码需要配合EL表达式使用"${requestScope.message}"
			layer.msg(message, {
				icon : 1,
				time : 2000
			//2秒关闭（如果不配置，默认是3秒）
			}, function() {
				var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
				parent.layer.close(index); //再执行关闭
				
			});

		});
	</script>
</body>
</html>