<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath(); 
	String realPath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html >
<html>
	<base href="<%=realPath%>">
	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
	
	    <title>客户登录</title>
	    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
	    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">
	    <link href="resource/css/bootstrap.min.css" rel="stylesheet">
	    <link href="resource/css/font-awesome.css?v=4.4.0" rel="stylesheet">
	    <link href="resource/css/animate.css" rel="stylesheet">
	    <link href="resource/css/style.css" rel="stylesheet">
	    <link href="resource/css/login.css" rel="stylesheet">
	</head>
	<body class="signin">
	    <div class="signinpanel">
	        <div class="row">
	            <div class="col-sm-7">
	                <div class="signin-info">
	                </div>
	            </div>
	            <div class="col-sm-5">
	                <form method="post" action="clientLogin" id="myForm">
	                    <h4 class="no-margins">用户登录</h4>
	                    <p class="m-t-md"></p>
	                    <p class="m-t-md"></p>
						<p class="m-t-md"></p>
	                    <input type="text" class="form-control uname" name="c_account"  value="${c_account}" placeholder="用户名" onfocus="clearError()" />
	                    <input type="password" class="form-control pword m-b" name="c_password" placeholder="密码" onfocus="clearError()"/>
	                    <button class="btn btn-success btn-block" onclick="toSub()" type="button">登录</button><br/>
	                    <a href="findPsw">忘记密码了?</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                    <strong>还没有账号?<a href="register">立即注册&raquo;</a></strong><br>
	                    <span id="msg" style="color:red;font-size:18px">${msg}</span>
	                </form>
	            </div>
	        </div>
	    </div>
	</body>
	<script src="resource/js/jquery.min.js"></script>
	<script>
		//获取输入框的值
		function toSub(){
		var c_password=$.trim($(":password").val());
		var c_account=$.trim($("input[name='c_account']").val());
		if(!c_account){
			$("#msg").html("账号不能为空!");
			return;
		}
		if(!c_password){
			$("#msg").html("密码不能为空");
			return;
		}
		//没有问题提交数据
		$("#myForm").submit();
			
		}
		//清除错误信息
		function clearError(){
			$("#msg").html("");
		}
	
		//回车提交表单
		$(document).keydown(function(e){
			if(e.keyCode==13){
				toSub();
			}			
		});
	
	
	
	</script>

</html>