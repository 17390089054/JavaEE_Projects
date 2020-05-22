<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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
    <meta name="renderer" content="webkit">

    <title>权限分配</title>
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="resource/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="resource/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="resource/css/animate.css" rel="stylesheet">
    <link href="resource/css/style.css?v=4.1.0" rel="stylesheet">
    <style type="text/css">
        .center-btn{
            width:100%;margin-bottom:15px;
        }
    </style>
</head>
<body>

<div class="row">
    <div class="col-sm-12">
        <div class="wrapper wrapper-content">
            <!-- 插入表单类型元素 -->
            <div class="col-md-2" style="float:left">
                <h2>未分配的菜单</h2>
            	<select multiple="multiple" style="float:left;width:210px;height:300px;padding:20px;font-size:15px">
            		<c:forEach items="${parentMenuList}"  var="parent">
	            		<optgroup label="${parent.menuName}">
		            		<c:forEach items="${excludeMenuList}" var="exclude">
		            			<c:if test="${parent.menuId==exclude.menuParentId}">
			            			<option value="${exclude.menuId}">${exclude.menuName }</option>
		            			</c:if>
		            		</c:forEach>
	            		</optgroup>
            		</c:forEach>
            	</select>
            </div>
            <div class="col-sm-4" style="margin-top:100px">
            	<button class="btn center-btn">右移&gt;&gt;</button><br/>
            	<button class="btn center-btn">左移&lt;&lt;</button><br/>
            	<button class="btn center-btn">全部右移&gt;&gt;</button><br/>
            	<button class="btn center-btn">全部左移&lt;&lt;</button><br/>
            </div>
            <div class="col-md-2" style="float:right">
                <h2>已分配的菜单</h2>
            	<select multiple="multiple" style="float:right;width:210px;height:300px;padding:20px;font-size:15px">
            		<c:forEach items="${parentMenuList}"  var="parent">
	            		<optgroup label="${parent.menuName}">
		            		<c:forEach items="${includeMenuList}" var="include">
		            			<c:if test="${parent.menuId==include.menuParentId}">
			            			<option value="${include.menuId}">${include.menuName }</option>
		            			</c:if>
		            		</c:forEach>
	            		</optgroup>
            		</c:forEach>
            	</select>
            </div>
        </div>
    </div>
    <div class="col-sm-12">
    	<div class="wrapper wrapper-content">
    		 <div class="col-md-2">
			    <button type="button" class="btn btn-md btn-primary">分配角色</button>
    		 </div>
    	</div> 
    </div>
</div>
</body>
</html>