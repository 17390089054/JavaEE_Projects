<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>    
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
    <title>添加评价</title>
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
                        <div class="row">
                            <div class="col-sm-12">
                                <div  class="panel blank-panel">
                                    <div style="float:left">
                                    	<img src="${goods.g_logo}" class="img-circle" width="90px" height="90px"/>
                                    </div>
                                    <div style="float:left;margin-left:20px;margin-top:20px">
                                    	<strong><span style="font-size:20px;color:#660"> &nbsp; ${goods.g_name}</span></strong><br/>
                                    	<strong><span style="font-size:16px;color:#668">￥${goods.g_price}</span></strong>
                                    </div>
                                    <div style="float:left;margin-left:20px;margin-top:25px">
                                    	<span style="font-size:18px;color:#668">￥${goods.g_price+10 }</span>
                                    </div>
                                    <div style="float:left;margin-left:25px;margin-top:28px">
                                    	<span style="font-size:15px;color:#666"><i class="fa fa-map-marker"></i> ${goods.g_addr}</span>
                                    </div>
                                    <div style="float:left;margin-left:30px;margin-top:28px">
                                    	<span style="font-size:15px;color:#666">${goods.g_create_time }</span>
                                    </div>
                                </div>
                            </div>
                        </div>
	                	<div class="row m-t-sm"> 
	                            <div class="col-sm-13">
	                               <div class="panel blank-panel">
	                               <input type="hidden" name="go_id" value="${go_id}">
	                               <input type="hidden" name="c_id" value="${c_id}"/>
	                               <input type="hidden" name="g_id" value="${goods.g_id}"/>
										<div class="col-sm-12">
	                                    	<textarea id="editor" name="g_desc" placeholder="这里输入您的评价"  autofocus></textarea>
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
    <!-- 自定义js -->
    <script src="resource/js/content.js?v=1.0.0"></script>
    <script src="resource/layer/layer.js"></script>
    <script>
    //富文本编辑器
    $(function () {
        var editor = new Simditor({
            textarea: $('#editor'),
            defaultImage: 'resource/img/a9.jpg'
        });
    });
    //发布评价
    function toSub(){
    	var c_id=$("input[name='c_id']").val();
    	var g_id=$("input[name='g_id']").val();
    	var g_desc=$.trim($("textarea").val());
    	var go_id=$("input[name='go_id']").val();
    	if(!g_desc){
    		$("#msg").html("评价不能为空!");
    		return;
    	}
    	//提交信息
    	$.post("addComment.a",{"gc_client_id":c_id,"gc_goods_id":g_id,"go_id":go_id,"gc_content":g_desc},function(data){
    		if(data.msg){
    			top.layer.alert(data.msg,{icon:1,end:function(){
    				window.parent.location.reload();	
    			}});
    		}else{
    			top.layer.alert(data.msg,{icon:2,end:function(){
    				window.location.reload();	
    			}});
    		}
    	},"json");
    }
    
    function clearError(){
    	$("#msg").html("");
    }
    </script>
</body>

</html>
