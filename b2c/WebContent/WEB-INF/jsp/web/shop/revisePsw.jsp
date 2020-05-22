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
    <title>请输入标题</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">
    <link href="resource/css/bootstrap.min.css" rel="stylesheet">
    <link href="resource/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="resource/css/animate.css" rel="stylesheet">
    <link href="resource/css/style.css" rel="stylesheet">
    <link href="resource/css/login.css" rel="stylesheet">
</head>
<body style="background:url('resource/img/p_big3.jpg') no-repeat;overflow:auto;background-size:100% 100%">
 <div class="signinpanel">
	<div class="row">
		 <div class="col-sm-7">
	             <div class="signin-info">
	             </div>
	        </div>
		 <div class="col-sm-5">
            <form method="post" action="revisePsw" id="myForm">
                <h4 class="no-margins">修改密码</h4>
                <p class="m-t-md"></p>
                <p class="m-t-md"></p>
		  	<p class="m-t-md"></p>
		  	 <input type="hidden" name="c_tel" value="${c_tel}">
                <input type="password" class="form-control " name="c_password"  value="${c_password}" placeholder="请输入密码" onfocus="clearError()"/>
                <input type="password" class="form-control " id="psw" placeholder="请确认密码" onfocus="clearError()"/>
                <button class="btn btn-success btn-block" onclick="toSub()" type="button">确定</button><br/>
                <span id="msg" style="color:red;font-size:18px">${msg}</span>
    		</form>
	     </div>
	  </div>
	</div>  
   
   <!-- 全局js -->
   <script src="resource/js/jquery.min.js?v=2.1.4"></script>
   <script src="resource/js/bootstrap.min.js?v=3.3.6"></script>
   <script src="resource/layer/layer.js"></script>
   <script>
   		function toSub(){
   			//校验数据的正确性
   			var c_password=$.trim($("input[name='c_password']").val());
   			var password=$.trim($("#psw").val());
   			if(!c_password){
   				$("#msg").html("密码不能为空!");
   				return;
   			}
   			if(!password){
   				$("#msg").html("请确认密码!");
   				return;
   			}
   			
   			//正则校验密码
			var passwordExp=/^[a-zA-Z]\w{5,17}$/;
			if(!passwordExp.test(c_password))
			{
				$("#msg").html("密码格式不正确!(以字母开头，长度在6~18之间，只能包含字母，数字和下划线)");
				return;
			}	
			//前后密码设置
			var password2=$.trim($("#psw").val());
			if(c_password!=password2){
				$("#msg").html("前后密码不一致!");
				return;
			}
			//提交表单
			$("#myForm").submit();
   		}
   		
   		
   //清除错误信息
   function clearError(){
	 $("#msg").html("");
   }
   		
   		
   </script>
</body>
</html>