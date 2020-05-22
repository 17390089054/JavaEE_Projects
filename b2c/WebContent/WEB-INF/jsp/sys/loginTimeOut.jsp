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
    <title>登录超时</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">
    <link rel="shortcut icon" href="favicon.ico"> <link href="resource/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="resource/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <link href="resource/css/animate.css" rel="stylesheet">
    <link href="resource/css/style.css?v=4.1.0" rel="stylesheet">
    <script>if(window.top !== window.self){ window.top.location = window.location;}</script>

</head>

<body class="gray-bg">

    <div class="lock-word animated fadeInDown">
    </div>
    <div class="middle-box text-center lockscreen animated fadeInDown">
        <div>
            <div class="m-b-md">
                <img alt="image" class="img-circle circle-border" src="${user.user_photo }" width="200px" height="200px">
            </div>
            <h3>${user.user_name}</h3>
            <p>您需要再次输入密码</p>
            <form class="m-t" role="form" action="TimeOut.do" method="post">
                <div class="form-group">
                    <input type="password" class="form-control" name="password" value="${user.password}" onfocus="clearError()" onblur="checkPassword()">
                </div>
                <button type="button" class="btn btn-primary block full-width">登录到系统</button>
                <span id="msg">${msg}</span>
            </form>
        </div>
    </div>

    <!-- 全局js -->
    <script src="resource/js/jquery.min.js?v=2.1.4"></script>
    <script src="resource/js/bootstrap.min.js?v=3.3.6"></script>
    <script>
	$("#msg").css({"color":"red","font-size":"20px"});
    //检查密码
    function checkPassword(){
    	var flag=true;
		if($.trim($("[name='password']").val())==""){

			$("#msg").html("密码不能为空");
			flag=false;
		}
		return flag;			
	}
    //清除错误信息
    function clearError(){
    	$("#msg").html("");  	
    }
    
    //提交表单
    $(":button").click(function(){
    	if(checkPassword()){
    		$("[role='form']").submit();
    	}
    })
    //回车键提交表单
    $(document).keydown(function(e){
    	if(e.keyCode==13){
    		$(":button").click();
    	}
    	
    	
    })
    
    
    
    </script>
	

</body>

</html>
