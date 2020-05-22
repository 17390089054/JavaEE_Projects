<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ 	taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";%>
<!DOCTYPE html>
<html>
<base href="<%=basePath%>">
<head>
<meta charset="utf-8">
<title>Go商城</title>

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
                    	<li><a href="shop_index.jsp">首页</a></li>
                       	<c:if test="${!empty client}">
                       		 <i class="fa fa-user"></i> hi~${client.c_name}
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
            <a href="javascript:void(0);" class="top-cart-info-count">5件商品</a>
            <a href="javascript:void(0);" class="top-cart-info-value">共1230元</a>
          </div>
          <i class="fa fa-shopping-cart"></i>
                        
          <div class="top-cart-content-wrapper">
            <div class="top-cart-content">
              <ul class="scroller" style="height: 250px;">
                <li>
                  <a href="shop-item.html"><img src="resource/web/frontend/pages/img/cart-img.jpg" alt="Rolex Classic Watch" width="37" height="34"></a>
                  <span class="cart-content-count">x 1</span>
                  <strong><a href="shop-item.html">大金表</a></strong>
                  <em>15800元</em>
                  <a href="javascript:void(0);" class="del-goods">&nbsp;</a>
                </li>
              </ul>
              <div class="text-right">
                <a href="shop-shopping-cart.html" class="btn btn-default">查看购物车</a>
                <a href="shop-checkout.html" class="btn btn-primary">结账</a>
              </div>
            </div>
          </div>            
        </div>
        <!--END CART -->

        <!-- BEGIN NAVIGATION -->
        <div class="header-navigation">
          <ul>
            <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" href="javascript:;">
                	服饰
              </a>
                
              <!-- BEGIN DROPDOWN MENU -->
              <ul class="dropdown-menu">
                <li class="dropdown-submenu">
                  <a href="shop-product-list.html">Hi Tops <i class="fa fa-angle-right"></i></a>
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="shop-product-list.html">Second Level Link</a></li>
                    <li><a href="shop-product-list.html">Second Level Link</a></li>
                    <li class="dropdown-submenu">
                      <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" href="javascript:;">
                        Second Level Link 
                        <i class="fa fa-angle-right"></i>
                      </a>
                      <ul class="dropdown-menu">
                        <li><a href="shop-product-list.html">Third Level Link</a></li>
                        <li><a href="shop-product-list.html">Third Level Link</a></li>
                        <li><a href="shop-product-list.html">Third Level Link</a></li>
                      </ul>
                    </li>
                  </ul>
                </li>
                <li><a href="shop-product-list.html">Running Shoes</a></li>
                <li><a href="shop-product-list.html">Jackets and Coats</a></li>
              </ul>
              <!-- END DROPDOWN MENU -->
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
                    <c:forEach items="${parentTypeList }" var="parent" varStatus="vs">
                        <h4>${parent.type_name }</h4>
                         <ul>
            				<c:forEach items="${childTypeList }" var="child">
            					<c:if test="${parent.type_id==child.type_parent_id }">
            					 <li><a href="查询页面.web?type_id=${child.type_id }">${child.type_name }</a></li>
            					</c:if>
            				</c:forEach>
            			</ul>
            			<c:if test="${vs.count%2==0 }">
            			</div>
            			 <div class="col-md-4 header-navigation-col">
            			</c:if>
           			</c:forEach>
            		</div>
                    </div>
                  </div>
                </li>
              </ul>
            </li>
            <li><a href="shop-item.html">手机</a></li>
            <li class="dropdown dropdown100 nav-catalogue">
              <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" href="javascript:;">
                	最新商品
              </a>
              <ul class="dropdown-menu">
                <li>
                  <div class="header-navigation-content">
                    <div class="row">
                    <c:forEach items="${newGoodsListForHeader }" var="goods">
                     <div class="col-md-3 col-sm-4 col-xs-6">
                        <div class="product-item">
                          <div class="pi-img-wrapper">
                            <a href="详情。web?goods_id=${goods.goods_id }"><img  src="${goods.goods_photo }" class="img-responsive" style="height:305px" alt="Berry Lace Dress"></a>
                          </div>
                          <h3><a href="shop-item.html">${goods.goods_name }</a></h3>
                          <div class="pi-price">￥${goods.goods_price }</div>
                          <a href="javascript:;" class="btn btn-default add2cart">加入购物车</a>
                        </div>
                      </div>
                    </c:forEach>
                    </div>
                  </div>
                </li>
              </ul>
            </li>
            <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" href="javascript:;">
				电器                
              </a>
              <ul class="dropdown-menu">
                <li class="active"><a href="shop-index.html">Home Default</a></li>
                <li><a href="shop-index-header-fix.html">Home Header Fixed</a></li>
                <li><a href="shop-index-light-footer.html">Home Light Footer</a></li>
                <li><a href="shop-product-list.html">Product List</a></li>
                <li><a href="shop-search-result.html">Search Result</a></li>
              </ul>
            </li>
            <li><a href="index.html" target="_blank">超市</a></li>
            <li><a href="onepage-index.html" target="_blank">生活用品</a></li>

            <!-- BEGIN TOP SEARCH -->
            <li class="menu-search">
              <span class="sep"></span>
              <i class="fa fa-search search-btn"></i>
              <div class="search-box" style="width:500px;">
                <form action="shop_search.jsp">
                  <div class="input-group">
                    <input type="text" placeholder="请输入搜索条件" class="form-control">
                    <span class="input-group-btn">
                      <button class="btn btn-primary" type="submit">搜索</button>
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
					self.location=document.referrer;
				}
			});			  
	  }
	</script>
	<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
</html>