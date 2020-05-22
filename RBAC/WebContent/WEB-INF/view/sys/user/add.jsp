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
                                <form method="post" class="form-horizontal" id="myForm" action="sys/user/add">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">账号</label>
                                        <div class="col-sm-4">
                                            <input type="text" name="account" id="account"  class="form-control" autofocus>

                                        </div>
                                        <div class="col-sm-6">
                                            <span class="help-block m-b-none text-success">请输入唯一的账号信息,需要使用Ajax验证</span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">密码</label>
                                        <div class="col-sm-4">
                                            <input type="text" name="password" id="password" class="form-control" readonly="readonly" value="123456">

                                        </div>
                                        <div class="col-sm-6">
                                            <span class="help-block m-b-none text-success">初始化密码123456,需要加密处理!</span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">姓名</label>
                                        <div class="col-sm-4">
                                            <input type="text" name="userName" id="userName" class="form-control">

                                        </div>
                                        <div class="col-sm-6">
                                            <span class="help-block m-b-none text-success"></span>
                                        </div>
                                    </div>
                                    
                                     <div class="form-group">
                                        <label class="col-sm-2 control-label">年龄</label>
                                        <div class="col-sm-4">
                                            <input type="number" name="userAge" min="0" id="userAge" class="form-control">

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
                                                <c:forEach items="${roleList}" var="role">
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
                                            <div class="checkbox i-checks">
                                                <label>
                                                    <input type="radio" name="userSex" value="男" checked="checked"> 
                                                    <i class="fa fa-mars"></i> 男
                                                </label>

                                                <label>
                                                    <input type="radio" name="userSex" value="女" >
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
        	$("#subBtn").on("click",function(){
				//校验账号是否为空				
        		var account=$.trim($("#account").val());
				if(!account){
					layer.msg("账号不能为空!");
					return false;
				}
				//校验账号长度，组合是否合法
				if(account.length<4){
					layer.msg("账号长度不得低于四位!");
					return false;
				}
				var regExp=/^[a-zA-Z][a-zA-Z0-9_]{3,15}$/;
				if(!regExp.test(account)){
					layer.msg("账号必须字母开头,4-16字节,允许字母数字下划线");
					return false;
				}
				//验证姓名是否为空
				var userName=$.trim($("#userName").val());
				if(!userName){
					layer.msg("姓名不能为空!");
					return false;
				}
				//验证是否分配角色
				var userRoleId=$.trim($("#roleId").val());
				if(userRoleId==''){
					layer.msg("请选择角色");
					return false;
				}
        		
				//验证账号是否重复
				$.get("sys/user/validAccountUnique",{"account":account},function(data){
					if(data.flag){
						//md5加密
						$("#password").val($.md5($("#password").val()));
						//提交表单
						$("#myForm").submit();
					}else{
						layer.msg(data.msg);
						return false;
					}
					
				},"json");
			
				
				
        	});
        </script>
        
        
        
    </body>
</html>