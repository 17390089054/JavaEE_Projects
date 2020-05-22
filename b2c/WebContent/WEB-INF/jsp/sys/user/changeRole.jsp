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
    <title>修改用户角色</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">
    <link rel="shortcut icon" href="favicon.ico"> <link href="resource/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="resource/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="resource/css/animate.css" rel="stylesheet">
    <link href="resource/css/style.css?v=4.1.0" rel="stylesheet">
</head>
<body>
<!-- 角色修改模块 -->
	<div class="col-md-12" style="margin-top:20px">
	    <div class="form-group">
	        <label class="col-sm-3 control-label">用户角色:</label>
	        <div class="col-sm-9">
	            <select class="form-control" name="role_id" onchange="clearError()">
	            	<option value="0">==请选择角色名称==</option>
	            	<c:forEach items="${list}" var="u">
	            		<c:if test="${u.role_id!=1}">
	            			<option value="${u.role_id}"
	            				<c:if test="${u.role_id eq user_role_id}">selected</c:if>
	            			>${u.role_name}</option>
	            		</c:if>
	            	</c:forEach>
	            </select>
	        </div>
	    </div>
	</div>
	<div class="col-md-12" style="margin-top:40px">
		<div class="col-sm-9">
	    	<button class="btn btn-md btn-primary" style="width:100%" onclick="reviseRole(${user_id})"> 确 认 修 改 </button>
		</div>
		<span id="msg" style='color:red;font-size:25px'></span>
	</div>
		
   <!-- 全局js -->
   <script src="resource/js/jquery.min.js?v=2.1.4"></script>
   <script src="resource/js/bootstrap.min.js?v=3.3.6"></script>
   <script src="resource/layer/layer.js"></script>
   <script>
   		//改变角色
   		function reviseRole(user_id){
   			//获取选择框的值
   			var role_id=$("select[name='role_id']").val();
   			if(role_id==0){
   				$("#msg").html("请选择角色名称!");
   			}else{
   				//ajax完成修改任务
   				$.post("userRoleChange.do",{"role_id":role_id,"user_id":user_id},function(data){
   					if(data.flag){
   						top.layer.msg(data.msg,{icon:1,time:1000,end:function(){
   							top.layer.closeAll();
   						}});
   					}else{
   						top.layer.msg(data.msg,{icon:2,time:1000,end:function(){
   							top.layer.closeAll();
   						}});
   						}
   				},"json");
   			}
   			
   		}
   		//清除错误
   		function clearError(){
   			$("#msg").html("");
   		}
   
   </script>
   
   
</body>
</html>