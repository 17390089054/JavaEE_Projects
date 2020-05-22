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
	    <title>用户添加</title>
	    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
	    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">
	    <link rel="shortcut icon" href="favicon.ico"> <link href="resource/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
	    <link href="resource/css/font-awesome.css?v=4.4.0" rel="stylesheet">
	    <link href="resource/css/animate.css" rel="stylesheet">
	    <link href="resource/css/style.css?v=4.1.0" rel="stylesheet">
	</head>
	<body>
		<!-- 用户添加模块 -->
		<div class="col-md-12" style="margin-top:20px">
			 <div class="form-group">
		        <label class="col-sm-3 control-label">用 户 名 :</label>
		        <div class="col-sm-9">
		            <input type="text" name="account" class="form-control" placeholder="请输入用户名"> 
		        </div>
		    </div>
		    <div class="form-group">
		        <label class="col-sm-3 control-label">密 码 :</label>
		        <div class="col-sm-9">
		            <input type="password" class="form-control" name="password" value="123456">
		        </div>
		    </div>
		    <div class="form-group"> 
		        <label class="col-sm-3 control-label">用 户 昵 称 :</label>
		        <div class="col-sm-9">
		            <input type="text" name="user_name" class="form-control" placeholder="请输入昵称"> 
		        </div>
		    </div>
		    <div class="form-group">
		        <label class="col-sm-3 control-label">用 户 角 色 :</label>
		        <div class="col-sm-9">
		            <select class="form-control" name="user_role_id">
		            	<option value="0">==请选择角色名称==</option>
		            	<c:forEach items="${roleList}" var="r">
		            		<c:if test="${r.role_id != 1}">
		            			<option value="${r.role_id}">${r.role_name }</option>
		            		</c:if>
		            	</c:forEach>
		            </select>
		        </div>
		    </div>
		    <div class="form-group">
		        <label class="col-sm-3 control-label">性 别 :</label>
		                <input type="radio"  value="男" name="user_sex">男 &nbsp;&nbsp;&nbsp;
		                <input type="radio" value="女"  name="user_sex">女
		    </div>
		 	    
		    <div class="from-group">
		    	 <div class="col-sm-9">
		    		<button class="btn btn-md btn-primary" style="width:100%" onclick="toSub()">添加</button>
		    		<span id="msg" style="font-size:20px;color:red"></span>
		    	</div>
		    	
		    </div>
		
		</div>
		
		
	<!-- 全局js -->
    <script src="resource/js/jquery.min.js?v=2.1.4"></script>
    <script src="resource/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="resource/layer/layer.js"></script>
	
	<script>
		//提交数据
		function toSub(){
			//获取校验数据有效性
			var account=$.trim($("input[name='account']").val());
			var password=$.trim($(":password").val());
			var user_name=$.trim($("input[name='user_name']").val());
			//var user_sex=$("input:radio[name='user_sex']:checked").val();
			var user_sex=$("input[name='user_sex']:checked").val();
			var user_role_id=$("select[name='user_role_id']").val();
			
			if(!account){
				$("#msg").html("用户名不能为空!");
				$("input[name='account']").focus();
				return;
			}
			if(!password){
				$("#msg").html("密码不能为空!");
				$("input[name='password']").focus();
				return;
			}
			if(!user_name){
				$("#msg").html("用户昵称不能为空!");
				$("input[name='user_name']").focus();
				return;
			}
			
			if(user_role_id==0){
				$("#msg").html("尚未选择角色!");
				return;
			}
			
			if(!user_sex){
				$("#msg").html("请选择性别!");
				return;
			}
			//利用ajax上传数据
			$.ajax({
				url:"userAdd.do",//路径
				type:"post",//方式
				data:{"account":account,"password":password,"user_name":user_name,"user_sex":user_sex,"user_role_id":user_role_id},//上传数据格式
				dataType:"json",
				success:function(data){
					if(data.flag){
						layer.alert("添加成功!",{icon:1,end:function(){
							top.layer.closeAll();
							window.location.reload();
						}});						 
					}else{
						$("#msg").html(data.msg);
					}
					
				},
				error:function(){
					console.log("传输失败了!");
				}
			});
			
			
			
			
		}
	
	
	</script>	
		
	
		
		
		
		
		
		
	</body>
</html>