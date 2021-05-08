<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>中小数值模拟社区工作流管理系统</title>
<meta name="keywords" content="free css templates, free website templates, simple blue, light gray"/>
<meta name="description" content="Simple Blue is a free CSS template from www.templatemo.com" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css"/>
<link href="css/GooFlow.css" rel="stylesheet" type="text/css"/>
<link href="css/jquery.ennui.contentslider.css" rel="stylesheet" type="text/css" media="screen,projection"/>
<script language="javascript" type="text/javascript">
function clearText(field)
{
    if (field.defaultValue == field.value) field.value ='';
    else if (field.value == '') field.value = field.defaultValue;
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

<table>
<tr>
<td style="width: 278px; ">
<!--<div class="menu_list" style="float:left"><ul>
            <li><a href="#"><span></span></a></li>
            <li><a href="#"><span></span></a></li>
            <li><a href="#"><span></span></a></li>     
            <li><a href="#"><span></span></a></li>
            
    </ul>
	</div>-->
</td>
<td>
<div id="templatemo_content">
    <div class="section_w940" >
    	<c:forEach items="${workFlowList }" var="workFlow">
                <h3>${workFlow.wfName } (价格：${workFlow.wfPrice })</h3>
              	<img src="${workFlow.wfImagePath}" class="img_fl img_border"/>
                <h4>${workFlow.wfPrinciple}</h4>
                <p>${workFlow.wfDescription}</p>
                <div style="float:right">
                <c:if test="${sessionScope.session_user.username != 'admin'}">
                	<c:if test="${workFlow.wfStatus == -1}">
	             		<a href="${pageContext.request.contextPath}/WorkFlowServlet?method=updateStatus&wid=${workFlow.wid }&wfStatus=0"><font size="4">发布模板</font></a>
	              	</c:if>
	              	<c:if test="${workFlow.wfStatus == 0}">
	             		<a href="${pageContext.request.contextPath}/WorkFlowServlet?method=updateStatus&wid=${workFlow.wid }&wfStatus=-1"><font size="4">取消发布</font></a>
	              	</c:if>
	              	<c:if test="${workFlow.wfStatus == 1}">
	              		<!--<c:choose>
	              			<c:when test="${workFlow.wfPara == 1}">
	              				<a href=http://nscc.tbocii.tk:8000/#/Workflow_upload_run?id=1&name=chenyifu><font size="4">执行模板</font></a>
	              			</c:when>
	              			<c:when test="${workFlow.wfPara == 18}">
	              				<a href=http://nscc.tbocii.tk:8000/#/Workflow_upload_run?id=18&name=chenyifu><font size="4">执行模板</font></a>
	              			</c:when>
	              			<c:otherwise>
	              				<font size="4">执行模板</font>
	              			</c:otherwise>
	              		</c:choose>-->
	              		
	              	</c:if>
                </c:if>
                <a href="${pageContext.request.contextPath}/WorkFlowServlet?method=detail&wid=${workFlow.wid }"><font size="4">查看详情</font></a>
                <a href="${pageContext.request.contextPath}/WorkFlowServlet?method=deleteWorkFlow&wid=${workFlow.wid}" onclick="javascript:alert('删除成功！');"><font size="4">删除</font></a>
                </div>
                <div class="cleaner_h40"></div>
         </c:forEach>
    </div> 
</div> <!-- end of templatemo_content -->
</td>
</tr>
</table>

<div id="templatemo_footer_wrapper">
<div id="templatemo_footer">
    <center>
        Copyright ?? 2019 <a href="#">北京科技大学国家材料服役安全科学中心</a> | 
        Designed by <a href="#" target="_parent">北京科技大学</a> | 
        Validate <a href="http://validator.w3.org/check?uri=referer">XHTML</a> &amp; <a href="http://jigsaw.w3.org/css-validator/check/referer">CSS</a>
    </center>
</div> <!-- end of footer -->
</div> <!-- end of footer wrapper -->
    
</body>
</html>