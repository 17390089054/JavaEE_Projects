<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>   
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
    <title>Go商城购物车</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">
    <link rel="shortcut icon" href="resource/img/favicon.ico"> 
    <link href="resource/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="resource/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="resource/css/animate.css" rel="stylesheet">
    <link href="resource/css/style.css?v=4.1.0" rel="stylesheet">
</head>

<body class="gray-bg">
  <!--   <div class="row"> -->
        <div class="wrapper wrapper-content animated fadeRight">
            <div class="row">
                <div class="col-sm-12" >
                    <div class="wrapper wrapper-content animated fadeInRight">
                        <div class="ibox-content m-b-sm border-bottom">
                            <div class="p-xs">
                                <div class="pull-left m-r-md">
                                    <i class="fa fa-globe text-navy mid-icon"></i>
                                </div>
                                <h2>Go商城购物车</h2>
                                <span>你可以自由选择你喜欢的商品。</span>
                            </div>
                        </div>

					<c:if test="${fn:length(carList) != 0}">
                        <div class="ibox-content forum-container">
                            <div class="forum-title">
                                <div class="pull-right forum-desc">
                                    <samll>商品总数量: ${sum}</samll>
                                </div>
                              <!--   <h3>主版</h3> -->
                            </div>

                    <div class="forum-item active">
                    	<c:forEach items="${carList}" var="l">
                           <div class="row">
                               <div class="col-sm-12">
                                   <div class="forum-icon">
                                       <input type="checkbox" style="display: inline-block;width:20px;height:20px;background:#fff" value="${l.g_price * l.sc_number}" onclick="checkGoodsItem(this,${l.sc_goods_id})" />
                                   	   <input type="hidden" name="sc_id" value="${l.sc_id}">
                                   </div>
                                   <div style="float:left">
                                   	<img src="${l.g_logo}" width="100px" height="100px" alt="商品logo"/>
                                   </div>
                                  <div style="float:left;width:200px;height:120px;padding:2px;color:#e6d42e">
                                   <div class="" style="font-size:20px"><span>${l.g_name}</span></div>
                                  	 <span style="font-size:20px">￥</span><span style="font-size:20px" id="price"> ${l.g_price}</span>
                                  </div>
                                  	<span style="display:block;float:left;width:90px;height:80px;padding:20px;">
                                      <input type="number" style="width:65px;height:40px;font-size:20px;outline:none;text-align:center;color:#ff8f00" min="1" name="sc_number" value="${l.sc_number}" onchange="changeCount(this)"/>
                                  		<input type="hidden" name="sc_id" value="${l.sc_id}">
                                   </span>
                                   <span style="display:block;float:left;width:120px;height:80px;padding:20px;font-size:25px;color:red" id="total">
                                   	￥${l.g_price * l.sc_number}
                                   </span>
                                   <span style="float:right;margin:20px auto">
                                  	 	<button class="btn btn-md btn-warning" onclick="collect(${l.sc_goods_id},${l.sc_client_id})">收藏</button>&nbsp;&nbsp;
                                       <button class="btn btn-md btn-danger" onclick="deleteGoods(${l.sc_id})">删除</button>
                                   </span>
                               </div>
                           </div>
                    	</c:forEach>
                    </div>
                    	
                    	<div style="float:right;margin-top:-5px;width:250px;height:50px;background:#fff;">
                    		<span style="display:block;width:150px;height:20px;font-size:20px;color:#28bbbc;margin-right:35px;text-align:center;line-height:35px" id="payTotal">总价: 0.00</span>
                    		<button class="btn btn-md btn-danger" style="float:right;display:block;width:100px;height:40px;margin-top:-20px;margin-left:25px" onclick="toSub()">&nbsp;&nbsp;结&nbsp;&nbsp; 算&nbsp;&nbsp;</button>
                    	</div>
                        </div>
                     </c:if> 
                     <c:if test="${fn:length(carList) eq 0}">
                     		<div style="width:100%;height:20%;margin:10px auto">
                     			 	<h1 style="display:block;margin-left:350px;color:lightblue">暂无商品,去<a href="Index">主页</a>看看吧</h1>
                     		</div>
                     </c:if>  
                        <div style="background:#fff;height:20px;"></div>
                    </div>
                </div>
            </div>
        </div>
   <!--  </div> -->

    <!-- 全局js -->
    <script src="resource/js/jquery.min.js?v=2.1.4"></script>
    <script src="resource/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="resource/layer/layer.js"></script>
    <!-- Peity -->
    <script src="resource/js/plugins/peity/jquery.peity.min.js"></script>
    <!-- 自定义js -->
    <script src="resource/js/content.js?v=1.0.0"></script>
    <div class="gohome">
	    <a class="animated bounceInUp" href="Index" title="返回首页">
	    	<i class="fa fa-home"></i>
	    </a>
    </div>
    <script>
    //数组存放商品id
    var arr=new Array();
    //购物车商品总价
    var payTotal=0.00;
    
    //复选框选中计算商品综合
    function checkGoodsItem(obj,g_id){
    	//判断是否选中
    	if($(obj).is(":checked")){
    		
    		/* var priceContent=$(obj).parent().parent().find("#price").html();	
    		var price=parseFloat(priceContent);
    		var num=$(obj).parent().parent().find("input[name='sc_number']").val();
    		total=price*num;
    		payTotal+=total; */

    		arr.push(g_id);
    	}else{//取消则减少
    		/* var priceContent=$(obj).parent().parent().find("#price").html();	
    		var price=parseFloat(priceContent);
    		var num=$(obj).parent().parent().find("input[name='sc_number']").val();
    		total=price*num;
    		 
	    	payTotal-=total; */
	    	
			arr.pop(g_id);
    	}
		
    	calTotal();
    	//$("#payTotal").html("总价:￥"+payTotal.toFixed(2));
    }
    
    //结算订单
    function toSub(){
    	if(arr.length==0){
    		layer.alert("请选择你要结算的商品!",{icon:4});
    		return;
    	}
    	/* application/x-www-form-urlencoded */
		 $.ajax({
			type:'POST',
			url:'addToPay.a',
			dataType:'json',
			data:{"array":arr,"payTotal":payTotal},
			success:function(data){
				 layer.msg(data.msg,{icon:1,time:1000,end:function(){
					window.location.href='clientBuy.a'					
				}}) 
			}
		});
		
    }
    
    
    
	//修改购物车商品数量
		function changeCount(obj){
		//更改商品数量 价格 总价
		var priceContent=$(obj).parent().parent().find("#price").html();	
		var price=parseFloat(priceContent).toFixed(2);
		
		var num=$(obj).val();

		var total=parseFloat(num*price).toFixed(2);
		$(obj).parent().parent().find("#total").html("￥"+total);
		var sc_id=$(obj).parent().parent().find("input[name='sc_id']").val();
		
		//AJAX提交数据修改申请
		 $.post("reviseNum.a",{"num":num,"sc_id":sc_id},function(data){
			//更新商品数量
			 $(obj).find("input[name='sc_number']").val(num);
			 //更新商品总价
			 total=parseFloat(num*price).toFixed(2);
			 $(obj).parent().parent().find("#total").html("￥"+total);
			 
			 //更新价格购物车商品总价
			 calTotal();
			 
			 
		},"json"); 
		}
		
	
		function calTotal(){
			var totalPrice=0.00;
			var rows=$(".forum-item.active").find(".col-sm-12");
			for(var i=0;i<rows.length;i++){
				var row=rows[i];
				var checkbox=$(row).find("input[type='checkbox']");
				if($(checkbox).is(":checked")){
					//获取所选商品价格和数量
					var price =parseFloat($(row).find("#price").html());
					var number=$(row).find("input[name='sc_number']").val();
					//计算总价
					totalPrice+=price*number;
				} 
				
				
			}
			$("#payTotal").html("总价:￥"+totalPrice.toFixed(2));		
		}
		
	
	
	
		//收藏商品
			function collect(g_id){
			$.post("collect.a",{"g_id":g_id},function(data){
				top.layer.alert(data.msg,{icon:1,end:function(){
					window.location.reload();
				}});
			},"json");
			
			
		}
		
		//删除商品
		function deleteGoods(sc_id){
			top.layer.confirm("确定要删除么?",{btn:['YES','NO'],icon:3},function(){
				$.post("delCarItem.a",{"sc_id":sc_id},function(data){
		    		top.layer.alert(data.msg,{icon:1,end:function(){
		    			window.location.reload();
		    		}});
		    	},"json")
			},function(){
				top.layer.closeAll();
			})
		} 

    
    
    </script>

</body>

</html>
