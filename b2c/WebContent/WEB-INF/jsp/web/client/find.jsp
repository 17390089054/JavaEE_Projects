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
	             <form method="post" action="findPsw" id="myForm">
	                 <h4 class="no-margins">密码找回</h4>
	                 <p class="m-t-md"></p>
	                 <p class="m-t-md"></p>
				  	<p class="m-t-md"></p>
				  	<input type="hidden" name="c_account" value="${c_account}"/>
	                 <input type="number" class="form-control " name="c_tel"  value="${c_tel}" placeholder="请输入11位手机号" onfocus="clearError()" />
	                 <button type="button" class="btn btn-md btn-warning" onclick="getPhoneCode()">获取验证码</button>
	                 <input type="number" class="form-control " name="code" placeholder="请输入验证码" onfocus="clearError()"/>
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
   		//请求验证码次数
   		var count=0; 
   		//验证码
   		var phoneCode="";
   		//提交表单
		function toSub(){
   			//获取手机号
   			var c_tel=$.trim($("input[name='c_tel']").val());
   			if(!c_tel){
   				$("#msg").html("手机号不能为空!");
   				return;
   			}
   			//正则校验手机号
   			var telExp=/^[1][3,4,5,7,8][0-9]{9}$/;
   			if(!telExp.test(c_tel)){
   				$("#msg").html("手机号格式不正确");
   				return;
   			}
			//单个手机次数单日最高请求次数为4	
  			if(count<=4){
  				//用户输入的验证码
  	  			var code=$.trim($("input[name='code']").val());
  				if(!code){
  					$("#msg").html("请输入验证码!");
  					return;
  				}
				console.log(phoneCode);
  				if(code==phoneCode){
  	  				$("#myForm").submit();
  	  			}else{
  	  				$("#msg").html("验证码输入有误!请重新输入!");
  	  			}
  			}else{
  				$("#msg").html("请求验证码次数过多!请明日再试!");
  			}
			
		}
   		
   		function getPhoneCode(){
   			//获取手机号
   			var c_tel=$.trim($("input[name='c_tel']").val());
   			if(!c_tel){
   				$("#msg").html("手机号不能为空!");
   				return;
   			}
   			//正则校验手机号
   			var telExp=/^[1][3,4,5,7,8][0-9]{9}$/;
   			if(!telExp.test(c_tel)){
   				$("#msg").html("手机号格式不正确");
   				return;
   			}
   			//后台得到的验证码
  			$.post("sendCode",{"phone":c_tel},function(data){
  				phoneCode=data;
  				count++;
  			},"json");
  			window.alert("验证码已发送到您的手机!请注意查收!");	
   		}
   
		function clearError(){
			$("#msg").html("");
		} 
		
   </script>
</body>
</html>