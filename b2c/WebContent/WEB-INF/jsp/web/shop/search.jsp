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
		<jsp:include page="header.jsp"></jsp:include>
	</div>
    <div class="main">
      <div class="container">
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN CONTENT -->
          <div class="col-md-12 col-sm-10">
            <div class="content-search margin-bottom-20">
              <div class="row">
                <div class="col-md-6">
                  <h1>以下是您搜索的<em id="search">${sc}</em>结果：</h1>
                </div>
                <div class="col-md-6">
                    <div class="input-group">
                      <input type="text" name="sc" placeholder="请输入搜索条件" class="form-control" >
                      <span class="input-group-btn">
                        <button class="btn btn-primary" type="button" id="btn" onclick="toSub()">搜索</button>
                      </span>
                    </div>
                </div>
              </div>
            </div>
            <div class="row list-view-sorting clearfix">
              <div class="col-md-2 col-sm-2 list-view">
                <a href="javascript:;"><i class="fa fa-th-large"></i></a>
                <a href="javascript:;"><i class="fa fa-th-list"></i></a>
              </div>
              <div class="col-md-10 col-sm-10">
                <div class="pull-right">
                  <label class="control-label">显示:</label>
                  <select class="form-control input-sm" name="number" onchange="toSub()">
                    <option value="4">4</option>
                    <option value="8">8</option>
                    <option value="12">12</option>
                    <option value="16">16</option>
                    <option value="20">20</option>
                  </select>
                </div>
                <div class="pull-right">
                  <label class="control-label">排序方式：</label>
                  <select class="form-control input-sm" name="type"  onchange="toSub()">
                    <option value="1">综合</option>
                    <option value="2">库存</option>
                    <option value="3">最新上架</option>
                    <option value="4">价格(由高到低)</option>
                    <option value="5">价格(由低到高)</option>
                  </select>
                </div>
              </div>
            </div>
            <div class="row product-list">
            <!-- BEGIN PRODUCT LIST -->
            <c:forEach items="${goodsList}" var="gl" varStatus="v">
	            <c:if test="${v.count % 4 eq 0 }">
	             <div class="row product-list">
	            </c:if>
		              <!-- PRODUCT ITEM START -->
		              <div class="col-md-3 col-sm-6 col-xs-12">
		                <div class="product-item">
		                  <div class="pi-img-wrapper">
		                    <img src="${gl.g_logo}" class="img-responsive" alt="商品logo">
		                    <div>
		                      <a href="${gl.g_logo}" class="btn btn-default fancybox-button">看大图</a>
		                      <a href="item?g_id=${gl.g_id}" class="btn btn-default fancybox-fast-view">查看详情</a>
		                    </div>
		                  </div>
		                  <h3><a href="shop-item.html">${gl.g_name}</a></h3>
		                  <div class="pi-price">￥${gl.g_price}</div>
		                  <a onclick="addToCar(${gl.g_id})" class="btn btn-default add2cart">加入购物车</a>
		                </div>
		              </div>
		              <!-- PRODUCT ITEM END -->
				 <c:if test="${v.count % 4 eq 0 }">	           
	          	 </div>
	            </c:if> 
           </c:forEach>  
           
           </div>
            <!-- END PRODUCT LIST -->
            <!-- BEGIN PAGINATOR -->
            <div class="row">
              <div class="col-md-4 col-sm-4 items-info">第1页 共<span style="color:#666">${count}</span>条</div>
              <div class="col-md-8 col-sm-8">
                <ul class="pagination pull-right">
                  <li><a href="javascript:;">首页</a></li>
                  <li><a href="javascript:;">上一页</a></li>
                  <li><a href="javascript:;">下一页</a></li>
                  <li><a href="javascript:;">尾页</a></li>
                </ul>
              </div>
            </div>
            <!-- END PAGINATOR -->
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
      </div>
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
                  <h1>Cool green dress with red bell</h1>
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
                    <button class="btn btn-primary" type="submit">Add to cart</button>
                    <a href="shop-item.html" class="btn btn-default">More details</a>
                  </div>
                </div>

                <div class="sticker sticker-sale"></div>
              </div>
            </div>
    </div>
    <!-- END fast view of a product -->
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
	<script src="resource/layer/layer.js"></script>
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
	        //Layout.initSliderRange();
	    });
	</script>
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
	
	
	//回车提交表单
	$(function(){
		$(document).keydown(function(e){
			if(e.keyCode==13){
				toSub();
			}
		})
	});
	
	//提交表单
		function toSub(){
			var number=$.trim($("select[name='number']").val());
			var type=$("select[name='type']").val();
			var sc=$.trim($("input[name='sc']").val());
			$("#search").html(sc);
			var pageNow=$("input[name='pageNow']").val();
			//ajax传值
			$.ajax({
				type:"POST",
				url:"search",
				data:{"search_condition":sc,"type":type,"number":number,"pageNow":pageNow},
				dataType:"json",
				success:function(data){
					var pl=$(".product-list");
					pl.html("");
					for(var i=0;i<data.length;i++){
						pl.append("<div class='col-md-3 col-sm-6 col-xs-12'>"+
				                "<div class='product-item'>"+
		                  "<div class='pi-img-wrapper'>"
		                    +"<img src='"+data[i].g_logo+"' class='img-responsive' alt='商品logo'>"+
		                    "<div>"+
		                      +"<a href='"+data[i].g_logo+"' class='btn btn-default fancybox-button'>看大图</a>"
		                      +"<a href='item?g_id="+data[i].g_id+"' class='btn btn-default fancybox-fast-view'>查看详情</a>"
		                    +"</div>"
		                  +"</div>"
		                  +"<h3><a href=item?g_id='"+data[i].g_id+"'>"+data[i].g_name+"</a></h3>"
		                  +"<div class='pi-price'>￥"+data[i].g_price+"</div>"
		                  +"<a href='javascript:;' class='btn btn-default add2cart'>加入购物车</a>"
		                +"</div>"
		              +"</div>");
					}
				}
			});
		}
	</script>
	<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
</html>