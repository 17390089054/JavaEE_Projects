<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<base href="<%=basePath%>" />
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>系统用户管理</title>
<link rel="shortcut icon" href="resource/img/favicon.ico">
<link href="resource/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="resource/css/font-awesome.css?v=4.4.0" rel="stylesheet">

<link href="resource/css/animate.css" rel="stylesheet">
<link href="resource/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">

	<div class="row">
		<div class="col-sm-12">
			<div class="ibox">
				<div class="ibox-title">
					<h5>系统用户管理</h5>
				</div>
				<div class="ibox-content">
					<div class="row m-b-sm m-t-sm">
						<div class="col-md-2">
							<button type="button" id="user-add-btn"
								class="btn btn-primary btn-sm">
								<i class="fa fa-user-plus"></i> 新建
							</button>
							<button type="button" id="user-loading-btn"
								class="btn btn-white btn-sm">
								<i class="fa fa-refresh"></i> 刷新
							</button>
						</div>
						<form action="sys/user/list" method="GET" id="myForm">
							<div class="col-md-2 col-md-offset-4">
								<select class="input-sm form-control input-s-sm inline"
									id="role_id" name="queryList['roleId']"
									style="font-size: 12px;">
									<option value="">请选择角色</option>
									<c:forEach items="${roleList}" var="role">
										<option value="${role.roleId}">${role.roleName}</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-md-3">
								<div class="input-group">
									<input type="text" placeholder="请输入用户的姓名"
										class="input-sm form-control" name="queryList['userName']"
										value="${pager.queryList.userName}">
									<span class="input-group-btn">
										<button type="button" class="btn btn-sm btn-primary"
											id="searchBtn">搜索</button>
									</span>
								</div>
							</div>
							<!-- 设置隐藏域 用于存储pageNow的值 -->
							<input type="hidden" name="pageNow" value="${pager.pageNow }" />
							<input type="hidden" id="totalPage" value="${pager.totalPage }" />
						</form>

					</div>

					<div class="project-list">

						<table class="table table-hover">
							<tbody>
								<c:forEach items="${requestScope.pager.data}" var="u">
									<c:if test="${u.userRoleId!=1 }">
										<tr>
											<td class="client-avatar"><img alt="image"
												onerror="this.src='resource/img/a8.jpg'"
												src="resource/photo/${u.userPhoto}"></td>
											<td>
												<!-- A标签的样式,暂时没有使用该链接 --> <a href="javascript:;"
												class="client-link">${u.userName}</a>
											</td>
											<td>${u.account}</td>
											<td class="contact-type"><i class="fa fa-user-secret">
											</i></td>
											<td><c:out value="${u.role.roleName}" escapeXml="false">
													<span class="text-danger">未分配</span>
												</c:out></td>
											<td class="client-status"><c:if
													test="${u.userStatus==1}" var="flag">
													<span class="label label-primary">已激活</span>
												</c:if> <c:if test="${!flag}">
													<span class="label label-danger">未激活</span>
												</c:if></td>
											<td class="contact-type"><i class="fa fa-clock-o"> </i>
											</td>
											<td><fmt:formatDate value="${u.userCreateTime}"
													pattern="yyyy-MM-dd HH:mm:ss" /></td>

											<td><c:if test="${u.userSex=='男'}" var="flag">
													<i class="fa fa-mars"> ${u.userSex }</i>
												</c:if> <c:if test="${u.userSex=='女'}" var="flag">
													<i class="fa fa-venus"> ${u.userSex }</i>
												</c:if></td>

											<td>${u.userAge }</td>

											<td><a href="sys/user/update/${u.userId}"
												class="btn btn-success btn-sm"><i class="fa fa-pencil"></i>
													编辑 </a> <!-- 设置自定义数据 pk-id 用于表示注解 --> <c:if
													test="${u.userId !=sessionScope.sessionUser.userId}">
													<a href="javascript:;" pk-id="${u.userId}"
														user-status="${u.userStatus==1?0:1 }"
														class="btn ${u.userStatus==1?'btn-danger':'btn-primary'} btn-sm user-delete-btn">
														${u.userStatus==1?'<i class="fa fa-remove"></i> 删除':'<i class="fa fa-smile-o"></i> 激活' }
													</a>
												</c:if> <a href="javascript:;" pk-id="${u.userId}"
												class="btn btn-white btn-sm user-photo-btn"><i
													class="fa fa-file-photo-o"></i> 头像 </a></td>
										</tr>

									</c:if>


								</c:forEach>


							</tbody>
						</table>
					</div>
					<div class="row m-b-sm m-t-sm">
						<div class="col-md-2">
							<span style="line-height: 30px;">显示 ${pager.pageNow} 到
								${pager.totalPage} 页，共 ${pager.totalCount} 条</span>
						</div>
						<div class="col-md-5 col-md-offset-5">
							<span class="input-group-btn">
								<button type="button" class="btn btn-sm btn-white" id="begin">
									首页</button>
								<button type="button" class="btn btn-sm btn-white" id="pre">
									上一页</button>
								<button type="button" class="btn btn-sm btn-white" id="next">
									下一页</button>
								<button type="button" class="btn btn-sm btn-white" id="end">
									尾页</button>
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 全局js -->
	<script src="resource/js/jquery.min.js?v=2.1.4"></script>
	<script src="resource/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="resource/js/plugins/layer/layer.min.js"></script>


	<!-- 自定义js -->
	<script src="resource/js/content.js?v=1.0.0"></script>
	<!-- 左右翻页 -->
	<script>
		$(function() {
			//首页
			$("#begin").click(function() {
				$("input[name='pageNow']").val(1);
				$("#myForm").submit();
				return;
			});
			//上一页
			$("#pre").click(function() {
				var pageNow = $("input[name='pageNow']").val();
				if (pageNow == 1) {
					layer.msg("没有上一页了!");
					return false;
				}
				$("input[name='pageNow']").val(pageNow - 1);
				$("#myForm").submit();
			});
			//下一页
			$("#next").click(function() {
				var pageNow = $("input[name='pageNow']").val();
				var totalPage = $("#totalPage").val();
				if (pageNow == totalPage) {
					layer.msg("没有下一页了!");
					return false;
				}
				$("input[name='pageNow']").val(parseInt(pageNow) + 1);
				$("#myForm").submit();
				return;
			});
			//尾页
			$("#end").click(function() {
				$("input[name='pageNow']").val($("#totalPage").val());
				$("#myForm").submit();
				return;
			});

		});
	</script>
	<!-- 角色回显 -->
	<script>
		$(function() {
			var roleId = '${requestScope.pager.queryList.roleId}';
			$("#role_id").val(roleId);
		})
	</script>
	<script>
		//查询提交表单
		$("#searchBtn").click(function() {
			$("input[name='pageNow']").val(1);
			$("#myForm").submit();
		});
	</script>


	<script>
		$(document).ready(function() {
			$('#user-loading-btn').click(function() {
				simpleLoad($(this), true)
			});

			$("#user-add-btn").click(function() {
				window.location.href = "sys/user/add";
			});

			$(".user-delete-btn").click(function() {
				//获取两个自定义属性
				var user_id = $(this).attr("pk-id");
				var user_status = $(this).attr("user-status");

				layer.confirm('您确定要执行此操作吗？', {
					skin : 'layui-layer-molv', //样式类名
					btn : [ '确定继续', '取消' ], //按钮
					shade : 0.01, //显示遮罩
					shift : 6
				}, function() {
					//需要发送ajax请求
					$.post("sys/user/delete", {
						userId : user_id,
						userStatus : user_status,
						_method : "DELETE"
					}, function(data) {
						if (data.flag) {
							window.location.reload();
							return false;
						} else {
							layer.msg(data.msg);
							return false;
						}
					}, "json")
				}, function() {
					layer.close();
				});

			});

			$(".user-role-btn").click(function() {
				var user_id = $(this).attr("pk-id");
				layer.open({
					title : "系统用户设置角色",
					type : 2,
					area : [ '400px', '220px' ],
					fixed : false, //不固定
					shade : 0.01,
					content : 'system_user_role.html?user_id=' + user_id
				});
			});

			$(".user-photo-btn").click(function() {
				var user_id = $(this).attr("pk-id");
				layer.open({
					title : "系统用户头像",
					type : 2,
					area : [ '350px', '400px' ],
					fixed : false, //不固定
					shade : 0.01,
					content : "sys/user/photo?" + 'userId=' + user_id,
					end : function() {
						window.location.reload();
					}
				});
			});
		});

		function simpleLoad(btn, state) {
			if (state) {
				btn.children().addClass('fa-spin');
				btn.contents().last().replaceWith(" Loading");
				window.location.reload();
			} else {
				setTimeout(function() {
					btn.children().removeClass('fa-spin');
					btn.contents().last().replaceWith(" Refresh");
					window.location.reload();
				}, 2000);
			}
		}
	</script>


</body>
</html>
