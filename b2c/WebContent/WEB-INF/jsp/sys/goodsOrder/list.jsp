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
    <title>订单列表</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="favicon.ico"> <link href="resource/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="resource/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <link href="resource/css/animate.css" rel="stylesheet">
    <link href="resource/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">

    <div class="wrapper wrapper-content animated fadeInUp">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox">
                    <div class="ibox-title">
                        <h5>所有项目</h5>
                        <div class="ibox-tools">
                            <a href="projects.html" class="btn btn-primary btn-xs">创建新项目</a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="row m-b-sm m-t-sm">
                            <div class="col-md-1">
                                <button type="button" id="loading-example-btn" class="btn btn-white btn-sm"><i class="fa fa-refresh"></i> 刷新</button>
                            </div>
                            <div class="col-md-11">
                                <div class="input-group">
                                    <input type="text" placeholder="请输入项目名称" class="input-sm form-control"> <span class="input-group-btn">
                                        <button type="button" class="btn btn-sm btn-primary"> 搜索</button> </span>
                                </div>
                            </div>
                        </div>

                        <div class="">
                            <table class="table table-hover">
                                <tbody>
                                <c:forEach items="${list}" var="l">
                                    <tr>
                                        <td class="project-status">
                                        	<c:if test="${l.go_status eq 1}">
                                        			<span class="label label-warning">待支付</span>
                                        	 </c:if>
                                            <c:if test="${l.go_status eq 2}">
                                        			<span class="label label-danger">待发货</span>
                                        	 </c:if>
                                            <c:if test="${l.go_status eq 3}">
                                        			<span class="label label-success">已发货</span>
                                        	 </c:if>
                                            <c:if test="${l.go_status eq 4}">
                                        			<span class="label label-info">待评价</span>
                                        	 </c:if>
                                            <c:if test="${l.go_status eq 5}">
                                        			<span class="label label-primary">已完成</span>
                                        	 </c:if>
                                            
                                        </td>
                                        <td style="width:120px" >
			                             <div style="float:left;width:100px;height:100px">
                                           	<img alt="image"  width="80px" height="80px" src="${l.g_logo}" style="border-radius:50%"		>
			                             </div>          
                                         <div style="float:left">
                                         	<span style="display:block;font-size:15px;width:120px;float:left">${l.g_name}</span><br>
                                          <span style="font-size:15px">￥${l.g_price}</span>	
                                         </div>	
                                        </td>
                                        <td>
                                        	<h2><span style="color:#486"><strong>￥${l.go_money}</strong></span></h2>
                                        </td>
                                        <td>
                                               	<span style="color:#666;font-size:18px;display:block;width:140px">${l.province_name }${l.city_name }${l.area_name }${l.a_desc}</span>
                                        </td>
                                        <td >
                                               	<span style="color:#666;font-size:18px">${l.c_name}</span>                                        
                                        </td>
                                        <td>
                                               	<span style="color:#666;font-size:18px">${l.a_tel}</span>
                                        </td>
                                        <td>
                                            <span style="color:#666;font-size:18px">${l.go_code}</span>
                                        </td>	
                                        <td>
                                        	<span style="color:#666;font-size:18px">${l.go_create_time}</span>
                                        </td>
                                        <td>
                                            <c:if test="${l.go_status eq 2}">
                                            <a href="javascript:void(0)" onclick="sendGoods(${l.go_id})" class="btn btn-white btn-sm"><i class="fa fa-bell-o"></i> 发货 </a>
                                            </c:if>
                                            <c:if test="${l.go_status eq 3}">
                                            <a href="javascript:void(0)" class="btn btn-white btn-sm"><i class="fa fa-bell-slash"></i> 已发货 </a>
                                            </c:if>
<!--                                             <a href="javascript:void(0)" class="btn btn-white btn-sm"><i class="fa fa-pencil"></i> 编辑 </a>
 -->                                    </td>
                                    </tr>
                                  </c:forEach>
                                 </tbody>
                                </table>
                            </div>
                        </div>
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
        $(document).ready(function(){

            $('#loading-example-btn').click(function () {
                btn = $(this);
                simpleLoad(btn, true)

                // Ajax example
//                $.ajax().always(function () {
//                    simpleLoad($(this), false)
//                });

                simpleLoad(btn, false)
            });
        });

        function simpleLoad(btn, state) {
            if (state) {
                btn.children().addClass('fa-spin');
                btn.contents().last().replaceWith(" Loading");
            } else {
                setTimeout(function () {
                    btn.children().removeClass('fa-spin');
                    btn.contents().last().replaceWith(" Refresh");
                }, 2000);
            }
        }
        
        //发货
        function sendGoods(go_id){
        	$.post("sendGoods.do",{"go_id":go_id},function(data){
        		if(data.flag){
        			layer.alert(data.msg,{icon:1,end:function(){
        				layer.close();
        				window.location.reload();
        			}});
        		}else{
        			layer.alert(data.msg,{icon:2,end:function(){
        				layer.close();
        				window.location.reload();
        			}});
        		}
        	},"json");
        }
        
        
        
    </script>


    </body>
</html>