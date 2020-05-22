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
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>后台管理</title>
<link href="resource/css/login.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<div class="login_box">
		<div class="login_l_img">
			<img src="resource/img/login-img.png" />
		</div>
		<div class="login" style="height:410px">
			<div class="login_logo">
				<a href="#"><img src="resource/img/login_logo.png" /></a>
			</div>
			<div class="login_name">
				<p>后台管理系统</p>
			</div>
				<form id="myForm">
					<input name="account" class="input" type="text" value="${account}"
						placeholder="用户名"> <input name="password" class="input"
						type="password" id="pwd" placeholder="密码">
					<div style="width: 300px; height: 50px">
						<input type="text" id="user_input_verifyCode" name="inputCode"
							placeholder="验证码" maxlength="4" style="width: 180px; float: left">
						<img src="common/checkCode" width="110" height="50"
							style="margin-left: 5px; text-align: center; float: right"
							id="verifyCodeImage" onclick="javascript:changeImage();">
					</div>
					<input value="登录" style="width: 100%;" type="button" id="btn">
					<span id="msg"
						style="display: block; text-align: center; line-height: 40px; font-size: 18px; color: #ff0021">${msg}
					</span>
				</form>
		</div>
	</div>
	<script>
		if (window.top !== window.self) {
			window.top.location = window.location;
		}
	</script>
	<script type="text/javascript" src="resource/js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="resource/js/jquery.md5.js"></script>
	<script>
		/*图片验证码*/
		function genTimestamp() {
			var time = new Date();
			return time.getTime();
		}
		/*更换验证码*/
		function changeImage() {
			$('#verifyCodeImage').attr('src',
					'common/checkCode?timestamp=' + genTimestamp());
		}

		//点击提交按钮
		$("#btn").click(function() {
			//console.log("session Code:"+'${sessionScope.codeVal}');
			//inputCode=$.trim($("#user_input_verifyCode").val());
			//console.log("input Code:" + inputCode);
			//用户名
			var account = $.trim($("input[name='account']").val());
			//密码
			var password = $.trim($("#pwd").val());
			//验证账号密码是否为空
			if (!account) {
				$("#msg").html("账号不能为空");
				$("input[name='account']").focus();
				return;
			}
			if (!password) {
				$("#msg").html("密码不能为空!");
				$("#pwd").focus();
				return;
			}
			//验证码是否为空
			var inputCode = $.trim($("#user_input_verifyCode").val());
			if (!inputCode) {
				$("#msg").html("请输入验证码!");
				$("#user_input_verifyCode").focus();
				return;
			}

			//md5加密
			$("#pwd").val($.md5($("#pwd").val()));

			//提交表单
			$("#myForm").attr({
				"method" : "post",
				"action" : "sys/login"
			});
			$("#myForm").submit();
		});

		//回车提交表单
		$(document).keydown(function(e) {
			//兼容IE浏览器
			e = e || window.event;
			if (e.keyCode == 13) {
				$("#btn").click();
			}

		});
	</script>
</body>
</html>
