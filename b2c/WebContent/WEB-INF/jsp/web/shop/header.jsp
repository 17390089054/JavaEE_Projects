<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";%>
<!DOCTYPE html>
<html>
<base href="<%=basePath%>">
<head>
<meta charset="utf-8">
<title>商城主页</title>

<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta content="Metronic Shop UI description" name="description">
<meta content="Metronic Shop UI keywords" name="keywords">
<meta content="keenthemes" name="author">
<meta property="og:site_name" content="-CUSTOMER VALUE-">
<meta property="og:title" content="-CUSTOMER VALUE-">
<meta property="og:description" content="-CUSTOMER VALUE-">
<meta property="og:type" content="website">
<meta property="og:image" content="-CUSTOMER VALUE-"><!-- link to image for socio -->
<meta property="og:url" content="-CUSTOMER VALUE-">

<link rel="shortcut icon" href="favicon.ico">
<!-- Global styles START -->          
<link href="resource/web/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="resource/web/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Global styles END --> 
 
<!-- Page level plugin styles START -->
<link href="resource/web/global/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet">
<link href="resource/web/global/plugins/carousel-owl-carousel/owl-carousel/owl.carousel.css" rel="stylesheet">
<link href="resource/web/global/plugins/slider-layer-slider/css/layerslider.css" rel="stylesheet">
<!-- Page level plugin styles END -->

<!-- Theme styles START -->
<link href="resource/web/global/css/components.css" rel="stylesheet">
<link href="resource/web/frontend/layout/css/style.css" rel="stylesheet">
<link href="resource/web/frontend/pages/css/style-shop.css" rel="stylesheet" type="text/css">
<link href="resource/web/frontend/pages/css/style-layer-slider.css" rel="stylesheet">
<link href="resource/web/frontend/layout/css/style-responsive.css" rel="stylesheet">
<link href="resource/web/frontend/layout/css/themes/red.css" rel="stylesheet" id="style-color">
<link href="resource/web/frontend/layout/css/custom.css" rel="stylesheet">
<!-- 购物车样式 -->
<style>
	.carNum{
		width:50px;
		height:25px;
		float:right;
	}
	.carNum span{
		display:block;
		width:20px;
		height:20px;
		float:left;
		background-color:red;
		color:#fff;
		text-align:center;
		line-height:20px;
		border-radius:50%;
	}
</style>
</head>

<!-- Body BEGIN -->
<body class="ecommerce">
    <!-- BEGIN TOP BAR -->
    <div class="pre-header">
        <div class="container">
            <div class="row">
                <!-- BEGIN TOP BAR LEFT PART -->
                <div class="col-md-6 col-sm-6 additional-shop-info">
                    <ul class="list-unstyled list-inline">
                        <li><i class="fa fa-phone"></i><span>+1 456 6717</span></li>
                    </ul>
                </div>
                <!-- END TOP BAR LEFT PART -->
                <!-- BEGIN TOP BAR MENU -->
                <div class="col-md-6 col-sm-6 additional-nav">
                    <ul class="list-unstyled list-inline pull-right">
                    	<li><a href="Index">首页</a></li>
                       	<c:if test="${!empty client}">
                       		 <i><img src="${client.c_photo}" width="25px" height="25px" class="img-circle"></i> hi~${client.c_name} |
                       		<a class="pull left" href="ClientLogout.a">退出</a>
                       	</c:if>
                       	<c:if test="${empty client}">
                       		<li><a onclick="Login()">登录</a></li>
                        	<li><a href="register">注册</a></li>
                       	</c:if>
                        <li><a href="clientAccount.a">个人中心</a></li>
                    </ul>
                </div>
                <!-- END TOP BAR MENU -->
            </div>
        </div>        
    </div>
    <!-- END TOP BAR -->

    <!-- BEGIN HEADER -->
    <div class="header">
      <div class="container">
        <a class="site-logo" href=""><img src="resource/web/frontend/layout/img/logos/logo-shop-red.png" alt="Metronic Shop UI"></a>

        <a href="javascript:void(0);" class="mobi-toggler"><i class="fa fa-bars"></i></a>

        <!-- BEGIN CART -->
        <div class="top-cart-block">
          <div class="top-cart-info">
            <a href="javascript:void(0);" class="top-cart-info-count">
            <c:if test="${empty sum}">
            	0
            </c:if>
            <c:if test="${!empty sum }">
            ${sum}
            </c:if>
           件商品</a>
            <a href="javascript:void(0);" class="top-cart-info-value">共
      		<c:if test="${empty totalPrice}">
      			0.00
      		</c:if> 
      		<c:if test="${!empty totalPrice}">
      		     ${totalPrice}
      		</c:if>
            元</a>
          </div>
       	<div class="carNum">
        	 <span id="count" class="gc">${fn:length(carList)}</span>
        	 <i class="fa fa-shopping-cart"></i> 
       	</div>
          <div class="top-cart-content-wrapper">
            <div class="top-cart-content">
               <ul class="scroller" style="height: 250px;">
                <c:forEach items="${carList}" var="c" varStatus="vs">
	                <li>
	                  <a href="item?g_id=${c.g_id}">
	                  		<img src="${c.g_logo}" alt="Rolex Classic Watch" width="37" height="34">
	                  </a>
	                  <span class="cart-content-count">x ${c.sc_number}</span>
	                  <strong><a href="item?g_id=${c.g_id}">${c.g_name}</a></strong>
	                  <em>￥${c.sc_number * c.g_price}</em>
	                  <a href="javascript:void(0)" onclick="deleteGoods(this,${vs.index})" class="del-goods">&nbsp;</a>
	                </li>
                </c:forEach>
              </ul>
              <div class="text-right">
                <a href="shopCarList.a" class="btn btn-primary">查看购物车</a>
              </div>
            </div>
          </div>            
        </div>
        <!--END CART -->

        <!-- BEGIN NAVIGATION -->
        <div class="header-navigation">
          <ul>
            <li class="dropdown dropdown100 nav-catalogue">
              <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" href="javascript:;">
                	最新商品
              </a>
              <ul class="dropdown-menu">
                    <c:forEach items="${list}" var="goods">
                <!--   <div class="header-navigation-content">  -->
                    <!-- <div class="row">  -->
                     <div class="col-sm-3 col-sm-3  col-sm-3  ">
                        <div class="product-item">
                          <div class="pi-img-wrapper">
                            <a href="search?search_condition=${goods.gt_name}"><img  src="${goods.g_logo}" class="img-responsive" style="height:305px" alt="Berry Lace Dress"></a>
                          </div>
                          <h3><a href="item?g_id=${goods.g_id}">${goods.g_name }</a></h3>
                          <div class="pi-price">￥${goods.g_price }</div>
                          <a href="javascript:;"  onclick="addToCar(${goods.g_id})" class="btn btn-default add2cart">加入购物车</a>
                        </div>
                      </div>
                  <!--  </div> -->
                  <!-- </div> -->
                </li>
                    </c:forEach>
              </ul>
            </li>
            
            <li class="dropdown dropdown-megamenu">
              <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" href="javascript:;">
				全部类别                
              </a>
              <ul class="dropdown-menu">
                <li>
                  <div class="header-navigation-content">
                    <div class="row">
                    <div class="col-md-4 header-navigation-col">
                    <c:forEach items="${parentList }" var="parent" varStatus="vs">
                        <h4>${parent.gt_name }</h4>
                         <ul>
            				<c:forEach items="${childList }" var="child">
            					<c:if test="${parent.gt_id==child.gt_parent_id }">
            					 <li><a href="search?search_condition=${child.gt_name}">${child.gt_name }</a></li>
            					</c:if>
            				</c:forEach>
            			</ul>
            			<c:if test="${vs.count%2==0 }">
            			 	<div class="col-md-4 header-navigation-col"></div>
            			</c:if>
           			</c:forEach>
            		</div>
                    </div>
                  </div>
                </li>
              </ul>
            </li>
    
            <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" aria-expanded="true" href="javascript:;">
                	服饰
              </a>
              <!-- BEGIN DROPDOWN MENU -->
              <ul class="dropdown-menu">
                <c:forEach items="${clothesList}" var="cl">
	 				<li class="dropdown-submenu">
	                  <a href="search?search_condition=${cl.gt_name}">${cl.gt_name}<i class=""></i></a>
	                </li>               
                </c:forEach>
              </ul>
              <!-- END DROPDOWN MENU -->
            </li>
            <li><a href="search?search_condition=手机">手机</a></li>
           <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" href="javascript:;">
				电器                
              </a>
              <ul class="dropdown-menu">
              <c:forEach items="${applianceList}" var="al">
                <li class=""><a href="search?search_condition=${al.gt_name}">${al.gt_name}</a></li>
              </c:forEach>
              </ul>
            </li>
            
            <li><a href="javascript:;" target="_blank">超市</a>
             <ul class="dropdown-menu">
              <c:forEach items="${foodList}" var="fl">
                <li class=""><a href="search?search_condition=${fl.gt_name}">${fl.gt_name}</a></li>
              </c:forEach>
              </ul>
            </li>
            
            <li><a href="javascript:;" target="_blank">生活用品</a>
             <ul class="dropdown-menu">
              <c:forEach items="${dList}" var="dl">
                <li class=""><a href="search?search_condition=${dl.gt_name}">${dl.gt_name}</a></li>
              </c:forEach>
             </ul>
            </li> 

            <!-- BEGIN TOP SEARCH -->
            <li class="menu-search">
              <span class="sep"></span>
              <i class="fa fa-search search-btn"></i>
              <div class="search-box" style="width:500px;">
                <form action="search" id="myForm">
                  <div class="input-group">
                    <input type="text" placeholder="请输入你要搜索的商品" name="search_condition" class="form-control">
                    <span class="input-group-btn">
                      <button class="btn btn-primary" type="button" onclick="search()">搜索</button>
                    </span>
                  </div>
                </form>
              </div> 
            </li>
            <!-- END TOP SEARCH -->
          </ul>
        </div>
        <!-- END NAVIGATION -->
      </div>
    </div>
    <!-- Header END -->
    
    <!-- Theme styles END -->
	<script src="resource/web/global/plugins/jquery.min.js" type="text/javascript"></script>
	<script src="resource/web/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
	<script src="resource/web/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>      
	<script src="resource/web/frontend/layout/scripts/back-to-top.js" type="text/javascript"></script>
	<script src="resource/web/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
	<!-- END CORE PLUGINS -->
	
	<!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
	<script src="resource/web/global/plugins/fancybox/source/jquery.fancybox.pack.js" type="text/javascript"></script><!-- pop up -->
	<script src="resource/web/global/plugins/carousel-owl-carousel/owl-carousel/owl.carousel.min.js" type="text/javascript"></script><!-- slider for products -->
	<script src='resource/web/global/plugins/zoom/jquery.zoom.min.js' type="text/javascript"></script><!-- product zoom -->
	<script src="resource/web/global/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script><!-- Quantity -->
	
	<!-- BEGIN LayerSlider -->
	<script src="resource/web/global/plugins/slider-layer-slider/js/greensock.js" type="text/javascript"></script><!-- External libraries: GreenSock -->
	<script src="resource/web/global/plugins/slider-layer-slider/js/layerslider.transitions.js" type="text/javascript"></script><!-- LayerSlider script files -->
	<script src="resource/web/global/plugins/slider-layer-slider/js/layerslider.kreaturamedia.jquery.js" type="text/javascript"></script><!-- LayerSlider script files -->
	<script src="resource/web/frontend/pages/scripts/layerslider-init.js" type="text/javascript"></script>
	<!-- END LayerSlider -->
	<script src="resource/layer/layer.js"></script>	
	<script src="resource/web/frontend/layout/scripts/layout.js" type="text/javascript"></script>
	<script type="text/javascript">
		//用户登录方法  
		function Login(){
			layer.open({
				type:2,
				title:"用户登录",
				shadeClose:false,
				shade:0.4,
				closeBtn:2,
				area:['440px','420px'],
				content:'clientLogin',
				end:function(){
					//self.location=document.referrer;
					window.location.reload();
				}
			});			  
	  }
		
		//移除购物车商品
		 function deleteGoods(obj,index){
			$(obj).parent().remove();
			/* $.post("delCarItem",{"index":index},function(data){
				if(data.flag){
					console.log(data.msg);
				}
			},"json"); */
		} 
		
		//搜索页面
		function search(){
			var condition=$.trim($("input[name='search_condition']").val());
			if(!condition){
				$("input[name='search_condition']").focus();
				return;
			}
			$("#myForm").submit();
		}
	
	</script>
	<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
</html>