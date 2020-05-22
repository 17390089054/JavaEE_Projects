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
    <link rel="shortcut icon" href="favicon.ico"> <link href="resource/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="resource/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="resource/css/animate.css" rel="stylesheet">
    <link href="resource/css/style.css?v=4.1.0" rel="stylesheet">
   
</head>
<body>
   <div class="col-md-9" style="margin:40px auto">
	    <div class="form-group">
	        <div class="col-sm-4">
	            <input type="password" class="form-control" name="password"  style="font-size:18px" placeholder="请输入6位数字密码" onfocus="clearError()">
	        	<input type="hidden" value="${go_id}" name="go_id">
	        </div>
	    </div>
	    <div class="form-group">
	    	<div class="col-sm-9">
	    		 <button class="btn btn-md btn-success" style="width:100%;margin-top:20px" onclick="toPay(${go_id})">确认支付</button>
	    	<span id="msg" style="font-size:18px;color:#954e2fd4"></span>
	    	</div>
	    	
	    </div>
	</div>
   <!-- 全局js -->
   <script src="resource/js/jquery.min.js?v=2.1.4"></script>
   <script src="resource/js/bootstrap.min.js?v=3.3.6"></script>
   <script src="resource/layer/layer.js"></script>
   <script>
   //支付
   	function toPay(go_id){
   		//校验密码是否为空!
   		var psw=$.trim($("input[name='password']").val());
   		if(!psw){
   			$("#msg").html("密码不能为空!");
   			return;
   		}
   		if(psw.length!=6){
   			$("#msg").html("密码长度为6位!");
   			return;
   		}
   		if(!checkNumber(psw)){
   			$("#msg").html("密码必须全为数字!");
   			return;
   		}
   		//默认密码123456
   		if(psw=='123456'){
   			//修改订单状态
   			$.post("clientPay",{"go_id":go_id},function(data){
   				if(data.flag){
   					 layer.alert(data.msg,{icon:1,end:function(){
   	   				top.layer.closeAll();
   	   			}}); 
   				}else{
   				 layer.alert(data.msg,{icon:2,end:function(){
    	   				top.layer.closeAll();
    	   			}}); 
   				}
   			},"json");
   			
   			
   			
   			
   		}else{
   			$("#msg").html("密码输入错误!");
   		}
   		
   		
   		
   		
   	}
   
   //清除错误信息
   function clearError(){
	   $("#msg").html("");
   }
   //正则校验输入字符串是否为数字
   function checkNumber(number){
	   var testExp=/^[0-9]*$/;
	   if(testExp.test(number)){
		   return true;
	   }
	   return false;
   }
   
   //键盘点击提交数据
   $(document).keydown(function(e){
	   if(e.keyCode==13){
		   toPay();
	   }
   })
   
   
   </script>
</body>
</html>