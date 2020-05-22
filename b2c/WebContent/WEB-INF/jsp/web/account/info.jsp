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
    <title>个人资料</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">
    <link rel="shortcut icon" href="favicon.ico"> <link href="resource/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="resource/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="resource/css/animate.css" rel="stylesheet">
    <link href="resource/css/style.css?v=4.1.0" rel="stylesheet">
</head>
<body>
<form id="myForm" enctype="multipart/form-data">
	<div class="col-md-12" >
	   <input type="hidden"  name="c_id" value="${c.c_id}">
	     <div class="form-group" >
	        <label class="col-sm-2">用户头像</label>
	        <div class="col-sm-9">
				<input type="file" onchange="filechange(event)" style="display:none;"  name="c_photo" id="g_logo" class="form-control">
				<img id="img-change" style="border-radius:50%;" width="120px" height="120px" alt="用户头像" src="${c.c_photo}" width="200px" height="200px" onclick="fileClick()"/>        
			</div>
	    </div>
	   <div class="form-group" >
	        <label class="col-sm-2">账号</label>
	        <div class="col-sm-9">
	            <input type="text" name="c_account" value="${c.c_account}" readonly class="form-control" onblur="clearError()" >
	        </div>
	    </div>
	    <div class="form-group" >
	        <label class="col-sm-2">昵称</label>
	        <div class="col-sm-9">
	            <input type="text" name="c_name"  value="${c.c_name}" class="form-control" onblur="clearError()">
	        </div>
	    </div>
	    <div class="form-group">
	        <label class="col-sm-2">联系方式</label>
	        <div class="col-sm-9">
	            <input type="number"  maxlength="11" name="c_tel" value="${c.c_tel}" class="form-control"  onblur="clearError()"> 
	        </div>
	    </div>
	    <div class="form-group">
	        <label class="col-sm-2">性别</label>
	        <div class="col-sm-9">
	            <select class="form-control" name="c_sex" onchange="clearError()">
	            	<option value="">==请选择性别==</option>
	            	<option value="男"
	            		<c:if test="${c.c_sex eq '男'}">selected</c:if>
	            	>男</option>
	            	<option value="女"
	            		<c:if test="${c.c_sex eq '女' }">selected</c:if>
	            	>女</option>
	            </select>
	        </div>
	    </div>
	    <div class="form-group">
	        <label class="col-sm-2">出生年月</label>
	        <div class="col-sm-9">
	            <input type="date" name="c_birthday"  value="${c.c_birthday}" class="form-control"> 
	        </div>
	    </div>
	    <input type="hidden" name="c_old_photo" value="${c_old_photo}"/>
		<div class="form-group" >
			<label class="col-sm-2"></label>
			<div class="col-sm-9">
				<button class="btn btn-md btn-success" id="btn" style="margin-top:20px">确认修改</button>
				<br/><br/>
				<span id="msg" style="color:red;font-size:18px"></span>
			</div>
		</div>
	</div>
</form>
   <!-- 全局js -->
   <script src="resource/js/jquery.min.js?v=2.1.4"></script>
   <script src="resource/js/bootstrap.min.js?v=3.3.6"></script>
   <script src="resource/layer/layer.js"></script>
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
	
   //设置样式
   $(function(){
	  $(".form-control").css("margin-top","20px");
	  $(".col-sm-2").css("margin-top","20px");
   });
   //点击触发ajax数据提交
   $("#btn").click(function(){
	   var c_id=$("input[name='c_id']").val();
	   var c_account=$.trim($("input[name='c_account']").val());
	   var c_name=$.trim($("input[name='c_name']").val());
	   var c_sex=$.trim($("select[name='c_sex']").val());
	   var c_tel=$.trim($("input[name='c_tel']").val());
	   var c_birthday=$("input[name='c_birthday']").val();
		var c_photo=$("img").attr("src");
		if(!c_photo){
			$("#msg").html("请上传头像!");
			return;
		}
		
		if(!c_name){
			$("#msg").html("昵称不能为空!");
			return;
		}
		if(!c_sex){
			$("#msg").html("性别不能为空!");
			return;
		}
		if(!c_tel){
			$("#msg").html("联系方式不能为空!");
			return;
		}
		if(!c_birthday){
			$("#msg").html("请选择出生日期!");
			return;
		}
		//正则校验手机号
	    if(!isPhone(c_tel)){
	    	$("#msg").html("手机号输入不正确!");
	   		return;
	    }
		//提交表单
		$("#myForm").attr({"action":"clientInfo.a","method":"post"});
		$("#myForm").submit();
		
		
	/* //ajax提交数据
	$.post("clientInfo.a",{"c_id":c_id,"c_account":c_account,"c_name":c_name,"c_sex":c_sex,"c_tel":c_tel,"c_birthday":c_birthday},function(data){
		if(data.msg){
			top.layer.alert(data.msg,{icon:"1",end:function(){
				window.parent.location.reload();
			}});
		}else{	
			top.layer.alert(data.msg,{icon:"2",end:function(){
				window.location.reload();
			}});
		}
	},"json") */
	
	
	   
   });
   
   
   //清除错误函数
   function clearError(){
	   $("#msg").html("");
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
	   
   
   
   
   </script>
</body>
</html>