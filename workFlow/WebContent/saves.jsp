<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>中小数值模拟社区工作流管理系统</title>
<meta name="keywords" content="free css templates, free website templates, simple blue, light gray"/>
<meta name="description" content="Simple Blue is a free CSS template from www.templatemo.com" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css"/>
<link href="css/GooFlow.css" rel="stylesheet" type="text/css"/>
<link href="css/jquery.ennui.contentslider.css" rel="stylesheet" type="text/css" media="screen,projection"/>

	
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
    <!-- Fontastic Custom icon font-->
    <link rel="stylesheet" href="css/fontastic.css">
    <!-- Google fonts - Poppins -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/favicon.ico">
    <script type="text/javascript">
    				function checkForm() {
    					var flag1 = true;
    					var flag2 = false;
    					var p = document.getElementById("price").value;
    					if(p<0) {
    						alert("价格不能小于零");
    						flag1 = false;
    					}
    					var radio = document.getElementsByName("field");
    					for(var i=0;i<radio.length;i++){
    						if(radio[i].checked){
    							flag2 = true;
    							break;
    						}
    						if(i == radio.length-1){
    							alert("请选择领域！");
    						}
    					}
    					if(flag2&&flag1){
    						return true;
    					}else{
    						return false;
    					}
    				}
    				
    
                    /* document.getElementById("12");    
    				//审核通过
               		function pass() {
						document.getElementById("status").value="1";
						document.getElementById("method").value="updateStatus";
						document.getElementById("myForm").submit();
						alert('操作成功！');
					}
               
    				//审核不通过，取消发布
               		function noPass() {
						document.getElementById("status").value="-1";
						document.getElementById("method").value="updateStatus";
						document.getElementById("myForm").submit();
						alert('操作成功！');
					}
    				
               		//发布模板
               		function publishWorkFlow() {
						document.getElementById("status").value="0";
						document.getElementById("method").value="updateStatus";
						document.getElementById("myForm").submit();
						alert('操作成功！');
					}
               		
               		//删除模板
               		function deleteWorkFlow() {
						document.getElementById("method").value="deleteWorkFlow";
						document.getElementById("myForm").submit();
						alert('操作成功！');
					}
               		
               		//编辑模板
               		function editWorkFlow() {
						document.getElementById("method").value="editWorkFlow";
						document.getElementById("myForm").submit();
						
					}
               	
               		//执行模板
               		function executeWorkFlow() {
						document.getElementById("method").value="executeWorkFlow";
						document.getElementById("myForm").submit();
						alert('操作成功！');
					} */
     </script>
</head>
<body>
<div id="templatemo_site_title_bar_wrapper">
	<div id="templatemo_site_title_bar">
    	<div id="site_title">
            <h1><a href="#">我的模板<span>中小企业数值模拟与计算应用社区</span></a></h1>
        </div>
        
        <ul id="templatemo_menu">
            <li><a href="jmgj2.jsp"><span></span>工作流设计</a></li>
            <li><a href="${pageContext.request.contextPath}/WorkFlowServlet?method=listByPublic"><span></span>模板库</a></li>
            <c:choose>
	            <c:when test="${sessionScope.session_user.username == 'admin'}">
	            	<li><a href="${pageContext.request.contextPath}/WorkFlowServlet?method=listByUser"><span></span>工作流管理</a></li>  
	            </c:when>
            <c:otherwise>
            	<li><a href="${pageContext.request.contextPath}/WorkFlowServlet?method=listByUser"><span></span>我的工作流</a></li>  
            </c:otherwise>
            </c:choose>
            <li><a href="shuomingshu.jsp"><span></span>系统说明</a></li>

            <c:if test="${sessionScope.session_user == null }">
            	<li><a href="login.jsp"><span></span>登录</a></li>
            </c:if>
            <c:if test="${sessionScope.session_user != null }">
            	<li><a href="#"><span></span>${sessionScope.session_user.username}</a></li>
            </c:if>
            <li><a href="${pageContext.request.contextPath}/WorkFlowServlet?method=logout"><span></span>退出</a></li>
            <li><a href="http://nscc.tbocii.tk:8000/#/"><span></span>返回社区</a></li>  
        </ul>

	</div> <!-- end of templatemo_site_title_bar -->        
       
</div> <!-- end of templatemo_site_title_bar_wrapper -->


			<div class="col-lg-10" style="margin-left: 150px">
                  <div class="card">
                    <div class="card-header d-flex align-items-center">
                      <h3 class="h4">模板详情</h3>
                    </div>
                    <div class="card-body">
                      <form class="form-horizontal" action="${pageContext.request.contextPath }/WorkFlowServlet?method=save" method="post" style="height: 1100px; " onsubmit="return checkForm()" enctype="multipart/form-data">
                      	<input type="hidden" name="method" value="save">
                        <div class="form-group row">
                          <label class="col-sm-3 form-control-label">模板名称<font style="color: red">*</font></label>
                          <div class="col-sm-9">
                            <input type="text" class="form-control" name="wfName" placeholder="请为模板命名：（必填）">
                          </div>
                          <p><font color="red" size="5">${name }</font></p>
                        </div>
                        <div class="line"></div>
                        <div class="form-group row">
                          <label class="col-sm-3 form-control-label">价格<font style="color: red">*</font></label>
                          <div class="col-sm-9">
                            <input type="text" id="price" class="form-control" name="wfPrice" value="0" placeholder="（必填）">
                          </div>
                        </div>
                        <p><font color="red" size="5">${price }</font></p>
                        
                        
                        <div class="form-group row">
                          <label class="col-sm-3 form-control-label">模板状态</label>
                          <div class="col-sm-9">
                            	<input type="text" class="form-control" value="私有" readonly="readonly">
                            	<input type="hidden" class="form-control" name="wfStatus" value="-1" readonly="readonly">
                          </div>
                        </div>
                                     
                        <div class="line"></div>
                        <div class="form-group row">
                          <label class="col-sm-3 form-control-label">图片<font style="color: red">*</font>(图片规格为191p X 72p)</label>
                          <input type="file" name="fileupload">
                          
                        </div>                        
                        <div class="form-group row">
                        <p><font color="red" size="5">${field }</font></p>
                          <label class="col-sm-3 form-control-label">所属领域<font style="color: red">*</font>(请选择，单选)</label>
                          <div class="col-sm-9" style="background: ">
                            <input type="radio" name="field" value="机械领域"/>机械领域&ensp;
                            <input type="radio" name="field" value="化工领域"/>化工领域&ensp;
                            <input type="radio" name="field" value="土木领域"/>土木领域&ensp;
                            <input type="radio" name="field" value="材料领域"/>材料领域&ensp;
                            <input type="radio" name="field" value="生物领域"/>生物领域&ensp;
                            <input type="radio" name="field" value="农业领域"/>农业领域&ensp;
                            <input type="radio" name="field" value="医药领域"/>医药领域&ensp;
                            <input type="radio" name="field" value="商业餐饮"/>商业餐饮&ensp;
                            <input type="radio" name="field" value="冶金领域"/>冶金领域<br/>
                            <input type="radio" name="field" value="食品领域"/>食品领域&ensp;
                            <input type="radio" name="field" value="核领域"/>核领域&ensp;&ensp;&ensp;
                            <input type="radio" name="field" value="水利工程"/>水利工程&ensp;
                            <input type="radio" name="field" value="航空航天"/>航空航天&ensp;
                            <input type="radio" name="field" value="环境科学"/>环境科学&ensp;
                            <input type="radio" name="field" value="地球科学"/>地球科学&ensp;
                            <input type="radio" name="field" value="电子电镀"/>电子电镀&ensp;
                            <input type="radio" name="field" value="电子通信"/>电子通信			
                          </div>
                        </div>
                        
                        <div class="form-group row">
                          <label class="col-sm-3 form-control-label">模板环境</label>
                          <div class="col-sm-9">
                            <input type="text" class="form-control" name="wfEnvironment" placeholder="（选填）">
                          </div>
                        </div>
                        
                        <div class="form-group row">
                          <label class="col-sm-3 form-control-label">仿真对象</label>
                          <div class="col-sm-9">
                            <input type="text" class="form-control" name="wfObject" placeholder="（选填）">
                          </div>
                        </div>
                        
                        <div class="form-group row">
                          <label class="col-sm-3 form-control-label">基本原理</label>
                          <div class="col-sm-9">
                            <input type="text" class="form-control" name="wfPrinciple" placeholder="（选填）">
                          </div>
                        </div>
                        
                        <div class="form-group row">
                          <label class="col-sm-3 form-control-label">关键词</label>
                          <div class="col-sm-9">
                            <input type="text" class="form-control" name="wfKeywords" placeholder="（选填）">
                          </div>
                        </div>
                        
                        <div class="form-group row">
                          <label class="col-sm-3 form-control-label">使用说明</label>
                          <div class="col-sm-9">
                            <input type="text" class="form-control" name="wfDescription" placeholder="（选填）">
                          </div>
                        </div>
                        <div class="form-group row">
                          <label class="col-sm-3 form-control-label">备注</label>
                          <div class="col-sm-9">
                            <input type="text" class="form-control" name="comment" placeholder="（选填）">
                          </div>
                        </div>
                        
                        <div class="form-group row">
                          <div class="col-sm-9">
                           <textarea cols="150" rows="5" name="wfJson" style="visibility:hidden;">
                           	${jcontext }
                           </textarea>
                               
                          </div>                               
                        </div>
                        
                        <div class="form-group row">
                          <div class="col-sm-4 offset-sm-3">
	                          		<button type="submit" class="btn btn-primary">保存到我的模板库</button>
                          </div>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
               




<div id="templatemo_footer_wrapper">
<div id="templatemo_footer">
    <div style="text-align: center;">
        Copyright ?? 2019 <a href="#">北京科技大学国家材料服役安全科学中心</a> | 
        Designed by <a href="#" target="_parent">北京科技大学</a> | 
        Validate <a href="http://validator.w3.org/check?uri=referer">XHTML</a> &amp; <a href="http://jigsaw.w3.org/css-validator/check/referer">CSS</a>
    </div>
</div> <!-- end of footer -->
</div> <!-- end of footer wrapper -->

</body>
</html>