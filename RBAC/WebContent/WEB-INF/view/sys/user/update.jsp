<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html!>
<html>
<base href="<%=basePath %>" />
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>H+ 后台主题UI框架 - 基本表单</title>

        <link rel="shortcut icon" href="favicon.ico">
        <link href="resource/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
        <link href="resource/css/font-awesome.css?v=4.4.0" rel="stylesheet">
        <link href="resource/css/plugins/iCheck/custom.css" rel="stylesheet">
        <link href="resource/css/animate.css" rel="stylesheet">
        <link href="resource/css/style.css?v=4.1.0" rel="stylesheet">
    </head>
    <body class="gray-bg">
        <div class="wrapper wrapper-content">
                <!-- 定义行数 -->
                <div class="row">
                    <!-- 定义列数 -->
                    <div class="col-md-12">
                        <div class="ibox float-e-margins">
                            <!-- 定义标题 -->
                            <div class="ibox-title">
                                <h5>系统用户管理 <small>新建用户资料信息</small></h5>
                            </div>
                            <!-- 定义内容 -->
                            <div class="ibox-content">
                                <form method="post" class="form-horizontal" id="myForm" action="sys/user/update">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">账号</label>
                                        <div class="col-sm-4">
                                            <input type="text" name="account" id="account"  value="${requestScope.user.account}" class="form-control" readonly >
                                        </div>
                                        <div class="col-sm-6">
                                            <span class="help-block m-b-none text-success"></span>
                                        </div>
                                    </div>
                                  
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">姓名</label>
                                        <div class="col-sm-4">
                                            <input type="text" name="userName" id="userName" value="${requestScope.user.userName}" class="form-control">

                                        </div>
                                        <div class="col-sm-6">
                                            <span class="help-block m-b-none text-success"></span>
                                        </div>
                                    </div>
                                    
                                     <div class="form-group">
                                        <label class="col-sm-2 control-label">年龄</label>
                                        <div class="col-sm-4">
                                            <input type="number" name="userAge" min="0" id="userAge" value="${requestScope.user.userAge}" class="form-control">

                                        </div>
                                        <div class="col-sm-6">
                                            <span class="help-block m-b-none text-success"></span>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">角色</label>
                                        <div class="col-sm-4">
                                            <select class="form-control m-b" name="userRoleId" id="roleId">
                                                <option value="">请选择要分配的角色</option>
                                                <c:forEach items="${requestScope.roleList}" var="role">
	                                                <c:if test="${role.roleId != 1}">
	                                                	<option value="${role.roleId}">${role.roleName}</option>
	                                                </c:if>
                                                </c:forEach>
                                            </select>

                                        </div>
                                        <div class="col-sm-6">
                                            <span class="help-block m-b-none text-success"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">性别</label>
                                        <div class="col-sm-4">
                                            <div class="checkbox i-checks" id="userSex">
                                                <label>
                                                    <input type="radio" name="userSex" value="男" 
                                                    	<c:if test="${requestScope.user.userSex == '男'}">checked="checked"</c:if>
                                                    > 
                                                    <i class="fa fa-mars"></i> 男
                                                </label>

                                                <label>
                                                    <input type="radio" name="userSex" value="女" 
                                                    <c:if test="${requestScope.user.userSex == '女'}">checked="checked"</c:if>
                                                    >
                                                     <i  class="fa fa-venus"></i> 女
                                                </label>
                                            </div>

                                        </div>
                                        <div class="col-sm-6">
                                            <span class="help-block m-b-none text-success"></span>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <div class="col-sm-4 col-sm-offset-2">
                                            <button class="btn btn-primary" type="button" id="subBtn">保存</button>
                                            <button class="btn btn-default" type="reset">取消</button>
                                            <button class="btn btn-white" type="button" onclick="javascript:history.back()">返回</button>
                                        </div>
                                    </div>
                                    <!-- 隐藏域 -->
                                    <input type="hidden" name="userId" value="${requestScope.user.userId}" />
                                    <input type="hidden" name="_method" value="PUT" />
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
        </div>

        <!-- 全局js -->
        <script src="resource/js/jquery.min.js?v=2.1.4"></script>
        <script src="resource/js/bootstrap.min.js?v=3.3.6"></script>

        <!-- 自定义js -->
        <script src="resource/js/content.js?v=1.0.0"></script>
        <script src="resource/js/plugins/layer/layer.min.js"></script>
		<script type="text/javascript" src="resource/js/jquery.md5.js"></script>
        <!-- iCheck -->
        <script src="resource/js/plugins/iCheck/icheck.min.js"></script>
        <script>
            $(document).ready(function () {
                $('.i-checks').iCheck({
                    checkboxClass: 'icheckbox_square-green',
                    radioClass: 'iradio_square-green',
                });
            });
        </script>
        <script>
        	$(function(){
				var roleId='${requestScope.user.userRoleId}';
				$("#roleId").val(roleId);
        	})
        </script>
        
        <script>
        	$("#subBtn").on("click",function(){
				//验证姓名是否为空
				var userName=$.trim($("#userName").val());
				if(!userName){
					layer.msg("姓名不能为空!");
					return false;
				}
				//验证年龄是否为空
				var userAge=$.trim($("#userAge").val());
				if(!userAge){
					layer.msg("年龄不能为空!");
					return false;
				}
				
				//验证性别是否选择
				var sexes=document.getElementsByName("userSex");
				if(!sexes[0].checked && !sexes[1].checked){
					layer.msg("请选择性别!");
					return false;
				}				
				//验证是否分配角色
				var userRoleId=$.trim($("#roleId").val());
				if(userRoleId==''){
					layer.msg("请选择角色");
					return false;
				}
				//提交表单
				$("#myForm").submit();
				
        	});
        </script>
        
        
        
    </body>
</html>