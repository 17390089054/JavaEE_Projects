<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
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
    <title>用户列表</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">
    <link rel="shortcut icon" href="favicon.ico"> <link href="resource/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="resource/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="resource/css/animate.css" rel="stylesheet">
    <link href="resource/css/style.css?v=4.1.0" rel="stylesheet">
    <style>
    	span{   	
    	font-size:20px;
    	
    	}
    </style>
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
    		 <div class="col-sm-13" style="margin-top:-15px;margin-bottom:-10px" >
                <div class="ibox float-e-margins">
                     <div class="ibox-title">
                        <h5>快速查询</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#">
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
                   
                  	
                    <div class="ibox-content" >
                     <div class="row">
              
                    	<div class="col-md-10">
	                    	<form role="form" class="form-inline" method="post" action="userResign.do" id="myForm" >
	                            <div class="form-group">
	                                <label for="exampleInputEmail2" class="sr-only">用户名</label>
	                                <input type="text" placeholder="请输入用户名"  value="${user.account}" name="account" class="form-control">
	                            </div>
	                            &nbsp;&nbsp;
	                            <div class="form-group">
	                                <label for="exampleInputPassword2" class="sr-only">用户昵称</label>
	                             <input type="text" name="user_name" placeholder="请输入昵称" value="${user.user_name}" class="form-control">
	                            </div>
	                            &nbsp;&nbsp;
							    <div class="form-group">	        
						            <select class="form-control" name="user_role_id">
						            	<option value="0"
						            		
						            	>==请选择角色信息==</option>
						            	<c:forEach items="${roleList}" var="r" >
						            			<option value="${r.role_id}" 
						            				<c:if test="${user.user_role_id eq r.role_id}">
						            			selected
						            		</c:if>
						            			>${r.role_name}</option>
						            	</c:forEach>				            	
						            </select>
						    	</div>
						    	&nbsp;&nbsp; &nbsp;&nbsp;
						    	<div class="form-group">
							    	<input type="radio" value="男"  name="user_sex" <c:if test="${user.user_sex=='男'}">
							    	  	checked		
							    	  </c:if>>男	 &nbsp;&nbsp;			          
							          <input type="radio" value="女"  name="user_sex"
							          	<c:if test="${user.user_sex=='女'}">checked</c:if>
							          >女
							    </div>
							    &nbsp;&nbsp;
							    <div class="form-group">
							   	<input type="date" class="form-control" name="user_create_time" value="${user.user_create_time}">
							    </div>
							      &nbsp;&nbsp;                                             
	                           <button class="btn btn-md btn-primary"  type="button"  onclick="toSub(1)">查询</button>
								<input type="hidden"  id="pageNow" value="${pb.pageNow}">
	                           	<input type="hidden"  id="totalPage" value="${pb.totalPage}">						                          
	                        </form>
                    	</div>
                       
                      </div> 
                    </div>
                   
                </div>
            </div>            
    	<div class="row" >
      <!-- 遍历列表 -->
      <c:if test="${!empty pb.data}">
        <c:forEach items="${pb.data}" var="user">
            <div class="col-sm-4">
                <div class="contact-box">
                    <a href="javascript:;">
                        <div class="col-sm-4">
                            <div class="text-center">
                                <img alt="image" class="img-circle m-t-xs img-responsive" src="${user.user_photo}">
                                <div class="m-t-xs font-bold">${user.role_name}</div>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <h3><strong>${user.user_name }</strong></h3>
                            <p style="font-size:15px"><i class="fa fa-transgender"></i>&nbsp;   <strong> ${user.user_sex}</strong></p>
                           <address> 
                            	 <i class="fa fa-envelope-o"></i>&nbsp; <strong>${user.user_email}</strong><br>
                               	 <i class="fa fa-phone"></i>&nbsp;  <strong>${user.user_tel}</strong><br>
                              	 <i class="fa fa-times-circle-o"></i>&nbsp; <strong>${user.user_create_time}</strong><br>
                            	<a href="javascript:;" style="text-decoration:none;cursor:pointer">
	                            	 <i class="fa fa-adjust"></i> &nbsp;
	                            	 	<c:if test="${user.user_status eq 1}">
	                            	 		<label class="label label-success" style="font-size:12px;cursor:pointer">可用</label>
	                            	 	</c:if>
	                            	 	<c:if test="${user.user_status !=1}">
	                            	 		<label class="label label-danger">不可用</label>
	                            	 	</c:if>
                            	 </a>
                            </address>             
                        </div>
                        <div class="clearfix"></div>
                    </a>
                </div>
            </div> 
           </c:forEach> 
           <!-- 结束遍历 -->  
           <div class="row">
	           <!-- 页面查询按钮 -->       
	           <div class="col-md-8" style="margin-left:16px">
	           		<button class="btn btn-md btn-success"  type="button"   onclick="toSub(2)" >首页</button>
	           		<button class="btn btn-md btn-success"  type="button"  onclick="toSub(3)">上一页</button>
	           		<button class="btn btn-md btn-success"  type="button"  onclick="toSub(4)">下一页</button>
	           		<button class="btn btn-md btn-success"  type="button"  onclick="toSub(5)">尾页</button>
	           </div> 
	           <!--页面信息 -->
	         	<div class="col-sm-3" style="float:right">
			     	<span>当前第<span style="color:orange"><b>${pb.pageNow}</b></span>页|</span><span>总共<span style="color:purple"><b>${pb.totalPage}</b></span>页|</span><span>共<span style="color:#666"><b>${pb.totalCount}</b></span>条记录</span>     	
	        	</div> 
          </div> 
         
        	 
          </c:if>
          <c:if test="${empty pb.data}">
          	<div style="width:100%;">
          		<span style="display:block;width:22%;margin:10px auto;color:#0fc2fcf0;font-size:32px;">暂无数据</span>
          	</div>
          </c:if>
          	    
        </div>
    </div>

    <!-- 全局js -->
    <script src="resource/js/jquery.min.js?v=2.1.4"></script>
    <script src="resource/js/bootstrap.min.js?v=3.3.6"></script>
    <!-- 自定义js -->
    <script src="resource/js/content.js?v=1.0.0"></script>
    <script src="resource/layer/layer.js"></script>
    <script>
        $(document).ready(function () {
            $('.contact-box').each(function () {
                animationHover(this, 'pulse');
            });
        });
    </script>
	<script>
		var formData="";
		$(function(){
			formData=$("#myForm").serialize();
		})
		
		
		function toSub(value){
			//value 1.表单提交 2.首页 3.上一页 4.下一页  5.尾页
			switch(value){
			case 1:
				$("#pageNow").val(1);
				 formData=$("#myForm").serialize();				
				break;
			case 2:
				$("#pageNow").val(1);				
				break;
			case 3:
				if($("#pageNow").val()>1){
					$("#pageNow").val($("#pageNow").val()-1);
				}else{
					alert("已到首页!没有上一页!");	
				}
				break;
			case 4:
				if($("#pageNow").val()<$("#totalPage").val()){
					$("#pageNow").val(parseInt($("#pageNow").val())+1);
				}else{
					alert("已到尾页!没有下一页!");	
				}
				break;
			case 5:
				$("#pageNow").val($("#totalPage").val());
				break;
			
			}
			window.location.href="userResign.do?"+formData+"&pageNow="+$("#pageNow").val();
		}
	
		
		
		
	
	
	</script>
  

</body>

</html>


