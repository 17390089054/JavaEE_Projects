<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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


    <title>商品列表</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="favicon.ico"> <link href="resource/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="resource/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="resource/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="resource/css/animate.css" rel="stylesheet">
    <link href="resource/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
	<!-- 数据表格 -->
        <div class="row">
            <div class="col-md-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>鼠标经过</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="table_basic.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="">选项1</a>
                                </li>
                                <li><a href="">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">

                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>商品图片</th>
                                    <th>商品名称</th>
                                    <th>商品类别</th>
                                    <th>商品价格</th>
                                    <th>商品数量</th>
                                    <th>商品产地</th>
                                    <th>上传者</th>
                                    <th>创建时间</th>
                                    <th>商品操作</th>
                                </tr>
                            </thead>
                            <tbody>
                           	<c:forEach items="${goodsList}" var="g">
                                <tr>
                                    <td><img src="${g.g_logo}" width="50px" height="50px" alt="logo"></td>
                                    <td>${g.g_name}</td>
                                    <td>${g.gt_name} </td>
                                    <td class="text-navy"> 
                                    	<i class="fa fa-cny"></i>${g.g_price}
                                    </td>
                                    <td>${g.g_number}</td>
                                    <td>${g.g_addr}</td>
                                    <td>${g.user_name}</td>
                                    <td>${g.g_create_time}</td>
                                    <td>
                                    	<c:if test="${g.g_status eq 1}">
                                    		<button class="btn btn-sm btn-warning" type="button"  style="outline:none" onclick="editGoods(${g.g_id})">编辑</button>&nbsp;
											<button class="btn btn-sm btn-danger" type="button" style="outline:none" onclick="deleteGoods('${g.g_name}',${g.g_id})">下架</button>
										</c:if>
										<c:if test="${g.g_status eq 0}">
											<button class="btn btn-sm btn-default" type="button" style="display:block;disabled:true;outline:none">已下架</button>
										</c:if>
										
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
     
    </div>

    <!-- 全局js -->
    <script src="resource/js/jquery.min.js?v=2.1.4"></script>
    <script src="resource/js/bootstrap.min.js?v=3.3.6"></script>
    <!-- Peity -->
    <script src="resource/js/plugins/peity/jquery.peity.min.js"></script>
    <!-- 自定义js -->
    <script src="resource/js/content.js?v=1.0.0"></script>
    <script src='resource/layer/layer.js'></script>
    <!-- iCheck -->
    <script src="resource/js/plugins/iCheck/icheck.min.js"></script>
    <!-- Peity -->
    <script src="resource/js/demo/peity-demo.js"></script>
    <script>
         $(document).ready(function () {
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
        }); 
    </script>
	
	<script>
		//编辑商品信息
		function editGoods(g_id){
			top.layer.open({
				title:'编辑商品信息',
				type:2,
				shadeClose:false,
				closeBtn:2,
				shade:0.4,
				area:['540px','580px'],
				content:'goodsRevise.do?g_id='+g_id,
				end:function(){
					window.location.reload();
					//window.location.href='goodsList.do';
				}
			});

		}
		
		//删除商品信息(商品下架)
		function deleteGoods(g_name,g_id){
			layer.confirm("您确实要下架【"+g_name+"】?",{btn:['是的,我确定','不,让我想想']},function(){
				$.post("goodsDelete.do",{"g_id":g_id},function(data){
					if(data.flag){
						layer.alert(data.msg,{icon:1});
					}else{
						layer.alert(data.msg,{icon:2});
					}
				
				},"json")
				layer.closeAll();
				window.location.reload();
			});
			
		}
	
	
	</script>
</body>

</html>
