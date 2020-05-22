<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";%>
<!DOCTYPE html>
<html>
<base href="<%=basePath%>">
<head>
<!-- Meta -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<title>H+ 后台主题UI框架 - 页面</title>
<!-- CSS文件 -->
<link href="resource/css/bootstrap.min.css" rel="stylesheet">
<link href="resource/css/font-awesome.css" rel="stylesheet">
<link href="resource/css/animate.css" rel="stylesheet">
<link href="resource/css/plugins/dropzone/basic.css" rel="stylesheet">
<link href="resource/css/plugins/dropzone/dropzone.css" rel="stylesheet">
<link href="resource/css/style.css" rel="stylesheet"> 
<link rel="stylesheet" type="text/css" href="resource/css/plugins/simditor/simditor.css" />
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeIn">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>商品基本信息添加</h5>
                    </div>
                    <div class="ibox-content">
                    	<!-- 表单 -->
                    <form id="myForm" method="post" action="goodsAdd.do" class="form-horizontal" enctype="multipart/form-data">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">商品名称</label>

                                <div class="col-sm-5">
                                    <input type="text" name="g_name" id="g_name" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">商品价格</label>

                                <div class="col-sm-5">
                                    <input type="number" name="g_price" id="g_price" min="0" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">商品数量</label>

                                <div class="col-sm-5">
                                    <input type="number" name="g_number" id="g_number"  min="0" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">商品缩略图片</label>
                                <div class="col-sm-5">
                                    <input type="file" onchange="filechange(event)" style="display:none;"  name="g_logo"  id="g_logo"  class="form-control">
                                	<img id="img-change" src="resource/img/upload.jpg"  width="200px" height="200px" onclick="fileClick()"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">商品类型</label>

                                <div class="col-sm-5">
                                   <select class="form-control m-b" name="g_type_id" id="g_type_id">
                                   			<option value="">==请选择类型==</option>
                                   			<c:forEach items="${parentList }" var="parent">
                                   				<optgroup label="${parent.gt_name }">
	                                   				<c:forEach items="${childList }" var="child">
	                                   					<c:if test="${parent.gt_id==child.gt_parent_id }">
	                                   						<option value="${child.gt_id }">${child.gt_name }</option>
	                                   					</c:if>
	                                   				</c:forEach>
	                                   			</optgroup>
                                   			</c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">商品产地</label>

                                <div class="col-sm-5">
                                    <input type="text" name="g_addr" id="g_address"  class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">商品描述</label>
                                <div class="col-sm-10">
                                    <textarea id="editor" name="g_desc" placeholder="这里输入内容" autofocus></textarea>
                                </div>
                            </div>
                                           
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <button class="btn btn-primary" type="button" onclick="toSub()">保存内容</button>
                                    <span id="msg" style="color:red;font-size:20px"></span>
                                </div>
                            </div>
                        </form>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
    
<!-- 全局js -->
<script src="resource/js/jquery.min.js?v=2.1.4"></script>
<script src="resource/js/bootstrap.min.js?v=3.3.6"></script>
<script src="resource/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="resource/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="resource/js/plugins/layer/layer.min.js"></script>
<!-- 自定义js -->
<script src="resource/js/content.js?v=1.0.0"></script>
<!-- 第三方插件 -->
<script src="resource/js/plugins/pace/pace.min.js"></script>
<script src="resource/layer/layer.js"></script>
<!-- DROPZONE -->
<script src="resource/js/plugins/dropzone/dropzone.js"></script>
<!-- 编辑器 -->
<!-- simditor -->
<script type="text/javascript" src="resource/js/plugins/simditor/module.js"></script>
<script type="text/javascript" src="resource/js/plugins/simditor/uploader.js"></script>
<script type="text/javascript" src="resource/js/plugins/simditor/hotkeys.js"></script>
<script type="text/javascript" src="resource/js/plugins/simditor/simditor.js"></script>
<script>
    $(function () {
        var editor = new Simditor({
            textarea: $('#editor'),
            defaultImage: 'resource/img/a9.jpg'
        });
    });
</script>
<script type="text/javascript">
	function toSub(){
		var g_name = $.trim($("#g_name").val());
		var g_number = $.trim($("#g_number").val());
		var g_price = $.trim($("#g_price").val());
		var g_logo = $.trim($("#g_logo").val());
		var g_addr = $.trim($("#g_address").val());
		var g_desc =  $.trim($("#editor").val());
		var g_type_id =  $.trim($("#g_type_id").val());
		if(g_name==""){
			$("#msg").html("商品名称不能为空！");
			return;
		}
		if(g_price==""){
			$("#msg").html("商品价格不能为空！");
			return;
		}
		if(g_number==""){
			$("#msg").html("商品数量不能为空！");
			return;
		}
		if(g_logo==""){
			$("#msg").html("请选择商品缩略图！");
			return;
		}
		if(g_addr==""){
			$("#msg").html("商品产地不能为空！");
			return;
		}
		if(g_type_id==""){
			$("#msg").html("商品类型不能为空！");
			return;
		}
		if(g_desc==""){
			$("#msg").html("商品描述不能为空！");
			return;
		}
		$("#myForm").submit();
		
		
	}
	//图片点击事件
	function fileClick(){
		$("#g_logo").click();
	}
	//显示选择的图片
	function filechange(event){
	    var files = event.target.files;
	    var file;
	    if (files && files.length > 0) {
	        // 获取目前上传的文件
	        file = files[0];
	        //校验文件的类型(jpg,jpeg,png,gif)
			if(!checkFileExt(file.name)){
				alert("文件格式必须为jpg,jpeg,png,gif");
				return false;
			}	       
	        // 文件大小校验的动作
	       	if(file.size > 1024 * 1024 * 2) {
	            alert('图片大小不能超过 2MB!');
	            return false;
	        }
	        // 获取 window 的 URL 工具
	        var URL = window.URL || window.webkitURL;
	        // 通过 file 生成目标 url
	        var imgURL = URL.createObjectURL(file);
	        console.log(imgURL);
	        //用attr将img的src属性改成获得的url
	        $("#img-change").attr("src",imgURL);
	        // 使用下面这句可以在内存中释放对此 url 的伺服，跑了之后那个 URL 就无效了
	        // URL.revokeObjectURL(imgURL);
	    }
	    
	  //3、（字符）检查文件上传表单控件，如果含有[jpg,jpeg,gif,png]则显示“文件类型合法”，否则“显示文件类型错误”
	    
	    function checkFileExt(filename){
		     var flag = false; //状态
		     var arr = ["jpg","png","jpeg","gif"];
		     //取出上传文件的扩展名
		     var index = filename.lastIndexOf(".");
		     var ext = filename.substr(index+1);
		     //循环比较
		     for(var i=0;i<arr.length;i++)
		     {
		      if(ext == arr[i])
		      {
		       flag = true; //一旦找到合适的，立即退出循环
		       break;
		      }
		     }
		    return flag;
	    }
	     
	    
	}
</script>
</body>
</html>