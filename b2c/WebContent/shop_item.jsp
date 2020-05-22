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
<!-- Theme styles END -->

</head>
<!-- Head END -->

<!-- Body BEGIN -->
<body class="ecommerce">
    <div style="height:150px;">
		<jsp:include page="shop_header.jsp"></jsp:include>
	</div>
    
    <div class="main">
      <div class="container">
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          

          <!-- BEGIN CONTENT -->
          <div class="col-md-9 col-sm-7">
            <div class="product-page">
              <div class="row">
                <div class="col-md-6 col-sm-6">
                  <div class="product-main-image">
                    <img id="bigImg" src="resource/web/frontend/pages/img/products/model7.jpg" alt="Cool green dress with red bell" class="img-responsive" data-BigImgsrc="resource/web/frontend/pages/img/products/model7.jpg">
                  </div>
                  <div class="product-other-images">
                    <a href="resource/web/frontend/pages/img/products/model3.jpg" onmouseover="showBig(this)" class="fancybox-button" rel="photos-lib"><img alt="Berry Lace Dress" src="resource/web/frontend/pages/img/products/model3.jpg"></a>
                    <a href="resource/web/frontend/pages/img/products/model4.jpg" onmouseover="showBig(this)" class="fancybox-button" rel="photos-lib"><img alt="Berry Lace Dress" src="resource/web/frontend/pages/img/products/model4.jpg"></a>
                    <a href="resource/web/frontend/pages/img/products/model5.jpg" onmouseover="showBig(this)" class="fancybox-button" rel="photos-lib"><img alt="Berry Lace Dress" src="resource/web/frontend/pages/img/products/model5.jpg"></a>
                  </div>
                  <script type="text/javascript">
                  	function showBig(obj){
                  		var href = $(obj).attr("href");
                  		$("#bigImg").attr("src",href);
                  		$("#bigImg").attr("data-BigImgsrc",href);
                  		Layout.initImageZoom();
                  	}
                  </script>
                </div>
                <div class="col-md-6 col-sm-6">
                  <h1>韩都衣舍2017韩版女夏装新款显瘦纯色翻领连衣裙DU6306樱</h1>
                  <div class="price-availability-block clearfix">
                    <div class="price">
                      <strong><span>￥</span>47.00</strong>
                      <em>￥<span>62.00</span></em>
                    </div>
                    <div class="availability">
                      	库存: <strong>100</strong>
                    </div>
                  </div>
                  <div class="description">
                    <p>Lorem ipsum dolor ut sit ame dolore  adipiscing elit, sed nonumy nibh sed euismod laoreet dolore magna aliquarm erat volutpat 
Nostrud duis molestie at dolore.</p>
                  </div>
                  <div class="product-page-options">
                    <div class="pull-left">
                      <label class="control-label">类别：</label>
                    </div>
                    <div class="pull-left">
                      <label class="control-label">女装 </label>
                    </div>
                    <div class="pull-left">
                      <label class="control-label">连衣裙</label>
                    </div>
                  </div>
                  <div class="product-page-options">
                    <div class="pull-left">
                      <label class="control-label">服务承诺：</label>
                    </div>
                    <div class="pull-left">
                      <label class="control-label">正品保证</label>
                    
                      <label class="control-label">极速退款</label>
                    
                      <label class="control-label">七天无理由退换货</label>
                    </div>
                  </div>
                  <div class="product-page-cart">
                    <div class="product-quantity">
                        <input id="product-quantity" type="number" value="1" min="1" max="100" style="width:80px;"  class="form-control input-sm">
                    </div>
                    <a class="btn btn-primary" href="buy.a">立即购买</a>
                  </div>
                  <div class="review">
                    <a href="collect.a">收藏</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="addToCar.a">加入购物车</a>
                  </div>
                </div>

                <div class="product-page-content">
                  <ul id="myTab" class="nav nav-tabs">
                    <li  class="active"><a href="#Description" data-toggle="tab">商品描述</a></li>
                    <li><a href="#Reviews" data-toggle="tab">评价 (2)</a></li>
                  </ul>
                  <div id="myTabContent" class="tab-content">
                    <div class="tab-pane fade in active" id="Description">
                      <p>
                      
                      
                      
                      
                      Lorem ipsum dolor ut sit ame dolore  
                      adipiscing elit, sed sit nonumy n
                      ibh sed euismod laoreet dolore mag
                      na aliquarm erat sit volutpat Nostrud 
                      duis molestie at dolore. Lorem ipsum dolo
                      r ut sit ame dolore  adipiscing elit, s
                      ed sit nonumy nibh sed euismod laoreet dol
                      ore magna aliquarm erat sit volutpat Nost
                      rud duis molestie at dolore. Lorem ipsum do
                      lor ut sit ame dolore  adipiscing elit, sed s
                      it nonumy nibh sed euismod laoreet dolore magna 
                      aliquarm erat sit volutpat Nostrud duis molestie
                       at dolore. 
                       
                       
                       
                       
                       </p>
                    </div>
                    <div class="tab-pane fade " id="Reviews">
                    <div class="blog-item">
                      <div class="comments">
	                    <div class="media">                    
	                      <a href="javascript:;" class="pull-left">
	                      <img src="resource/web/frontend/pages/img/people/img1-small.jpg" alt="" class="media-object">
	                      </a>
	                      <div class="media-body">
	                        <h4 class="media-heading">张飞 <span>2017-03-21 / <a href="javascript:;">回复</a></span></h4>
	                        <p>透明度：蓝色不透。 身高164 体重115 穿M刚好合适，如果肩宽的话就要选大一个码，给个好评。。
	                        	尺码：大小合适，质量很好，稍微有点透，要是有其它色就好了，不过价格便宜，又是棉的，只是会皱．。</p>
	                        <!-- Nested media object -->
	                        <div class="media">
	                          <a href="javascript:;" class="pull-left">
	                          <img src="resource/web/frontend/pages/img/people/img2-small.jpg" alt="" class="media-object">
	                          </a>
	                          <div class="media-body">
	                            <h4 class="media-heading">卖家回复<span>2017-03-21 / <a href="javascript:;">回复</a></span></h4>
	                            <p>Dear韩粉，感谢您对我们产品的选购和用心评价哦！
	                            	咱设计师经过多挑细选而选用这款面料，是对这款式最美的诠释哦思密达~此面料较为柔软哦，
	                            	衣衣产生褶皱非常抱歉，您清洗后低温熨烫一下就可以啦思密达~
	                            	我们已反馈质检再次检验争取做到更好~谢谢您一直钟情韩都，期待您的下次到来哦?</p>
	                          </div>
	                        </div>
	                        <!--end media-->                      
	                      </div>
	                    </div>
	                    <!--end media-->
	                    <div class="media">
	                      <a href="javascript:;" class="pull-left">
	                      <img src="resource/web/frontend/pages/img/people/img4-small.jpg" alt="" class="media-object">
	                      </a>
	                      <div class="media-body">
	                        <h4 class="media-heading">大马西亚<span>2017-03-21 / <a href="javascript:;">回复</a></span></h4>
	                        <p>这裙子 我能穿？ 贼**漂亮 </p>
	                      </div>
	                    </div>
	                    <!--end media-->
	                  </div>	
	                  <!-- <div class="post-comment padding-top-40">
	                    <h3>Leave a Comment</h3>
	                    <form role="form">
	                      <div class="form-group">
	                        <label>评价</label>
	                        <textarea class="form-control" rows="8"></textarea>
	                      </div>
	                      <p><button class="btn btn-primary" type="submit">Post a Comment</button></p>
	                    </form>
	                  </div>  		 -->		
                      <!-- END FORM--> 
                      </div>
                    </div>
                  </div>
                </div>

                <div class="sticker sticker-sale"></div>
              </div>
            </div>
          </div>
          <!-- END CONTENT -->
          
          <!-- BEGIN SIDEBAR -->
          <div class="sidebar col-md-3 col-sm-5">
            

            <div class="sidebar-products clearfix">
              <h2>猜你喜欢</h2><!-- 同类商品推荐 -->
              <div class="item">
                <a href="shop-item.html"><img src="resource/web/frontend/pages/img/products/k1.jpg" alt="Some Shoes in Animal with Cut Out"></a>
                <h3><a href="shop-item.html">Some Shoes in Animal with Cut Out</a></h3>
                <div class="price">$31.00</div>
              </div>
              <div class="item">
                <a href="shop-item.html"><img src="resource/web/frontend/pages/img/products/k4.jpg" alt="Some Shoes in Animal with Cut Out"></a>
                <h3><a href="shop-item.html">Some Shoes in Animal with Cut Out</a></h3>
                <div class="price">$23.00</div>
              </div>
              <div class="item">
                <a href="shop-item.html"><img src="resource/web/frontend/pages/img/products/k3.jpg" alt="Some Shoes in Animal with Cut Out"></a>
                <h3><a href="shop-item.html">Some Shoes in Animal with Cut Out</a></h3>
                <div class="price">$86.00</div>
              </div>
            </div>
          </div>
          <!-- END SIDEBAR -->
        </div>
        <!-- END SIDEBAR & CONTENT -->

        <!-- BEGIN SIMILAR PRODUCTS -->
        <div class="row margin-bottom-40">
          <div class="col-md-12 col-sm-12">
            <h2>店铺其他商品</h2>
            <div class="owl-carousel owl-carousel4">
              <div>
                <div class="product-item">
                  <div class="pi-img-wrapper">
                    <img src="resource/web/frontend/pages/img/products/k1.jpg" class="img-responsive" alt="Berry Lace Dress">
                    <div>
                      <a href="resource/web/frontend/pages/img/products/k1.jpg" class="btn btn-default fancybox-button">Zoom</a>
                      <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                    </div>
                  </div>
                  <h3><a href="shop-item.html">漂亮大眼睛</a></h3>
                  <div class="pi-price">￥29.00</div>
                  <a href="javascript:;" class="btn btn-default add2cart">查看详情</a>
                  <div class="sticker sticker-new"></div>
                </div>
              </div>
              <div>
                <div class="product-item">
                  <div class="pi-img-wrapper">
                    <img src="resource/web/frontend/pages/img/products/k2.jpg" class="img-responsive" alt="Berry Lace Dress">
                    <div>
                      <a href="resource/web/frontend/pages/img/products/k2.jpg" class="btn btn-default fancybox-button">Zoom</a>
                      <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                    </div>
                  </div>
                  <h3><a href="shop-item.html">绿色大短裤</a></h3>
                  <div class="pi-price">￥29.00</div>
                  <a href="javascript:;" class="btn btn-default add2cart">查看详情</a>
                </div>
              </div>
              <div>
                <div class="product-item">
                  <div class="pi-img-wrapper">
                    <img src="resource/web/frontend/pages/img/products/k3.jpg" class="img-responsive" alt="Berry Lace Dress">
                    <div>
                      <a href="resource/web/frontend/pages/img/products/k3.jpg" class="btn btn-default fancybox-button">Zoom</a>
                      <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                    </div>
                  </div>
                  <h3><a href="shop-item.html">大白牙</a></h3>
                  <div class="pi-price">￥29.00</div>
                  <a href="javascript:;" class="btn btn-default add2cart">查看详情</a>
                </div>
              </div>
              <div>
                <div class="product-item">
                  <div class="pi-img-wrapper">
                    <img src="resource/web/frontend/pages/img/products/k4.jpg" class="img-responsive" alt="Berry Lace Dress">
                    <div>
                      <a href="resource/web/frontend/pages/img/products/k4.jpg" class="btn btn-default fancybox-button">Zoom</a>
                      <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                    </div>
                  </div>
                  <h3><a href="shop-item.html">灰色背景墙</a></h3>
                  <div class="pi-price">￥29.00</div>
                  <a href="javascript:;" class="btn btn-default add2cart">查看详情</a>
                  <div class="sticker sticker-sale"></div>
                </div>
              </div>
              <div>
                <div class="product-item">
                  <div class="pi-img-wrapper">
                    <img src="resource/web/frontend/pages/img/products/k1.jpg" class="img-responsive" alt="Berry Lace Dress">
                    <div>
                      <a href="resource/web/frontend/pages/img/products/k1.jpg" class="btn btn-default fancybox-button">Zoom</a>
                      <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                    </div>
                  </div>
                  <h3><a href="shop-item.html">Berry Lace Dress5</a></h3>
                  <div class="pi-price">$29.00</div>
                  <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                </div>
              </div>
              <div>
                <div class="product-item">
                  <div class="pi-img-wrapper">
                    <img src="resource/web/frontend/pages/img/products/k2.jpg" class="img-responsive" alt="Berry Lace Dress">
                    <div>
                      <a href="resource/web/frontend/pages/img/products/k2.jpg" class="btn btn-default fancybox-button">Zoom</a>
                      <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                    </div>
                  </div>
                  <h3><a href="shop-item.html">Berry Lace Dress6</a></h3>
                  <div class="pi-price">$29.00</div>
                  <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- END SIMILAR PRODUCTS -->
      </div>
    </div>

    
	<!-- footer -->
 	<div style="height:345px;">
 		<jsp:include page="shop_footer.jsp"></jsp:include>
 	</div>
 	
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
	});
	</script>
	<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
</html>