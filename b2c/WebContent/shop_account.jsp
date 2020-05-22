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

<link rel="shortcut icon" href="resource/img/favicon.ico">
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
<script src="resource/common/layer-v3.0.3/layer/layer.js"></script>
<script src="resource/web/frontend/layout/scripts/layout.js" type="text/javascript"></script>
<script type="text/javascript">
jQuery(document).ready(function() {
    Layout.init();    
    Layout.initOWL();
});
function changeIframe(){
	setIframeHeight(document.getElementById('iframe'));
}
	function setIframeHeight(iframe) {
		iframe.height = 300;
   		if (iframe) {
		   	var iframeWin = iframe.contentWindow || iframe.contentDocument.parentWindow;
		   	if (iframeWin.document.body) {
		   		iframe.height = iframeWin.document.documentElement.scrollHeight || iframeWin.document.body.scrollHeight;
		   	}
	   	}
	};
	window.onload = function(){
		$(".row").bind("mousemove",function(){
			setIframeHeight(document.getElementById('iframe'));

		});
		$("a").bind("click",function(){
			setIframeHeight(document.getElementById('iframe'));

		});
		setIframeHeight(document.getElementById('iframe'));
	}
</script>
<!-- END PAGE LEVEL JAVASCRIPTS -->
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
          <!-- BEGIN SIDEBAR -->
          <div class="sidebar col-md-3 col-sm-3">
            <ul class="list-group margin-bottom-25 sidebar-menu">
              <li class="list-group-item clearfix"><a href="shop_index.jsp" target="iframe"><i class="fa fa-angle-right"></i>个人信息</a></li>
              <li class="list-group-item clearfix"><a href="BuyOrderListServlet.web" target="iframe"><i class="fa fa-angle-right"></i>已买到的商品</a></li>
              <li class="list-group-item clearfix"><a href="AddressListServlet.web" target="iframe"> <i class="fa fa-angle-right"></i>地址管理</a></li>
              <li class="list-group-item clearfix"><a href="BuyCommentListServlet.web" target="iframe"><i class="fa fa-angle-right"></i>评价管理</a></li>
              <c:if test="${user.user_role eq '1' }"><!-- && (user.user_review eq '0' or user.user_review eq '-1') -->
              <li class="list-group-item clearfix"><a href="ApplyForSellServlet.web" target="iframe"><i class="fa fa-angle-right"></i>申请卖家</a></li>
              
              </c:if>
              
              <c:if test="${user.user_role eq '2' }">
              	<li class="list-group-item clearfix"><a href="IndexServlet.sys" target="_black"><i class="fa fa-angle-right"></i>进入店铺管理</a></li>
              </c:if>
            </ul>
          </div>
          <!-- END SIDEBAR -->

          <!-- BEGIN CONTENT -->
          <div class="col-md-9 col-sm-7">
            
            <div style="width:100%;min-height:100px;">
            	<iframe frameborder="0" src="PersonalServlet.web" name="iframe" id="iframe" width="100%"></iframe>
            </div>
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
      </div>
    </div>

    
    <!-- END BRANDS -->
	<!-- footer -->
 	<div style="height:345px;">
 		<jsp:include page="shop_footer.jsp"></jsp:include>
 	</div>
</body>
</html>