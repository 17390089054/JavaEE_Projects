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
      	<div class="row margin-bottom-40">
          <!-- BEGIN CONTENT -->
          <div class="col-md-12 col-sm-10">
            <!-- BEGIN PRODUCT LIST -->

             <!-- PRODUCT ITEM START -->
            <div class="row product-list">
             <c:forEach items="${list}" var="l" varStatus="v">
              <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="product-item c">
                  <div class="pi-img-wrapper">
                  <h2>收货地址:</h2>
		            <address style="margin:20px;">
		              <strong style="color:#EC4D1C;">收货人：</strong>${l.c_name}<br>
		              <strong style="color:#EC4D1C;">联系电话：</strong>${l.a_tel}<br>
		              <strong style="color:#EC4D1C;">收货地址：</strong>${l.province_name} ${l.city_name} ${l.area_name}<br>
		            	${l.a_desc}<br>
		            </address>
                  </div>
                  <div class="test">
                  	<c:if test="${v.count eq fn:length(list)}">
                  		<input type="hidden" name="addr_id" value="${l.a_id}" />	
                  	</c:if>
					
					<c:if test="${v.count eq fn:length(list)}">
						  <a href="javascript:;" class="a btn btn-primary chose"   style="float:right;"  onclick="getAddr(${l.a_id},this)">已选择</a>
					</c:if>
					
					<c:if test="${v.count < fn:length(list)}">
						  <a href="javascript:;" class="a btn btn-primary"  style="float:right;"  onclick="getAddr(${l.a_id},this)">选择地址</a>
					</c:if>
               	 	
               	 	<c:if test="${v.count eq 1}">
               	 	<div class="sticker sticker-new"></div>
                	</c:if>
                 </div>
                </div>
              </div>
              </c:forEach>
          </div>
          <!-- PRODUCT ITEM END -->
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
                    <!-- <th class="goods-page-ref-no">类别</th> -->
                    <th class="goods-page-quantity">数量</th>
                    <th class="goods-page-price">单价</th>
                    <th class="goods-page-total" colspan="2">总价</th>
                  </tr>
             <tbody id="tb">
               	<c:forEach items="${shopCarList}" var="goods">
               	<tr>
               		<input type="hidden" name="g_id" value="${goods.g_id}"/>
               		<input type="hidden" name="sc_id" value="${goods.sc_id}">
               		<input type="hidden" name="c_id" value="${goods.sc_client_id}">
                    <td class="goods-page-image">
                      <a href="javascript:;"><img src="${goods.g_logo}" alt="Berry Lace Dress"></a>
                    </td>
                    <td class="goods-page-description">
                      <h3>
                      	<a href="javascript:;" style="width:200px;text-overflow: -o-ellipsis-lastline;overflow: hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;">
							<h2>${goods.g_name}</h2>
						</a>
					  </h3>
                    </td>
                   <%--  <td class="goods-page-ref-no">
                      	<h2>${goods.gt_name }</h2>
                    </td> --%>
                    <td class="goods-page-quantity">
                      <div class="product-quantity">
                          <input id="product-quantity" type="number" min="1" value="${goods.sc_number}"  onchange="getTotal(this.value,${goods.g_price})" readonly class="form-control input-sm">
                      </div>
                    </td>
                    <td class="goods-page-price">
                      <strong><span>￥</span>${goods.g_price}</strong>
                    </td>
                    <td class="goods-page-total">
                      <strong class="price"><span>￥</span><a href="javascript:void(0)">${goods.g_price*goods.sc_number}</a></strong>
                    </td>
                    <td class="del-goods-col">
                      <a class="del-goods" href="javascript:;">&nbsp;</a>
                    </td>
                </tr>
               	</c:forEach>
            </tbody>     	
                </table>
                </div>

                <div class="shopping-total">
                  <ul>
                    <li>
                      <em>商品总金额</em>
                      <strong class="price"><span>￥</span>${payTotal}.00</strong>
                    </li>
                    <li>
                      <em>快递</em>
                      <strong><span>￥</span><t class="tips">10.00</t></strong>
                    </li>
                    <li class="shopping-total-price">
                      <em>订单总价</em>
                      <strong  class="gprice"><span>￥</span>${payTotal +10}.00</strong>
                    </li>
                  </ul>
                </div>
              </div>
              <button class="btn btn-primary" type="button" onclick="addOrder(1)">稍后支付<i class="fa fa-check"></i></button>
              <button class="btn btn-primary" type="button" onclick="addOrder(2)">立即支付<i class="fa fa-check"></i></button>
           </div>
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
      </div>
    </div>
   </div>
	<!-- footer -->
 	<div style="height:345px;">
 		<jsp:include page="footer.jsp"></jsp:include>
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
	        //Layout.initSliderRange();
	    });
	</script>
	<!-- END PAGE LEVEL JAVASCRIPTS -->
	<script>
		
	
	//获取地址ID
	var addr_id=$("input[name='addr_id']").val();
	//点击状态
	var flag=true;
	//用户订单数组
	var arr=new Array();
	
	
	//添加多个订单
	function addOrder(num){//num 订单类型  1未支付 2已支付

		//判断是否有收货地址
	var carList=$(".row.product-list").html();	
	if(!$.trim(carList)){
		layer.alert("尚无收货地址!",{icon:5,end:function(){
			addAddr();
		}});
		return;
	}
		
	 if(num==2){//立即支付
		//支付密码
		pay(arr,2);
	}else{
		addToOrder(arr,2);	
	}
		
	
		
	}
	
	//获取订单对象
	function getOrder(){
		//获取所有商品标签
		var trs=$("#tb").find("tr");
		//遍历
	 	$.each(trs,function(i,n){
			//获取每条订单对象
			var tr=trs[i];
			//查找商品ID 每条订单总价  
			var g_id=$(tr).find("input[name='g_id']").val();
			var c_id=$(tr).find("input[name='c_id']").val();
			var sc_id=$(tr).find("input[name='sc_id']").val();
	 		var tPrice=$(tr).find(".goods-page-total a").html();
	 		//将商品ID 订单总价  地址ID打包成一个对象
	 		var order=new Object();
	 		order.g_id=g_id;
	 		order.c_id=c_id;
	 		order.sc_id=sc_id;
	 		order.totalPrice=parseFloat(parseFloat(tPrice)+10).toFixed(2);
	 		order.addr_id=addr_id;
			arr.push(order);		 		
	 		//console.log(order);
		});
	}
	
	
	//AJAX提交数据修改申请
	function addToOrder(arr,num){
		//获取订单数组
		getOrder();

		$.ajax({
			type:'POST',
			url:'addOrderBatch.a',
			dataType:'json',
			data:{"ordersArr":JSON.stringify(arr),"num":num},
			success:function(data){
				if(data.flag){
					layer.msg(data.msg,{icon:6,time:2000,end:function(){
						window.location.href='Index';
					}})
				}else{
					layer.msg(data.msg,{icon:5,time:2000,end:function(){
						window.location.reload();
					}})
				}
			}
			
		}) 
	}
	
	
	
	
	
	//计算商品总价
	function getTotal(num,price){
		//商品总价
		var goodsAmount=parseFloat(price*num).toFixed(2);
		//运费
		var tip=$(".tips").html();
		//总价格
		var totalPrice=parseFloat(parseFloat(goodsAmount)+parseFloat(tip)).toFixed(2);
		$(".price").html("<span>￥</span>"+goodsAmount);
		console.log(totalPrice);
		$(".gprice").html("<span>￥</span>"+totalPrice);
	}
	
	
	//获取地址
	function getAddr(a_id,obj){
		addr_id=a_id;
	//方法一
		$(".a").removeClass("chose");
		$(".a").html("选择地址"); 
		$(obj).addClass("chose");
		$(obj).html("已选择");
	//方法二		
	/* 	var btns=$(".test").find("a");
			$.each(btns,function(i,n){
				var flag=Boolean($(btns[i]).attr("flag"));
				if(btns[i]==$(obj)[0]){
					 $(btns[i]).addClass("chose");				
					$(btns[i]).html("已选择"); 
				}else{
					$(btns[i]).html("选择地址"); 
				}
			}) */
		 
	}
	
	//没有收货地址 增加收货地址
	function addAddr(){
		top.layer.open({
			type:2,
			title:"新增收货地址",
			shadeClose:false,
			shade:0.2,
			closeBtn:2,
			area:['560px','540px'],
			content:'addressAdd.a',
			end:function(){
					top.layer.closeAll();
					window.location.reload();
		}});
	}
	
	
	
	//支付订单
	function pay(arr,num){
		top.layer.open({
			type:2,
			title:'用户支付',
			shade:0.4,
			closeBtn:0,
			shadeClose:false,
			area:['400px','250px'],
			content:'clientPay',
			end:function(){
				addToOrder(arr,num);
			}
			
		})
	}
		
	
	</script>
	
	
	
	
	
	
</body>
</html>
