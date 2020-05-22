<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html!>
<html>
<base href="<%=basePath %>" />
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>H+ 后台主题UI框架 - 团队管理</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">
    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="resource/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="resource/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="resource/css/animate.css" rel="stylesheet">
    <link href="resource/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
        <c:forEach items="${roleList}" var="r" varStatus="vs">
        	<div class="col-sm-4">
                <div class="ibox">
                    <div class="ibox-title">
                    	<c:if test="${vs.count==1}">
	                        <span class="label label-primary pull-right">NEW</span>
                    	</c:if>
                        <h5>${r.roleName}</h5>
                    </div>
                    <div class="ibox-content">
                        <div class="team-members">
							<h4>角色状态</h4> 
							&nbsp;&nbsp;
							<c:if test="${r.roleStatus == 1}">
								<span class="label label-primary"> 可 用 </span>
							</c:if> 
							
							<c:if test="${r.roleStatus == 0}">
								<span class="label label-danger"> 禁 用 </span>
							</c:if> 
							
                        </div>
                        
                        <h4>角色描述</h4>
						<div class="col-sm-9">
							<p>
								${r.roleDesc}
	                        </p>
						</div>                        
                       
                        
                        <div class="row  m-t-sm">
                            <div class="col-sm-4 text-left">
								<button class="btn btn-m btn-info" onclick="distribute(${r.roleId})">权限分配</button>
                            </div>
                            <div class="col-sm-4 ">
								<button class="btn btn-m btn-warning" onclick="window.location.href='sys/role/update?roleId=${r.roleId}'"> 编    辑 </button>
                            </div>
                            <div class="col-sm-4 text-right">
								<button class="btn btn-m btn-danger" onclick="deleteRole(${r.roleId})"> 删     除 </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
  
        </div>


    </div>
    <!-- 全局js -->
    <script src="resource/js/jquery.min.js?v=2.1.4"></script>
    <script src="resource/js/bootstrap.min.js?v=3.3.6"></script>
    <!-- 自定义js -->
    <script src="resource/js/content.js?v=1.0.0"></script>
    <script src="resource/js/plugins/layer/layer.min.js"></script>
    <script>
    	function distribute(roleId){
    		parent.layer.open({
    			type:2,
    		    title: "角色权限分配",
    		    shade:0.1,
    		    shadeClose:true,
    		    area: ['780px', '500px'],
    		    shift: 2,
    		    content: "sys/role/distribute?roleId="+roleId,
    		    end:function(){
	    		    	parent.layer.closeAll();
	    		    	window.location.reload();
    		    }
    		});
    	}
    
    	function deleteRole(roleId){
			layer.confirm('确定要删除么？', {
			    btn: ['狠心抛下','我再想想'], //按钮
			    shade: 0.1,
			    shadeClose:true//不显示遮罩
			}, function(){
				//ajax实现删除
				 $.post("sys/role/delete",{"roleId":roleId,"_method":"DELETE"},function(data){
					if(data.flag){
						layer.msg("删除成功！",{time:1000,end:function(){
							layer.close();
							window.location.reload();
						}});
					}else{
						layer.msg(data.msg);
					}
				},"json");
				
			}, function(){
				layer.close();
			});
		}
    </script>



</body>

</html>
