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
    <title>收藏列表</title>
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
        <c:if test="${empty list}"><h1 style="display:block;margin-left:350px;color:lightblue">暂无数据</h1> </c:if>
            <c:if test="${!empty list}">
            <div class="wrapper wrapper-content animated fadeInUp">
            <c:forEach items="${list}" var="l">
                <div class="faq-item">
                    <div class="row">
                        <div class="col-md-7">
                        	<div style="float:left">
                    			<img src="${l.g_logo}" width="80px" height="80px" class="img-circle"/>
                            </div>
                           <div style="float:left;margin-left:20px;width:150px">
	                           	<a data-toggle="collapse" href="javascript:void(0)" class="faq-question">${l.g_name}</a>
	                          	<span style="font-size:16px">￥ ${l.g_price}</span>
                           </div>
                        </div>
                        <div class="col-md-3" style="margin-top:30px;float:left;margin-left:20px">
                          <span style="font-size:16px"> <i class="fa fa-send"></i>${l.g_addr }</span>
                        </div>
                        <div style="float:left;margin-top:30px;margin-left:20px">
                        	<span style="font-size:15px"><i class="fa fa-user"></i> ${l.c_name}</span>
                        </div>
                        <div class="col-md-2 text-right" style="float:left;margin-top:30px;margin-left:20px">
                            <span class="font-bold" style="font-size:15px">${l.co_create_time}</span>
                        </div>
                        <div class="col-sm-2" style="margin-top:22px;float:right">
                        	<c:if test="${l.g_status eq 1}">
                        		<button class="btn btn-md btn-danger"  onclick="deleteColection(${l.co_id})" type="button">&nbsp;&nbsp;删 除&nbsp;</button>
                        	</c:if>
                        	<c:if test="${l.g_status eq 0}">
                        		<button class="btn btn-md btn-default" type="button">&nbsp;已下架</button>
                        	</c:if>
                        </div>
                    </div>
                </div>
          </c:forEach>
	        </div>
	      </c:if> 
	    </div>
	</div>

    <!-- 全局js -->
    <script src="resource/js/jquery.min.js?v=2.1.4"></script>
    <script src="resource/js/bootstrap.min.js?v=3.3.6"></script>
    <!-- 自定义js -->
    <script src="resource/js/content.js?v=1.0.0"></script>
    <script>
    	function deleteColection(co_id){
    		top.layer.confirm("你确定删除该收藏么？",{icon:3,btn:['YES','NO']},function(){
    			$.post("deleteCollection.a",{"co_id":co_id},function(data){
    				if(data.flag){
    					top.layer.alert(data.msg,{icon:1,end:function(){
    						window.location.reload();
    					}});
    				}else{
    					top.layer.alert(data.mag,{icon:2,end:function(){    						
    					window.location.reload();
    					}});
    				}
    			},"json");
    		},function(){
    			window.location.reload();
    		})
    		
    		
    		
    	}
    
    </script>

</body>

</html>
