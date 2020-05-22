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
    <title>H+ 后台主题UI框架 - 个人资料</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">
    <link rel="shortcut icon" href="resource/img/favicon.ico"> <link href="resource/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="resource/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="resource/css/animate.css" rel="stylesheet">
    <link href="resource/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
    <div class=""> 
        <div class="row animated fadeInRight">
         <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>我的订单</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0)">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="javascript:void(0)">选项1</a>
                                </li>
                                <li><a href="javascript:void(0)">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">

                        <div>
                            <div class="feed-activity-list">
	                            <c:forEach items="${list}" var="l">
	                                <!-- 订单 -->
	                                <div class="feed-element">
	                                    <!-- 商品部分 -->
	                                    <div  style="float:left;width:60px" >
		                                    <a href="javascript:;" onclick="top.location.href='item?g_id=${l.go_goods_id }'" class="pull-left">
		                                        <img alt="image" height="50px"  width="50px" style="border-radius:50%"  src="${l.g_logo }">
		                                    </a>
	                                    </div>
                                   <div style="width:120px;float:left">
                                 
                                     <a href="javascript:void(0);" onclick="top.location.href='item?g_id=${l.go_goods_id }'" >
                                       <span style="font-size:15px;"><strong>${l.g_name}</strong></span>.
                                      </a>
                                       	<span style="font-size:18px;color:#666;display:block;">￥${l.g_price}</span>
                                      </div>
	                                    <!-- 个人信息及订单部分 -->
	                                    	<div style="float:left;display:block;margin:20px auto">
	                                    	<span style="font-size:18px;color:orange">￥${l.go_money }</span>&nbsp;&nbsp;
	                                    	</div>
	                                    <div style="float:left;margin:20px">
	                                   
	                                    	<span style="font-size:16px">${l.c_name}</span>&nbsp;&nbsp;&nbsp;
	                                    	<span style="font-size:16px">${l.a_tel }</span>&nbsp;&nbsp;&nbsp;
	                                    	<span style="font-size:16px">${l.go_code }</span>&nbsp;&nbsp;&nbsp;
	                                       
	                                       <div style="margin-top:5px">
	                                       		<span style="float:left;width:20px"></span>
	                                       		<span style="font-size:16px">${l.province_name}</span>
	                                       		<span style="font-size:16px">${l.city_name}</span>
	                                       		<span style="font-size:16px">${l.area_name}</span>
	                                       		<span style="font-size:16px">${l.a_desc}</span>
	                                       </div>
	                                    </div>
                                      <!--  <div style="float:left;">
                                       </div> -->
                                       <div style="float:right;margin-top:5px">
                                       		<span style="font-size:15px;display:block;margin:10px 5px">
                                       			<small class="text-navy">${l.go_create_time}</small>
                                       		</span>
                                       <c:if test="${l.go_status eq 1}">
                                       		<button type="button"   class="btn btn-md btn-info" onclick="pay(${l.go_id})">支付订单</button>&nbsp;&nbsp;
                                       		<button type="button"   class="btn btn-md btn-danger" onclick="deleteOrder(${l.go_id})">删除订单</button>
                                       </c:if>
                                        <c:if test="${l.go_status eq 2}">
                                       		<button type="button" class="btn btn-md btn-warning" onclick="notice()">提醒发货</button>
                                       	</c:if>
                                       	 <c:if test="${l.go_status eq 3}">
                                       		<button type="button" class="btn btn-md btn-danger" onclick="receipt(${l.go_id})">确认收货</button>
                                       	</c:if>
                                       	<c:if test="${l.go_status eq 4 }">
                                       		<button type="button" class="btn btn-md btn-primary" onclick="comment(${l.go_client_id},${l.go_goods_id},${l.go_id})"> &nbsp;去评价&nbsp;&nbsp;</button>
                                       	</c:if>
                                       	<c:if test="${l.go_status eq 5 }">
                                       		<button type="button" class="btn btn-md btn-default">订单完成</button>
                                       </c:if>
                                       </div>
	                                </div>
	                            </c:forEach>
                            </div>

                            <button class="btn btn-primary btn-block m"><i class="fa fa-arrow-down"></i> 显示更多</button>

                        </div>

                    </div>
                </div>

            </div>
       </div>
  </div> 

    <!-- 全局js -->
    <script src="resource/js/jquery.min.js?v=2.1.4"></script>
    <script src="resource/js/bootstrap.min.js?v=3.3.6"></script>
    <!-- 自定义js -->
    <script src="resource/js/content.js?v=1.0.0"></script>
    <script src="resource/layer/layer.js"></script>
    <!-- Peity -->
    <script src="resource/js/plugins/peity/jquery.peity.min.js"></script>
    <!-- Peity -->
    <script src="resource/js/demo/peity-demo.js"></script>
	<script>
		//支付订单
		function pay(go_id){
			top.layer.open({
				type:2,
				title:'用户支付',
				shade:0.4,
				shadeClose:false,
				area:['400px','250px'],
				content:'clientPay?go_id='+go_id,
				end:function(){
					window.location.reload();//刷新本页
				}
				
			})
		}
		
	//删除未支付订单
		function deleteOrder(go_id){
			top.layer.confirm("你确定要删除么？",{btn:['YES','NO']},function(){
				$.post("deleteOrder.a",{"go_id":go_id},function(data){
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
				top.layer.closeAll();
			})
		
		
		
		
		
		
		
	}
		
		
		
		//提醒发货	
		function notice(){
			top.layer.alert("卖家已收到你的请求啦!",{icon:6});
		}
		//确认收货
		function receipt(go_id){
			top.layer.confirm("要确认收货么？",{btn:['YES','NO'],shade:0.4},function(){
				$.post("orderList.a",{"go_id":go_id},function(data){
					if(data.flag){
						top.layer.alert(data.msg,{icon:6,end:function(){
							window.location.reload();
							}
						});
					}else{
						top.layer.alert(data.msg,{icon:5,end:function(){
							window.location.reload();
						}});
					}
				},"json");
					
			},function(){
				window.location.reload();
			});
	
		}
		
		//评价商品
		function comment(c_id,g_id,go_id){
			window.location.href='addComment.a?c_id='+c_id+"&g_id="+g_id+"&go_id="+go_id;
		}
		
	</script>

</body>

</html>
