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
<script>
    $(document).ready(function () {
        Dropzone.options.myAwesomeDropzone = {
            autoProcessQueue: false,
            uploadMultiple: true,
            parallelUploads: 100,
            addRemoveLinks:true,//添加删除按钮
            maxFiles: 100,
            // Dropzone settings
            init: function () {
                var myDropzone = this;
                this.element.querySelector("button[type=submit]").addEventListener("click", function (e) {
                    e.preventDefault();
                    e.stopPropagation();
                    myDropzone.processQueue();
                });
                this.on("sendingmultiple", function () {});
                this.on("successmultiple", function (files, response) {
                	$("#stop").css("display","block");
                });
                this.on("errormultiple", function (files, response) {});
            }
        }
    });
</script>
<script type="text/javascript">

</script>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeIn">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>商品图片批量上传</h5>
                    </div>
                    <div class="ibox-content">
                        <form id="my-awesome-dropzone" class="dropzone" action="addGoodsMany.do" method="post" enctype="multipart/form-data">
                           	<input type="hidden" value="${g_id }" name="gp_goods_id">
                            <div class="dropzone-previews"></div>
                            <button type="submit" class="btn btn-primary pull-right">提交</button>
                        </form>
                    <br/>
                    <button type="button" id="stop" onclick="location.href='goodsAdd.do';" style="display:none;" class="btn btn-success pull-center">继续添加商品</button>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
</body>
</html>