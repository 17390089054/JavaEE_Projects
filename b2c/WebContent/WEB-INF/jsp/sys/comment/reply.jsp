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
    <link rel="stylesheet" type="text/css" href="resource/css/plugins/simditor/simditor.css" />
</head>
<body class="gray-bg">
    <div class="row">
        <div class="col-sm-12">
            <div class="wrapper wrapper-content animated fadeInUp">
                <div class="ibox">
                    <div class="ibox-content">
						<div class="row m-t-sm"> 
				             <div class="col-sm-13">
				                <div class="panel blank-panel">
				                <input type="hidden" name="gc_id" value="${gc_id}">
								<div class="col-sm-12">
					               	<textarea id="editor" name="gc_reply" placeholder="这里输入您的评价"  autofocus></textarea>
					            </div>
				                </div> 
							</div>
				         </div>
				         <div style="margin-top:10px">
				    		<button type="button" class="btn btn-md btn-success" onclick="toSub()"> 提 交 </button>
				         	<span id="msg" style="font-size:15px;color:red">${msg}</span>
				         </div>
				     </div>
				</div>
			</div>
		</div>
	</div> 


   <!-- 全局js -->
   <script src="resource/js/jquery.min.js?v=2.1.4"></script>
   <script src="resource/js/bootstrap.min.js?v=3.3.6"></script>
   <!-- 编辑器 -->
	<!-- simditor -->
	<script type="text/javascript" src="resource/js/plugins/simditor/module.js"></script>
	<script type="text/javascript" src="resource/js/plugins/simditor/uploader.js"></script>
	<script type="text/javascript" src="resource/js/plugins/simditor/hotkeys.js"></script>
	<script type="text/javascript" src="resource/js/plugins/simditor/simditor.js"></script>
   <script src="resource/layer/layer.js"></script>
   <script>
	   //富文本编辑器
	   $(function () {
	       var editor = new Simditor({
	           textarea: $('#editor'),
	           defaultImage: 'resource/img/a9.jpg'
	       });
	   });
   
   		//提交数据
   		function toSub(){
   		var gc_id=$("input[name='gc_id']").val();
   		var gc_reply=$("textarea[name='gc_reply']").val();
   		if(!gc_reply){
   			$("#msg").html("回复不能为空!");
   			return;
   		}
   		//提交表单
   		$.post("reply.do",{"gc_id":gc_id,"gc_reply":gc_reply},function(data){
   			if(data.flag){
   				top.layer.alert(data.msg,{icon:1,end:function(){
   					top.layer.closeAll();
   				}});
   			}else{
   				top.layer.alert(data.msg,{icon:2,end:function(){
   					top.layer.closeAll();
   				}});
   			}
   		},"json");
   		
   		
   	}
   
   
   
   </script>
</body>
</html>