<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
                           window.location.href="http://nscc.tbocii.tk:8000/#/Workflow_service?username=chenyifu";
					}
     </script>
</head>
<body>
<div id="templatemo_site_title_bar_wrapper">
	<div id="templatemo_site_title_bar">
    	<div id="site_title">
            <h1><a href="#">我的工作流模板<span>中小企业数值模拟与计算应用社区</span></a></h1>
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
                      <form class="form-horizontal" id="myForm" action="${pageContext.request.contextPath}/WorkFlowServlet" method="post">
                      	<input type="hidden" id="method" name="method" value="">
                      	<input type="hidden" name="wid" value="${workFlow.wid }">
                        <div class="form-group row">
                          <label class="col-sm-3 form-control-label">模板名称</label>
                          <div class="col-sm-9">
                            <input type="text" name="wfName" class="form-control" value="${workFlow.wfName }" readonly="readonly">
                          </div>
                        </div>
                        <div class="line"></div>
                        <div class="form-group row">
                          <label class="col-sm-3 form-control-label">模板价格</label>
                          <div class="col-sm-9">
                            <input type="text" name="wfPrice" class="form-control" value="${workFlow.wfPrice }" readonly="readonly">
                          </div>
                        </div>
                        <div class="form-group row">
                          <label class="col-sm-3 form-control-label">模板状态</label>
                          <div class="col-sm-9">
                          	<c:if test="${workFlow.wfStatus == -1}">
                          		<input id="status" type="hidden" name="wfStatus" value="${workFlow.wfStatus }">
                            	<input type="text" class="form-control" value="私有" readonly="readonly"><!-- <small class="help-block-none">A block of help text that breaks onto a new line and may extend beyond one line.</small> -->
                            </c:if>
                            <c:if test="${workFlow.wfStatus == 0}">
                            	<input id="status" type="hidden" name="wfStatus" value="${workFlow.wfStatus }">
                            	<input type="text" class="form-control" value="待发布" readonly="readonly"><!-- <small class="help-block-none">A block of help text that breaks onto a new line and may extend beyond one line.</small> -->
                            </c:if>
                            <c:if test="${workFlow.wfStatus == 1}">
                            	<input id="status" type="hidden" name="wfStatus" value="${workFlow.wfStatus }">
                            	<input type="text" class="form-control" value="公有" readonly="readonly"><!-- <small class="help-block-none">A block of help text that breaks onto a new line and may extend beyond one line.</small> -->
                            </c:if>
                          </div>
                        </div>
                        <div class="line"></div>
                        <div class="form-group row">
                          <label class="col-sm-3 form-control-label">所属用户</label>
                          <div class="col-sm-9">
                            <input type="text" class="form-control" value="${workFlow.user.username }" readonly="readonly">
                            <input type="hidden" name="uid" class="form-control" value="${workFlow.user.uid }">
                          </div>
                        </div>
                        <div class="line"></div>
                        <div class="form-group row">
                          <label class="col-sm-3 form-control-label">图片</label>
                          <img alt="无图像" src="${workFlow.wfImagePath}">
                        </div>
                        <input type="hidden" name="wfImagePath" value="${workFlow.wfImagePath}">
                        <div class="line"></div>
                        <div class="form-group row">
                          <label class="col-sm-3 form-control-label">所属领域</label>
                          <div class="col-sm-9">
                            <input type="text" class="form-control" name="field" value="${workFlow.field }" readonly="readonly">
                          </div>
                        </div>
                        <div class="line"></div>
                        <div class="form-group row">
                          <label class="col-sm-3 form-control-label">模板环境</label>
                          <div class="col-sm-9">
                            <input type="text" class="form-control" name="wfEnvironment" value="${workFlow.wfEnvironment }" readonly="readonly">
                          </div>
                        </div>
                        <div class="form-group row">
                          <label class="col-sm-3 form-control-label">仿真对象</label>
                          <div class="col-sm-9">
                            <input type="text" class="form-control" name="wfObject" value="${workFlow.wfObject }" readonly="readonly">
                          </div>
                        </div>
                        <div class="form-group row">
                          <label class="col-sm-3 form-control-label">基本原理</label>
                          <div class="col-sm-9">
                            <input type="text" class="form-control" name="wfPrinciple" value="${workFlow.wfPrinciple }" readonly="readonly">
                          </div>
                        </div>
                        <div class="form-group row">
                          <label class="col-sm-3 form-control-label">关键词</label>
                          <div class="col-sm-9">
                            <input type="text" class="form-control" name="wfKeywords" value="${workFlow.wfKeywords }" readonly="readonly">
                          </div>
                        </div>
                        <div class="form-group row">
                          <label class="col-sm-3 form-control-label">使用说明</label>
                          <div class="col-sm-9">
                            <textarea class="form-control" name="wfDescription" rows="5" readonly="readonly">${workFlow.wfDescription }</textarea>
                          </div>
                        </div>
                        <div class="form-group row">
                          <label class="col-sm-3 form-control-label">备注</label>
                          <div class="col-sm-9">
                            <textarea class="form-control" name="comment" rows="5" readonly="readonly">${workFlow.comment }</textarea>
                          </div>
                        </div>
                        <textarea style="visibility: hidden" name="wfJson">${workFlow.wfJson }</textarea>
                        <div class="form-group row">
                          <div class="col-sm-4 offset-sm-3">
                          <c:choose>
                          	<c:when test="${sessionScope.session_user.username == 'admin'}">
                          		<button type="button" class="btn btn-primary" onclick="pass()">审核通过</button>
                            	<button type="button" class="btn btn-secondary" onclick="noPass()">审核不通过</button>
                          	</c:when>
                          	<c:otherwise>
                          		<c:if test="${workFlow.wfStatus == -1}">
	                          		<button type="button" class="btn btn-primary" onclick="editWorkFlow()">查看&修改&执行模板</button>
	                          		<!-- <button type="button" class="btn btn-primary" onclick="publishWorkFlow()">发布模板</button> -->
                            	</c:if>
                            	<c:if test="${workFlow.wfStatus == 0}">
	                          		<!-- <button type="button" class="btn btn-primary" onclick="noPass()">取消发布</button> -->
                            	</c:if>
                            	<c:if test="${workFlow.wfStatus == 1}">
	                          		<button type="button" class="btn btn-primary" onclick="editWorkFlow()">查看&修改&执行模板</button>
	                            	<!-- <button type="button" class="btn btn-primary" onclick="executeWorkFlow()">执行模板</button> -->
                            	</c:if>
                          	</c:otherwise>
                          </c:choose>                       
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