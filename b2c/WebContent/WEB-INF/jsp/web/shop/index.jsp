<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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
<link rel="shortcut icon" href="resource/img/favicon.ico"> 
<link href="resource/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="resource/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
<link href="resource/css/animate.css" rel="stylesheet">
<link href="resource/css/style.css?v=4.1.0" rel="stylesheet">
<!-- Theme styles END -->
<script src="resource/web/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="resource/web/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<script src="resource/web/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>      
<script src="resource/web/frontend/layout/scripts/back-to-top.js" type="text/javascript"></script>
<script src="resource/web/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->

</head>
<!-- Body BEGIN -->
<body class="ecommerce">
	<div style="height:150px;">
	<!-- 导航栏及标签 -->
		<jsp:include page="header.jsp"></jsp:include>
	</div>
    
    <!-- BEGIN SLIDER -->
    <div class="page-slider margin-bottom-35">
      
      <!-- LayerSlider start -->
      <div id="layerslider" style="width: 100%; height: 494px; margin: 0 auto;">

        <!-- slide one start -->
        <div class="ls-slide ls-slide1" data-ls="offsetxin: right; slidedelay: 7000; transition2d: 24,25,27,28;">

          <img src="resource/web/frontend/pages/img/layerslider/slide1/bg.jpg" class="ls-bg" alt="Slide background">

          <div class="ls-l ls-title" style="top: 96px; left: 35%; white-space: nowrap;" data-ls="
            fade: true; 
            fadeout: true; 
            durationin: 750; 
            durationout: 750; 
            easingin: easeOutQuint; 
            rotatein: 90; 
            rotateout: -90; 
            scalein: .5; 
            scaleout: .5; 
            showuntil: 4000;
          "><!-- 新款<strong>女士围裙</strong>你值得拥有 --></div>

          <div class="ls-l ls-mini-text" style="top: 338px; left: 35%; white-space: nowrap;" data-ls="
          fade: true; 
          fadeout: true; 
          durationout: 750; 
          easingin: easeOutQuint; 
          delayin: 300; 
          showuntil: 4000;
          "><!-- 今日特价<br >快来看一看吧！ -->
          </div>
        </div>
        <!-- slide one end -->

        <!-- slide two start -->
        <div class="ls-slide ls-slide2" data-ls="offsetxin: right; slidedelay: 7000; transition2d: 110,111,112,113;">

          <img src="resource/web/frontend/pages/img/layerslider/slide2/bg.jpg" class="ls-bg" alt="Slide background">
          
          <div class="ls-l ls-title" style="top: 40%; left: 21%; white-space: nowrap;" data-ls="
          fade: true; 
          fadeout: true;  
          durationin: 750; durationout: 109750; 
          easingin: easeOutQuint; 
          easingout: easeInOutQuint; 
          delayin: 0; 
          delayout: 0; 
          rotatein: 90; 
          rotateout: -90; 
          scalein: .5; 
          scaleout: .5; 
          showuntil: 4000;
          "><!-- <strong></strong> -->
            </div>

          <div class="ls-l ls-price" style="top: 50%; left: 45%; white-space: nowrap;" data-ls="
          fade: true; 
          fadeout: true;  
          durationout: 109750; 
          easingin: easeOutQuint; 
          delayin: 300; 
          scalein: .8; 
          scaleout: .8; 
          showuntil: 4000;">
          </div>

         <!--  <a href="javascript:;" class="ls-l ls-more" style="top: 72%; left: 21%; display: inline-block; white-space: nowrap;" data-ls="
          fade: true; 
          fadeout: true; 
          durationin: 750; 
          durationout: 750; 
          easingin: easeOutQuint; 
          easingout: easeInOutQuint; 
          delayin: 0; 
          delayout: 0; 
          rotatein: 90; 
          rotateout: -90; 
          scalein: .5; 
          scaleout: .5; 
          showuntil: 4000;">
          </a> -->
        </div>
        <!-- slide two end -->

        <!-- slide three start -->
        <div class="ls-slide ls-slide3" data-ls="offsetxin: right; slidedelay: 7000; transition2d: 92,93,105;">

          <img src="resource/web/frontend/pages/img/layerslider/slide3/bg.jpg" class="ls-bg" alt="Slide background">
          
          <div class="ls-l ls-title" style="top: 83px; left: 33%; white-space: nowrap;" data-ls="
          fade: true; 
          fadeout: true; 
          durationin: 750; 
          durationout: 750; 
          easingin: easeOutQuint; 
          rotatein: 90; 
          rotateout: -90; 
          scalein: .5; 
          scaleout: .5; 
          showuntil: 4000;
          ">
          </div>
          <div class="ls-l" style="top: 333px; left: 33%; white-space: nowrap; font-size: 20px; font: 20px 'Open Sans Light', sans-serif;" data-ls="
          fade: true; 
          fadeout: true; 
          durationout: 750; 
          easingin: easeOutQuint; 
          delayin: 300; 
          scalein: .8; 
          scaleout: .8; 
          showuntil: 4000;
          ">
           <!--  <a href="javascript:;" class="ls-buy">
              Buy It Now!
            </a>
            <div class="ls-price">
              <span>All these for only:</span>
              <strong>25<sup>$</sup></strong> -->
            </div>
          </div>
        </div>
        <!-- slide three end -->

        <!-- slide four start -->
        <div class="ls-slide ls-slide4" data-ls="offsetxin: right; slidedelay: 7000; transition2d: 110,111,112,113;">

          <img src="resource/web/frontend/pages/img/layerslider/slide5/bg.jpg" class="ls-bg" alt="Slide background">
          
          <div class="ls-l ls-title" style="top: 35%; left: 60%; white-space: nowrap;" data-ls="
          fade: true; 
          fadeout: true; 
          durationin: 750; 
          durationout: 750; 
          easingin: easeOutQuint; 
          rotatein: 90; 
          rotateout: -90; 
          scalein: .5; 
          scaleout: .5; 
          showuntil: 4000;">
          </div>

          <div class="ls-l ls-mini-text" style="top: 70%; left: 60%; white-space: nowrap;" data-ls="
          fade: true; 
          fadeout: true;  
          durationout: 750; 
          easingin: easeOutQuint; 
          delayin: 300; 
          scalein: .8; 
          scaleout: .8; 
          showuntil: 4000;">
        <!--   <span></span> -->
          <!-- <a href="javascript:;"></a> -->
          </div>

        </div>
        <!-- slide four end -->
      </div>
      <!-- LayerSlider end -->
    </div>
    <!-- END SLIDER -->



    <div class="main">
      <div class="container">
        <!-- BEGIN SALE PRODUCT & NEW ARRIVALS -->
        <div class="row margin-bottom-40">
          <!-- BEGIN SALE PRODUCT -->
          <div class="col-md-12 sale-product">
            <h2>新品推荐</h2>
            <div class="owl-carousel owl-carousel5">
              <c:forEach items="${list}" var="g" varStatus="v">
	              <div>
	                <div class="product-item">
	                  <div class="pi-img-wrapper">
	                    <img src="${g.g_logo}" class="img-responsive" alt="Berry Lace Dress">
	                    <div>
	                      <a href="${g.g_logo}" class="btn btn-default fancybox-button">预览</a>
	                      <a href="item?g_id=${g.g_id}" class="btn btn-default fancybox-fast-view">查看详情</a>
	                    </div>
	                  </div>
	                  <h3><a href="item?g_id=${g.g_id}">${g.g_name}</a></h3>
	                  <div class="pi-price" >￥${g.g_price}</div>
	                  <a href="javascript:void(0)" onclick="addToCar(${g.g_id})" class="btn btn-default add2cart">加入购物车</a>
	                  <c:if test="${v.count <= 3}">
	                  		<div class="sticker sticker-sale"></div>
	                  </c:if>
	                </div>
	                <div class="owl-buttons"><div class="owl-prev">prev</div><div class="owl-next">next</div></div>
	              </div>
              </c:forEach>
            </div>
          </div>
          <!-- END SALE PRODUCT -->
        </div>
        <!-- END SALE PRODUCT & NEW ARRIVALS -->

        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40 ">
          <!-- BEGIN SIDEBAR -->
          <div class="sidebar col-md-3 col-sm-4">
            <ul class="list-group margin-bottom-25 sidebar-menu">
            <c:forEach items="${parentList}" var="p">
              <li class="list-group-item clearfix dropdown">
                <a href="javascript:void(0)">
                  <i class="fa fa-angle-right"></i>
                  	${p.gt_name}
                </a>
                <ul class="dropdown-menu">
	                <c:forEach items="${childList}" var="c" >
		                <c:if test="${p.gt_id eq c.gt_parent_id}">
		                  <li class="list-group-item dropdown clearfix" >
		                    <a href="javascript:void(0)" onclick="queryGoods(${c.gt_id})"><i class=""></i>${c.gt_name}</a>
	                  	  </li>
		                </c:if>
	                </c:forEach>   
                </ul>
              </li>
            </c:forEach>
            </ul>
          </div>
          <!-- END SIDEBAR -->
          
          <!-- BEGIN CONTENT -->
          <div class="col-md-9 col-sm-8" >
            <!-- <h2>商品列表</h2> -->
            <div class="owl-carousel owl-carousel3" id="gList">
             <c:forEach items="${gsList}" var="gsl">
	             <div>
	                <div class="product-item">
	                  <div class="pi-img-wrapper">
	                    <img src="${gsl.g_logo}" class="img-responsive" alt="商品图片">
	                    <div>
	                      <a href="${gsl.g_logo}" class="btn btn-default fancybox-button">看大图</a>
	                      <a href="item?g_id=${gsl.g_id}" class="btn btn-default fancybox-fast-view"  >查看详情</a>
	                    </div>
	                  </div>
	                  <h3><a href="item?g_id=${gsl.g_id}">${gsl.g_name }</a></h3>
	                  <div class="pi-price">￥${gsl.g_price}</div>
	                  <a href="javascript:;" class="btn btn-default add2cart" onclick="addToCar(${gsl.g_id})">加入购物车</a>
	                </div>
	              </div>
             </c:forEach>
            </div>
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->

    <!-- BEGIN TWO PRODUCTS & PROMO -->
        <div class="row margin-bottom-35 ">
          <!-- BEGIN TWO PRODUCTS -->
          <div class="col-md-6 two-items-bottom-items">
            <h2>今日推荐</h2>
            <div class="owl-carousel owl-carousel2">
              
                <c:forEach items="${gcList}" var="gcl">
	              <div>
	                <div class="product-item">
	                  <div class="pi-img-wrapper">
	                    <img src="${gcl.g_logo}" class="img-responsive" alt="商品图标">
	                    <div>
	                      <a href="${gcl.g_logo}" class="btn btn-default fancybox-button">看大图</a>
	                      <a href="item?g_id=${gcl.g_id}" class="btn btn-default fancybox-fast-view">查看详情</a>
	                    </div>
	                  </div>
	                  <h3><a href="item?g_id=${gcl.g_id}">${gcl.g_name}</a></h3>
	                  <div class="pi-price">${gcl.g_price}</div>
	                  <a href="javascript:;"  onclick="addToCar(${gcl.g_id})" class="btn btn-default add2cart">加入购物车</a>
	                </div>
	              </div>
                </c:forEach>
              
            </div>
          </div>
          <!-- END TWO PRODUCTS -->
          
          <!-- BEGIN PROMO -->
          <div class="col-md-6 shop-index-carousel">
            <div class="content-slider">
              <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                  <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                  <li data-target="#myCarousel" data-slide-to="1"></li>
                  <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                  <div class="item active">
                    <img src="resource/img/b1.jpg" class="img-responsive" alt="Berry Lace Dress">
                  </div>
                  <div class="item">
                    <img src="resource/img/b2.jpg" class="img-responsive" alt="Berry Lace Dress">
                  </div>
                  <div class="item">
                    <img src="resource/img/b3.jpg" class="img-responsive" alt="Berry Lace Dress">
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- END PROMO -->
        </div>        
        <!-- END TWO PRODUCTS & PROMO -->
      </div>
       <!--mini聊天窗口开始-->
       
        <div id="small-chat">
            <span class="badge badge-warning pull-right"></span>
            <a class="open-small-chat" id="chat">
                <i class="fa fa-comments"></i>
            </a>
        </div>
        <!--mini聊天窗口结束-->
    </div>
	
	<!-- footer -->
 	<div style="height:345px;">
 		<jsp:include page="footer.jsp"></jsp:include>
 	</div>
 
    <!-- BEGIN fast view of a product -->
    <div id="product-pop-up" style="display: none; width: 700px;">
            <div class="product-page product-pop-up">
              <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-3">
                  <div class="product-main-image">
                    <img src="resource/web/frontend/pages/img/products/model7.jpg" alt="Cool green dress with red bell" class="img-responsive">
                  </div>
                  <div class="product-other-images">
                    <a href="javascript:;" class="active"><img alt="Berry Lace Dress" src="resource/web/frontend/pages/img/products/model3.jpg"></a>
                    <a href="javascript:;"><img alt="Berry Lace Dress" src="resource/web/frontend/pages/img/products/model4.jpg"></a>
                    <a href="javascript:;"><img alt="Berry Lace Dress" src="resource/web/frontend/pages/img/products/model5.jpg"></a>
                  </div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-9">
                  <h2>Cool green dress with red bell</h2>
                  <div class="price-availability-block clearfix">
                    <div class="price">
                      <strong><span>$</span>47.00</strong>
                      <em>$<span>62.00</span></em>
                    </div>
                    <div class="availability">
                      Availability: <strong>In Stock</strong>
                    </div>
                  </div>
                  <div class="description">
                    <p>Lorem ipsum dolor ut sit ame dolore  adipiscing elit, sed nonumy nibh sed euismod laoreet dolore magna aliquarm erat volutpat 
Nostrud duis molestie at dolore.</p>
                  </div>
                  <div class="product-page-options">
                    <div class="pull-left">
                      <label class="control-label">Size:</label>
                      <select class="form-control input-sm">
                        <option>L</option>
                        <option>M</option>
                        <option>XL</option>
                      </select>
                    </div>
                    <div class="pull-left">
                      <label class="control-label">Color:</label>
                      <select class="form-control input-sm">
                        <option>Red</option>
                        <option>Blue</option>
                        <option>Black</option>
                      </select>
                    </div>
                  </div>
                  <div class="product-page-cart">
                    <div class="product-quantity">
                        <input id="product-quantity" type="text" value="1" readonly name="product-quantity" class="form-control input-sm">
                    </div>
                    <button class="btn btn-primary" type="submit">加入购物车</button>
                    <a href="shop_item.jsp" class="btn btn-default">查看详情</a>
                  </div>
                </div>

                <div class="sticker sticker-sale"></div>
              </div>
            </div>
    </div>
    
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
	    jQuery(document).ready(function() {
	        Layout.init();    
	        Layout.initOWL();
	        LayersliderInit.initLayerSlider();
	        Layout.initImageZoom();
	        Layout.initTouchspin();
	        Layout.initTwitter();
	    });
	</script>
	<!-- END PAGE LEVEL JAVASCRIPTS -->
    <script>
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
    	
    	//点击事件修改商品类别列表商品
    	function  queryGoods(gt_id){
    		//ajax实现动态修改
    		 $.post("Index",{"gt_id":gt_id},function(data){
    			 //先清空列表中的信息
    			 var html="<div class='owl-wrapper-outer'>"+
    			 "<div class='owl-wrapper' style='width: 1692px; left: 0px; display: block;'>";
    			 $("#gList").html("");
    			 //循环修改商品列表内容
    			 $.each(data,function(i,n){
    				html+=
    					'<div class="owl-item active" style="width: 282px;">'+
    					'<div>'
    	                +'<div class="product-item">'
	                  	+'<div class="pi-img-wrapper">'
	                    +'<img src="'+data[i].g_logo+'" class="img-responsive" alt="商品图片">'
	                    +'<div>'
	                      +'<a href="'+data[i].g_logo+'" class="btn btn-default fancybox-button">看大图</a>'
	                      +'<a href="item?g_id='+data[i].g_id+'" class="btn btn-default fancybox-fast-view"  >查看详情</a>'
	                    +'</div>'
	                  +'</div>'
	                  +'<h3><a href="item?g_id='+data[i].g_id+'">'+data[i].g_name+'</a></h3>'
	                  +'<div class="pi-price">￥'+data[i].g_price+'</div>'
	                  +'<a href="javascript:;" class="btn btn-default add2cart" onclick="addToCar('+data[i].g_id+')">加入购物车</a>'
	                +'</div>'
	              +'</div></div>'
	              ;
    			 });
    			$("#gList").html(html+"</div></div>");
				    			
    		},"json"); 
    		
    	}
    	
    	//聊天窗口
    	 $("#chat").click(function(){
			top.layer.open({
				type:2,
				title:"智能客服",
				shadeClose:false,
				shade:0.4,
				area:['800px','650px'],
				content:'Chat'
			});
		});
    </script>
</body>
</html>