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

</head>
<!-- Head END -->

<!-- Body BEGIN -->
<body class="ecommerce">
    <div style="height:150px;">
		<jsp:include page="header.jsp"></jsp:include>
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
                    <img id="bigImg" src="${item.g_logo}" alt="Cool green dress with red bell" class="img-responsive" data-BigImgsrc="${item.g_logo}">
                  </div>
                  <div class="product-other-images">
                  <c:forEach items="${photoList}" var="l">
                    <a href="${l}" onmouseover="showBig(this)" class="fancybox-button" rel="photos-lib">
                    	<img alt="Berry Lace Dress" src="${l}">
                    </a>
                  </c:forEach>
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
                  <h1>${item.g_name}</h1>
                  <div class="price-availability-block clearfix">
                    <div class="price">
                      <strong><span>￥</span>${item.g_price}</strong>
                      <em>￥<span>${item.g_price +200}</span></em>
                    </div>
                    <div class="availability">
                      	库存: <strong>${item.g_number}</strong>
                    </div>
                  </div>
                  <div class="description">
                    <p>商品产地: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${item.g_addr }</p>
                  </div>
                  <div class="product-page-options">
                    <div class="pull-left">
                      <label class="control-label">类别:</label>
                    </div>
                     <div class="pull-left">
                      <label class="control-label">${item.gt_name } </label>
                    </div> 
                  </div>
                  <div class="product-page-options">
                    <div class="pull-left">
                      <label class="control-label">服务承诺:</label>
                    </div>
                   <div class="pull-left">
                      <label class="control-label">正品保证</label>
                    
                      <label class="control-label">极速退款</label>
                    
                      <label class="control-label">七天无理由退换货</label>
                    </div>
                  </div>
                  <div class="product-page-cart">
                    <div class="product-quantity">
                        <input id="product-quantity" type="number" value='1' min="1" name="num" max="100" style="width:80px;"  class="form-control input-sm">
                    </div>
                    <a class="btn btn-primary"  onclick="purchase(${item.g_id})">立即购买</a>
                  </div>
                  <div class="review">
                    <a href="collect.a?g_id=${item.g_id}">收藏</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="javascript:void(0)" onclick="addToCar(${item.g_id})">加入购物车</a>
                  </div>
                </div>

                <div class="product-page-content">
                  <ul id="myTab" class="nav nav-tabs">
                    <li  class="active"><a href="#Description" data-toggle="tab">商品描述</a></li>
                    <li><a href="#Reviews" data-toggle="tab">评价 (${fn:length(commentList)})</a></li>
                  </ul>
                  <div id="myTabContent" class="tab-content">
                    <div class="tab-pane fade in active" id="Description">
                      <p>
                      	${item.g_desc}
                       </p>
                    </div>
                    <div class="tab-pane fade " id="Reviews">
                    <div class="blog-item">
                      <div class="comments">
	                    <c:forEach items="${commentList}" var="cl">
	                    <div class="media">                    
	                      <a href="javascript:;" class="pull-left">
	                      <img src="${cl.c_photo }" alt="" class="media-object">
	                      </a>
	                      <div class="media-body">
	                        <h4 class="media-heading">${cl.c_name} <span>${cl.gc_create_time} / <a href="javascript:;">回复</a></span></h4>
	                        <p>
	                        	${cl.gc_content }
	                        </p>
	               	<c:if test="${!empty cl.gc_reply}">
	               	  <div class="media">
                        <a href="javascript:;" class="pull-left">
                        <img src="resource/web/frontend/pages/img/people/img2-small.jpg" alt="头像" class="media-object">
                        </a>
                        <div class="media-body">
                          <h4 class="media-heading">卖家回复<span>${cl.gc_reply_time} / <a href="javascript:;">回复</a></span></h4>
                          <p>
                          	${cl.gc_reply}
                          	</p>
                        </div>
                      </div>
	               	</c:if>
                    </div>
                  </div>
	                    
                      <!--end media-->      
	                   </c:forEach> 
	                    <!--end media-->
	                  </div>	
                      <!-- END FORM--> 
                      <!-- Nested media object -->
                                    
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
              <c:forEach items="${goodsAlike }" var="g">
              <div class="item">
                <a href="item?g_id=${g.g_id}"><img src="${g.g_logo}" alt="${g.gt_name}"></a>
                <h3><a href="item?g_id=${g.g_id}">${g.g_name}</a></h3>
                <div class="price">${g.g_price}</div>
              </div>
              </c:forEach>
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
              <c:forEach items="${goodsList}" var="l">
              <div>
                <div class="product-item">
                  <div class="pi-img-wrapper">
                    <img src="${l.g_logo}" class="img-responsive" alt="${l.g_name}">
                    <div>
                      <a href="${l.g_logo}" class="btn btn-default fancybox-button">看大图</a>
                    </div>
                  </div>
                  <h3><a href="item?g_id=${l.g_id}">${l.g_name}</a></h3>
                  <div class="pi-price">￥${l.g_price}</div>
                  <a href="item?g_id=${l.g_id}" class="btn btn-default add2cart">查看详情</a>
<!--                   <div class="sticker sticker-new"></div>
 -->                </div>
              </div>
              </c:forEach>
            </div>
          </div>
        </div>
        <!-- END SIMILAR PRODUCTS -->
      </div>
    </div>

    
	<!-- footer -->
 	<div style="height:345px;">
 		<jsp:include page="footer.jsp"></jsp:include>
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
	<script>
		function purchase(g_id){
			var num=$("input[name='num']").val();
			window.location.href="buy.a?g_id="+g_id+"&num="+num;
		}
		
		//添加商品到购物车
    	function addToCar(g_id){
			$.post("addToCar.a",{g_id:g_id},function(data){
				if(data.flag){
					layer.msg(data.msg,{icon:1,time:2000,end:function(){
						window.location.reload();
					}});
				}else{
					if(data.login){
						layer.msg(data.msg,{icon:1,time:2000,end:function(){
							Login();
						}});
					}else{
						layer.msg(data.msg,{icon:1,time:2000,end:function(){
							window.location.reload();
						}});
					}
				}				
			},"json");    		
    	}
	</script>
	<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
</html>