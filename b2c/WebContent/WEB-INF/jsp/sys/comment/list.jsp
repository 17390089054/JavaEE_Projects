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
    <title>客户评价</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">
    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="resource/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="resource/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="resource/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="resource/css/animate.css" rel="stylesheet">
    <link href="resource/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>边框</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="table_basic.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="table_basic.html#">选项1</a>
                                </li>
                                <li><a href="table_basic.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">

                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>商品</th>
                                    <th>客户</th>
                                    <th>评价内容</th>
                                    <th>评价时间</th>
                                    <th>卖家回复</th>
                                    <th>回复时间</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${list}" var="l">
                                <tr>
                                    <td>
                                    <div style="float:left">
                                    	<img src="${l.g_logo}" class="img-circle" width="50px" height="50px"/>
                                    </div>
                                    <div style="float:left;margin-left:20px;margin-top:5px">
                                    	<strong><span style="font-size:20px;color:#666">${l.g_name}</span></strong><br/>
                                    	<span style="font-size:15px;color:#66f">￥${l.g_price}</span>
                                    </div>
                                    </td>
                                    <td>
                                    	<span style="font-size:15px;color:#666">${l.c_name}</span>
                                    </td>
                                    <td>
                                   		<span style="font-size:15px;color:#666">${l.gc_content}</span>
									</td>
                                    <td>
                                    	<span style="font-size:15px;color:#666">${l.gc_create_time}</span>
                                    </td>
                                    <td>
                                    	<span style="font-size:15px;color:666">${l.gc_reply }</span>
                                    </td>
                                    <td>
                                    	<span style="font-size:15px;color:666">${l.gc_reply_time }</span>
                                    </td>
                                    <td>
                                    	<c:if test="${empty l.gc_reply}">
                                    		<button class="btn btn-md btn-warning" onclick="reply(${l.gc_id})">&nbsp;回&nbsp;&nbsp;复&nbsp;</button>
                                    	</c:if>
                                    	<c:if test="${!empty l.gc_reply}">
                                    	<button class="btn btn-md btn-default">&nbsp;已回复</button>
                                    	</c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 全局js -->
    <script src="resource/js/jquery.min.js?v=2.1.4"></script>
    <script src="resource/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="resource/layer/layer.js"></script>
    <!-- Peity -->
    <script src="resource/js/plugins/peity/jquery.peity.min.js"></script>
    <!-- 自定义js -->
    <script src="resource/js/content.js?v=1.0.0"></script>
    <!-- iCheck -->
    <script src="resource/js/plugins/iCheck/icheck.min.js"></script>
    <!-- Peity -->
    <script src="resource/js/demo/peity-demo.js"></script>
    <script>
        $(document).ready(function () {
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
        });
    </script>
    <script>
    	function reply(gc_id){
    		top.layer.open({
				title:'卖家回复',
    			type:2,
    			shade:0.3,
    			shadeClose:false,
    			content:'reply.do?gc_id='+gc_id,
    			area:['580px','450px'],
    			end:function(){
    				window.location.reload();
    			}
    		});
    	}
    
    </script>
</body>

</html>
