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
    <title>请输入标题</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">
    <link rel="shortcut icon" href="favicon.ico"> <link href="resource/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="resource/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="resource/css/animate.css" rel="stylesheet">
    <link href="resource/css/style.css?v=4.1.0" rel="stylesheet">
</head>
<body>
	<form id="myForm">
		<div class="col-md-12" style="margin-top:20px">
		    <div class="form-group">
		        <label class="col-sm-3 control-label">省份</label>
		        <div class="col-sm-9">
		            <select class="form-control" name="a_province_id" onchange="getCity()">
		            	<option value="0">==请选择省份==</option>
		            	<c:forEach items="${list}" var="l">
		            		<option value="${l.province_id}">${l.province_name}</option>
		            	</c:forEach>
		            </select>
		        </div>
		    </div>
		    <div class="form-group">
		        <label class="col-sm-3 control-label">城市</label>
		        <div class="col-sm-9">
		            <select class="form-control" name="a_city_id" onchange="getArea()">
		            	<option value="0">==请选择城市==</option>
		            </select>
		        </div>
		    </div>
		    <div class="form-group">
		        <label class="col-sm-3 control-label">地区</label>
		        <div class="col-sm-9">
		            <select class="form-control" name="a_area_id" onchange="clearError()">
		            	<option value="0">==请选择区域==</option>
		            </select>
		        </div>
		    </div>
		    
		    <div class="form-group">
		        <label class="col-sm-3 control-label">详细地址</label>
		        <div class="col-sm-9">
		            <input type="text" name="a_desc" class="form-control" placeholder="请输入您的详细地址" onfocus="clearError()"> 
		        </div>
		    </div>
		    <div class="form-group">
		        <label class="col-sm-3 control-label">联系方式</label>
		        <div class="col-sm-9">
		            <input type="number" name="a_tel" class="form-control" maxlength="11" placeholder="请输入您的手机号" onfocus="clearError()"> 
		        </div>
		    </div>
		    <div class="form-group">
		    	<label class="col-sm-3 control-label"></label>
		    	<div class="col-sm-9">
		    		<button class="btn btn-md btn-primary" style="width:100%;height:35px;font-size:18px" type="button" onclick="toSub()">确 认 添 加</button>
		    	</div>
		    		<span id="msg" style="display:block;margin-left:20px;color:red;font-size:18px">${msg}</span>
		    </div>
		</div>
	</form>

   <!-- 全局js -->
   <script src="resource/js/jquery.min.js?v=2.1.4"></script>
   <script src="resource/js/bootstrap.min.js?v=3.3.6"></script>
   <script src="resource/layer/layer.js"></script>
   <script>
	   //获取城市的方法
	   function getCity(){
		clearError();
		 //清空城市和区域信息
		 $("select[name='a_city_id']").html("<option value='0'>==请选择城市==</option>");
		 $("select[name='a_area_id']").html("<option value='0'>==请选择地区==</option>");
		  var province_id=$("select[name='a_province_id']").val();
		  if(province_id==0){
			  $("#msg").html("请选择省份");
			  return;
		  }
		   $.post("getCity",{"province_id":province_id},function(data){
			  for(var i=0;i<data.length;i++){
				  $("select[name='a_city_id']").append("<option value='"+data[i].city_id+"'>"+data[i].city_name+"</option>");
			  }
		   },"json");		   
	   }
   
	   //获取地区的方法
	   function getArea(){
	   //清除错误信息
	  	clearError();
		  //清除区域信息
		 $("select[name='a_area_id']").html("<option value='0'>==请选择地区==</option>");
		  var city_id=$("select[name='a_city_id']").val();
		  if(city_id==0){
			  $("#msg").html("请选择城市");
			  return;
		  }
		   $.post("getArea",{"city_id":city_id},function(data){
			  for(var i=0;i<data.length;i++){
				  $("select[name='a_area_id']").append("<option value='"+data[i].area_id+"'>"+data[i].area_name+"</option>");
			  }
		   },"json");		   
	   }
   
	   //提交表单
	   function toSub(){
		    var province_id=$("select[name='a_province_id']").val();
		    var city_id=$("select[name='a_city_id']").val();
		    var area_id=$("select[name='a_area_id']").val();
		   	var a_desc=$("input[name='a_desc']").val();
		   	var a_tel=$("input[name='a_tel']").val();
		   	//校验数据的正确性
		   	if(province_id==0){
		   		$("#msg").html("请选择省份!");
		   		return;
		   	}
			if(city_id==0){
		   		$("#msg").html("请选择城市!");
		   		return;
		   	}
			if(area_id==0){
		   		$("#msg").html("请选择地区!");
		   		return;
		   	}
		   	if(!a_desc){
		   		$("#msg").html("请输入详细地址!");
		   		return;
		   	}
		   	if(!a_tel){
		   		$("#msg").html("请输入联系方式!");
		   		return;
		   	}
		   	//正则校验手机号
		    if(!isPhone(a_tel)){
		    	$("#msg").html("手机号输入不正确!");
		   		return;
		    }
		   	//提交表单
			$("#myForm").attr({"action":"addressAdd.a","method":"post"});
		   	$("#myForm").submit();
		   	
	   }
	   
	//校验手机号是否正确
	function isPhone(phone){
		//正则校验手机号
		var telExp=/^[1][3,4,5,7,8][0-9]{9}$/;
		if(telExp.test(phone)){
			return true;
		}
		return false;
	}
	   
	   
	//清除错误信息
	function clearError(){
		 $("#msg").html("");
	}   
	   
	   
   </script>
</body>
</html>