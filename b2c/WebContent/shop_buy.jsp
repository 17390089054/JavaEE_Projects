<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";%>
<!DOCTYPE html>
<html>
<base href="<%=basePath%>">
<head>
<meta charset="utf-8">
<title>Metronic Shop UI</title>

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
<link href="resource/web/frontend/layout/css/themes/blue.css" rel="stylesheet" id="style-color">
<link href="resource/web/frontend/layout/css/custom.css" rel="stylesheet">

</head>
<!-- Body BEGIN -->
<body class="ecommerce">
	<div style="height:150px;">
		<jsp:include page="shop_header.jsp"></jsp:include>
	</div>
    <div class="main">
      <div class="container">
      
      
      <div class="row margin-bottom-40">
          <!-- BEGIN CONTENT -->
          <div class="col-md-12 col-sm-10">
            <!-- BEGIN PRODUCT LIST -->
            <div class="row product-list">
              <!-- PRODUCT ITEM START -->
              <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="product-item">
                  <div class="pi-img-wrapper">
                  <h2>收货地址：</h2>
		            <address style="margin:20px;">
		              <strong style="color:#EC4D1C;">收货人：</strong>秦始皇<br>
		              <strong style="color:#EC4D1C;">联系电话：</strong>13057685768<br>
		              <strong style="color:#EC4D1C;">收货地址：</strong>吉林省 长春市 南关区<br>
		            	幸福街南三环交汇中东财富中心二楼四海兴唐<br>
		            </address>
                  </div>
                  <a href="javascript:;" class="btn btn-primary" style="float:right;">选择地址</a>
               		<div class="sticker sticker-new"></div>
                </div>
              </div>
              <!-- PRODUCT ITEM END -->
             <!-- PRODUCT ITEM START -->
              <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="product-item">
                  <div class="pi-img-wrapper">
                  <h2>收货地址：</h2>
		            <address style="margin:20px;">
		              <strong style="color:#EC4D1C;">收货人：</strong>秦始皇<br>
		              <strong style="color:#EC4D1C;">联系电话：</strong>13057685768<br>
		              <strong style="color:#EC4D1C;">收货地址：</strong>吉林省 长春市 南关区<br>
		            	幸福街南三环交汇中东财富中心二楼四海兴唐<br>
		            </address>
                  </div>
                  <a href="javascript:;" class="btn btn-primary" style="float:right;">选择地址</a>
                </div>
              </div>
              <!-- PRODUCT ITEM END -->
              <!-- PRODUCT ITEM START -->
              <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="product-item">
                  <div class="pi-img-wrapper">
                  <h2>收货地址：</h2>
		            <address style="margin:20px;">
		              <strong style="color:#EC4D1C;">收货人：</strong>秦始皇<br>
		              <strong style="color:#EC4D1C;">联系电话：</strong>13057685768<br>
		              <strong style="color:#EC4D1C;">收货地址：</strong>吉林省 长春市 南关区<br>
		            	幸福街南三环交汇中东财富中心二楼四海兴唐<br>
		            </address>
                  </div>
                  <a href="javascript:;" class="btn btn-primary" style="float:right;">选择地址</a>
                </div>
              </div>
              <!-- PRODUCT ITEM END -->
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN CONTENT -->
          <div class="col-md-12 col-sm-12">
            <h1>商品清单</h1>
            <div class="goods-page">
              <div class="goods-data clearfix">
                <div class="table-wrapper-responsive">
                <table summary="Shopping cart">
                  <tr>
                    <th class="goods-page-image">图片</th>
                    <th class="goods-page-description">名称</th>
                    <th class="goods-page-ref-no">类别</th>
                    <th class="goods-page-quantity">数量</th>
                    <th class="goods-page-price">单价</th>
                    <th class="goods-page-total" colspan="2">总价</th>
                  </tr>
                  <tr>
                    <td class="goods-page-image">
                      <a href="javascript:;"><img src="resource/web/frontend/pages/img/products/model3.jpg" alt="Berry Lace Dress"></a>
                    </td>
                    <td class="goods-page-description">
                      <h3>
                      	<a href="javascript:;" style="width:200px;text-overflow: -o-ellipsis-lastline;overflow: hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;">
                      	啊啊啊啊一啊啊啊啊一啊啊啊啊一啊啊啊啊一啊啊啊啊一啊啊啊啊一啊啊啊啊一啊啊啊啊一啊啊啊啊一啊啊啊啊一
						</a>
					  </h3>
                    </td>
                    <td class="goods-page-ref-no">
                      	手机
                    </td>
                    <td class="goods-page-quantity">
                      <div class="product-quantity">
                          <input id="product-quantity" type="text" value="1" readonly class="form-control input-sm">
                      </div>
                    </td>
                    <td class="goods-page-price">
                      <strong><span>$</span>47.00</strong>
                    </td>
                    <td class="goods-page-total">
                      <strong><span>$</span>47.00</strong>
                    </td>
                    <td class="del-goods-col">
                      <a class="del-goods" href="javascript:;">&nbsp;</a>
                    </td>
                  </tr>
                  <tr>
                    <td class="goods-page-image">
                      <a href="javascript:;"><img src="resource/web/frontend/pages/img/products/model4.jpg" alt="Berry Lace Dress"></a>
                    </td>
                    <td class="goods-page-description">
                      <h3>
                      	<a href="javascript:;" style="width:200px;text-overflow: -o-ellipsis-lastline;overflow: hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;">
                      	aaaabaaaabaaaabaaaabaaaabaaaabaaaabaaaabaaaabaaaab
						</a>
					  </h3>
                    </td>
                    <td class="goods-page-ref-no">
                      javc2133
                    </td>
                    <td class="goods-page-quantity">
                      <div class="product-quantity">
                          <input id="product-quantity2" type="text" value="1" readonly class="form-control input-sm">
                      </div>
                    </td>
                    <td class="goods-page-price">
                      <strong><span>$</span>47.00</strong>
                    </td>
                    <td class="goods-page-total">
                      <strong><span>$</span>47.00</strong>
                    </td>
                    <td class="del-goods-col">
                      <a class="del-goods" href="javascript:;">&nbsp;</a>
                    </td>
                  </tr>
                </table>
                </div>

                <div class="shopping-total">
                  <ul>
                    <li>
                      <em>商品总金额</em>
                      <strong class="price"><span>$</span>47.00</strong>
                    </li>
                    <li>
                      <em>快递</em>
                      <strong class="price"><span>$</span>3.00</strong>
                    </li>
                    <li class="shopping-total-price">
                      <em>订单总价</em>
                      <strong class="price"><span>$</span>50.00</strong>
                    </li>
                  </ul>
                </div>
              </div>
              <button class="btn btn-primary" type="submit">立即支付<i class="fa fa-check"></i></button>
              <button class="btn btn-primary" type="submit">稍后支付<i class="fa fa-check"></i></button>
            </div>
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
      </div>
    </div>
	<!-- footer -->
 	<div style="height:345px;">
 		<jsp:include page="shop_footer.jsp"></jsp:include>
 	</div>
 	
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
	
	<script src="resource/web/frontend/layout/scripts/layout.js" type="text/javascript"></script>
	<script type="text/javascript">
	    jQuery(document).ready(function() {
	    	Layout.init();    
	        Layout.initOWL();
	        Layout.initTwitter();
	        Layout.initImageZoom();
	        Layout.initTouchspin();
	        Layout.initUniform();
	        Layout.initSliderRange();
	    });
	</script>
	<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
</html>