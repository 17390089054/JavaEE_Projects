<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>    
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
    <title>用户注册</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">
    <link rel="shortcut icon" href="favicon.ico"> <link href="resource/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="resource/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="resource/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="resource/css/animate.css" rel="stylesheet">
    <link href="resource/css/style.css?v=4.1.0" rel="stylesheet">
    <style>
    	*{
    		margin:0px;
    		padding:0px;
    	}
    </style>
</head>
<body class="gray-bg" style="background:url('resource/img/p_big3.jpg') no-repeat;overflow:auto;background-size:100% 100%">
    <div class="middle-box text-center loginscreen   animated fadeInDown" >
            <h2 style="color:#662"><b>欢迎注册Go商城</b></h2>
            <form class="m-t" id="myForm" role="form" method="post" action="register">
                <div class="form-group">
                    <input type="text" class="form-control" name="c_account" value="${client.c_account}" placeholder="请输入用户名" onfocus="clearError()">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" name="c_password" value="${client.c_password}" placeholder="请输入密码" onfocus="clearError()">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" name="c_password2" value="${client.c_password}" placeholder="请再次输入密码" onfocus="clearError()" >
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="c_name"  value="${client.c_name}" placeholder="请输入昵称" onfocus="clearError()">
                </div>
                <div class="form-group">
                    <input type="number" class="form-control" name="c_tel" value="${client.c_tel}" placeholder="请输入手机号"  onfocus="clearError()">
                </div>
                <div class="form-group">
                    <input type="date" class="form-control" name="c_birthday" value="${client.c_birthday}" onfocus="clearError()" >
                </div>
                <div class="form-group">
			            <select class="form-control" name="c_sex" onchange="clearError()">
			            	<option value="">==请选择性别==</option>
			            	<option value="男" <c:if test="${client.c_sex eq '男'}">selected</c:if> >男</option>
			            	<option value="女" <c:if test="${client.c_sex eq '女'}">selected</c:if> >女</option>
			            </select>
               </div>
                <div class="form-group text-left">
                    <div class="checkbox i-checks">
                        <label class="no-padding">
                           <input type="checkbox" <c:if test="${!empty client.c_create_time}">checked</c:if>
                           ><i></i> 我同意注册协议</label>
                    </div>
                </div>
                <button type="button" class="btn btn-primary block full-width m-b" onclick="toSub()">注 册</button>
                <p class="text-muted text-center">
	                <small style="color:#000;font-size:15px">已经有账户了？</small>
	                <a href="clientLogin" style="color:#ff6;font-size:15px;">点此登录</a>
	                
                </p>
                 <span style="color:red;font-size:18px" id="msg">${msg}</span>
            </form>
        
    </div>

    <!-- 全局js -->
    <script src="resource/js/jquery.min.js?v=2.1.4"></script>
    <script src="resource/js/bootstrap.min.js?v=3.3.6"></script>
    <!-- iCheck -->
    <script src="resource/js/plugins/iCheck/icheck.min.js"></script>
    <script src="resource/js/jquery.md5.js"></script>
    <script>
        $(document).ready(function () {
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
        });
    </script>
	<script>
		function toSub(){
			//校验数据
			var c_account=$.trim($("input[name='c_account']").val());
			var c_password=$.trim($("input[name='c_password']").val());
			var c_password2=$.trim($("input[name='c_password2']").val());
			var c_tel=$.trim($("input[name='c_tel']").val());
			var c_birthday=$.trim($("input[name='c_birthday']").val());
			var c_name=$.trim($("input[name='c_name']").val());
			var c_sex=$.trim($("select[name='c_sex']").val());
			var flag=$("input[type='checkbox']").prop("checked");
			if(!c_account){
				$("#msg").html("账号不能为空");
				return;
			}
			
			if(!c_password){
				$("#msg").html("密码不能为空");
				return;
			}
			if(!c_password2){
				$("#msg").html("请确认密码");
				return;
			}
			if(!c_name){
				$("#msg").html("昵称不能为空");
				return;
			}
			if(!c_tel){
				$("#msg").html("手机号不能为空");
				return;
			}
			if(!c_birthday){
				$("#msg").html("请选择出生日期");
				return;
			}
			if(!c_sex){
				$("#msg").html("请选择性别");
				return;
			}
			if(!flag){
				$("#msg").html("请同意协议!");
				return;
			}
			//正则校验账号密码
			var accoutExp=/^[a-zA-Z][a-zA-Z0-9_]{4,15}$/;
			if(!accoutExp.test(c_account))
			{
				$("#msg").html("账号格式不正确!(字母开头，允许5-16字节，允许字母数字下划线)");
				return;
			}
			//正则校验密码
			var passwordExp=/^[a-zA-Z]\w{5,17}$/;
			if(!passwordExp.test(c_password))
			{
				$("#msg").html("密码格式不正确!(以字母开头，长度在6~18之间，只能包含字母，数字和下划线)");
				return;
			}
			//前后密码是否一致
			if(c_password!=c_password2){
				$("#msg").html("前后密码不一致!");
				return;
			}
			
			//正则校验手机号
			var telExp=/^[1][3,4,5,7,8][0-9]{9}$/;
			if(!telExp.test(c_tel)){
				$("#msg").html("手机号不正确!");
				return;
			}
			
			//md5加密
			$("input[name='c_password']").val($.md5(c_password));
			//提交表单
			$("#myForm").submit();
		}
		
		//回车提交表单
		$(document).keydown(function(e){
			if(e.keyCode==13){
				toSub();
			}			
		});
		
		//清除错误信息
		function clearError(){
			$("#msg").html("");
		}
	</script>

</body>

</html>
