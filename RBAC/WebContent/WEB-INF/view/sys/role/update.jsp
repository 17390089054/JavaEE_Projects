<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html!>
<html>
<base href="<%=basePath%>" />
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>角色新增</title>
	<link href="resource/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="resource/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="resource/css/animate.css" rel="stylesheet">
    <link href="resource/css/style.css?v=4.1.0" rel="stylesheet">
</head>
<body class="gray-bg">
 <div class="wrapper wrapper-content ">
 <form id="myForm" action="sys/role/update" method="post">
   <div class="row">
	 <div class="col-md-6">
	    <div class="form-group">
	        <div class="col-sm-9">
	        	<label class="col-sm-3 control-label">角色名称:</label>
	            <input type="text" name="roleName" id="roleName" value="${requestScope.role.roleName}" class="form-control">
	        </div>
	    </div>

	    <div class="form-group">
	          <div class="col-sm-9">
	        	<label class="col-sm-3 control-label">角色描述:</label>
	            <textarea cols="25" rows="10" name="roleDesc"   class="form-control roleDesc" >${requestScope.role.roleDesc}</textarea>
	      	  </div>
	  	  </div>
		</div>
 	</div>
 	<br/>
 	<div class="row">
 	  <div class="col-md-6">
 	  	<div class="form-group">
 	  		<div class="col-sm-9">
				<button type="button" class="btn btn-md btn-primary" id="btn">确定提交</button>&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn btn-md btn-warning" onclick="javascript:window.parent.location.reload()">取  消</button>
	  			 <div style="width:100%;height:100px;margin-top:20px;text-align:left;font-size:18px;color:#f00">
	  				<span id="msg">${requestScope.msg}</span>
	  			</div>
			</div>
		</div>
	  </div>
	</div>
	<input type="hidden" name="_method" value="put">
	<input type="hidden" name="roleId" value="${requestScope.role.roleId}">
 </form>	
 </div>
	
	<script src="resource/js/jquery.min.js?v=2.1.4"></script>
    <script src="resource/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="resource/js/plugins/layer/layer.min.js"></script>
    <!-- 自定义js -->
    <script src="resource/js/content.js?v=1.0.0"></script>
    <script>
   		$("#btn").click(function(){
   			//角色名称验空
   			var roleName=$.trim($("#roleName").val());
   			if(!roleName){
   				layer.msg("角色名称不能为空!");
   				$("#roleName").focus();
   				return false;
   			}
   			//验证角色描述可以为空
			var roleDesc=$.trim($(".roleDesc").val());   
   		 	if(!roleDesc){
   				layer.msg("角色描述不能为空!");
   				$("#roleDesc").focus();
   				return false;
   			} 
   		 	//提交表单
			$("#myForm").submit();   			
   			
   			
   		});
    
    </script>
    
</body>
</html>