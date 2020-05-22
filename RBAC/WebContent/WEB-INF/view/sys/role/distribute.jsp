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
            	<select multiple="multiple" id="leftSel" style="float:left;width:210px;height:300px;padding:20px;font-size:15px">
	            		<optgroup label="${parent.menuName}">
		            		<c:forEach items="${excludeMenuList}" var="exclude">
			            			<option value="${exclude.menuId}">${exclude.menuName }</option>
		            		</c:forEach>
	            		</optgroup>
            	</select>
            </div>
            <div class="col-sm-4" style="margin-top:100px">
            	<button type="button" class="btn center-btn" onclick="toRight()">右移&gt;&gt;</button><br/>
            	<button type="button" class="btn center-btn" onclick="toLeft()">左移&lt;&lt;</button><br/>
            	<button type="button" class="btn center-btn" onclick="toAllRight()">全部右移&gt;&gt;</button><br/>
            	<button type="button" class="btn center-btn" onclick="toAllLeft()">全部左移&lt;&lt;</button><br/>
            </div>
            <!-- 表单提交 -->
            <form method="post" action="sys/role/distribute" id="myForm">
	            <div class="col-md-2" style="float:right">
	                <h2>已分配的菜单</h2>
	            	<select multiple="multiple" name="menuIds"  id="rightSel" style="float:right;width:210px;height:300px;padding:20px;font-size:15px">
		            		<optgroup label="${parent.menuName}">
			            		<c:forEach items="${includeMenuList}" var="include">
				            			<option value="${include.menuId}">${include.menuName }</option>
			            		</c:forEach>
		            		</optgroup>
	            	</select>
	            </div>
	           <input type="hidden" name="roleId" value="${requestScope.roleId}"/> 
 	           <!-- <input type="hidden" name="_method" value="put"/> -->
           </form>  
        </div>
    </div>
    <div class="col-sm-12">
    	<div class="wrapper wrapper-content">
    		 <div class="col-md-2">
			    <button type="button" onclick="toDistribute()" class="btn btn-md btn-primary">分配角色</button>
    		 </div>
    	</div> 
    </div>
</div>
</body>
<script src="resource/js/jquery.min.js?v=2.1.4"></script>
<script>
	//右移
	function toRight(){
		$("#rightSel").append($("#leftSel :selected"));
	}
	//左移
	function toLeft(){
		$("#leftSel").append($("#rightSel :selected"));
	}
	//全部右移
	function toAllRight(){
		$("#leftSel option").each(function(){
			$(this).prop("selected",true);			
		});
		$("#rightSel").append($("#leftSel :selected"));
	}
	//全部左移
	function toAllLeft(){
		$("#rightSel option").each(function(){
			$(this).prop("selected",true);			
		});
		$("#leftSel").append($("#rightSel :selected"));
	}
	//分配角色
	function toDistribute(){
		$("#rightSel option").each(function(){
			$(this).prop("selected",true);			
		});
		$("#myForm").submit();
	}
	
	
</script>

</html>