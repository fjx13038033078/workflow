<%@ page language="java" contentType="text/html; charset=GB18030" 
pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>工作流建模工具</title>
<meta name="keywords" content="free css templates, free website templates, simple blue, light gray" />
<meta name="description" content="Simple Blue is a free CSS template from www.templatemo.com" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="css/jquery.ennui.contentslider.css" rel="stylesheet" type="text/css" media="screen,projection" />
<script language="javascript" type="text/javascript">
function clearText(field)
{
    if (field.defaultValue == field.value) field.value = '';
    else if (field.value == '') field.value = field.defaultValue;
}
</script>
</head>
<body>
<div id="templatemo_site_title_bar_wrapper">
	<div id="templatemo_site_title_bar">
    	<div id="site_title">
            <h1><a href="jmgj.jsp">工作流建模工具<span>中小企业数值模拟与计算应用社区</span></a></h1><a href="shuomingshu.jsp" target="_blank">使用说明</a>
        </div>
        
            <ul id="templatemo_menu">
            <li><a href="freemode.jsp"><span></span>首页</a></li>
            <!--<li><a href="${pageContext.request.contextPath}/WorkFlowServlet?method=listByPublic"><span></span>模板库</a></li>
            <li><a href="jmgj.jsp"><span></span>建模工具</a></li>
            <c:choose>
	            <c:when test="${sessionScope.session_user.username == 'admin'}">
	            	<li><a href="${pageContext.request.contextPath}/WorkFlowServlet?method=listByUser"><span></span>工作流管理</a></li>  
	            </c:when>
            <c:otherwise>
            	<li><a href="${pageContext.request.contextPath}/WorkFlowServlet?method=listByUser"><span></span>我的工作流</a></li>  
            </c:otherwise>
            </c:choose>-->
            <li><a href="jmgj.jsp"><span></span>立即使用</a></li>
            <li><a href="http://nscc.tbocii.tk:8000/#/"><span></span>返回社区</a></li>
            <c:if test="${sessionScope.session_user == null }">
            	<li><a href="login.jsp"><span></span>登录</a></li>
            </c:if>
            <c:if test="${sessionScope.session_user != null }">
            	<li><a href="#"><span></span>${sessionScope.session_user.username}</a></li>
            </c:if>
            <li><a href="${pageContext.request.contextPath}/WorkFlowServlet?method=logout"><span></span>退出</a></li>  
        </ul>
             
	</div> <!-- end of templatemo_site_title_bar -->        
       
</div> <!-- end of templatemo_site_title_bar_wrapper -->

	
	<div><iframe src="jmgj2.jsp"  scrolling="no" style="width: 1520px; height: 710px"></iframe></div>

	
    <!-- start of the slider -->
        <!-- Site JavaScript -->
        <script type="text/javascript" src="js/jquery-1.3.1.min.js"></script>
        <script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
        <script type="text/javascript" src="js/jquery.ennui.contentslider.js"></script>
        <script type="text/javascript">
            $(function() {
            $('#one').ContentSlider({
            width : '960px',
            height : '50px',
          	speed : 400,
            easing : 'easeOutSine'
            });
            });
            function execute() {
            	
            }
        </script>
        <script src="js/jquery.chili-2.2.js" type="text/javascript"></script>
        <script src="js/chili/recipes.js" type="text/javascript"></script>
        <div class="cleaner"></div>
  		<!-- end of the slider -->  


<div id="templatemo_footer_wrapper">
<div id="templatemo_footer">
    <center>
        Copyright © 2019 <a href="#">北京科技大学国家材料服役安全科学中心</a> | 
        Designed by <a href="#" target="_parent">北京科技大学</a> | 
        Validate <a href="http://validator.w3.org/check?uri=referer">XHTML</a> &amp; <a href="http://jigsaw.w3.org/css-validator/check/referer">CSS</a>
    </center>
</div> <!-- end of footer -->
</div> <!-- end of footer wrapper -->

</body>
</html>