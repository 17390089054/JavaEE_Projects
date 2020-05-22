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
	<!-- Meta -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="renderer" content="webkit">
	<title>用户资料修改</title>
	<!-- CSS文件 -->
	<link href="resource/css/bootstrap.min.css" rel="stylesheet">
	<link href="resource/css/font-awesome.css" rel="stylesheet">
	<link href="resource/css/animate.css" rel="stylesheet">
	<link href="resource/css/plugins/dropzone/basic.css" rel="stylesheet">
	<link href="resource/css/plugins/dropzone/dropzone.css" rel="stylesheet">
	<link href="resource/css/style.css" rel="stylesheet"> 
	<link rel="stylesheet" type="text/css" href="resource/css/plugins/simditor/simditor.css" />
	</head>
<body class="gray-bg">
  <div class="row">
	<div class="col-sm-12">
	 <div class="ibox float-e-margins">
	   <div class="ibox-content">
		 <!-- 用户表单 -->
		  <form id="myForm" method="post" action="UserRevise.do" class="form-horizontal" enctype="multipart/form-data">
	   		<!-- 用户ID -->
	       	<input type="hidden" name="user_id" value="${user.user_id}">
	        <div class="form-group">
	            <div class="col-sm-5">
				        <div style="float:left">
			            	 <input type="file" onchange="filechange(event)" style="display:none;"  name="user_photo" id="g_logo" class="form-control">
			            	<img id="img-change" style="border-radius:50%;" width="120px" height="120px" alt="用户头像" src="${user.user_photo}" width="200px" height="200px" onclick="fileClick()"/>
			            </div>
	              
			            <div style="float:left;margin-left:60px;margin-top:30px">
			            	<p>
			            		<c:if test="${user.user_sex eq '男' }">
			            			 <i class="fa fa-mars"></i> <b><span style="font-size:13px">${user.user_sex }</span></b>
			            		</c:if>
			            		<c:if test="${user.user_sex eq '女' }">
			            			<i class="fa fa-venus"></i><b> <span style="font-size:13px">${user.user_sex }</span></b>
			            		</c:if>
			            	</p>
			            	<p><label class="badge badge-primary"><b><span style="font-size:13px">${user.role_name }</span></b></label> </p>
			            	<p>
			            		<c:if test="${user.user_status eq 1}">
			            			<label class="label label-info"><b><span style="font-size:13px">在职</span></b></label>
			            		</c:if>
			            		<c:if test="${user.user_status eq 0}">
			            			<label class="label label-warning"><span style="font-size:13px">离职</span></label>
			            		</c:if>
			            	</p>
			            </div>
		            
		          
	            </div>
	            <!-- 原用户头像 -->
	            <input type="hidden" name="old_user_photo" value="${old_user_photo}">
	        </div>
	        <div class="form-group">
	            <label class="col-sm-2 control-label">用户昵称</label>
	
	            <div class="col-sm-5">
	                <input type="text" name="user_name"  value="${user.user_name}" class="form-control" onfocus="clearError()">
	            </div>
	        </div>
	 
	        <div class="form-group">
	            <label class="col-sm-2 control-label">联系方式</label>
	
	            <div class="col-sm-5">
	                <input type="number" maxlength="11" name="user_tel"  min="0" value="${user.user_tel}" class="form-control" onfocus="clearError()">
	            </div>
	        </div>
	        <div class="form-group">
	            <label class="col-sm-2 control-label">电子邮件</label>
	
	            <div class="col-sm-5">
	                <input type="email" name="user_email" value="${user.user_email}" min="0" class="form-control" onfocus="clearError()">
	            </div>
	        </div>
	        <div class="form-group">
	            <div class="col-sm-4 col-sm-offset-2">
	                <button class="btn btn-primary" type="button" onclick="toSub()">确定修改</button>
	                <span id="msg" style="color:red;font-size:20px"></span>
	            </div>
	        </div>
	    </form>
	   </div>
	 </div>
	</div>
   </div>
	<!-- 全局js -->
	<script src="resource/js/jquery.min.js?v=2.1.4"></script>
	<script src="resource/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="resource/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="resource/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="resource/js/plugins/layer/layer.min.js"></script>
	<!-- 自定义js -->
	<script src="resource/js/content.js?v=1.0.0"></script>
	<!-- 第三方插件 -->
	<script src="resource/js/plugins/pace/pace.min.js"></script>
	<script src="resource/layer/layer.js"></script>
	<!-- DROPZONE -->
	<script src="resource/js/plugins/dropzone/dropzone.js"></script>
	<script>
	//图片点击事件
	function fileClick(){
		$("#g_logo").click();
	}
	//显示选择的图片
	function filechange(event){
	    var files = event.target.files;
	    var file;
	    if (files && files.length > 0) {
	        // 获取目前上传的文件
	        file = files[0];// 文件大小校验的动作
	    
	        //校验文件的类型(jpg,jpeg,png,gif)
			if(!checkFileExt(file.name)){
				alert("文件格式必须为jpg,jpeg,png,gif");
				return false;
			}	  
	        
	       	if(file.size > 1024 * 1024 * 2) {
	            alert('图片大小不能超过 2MB!');
	            return false;
	        }
	        // 获取 window 的 URL 工具
	        var URL = window.URL || window.webkitURL;
	        // 通过 file 生成目标 url
	        var imgURL = URL.createObjectURL(file);
	        console.log(imgURL);
	        //用attr将img的src属性改成获得的url
	        $("#img-change").attr("src",imgURL);
	        // 使用下面这句可以在内存中释放对此 url 的伺服，跑了之后那个 URL 就无效了
	        // URL.revokeObjectURL(imgURL);
	    }
	}
	
	 //3、（字符）检查文件上传表单控件，如果含有[jpg,jpeg,gif,png]则显示“文件类型合法”，否则“显示文件类型错误”
    function checkFileExt(filename){
	     var flag = false; //状态
	     var arr = ["jpg","png","jpeg","gif"];
	     //取出上传文件的扩展名
	     var index = filename.lastIndexOf(".");
	     var ext = filename.substr(index+1);
	     //循环比较
	     for(var i=0;i<arr.length;i++)
	     {
	      if(ext == arr[i])
	      {
	       flag = true; //一旦找到合适的，立即退出循环
	       break;
	      }
	     }
	    return flag;
    }
	
	//提交方法
	function toSub(){
		//校验数据
		var user_name=$.trim($("input[name='user_name']").val());
		var user_tel=$.trim($("input[name='user_tel']").val());
		var user_email=$.trim($("input[name='user_email']").val());
		var user_photo=$("img").attr("src");
		if(!user_name){
			$("#msg").html("用户昵称不能为空!");
			return;
		}
		
		if(!user_tel){
			$("#msg").html("联系方式不能为空!");
			return;
		}
		
		if(!user_email){
			$("#msg").html("电子邮件不能为空!");
			return;
		}
		if(!user_photo){
			$("#msg").html("请上传用户头像!");
			return;
		}
		//正则表达式校验手机号和email
		var telExp=/^[1][3,4,5,7,8][0-9]{9}$/;
		if(!telExp.test(user_tel)){
			$("#msg").html("请输入合法手机号!");
			return;
		}
		var emailExp=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
		if(!emailExp.test(user_email)){
			$("#msg").html("请输入合法邮箱!");
			return;
		}
		//提交表单
		$("#myForm").submit();
	}
	
	function clearError(){
		$("#msg").html("");
	}
	
	
	
	
	
	</script>	
</body>
</html>