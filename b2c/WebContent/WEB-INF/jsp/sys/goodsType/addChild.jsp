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
	<!-- 父菜单 -->
	<div class="col-md-12" style="margin-top:20px">
	    <div class="form-group">
	        <label class="col-sm-3 control-label">父类商品类别:</label>
	        <div class="col-sm-9">
	            <input type="text"  class="form-control"  value="${map.gt_name}" readonly > 
	    	</div>
	    </div>
	</div>
	<!-- 父商品id -->
	<input type="hidden" name="gt_parent_id" value="${gt_id}"/>
	<!-- 子菜单 -->
	<div class="col-md-12" style="margin-top:20px">
	    <div class="form-group">
	        <label class="col-sm-3 control-label">父类商品类别:</label>
	        <div class="col-sm-9">
	            <input type="text" name="gt_name" class="form-control" placeholder="请输入名称" onfocus="clearError()"> 
	    	</div>
	    </div>
	</div>
	
	<div class="col-sm-12">
		<div class="from-group">
			<label class="col-sm-3 control-label"></label>
			<input type="button" class="btn btn-md btn-info" style="float:left;margin-left:18px" id="btn" value="确 认 添 加 "/>
			<span id="msg" style="color:red;font-size:24px;float:left;margin-left:20px"></span>
		</div>
	</div>	



   <!-- 全局js -->
   <script src="resource/js/jquery.min.js?v=2.1.4"></script>
   <script src="resource/js/bootstrap.min.js?v=3.3.6"></script>
   <script src="resource/layer/layer.js"></script>
   <script>
   $("#btn").click(function(){
  		//校验数据
  		var gt_name=$.trim($("input[name='gt_name']").val());
  		var gt_parent_id=$("input[name='gt_parent_id']").val();
  		if(!gt_name){
  			$("#msg").html("商品名称不能为空!");
  			return;
  		}
  		//ajax上传数据
  		$.post("addChild.do",{"gt_name":gt_name,"gt_parent_id":gt_parent_id},function(data){
  			if(data.flag){
  				layer.alert(data.msg,{icon:1});
  				
  			}else{
  				$("#msg").html(data.msg);
  				}
  			
  		},"json");
  		top.layer.closeAll();	
  	});
  	//清除错误信息
  function clearError(){
	$("#msg").html("");	   
  }
   
   
   </script>
</body>
</html>