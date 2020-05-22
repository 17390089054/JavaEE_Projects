<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>    
<%
	String path = request.getContextPath(); 
	String realPath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html >
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>H+ 后台主题UI框架 - 树形视图</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">
    <link rel="shortcut icon" href="resource/img/favicon.ico"> <link href="resource/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="resource/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="resource/css/plugins/jsTree/style.min.css" rel="stylesheet">
    <link href="resource/css/animate.css" rel="stylesheet">
    <link href="resource/css/style.css?v=4.1.0" rel="stylesheet">
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content  animated fadeInRight">
        <div class="row" >
            <div class="col-sm-6" style="float:left;margin-left:300px" >
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>商品类别 <small>商品类别管理</small></h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
						<div style="margin-left:40px">
							<button class="btn btn-info btn-md" type="button" onclick="addParent()">新增父类别</button>
						</div>
                        <div id="jstree1" >
                            <ul>
                                <li class="jstree-open">商品类别汇总
                                    <ul>
                                       <c:forEach items="${parentList}" var="p">
	                                       	<li class="jstree-open" onclick="operateParent(${p.gt_id},'${p.gt_name}')">${p.gt_name}
	                                            <ul>
	                                            	<c:forEach items="${childList}" var="c">
	                                                	<c:if test="${p.gt_id eq c.gt_parent_id}">
	                                                		<li data-jstree='{"type":"css"}' onclick="oprateChild(event,this,'${c.gt_name}',${c.gt_id},${c.gt_parent_id})"> ${c.gt_name }</li>
														</c:if>
													</c:forEach>
													<li data-jstree='{"type":"css"}' onclick="addChild(${p.gt_id},event)">点击新增</li>
	                                            </ul>
	                                        </li>
                                       </c:forEach>
                                    </ul>
                                </li>
                            </ul>
                        </div>

                    </div>
                </div>
            </div>
        
        </div>


    </div>


    <!-- 全局js -->	
    <script src="resource/js/jquery.min.js?v=2.1.4"></script>
    <script src="resource/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="resource/layer/layer.js"></script>
	
    <!-- 自定义js -->
	<script src="resource/js/content.js?v=1.0.0"></script>

    <!-- jsTree plugin javascript -->
    <script src="resource/js/plugins/jsTree/jstree.min.js"></script>

    <style>
        .jstree-open > .jstree-anchor > .fa-folder:before {
            content: "\f07c";
        }

        .jstree-default .jstree-icon.none {
            width: 0;
        }
    </style>
    <script>
    //添加父菜单元素
		function addParent(){
			top.layer.open({
				type:2,
				title:"新增父类商品类别",
				shadeClose:false,
				shade:0.4,
				closeBtn:2,
				area:["480px","280px"],
				content:'addParent.do'
				,end:function(){
					window.location.reload();
				}
			})
			
		}    
    //添加子菜单元素
    	function addChild(gt_id,e){
    	e.stopPropagation();
    		 top.layer.open({
    			type:2,
    			title:'添加子商品类别',
    			shadeClose:false,
    			shade:0.3,
    			closeBtn:2,
    			area:['480px','280px'],
    			content:'addChild.do?gt_id='+gt_id,
    			end:function(){
    				window.location.reload();
    			}	
    		}); 
    	
    }
    
    //父类元素操作
    function operateParent(gt_id,gt_name){
    	top.layer.confirm("你想进行哪项操作?",{btn:['修改商品','删除商品','取消'],function(index){//按钮三 取消
    		layer.close(index);
    	}},function(){//按钮一 修改商品
			top.layer.open({
				type:2,
				title:'修改商品名称',
				shadeClose:false,
				shade:0.2,
				closeBtn:2,
				area:['480px','280px'],
				content:'reviseGoodsType.do?gt_name='+gt_name+"&id="+gt_id
				,end:function(){
				window.location.reload();
			}});
    	},function(){//按钮二 删除商品
			top.layer.confirm("确认删除【"+gt_name+"】的信息么",{
				btn:['YES','NO']
				},function(){
					$.post("deleteGoodsType.do",{"gt_id":gt_id},function(data){
						if(data.flag){
							layer.alert(data.msg, {
								  skin: 'layui-layer-molv',//样式类名
								  closeBtn:0,
								  end:function(){
									  //刷新页面
									  window.location.reload();
								  }
								});
						}else{
							top.layer.alert(data.msg,{icon:2,end:function(){
								//刷新页面
								window.location.reload();
							}});
						}
					},"json")
			});
    	})
    }
    
    //子元素操作
    function oprateChild(e,obj,gt_name,gt_id,gt_parent_id){
    	layer.tips('<a href="#" onclick="editChild(\''+gt_name+'\','+gt_id+')" style="color:white">编辑</a> &nbsp;&nbsp; <a href="#" onclick="deleteChild(\''+gt_name+'\','+gt_id+','+gt_parent_id+')" style="color:white">删除</a>',obj,{
    		  tips: [1, '#3595CC'],
    		  time: 4000
    		});
    	e.stopPropagation();	
    }
    
    //编辑子元素
    function editChild(gt_name,gt_id){
    	top.layer.open({
			type:2,
			title:'修改商品名称',
			shadeClose:false,
			shade:0.2,
			closeBtn:2,
			area:['480px','280px'],
			content:'reviseGoodsType.do?gt_name='+gt_name+"&id="+gt_id
			,end:function(){
			window.location.reload();
		}});
    }
    //删除子元素
    function deleteChild(gt_name,gt_id,gt_parent_id){
    	layer.confirm("确定删除【"+gt_name+"】的信息?",{btn:['确定','取消']},function(){
    		$.post("deleteGoodsType.do",{"gt_id":gt_id,"gt_parent_id":gt_parent_id},function(data){
				if(data.flag){
					layer.alert(data.msg, {
						  skin: 'layui-layer-molv' //样式类名
						  ,closeBtn:0,
						  end:function(){
							  //刷新页面
							  window.location.reload();
						  }
						});
				}else{
					layer.alert(data.msg,{icon:2,end:function(){
						//刷新页面
						window.location.reload();
					}});
				}
			},"json");
    	});
 
    }
    
    
    </script>
    
    <script>
    	//文件夹式树
        $(document).ready(function () {

            $('#jstree1').jstree({
                'core': {
                    'check_callback': true
                },
                'plugins': ['types', 'dnd'],
                'types': {
                    'default': {
                        'icon': 'fa fa-cogs'
                    },
                    'html': {
                        'icon': 'fa fa-file-code-o'
                    },
                    'svg': {
                        'icon': 'fa fa-file-picture-o'
                    },
                    'css': {
                        'icon': 'fa fa-cog'
                    },
                    'img': {
                        'icon': 'fa fa-file-image-o'
                    },
                    'js': {
                        'icon': 'fa fa-file-text-o'
                    }

                }
            });

            
            
            
          /*   //JSON样式树
            $('#using_json').jstree({
                'core': {
                    'data': [
                    'Empty Folder',
                        {
                            'text': 'Resources',
                            'state': {
                                'opened': true
                            },
                            'children': [
                                {
                                    'text': 'css',
                                    'children': [
                                        {
                                            'text': 'animate.css',
                                            'icon': 'none'
                                    },
                                        {
                                            'text': 'bootstrap.css',
                                            'icon': 'none'
                                    },
                                        {
                                            'text': 'main.css',
                                            'icon': 'none'
                                    },
                                        {
                                            'text': 'style.css',
                                            'icon': 'none'
                                    }
                                ],
                                    'state': {
                                        'opened': true
                                    }
                            },
                                {
                                    'text': 'js',
                                    'children': [
                                        {
                                            'text': 'bootstrap.js',
                                            'icon': 'none'
                                    },
                                        {
                                            'text': 'hplus.min.js',
                                            'icon': 'none'
                                    },
                                        {
                                            'text': 'jquery.min.js',
                                            'icon': 'none'
                                    },
                                        {
                                            'text': 'jsTree.min.js',
                                            'icon': 'none'
                                    },
                                        {
                                            'text': 'custom.min.js',
                                            'icon': 'none'
                                    }
                                ],
                                    'state': {
                                        'opened': true
                                    }
                            },
                                {
                                    'text': 'html',
                                    'children': [
                                        {
                                            'text': 'layout.html',
                                            'icon': 'none'
                                    },
                                        {
                                            'text': 'navigation.html',
                                            'icon': 'none'
                                    },
                                        {
                                            'text': 'navbar.html',
                                            'icon': 'none'
                                    },
                                        {
                                            'text': 'footer.html',
                                            'icon': 'none'
                                    },
                                        {
                                            'text': 'sidebar.html',
                                            'icon': 'none'
                                    }
                                ],
                                    'state': {
                                        'opened': true
                                    }
                            }
                        ]
                    },
                    'Fonts',
                    'Images',
                    'Scripts',
                    'Templates',
                ]
                }
            });
			*/
        }); 
    </script>

 
</body>

</html>
