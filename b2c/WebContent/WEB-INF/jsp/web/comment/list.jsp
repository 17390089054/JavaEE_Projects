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
    <title>H+ 后台主题UI框架 - 时间轴</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">
    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="resource/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="resource/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="resource/css/animate.css" rel="stylesheet">
    <link href="resource/css/style.css?v=4.1.0" rel="stylesheet">
</head>

<body class="gray-bg">
    <div class="row">
        <div class="col-sm-12">
            <div class="wrapper wrapper-content">
                <div class="row animated fadeInRight">
                <c:if test="${!empty list}">
	              	<c:forEach items="${list}" var="l">
	           		  <div class="col-sm-12">
	                     <div class="ibox float-e-margins">
	                         <div class="" id="ibox-content">
	                             <div id="vertical-timeline" class="vertical-container light-timeline">
	                                 <div class="vertical-timeline-block">
	                                     <div class="vertical-timeline-icon navy-bg">
	                                         <i class="fa fa-briefcase"></i>
	                                     </div>
	
	                                     <div class="vertical-timeline-content">
	                                         <div style="float:left;margin:20px 5px">
			                                 <a href="javascript:;" onclick="top.location.href='item?g_id=${l.gc_goods_id }'" class="pull-left">
	                                         <img class="img-circle" width="50px" height="50px" src="${l.g_logo }">
	                                         </a>
	                                         </div>
	                                         <div style="float:left;margin:20px 5px">
	                                         	<a href="javascript:;" onclick="top.location.href='item?g_id=${l.gc_goods_id }'" class="pull-left">
	                                         		<span style="font-size:18px;color:#664">${l.g_name}</span><br/>
	                                         		<span style="font-size:15px;color:#666">￥${l.g_price}</span>
	                                         	</a>
	                                         </div>
	                                         <div style="float:left;margin:20px 10px">
	                                         	<div style="width:180px">
	                                         	<p>
	                                         	 ${l.gc_content}
	                                         </p>
	                                         </div>
	                                         </div>
	                                         <div style="float:left;margin:30px 12px">
	                                         	<span style="color:#66f;font-size:15px">${l.gc_create_time }</span>
	                                         </div>
	                                        <div style="float:right;margin:25px 15px">
	<%--                                         	<button class="btn btn-md btn-danger" onclick="deleteComment(${l.gc_id})">&nbsp;删 除&nbsp;</button>
	 --%>                                        </div>
	                                     </div>
	                                 </div>
	                             </div>
	                         </div>
	                     </div>
	                 </div>
	             </c:forEach>
	           </c:if>
	           <c:if test="${empty list}">
	           	<h1 style="display:block;margin-left:350px;color:lightblue">暂无数据</h1> 
	           </c:if>
            </div>
        </div>
      </div>
  </div>

    <!-- 全局js -->
    <script src="resource/js/jquery.min.js?v=2.1.4"></script>
    <script src="resource/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="resource/layer/layer.js"></script>
    <!-- 自定义js -->
    <script src="resource/js/content.js?v=1.0.0"></script>
    <script>
        $(document).ready(function () {

            // Local script for demo purpose only
            $('#lightVersion').click(function (event) {
                event.preventDefault()
                $('#ibox-content').removeClass('ibox-content');
                $('#vertical-timeline').removeClass('dark-timeline');
                $('#vertical-timeline').addClass('light-timeline');
            });

            $('#darkVersion').click(function (event) {
                event.preventDefault()
                $('#ibox-content').addClass('ibox-content');
                $('#vertical-timeline').removeClass('light-timeline');
                $('#vertical-timeline').addClass('dark-timeline');
            });

            $('#leftVersion').click(function (event) {
                event.preventDefault()
                $('#vertical-timeline').toggleClass('center-orientation');
            });
        });
    </script>
    <script>
    	//删除评论
    	function deleteComment(gc_id){
    		top.layer.confirm("确定要删除这条评论!",{icon:3,btn:['YES','NO']},function(){
    			$.post("deleteComment.a",{"gc_id":gc_id},function(data){
    				if(data.flag){
    					top.layer.alert(data.msg,{icon:1,end:function(){
    						window.location.reload();
    					}});
    				}else{
    					top.layer.alert(data.msg,{icon:2,end:function(){
    						window.location.reload();
    					}});
    				}
    			},"json");	
    		},function(){
    		
    		});
    	}
    
    </script>
</body>

</html>
