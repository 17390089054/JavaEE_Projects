<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
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
    <title>H+ 后台主题UI框架 - 团队管理</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">
    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="resource/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="resource/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="resource/css/animate.css" rel="stylesheet">
    <link href="resource/css/style.css?v=4.1.0" rel="stylesheet">
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
        <c:forEach items="${list}" var="l" varStatus="v">
            <div class="col-sm-6">
                <div class="ibox">
                    <div class="ibox-title">
                        <c:if test="${l.a_status eq 1}">
                        	<span class="label label-primary pull-right">默认</span>
                        </c:if>
                        <c:if test="${v.count eq 1}">
                        	<span class="label label-primary pull-right">NEW</span>
						</c:if>
						<c:if test="${v.count < fn:length(list)}">
						</c:if>
                        <h5><i class="fa fa-user"></i>  ${l.c_name} </h5>
                    </div>
                    <div class="ibox-content">
                        <div class="team-members">
                         	<h4><i class="fa fa-phone"></i><span> ${l.a_tel }</span></h4>
                        </div>
                        <h4><i class="fa fa-map-marker"></i> 收货地址</h4>
                        <p>
                        	${l.province_name}${l.city_name}${l.area_name}${l.a_desc }
                        </p>
                        <div>
                            <div></div>
                            <div>
                                <div style="height:15px"></div>
                            </div>
                        </div>
                        <div class="row  m-t-sm">
                            <div class="col-sm-4">
                             	<button type="button" class="btn btn-md btn-primary" onclick="setDefault(${l.a_id})">设为默认</button>
                            </div>
                            <div class="col-sm-4">
                           		<button type="button" class="btn btn-md btn-warning" onclick="editAddress(${l.a_id})">编辑地址</button>
                            </div>
                            <div class="col-sm-4">
                            	<button type="button" class="btn btn-md btn-danger" onclick="deleteAddress(${l.a_id})">删除地址</button>
                            </div>
                        </div>
                    </div>
                </div>
              </div>
            </c:forEach>
             <!-- PRODUCT ITEM START -->
              <div class="col-sm-6 ">
                <div class="ibox">
                  <div style="width:380px;height:230px">
                  		<img src="resource/img/add.jpg" width="100%" height="100%" alt="添加收货地址" id="img" style="display:block;margin:auto;cursor:pointer"/>	
                  </div>
                </div>
              </div>
              <!-- PRODUCT ITEM END -->
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
	  //添加新地址方法
		$("#img").click(function(){
			top.layer.open({
				type:2,
				title:"新增收货地址",
				shadeClose:false,
				shade:0.2,
				closeBtn:2,
				area:['560px','540px'],
				content:'addressAdd.a'
		});
	});
	 
	//设置默认收货地址
	function setDefault(a_id){
		$.post("addressRevise.a",{"a_id":a_id},function(data){
			if(data.flag){
				layer.msg(data.msg,{icon:6,end:function(){
					window.location.reload();
				}});
			}else{
				window.location.reload();
			}	
		},"json");
	}
	  
	//编辑地址
	function editAddress(a_id){
		top.layer.open({
			type:2,
			title:"修改收货地址",
			shadeClose:false,
			shade:0.2,
			closeBtn:2,
			area:['560px','540px'],
			content:'addressEdit.a?a_id='+a_id
	});
	}
	  
	//删除地址
	function deleteAddress(a_id){
		top.layer.confirm("确认删除该收货地址么？",{btn:['是的，我确定','不，让我想想']},function(){
			$.post("addressDelete.a",{"a_id":a_id},function(data){
				if(data.flag){
					top.layer.alert(data.msg,{icon:1,end:function(){
						window.location.reload();
					}});
				}else{
					window.location.reload();
				}
			},"json");
		},function(){
			
		});
		
		
	}
    </script>
</body>

</html>


