<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html!>
<html>
<base href="<%=basePath %>" />
<head>
<title>登录界面</title> 
</head>
<body>
 
	<div class="login-content">
		<div class="login-title">
			<h1>登录</h1>
		</div>
		<div class="login">
			<form>
				<!-- <div>
					<div>
						<input id="username" type="text" name="username" placeholder="用户名" />
					</div>
 
				</div>
				<div>
					<div>
						<input id="pwd" type="password" name="password" placeholder="密码" />
					</div>
				</div> -->
				<div>
					<input type="text" id="user_input_verifyCode"
						name="user_input_verifyCode" placeholder="验证码" maxlength="4">
 
				<!-- 	<span class="code_img"> 
					<img
						src="common/VerifyCode"
						width="110" height="40" id="verifyCodeImage" 
						id="changeVerifImageRegister"
						onclick="javascript:changeImage();">
					</span>
					 <span>
					 	 <a id="changeVerifImageRegister" onclick="javascript:changeImage();">换一张</a>
					</span> -->
				</div>
				<img src="common/checkCode" id="imageCode" width="100" height="32"  style="height:43px;cursor:pointer;" onclick="this.src='common/checkCode?'+new Date().getTime()">
				
				<input id="submit" type="button" value="登录" onclick="login()">
			</form>
 
 
 
		</div>
	</div>
	<script src="resource/js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript">
	 function genTimestamp() {    
        var time = new Date();    
        return time.getTime();    
    } 
	 function changeImage() {
         $('#verifyCodeImage').attr('src',
                 'common/VerifyCode?timestamp=' + genTimestamp());
     } 
	 //登录，目前只检测验证码
	 function login(){
		 
		 var user_input_verifyCode=$("#user_input_verifyCode").val();
		 console.log("input code:"+user_input_verifyCode);
		 console.log("session Code:"+'${sessionScope.randomcode_key}');
		  $.ajax({
				type : 'post',
				url : "common/test",
				data:{verifyCode:user_input_verifyCode},
				success : function(data) {	
					
				},
				/* error : function() {
					alert("查询失败");
				} 
				*/
			}); 
	
	 }
	
	 </script>
</body>
</html>