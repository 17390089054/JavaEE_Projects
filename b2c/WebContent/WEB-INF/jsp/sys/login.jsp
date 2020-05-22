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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>登录</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="resource/img/favicon.ico"> <link href="resource/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="resource/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="resource/css/animate.css" rel="stylesheet">
    <link href="resource/css/style.css?v=4.1.0" rel="stylesheet">
	<style>
	  	body{
	 	background:url(resource/img/bg.jpg) no-repeat;
	 	background-size:100% 100%;	 		 	
	 	} 
	 	span{
	 		font-size:22px;
	 		color:#ff0;
	 		font-weight:700;	
	 	}
	 	
	</style>
	 <script>if(window.top !== window.self){ window.top.location = window.location;}</script>
</head>

<body class="gray-bg" >

    <div class="middle-box text-center loginscreen  animated fadeInDown">
        <div>
            <div>

                <h1 class="logo-name">Go</h1>

            </div>
            <h3 style="color:white">欢迎登录后台管理系统</h3>
			<!-- 表单开始 -->
            <form class="m-t" role="form" action="Login.do" method="post">
                <div class="form-group">
                    <input type="text" class="form-control" value="${account}" placeholder="用户名" name="account" onblur="checkAccount()" onfocus="clearAccountError()">
                   <span id="accountError"></span>
                </div>
                 
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="密码" name="password" onblur="checkPassword()" onfocus="clearPasswordError()">
                     <span id="passwordError"></span>
                </div>
                <button type="button" class="btn btn-primary block full-width m-b">登 录</button>
				 <span id="msg">${msg}</span>

                <p class="text-muted text-center" style="color:#fff"> <a href="" style="color:#fff"><small>忘记密码了？</small></a> 
                | <a href="" style="color:#fff">注册一个新账号</a>
                </p>
            </form>
            <!-- 表单结束 -->
        </div>
    </div>

    <!-- 全局js -->
    <script src="resource/js/jquery.min.js?v=2.1.4"></script>
    <script src="resource/js/bootstrap.min.js?v=3.3.6"></script>
	<script>
		//检查账号是否为空
		function checkAccount(){
			var flag=true;
			var obj=$("[name='account']").val();
			if(obj==""){
				$("#accountError").html("用户名不能为空!");
				flag=false;
			}
			return flag;
		}
		//清除账号错误提示信息
		function clearAccountError(){
			$("#passwordError").html("");
			$("#accountError").html("");
			$("#msg").html("");
		}
		//检查密码是否为空
		function checkPassword(value){
			var flag=true;
			var value=$("[name='password']").val();
			//正则表达式检查密码格式
			var reExpression=/^[A-Za-z0-9]+$/;
			
			if(value==""){
				$("#passwordError").html("密码不能为空!");
				flag=false;
			}else if(!reExpression.test(value)){
					$("#passwordError").html("密码只能由数字和字母组成!");
					flag=false;
				}
			return flag;
		}
		//清除密码错误提示信息
		function clearPasswordError(){
			$("#accountError").html("");
			$("#passwordError").html("");
			$("#msg").html("");
		}
		//提交表单
		$(":button").on("click",function(){
			if(checkAccount()&&checkPassword()){
				$("#msg").html("");
				$("[role='form']").submit();
				
			}
			
		});
		//回车键提交
		$(document).keydown(function(e){
			if(e.keyCode==13){
				$(":button").click();
			}
			
		});
		
		
		
	
	
	</script>
    

</body>
