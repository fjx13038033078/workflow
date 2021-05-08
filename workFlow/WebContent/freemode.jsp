<%@ page language="java" contentType="text/html; charset=GB18030" 
pageEncoding="GB18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>中小数值模拟社区工作流管理系统</title>
<meta name="keywords" content="free css templates, free website templates, simple blue, light gray" />
<meta name="description" content="Simple Blue is a free CSS template from www.templatemo.com" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="css/jquery.ennui.contentslider.css" rel="stylesheet" type="text/css" media="screen,projection" />
<link href="css_pirobox/white/style.css" media="screen" title="shadow" rel="stylesheet" type="text/css" />
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
            <h1><a href="#">工作流自由模式<span>中小企业数值模拟与计算应用社区</span></a></h1>
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
            <li><a href="jmgj2.jsp"><span></span>立即使用</a></li>
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

<div id="templatemo_banner_wrapper_outter">
<div id="templatemo_banner_wrapper">
	
    <div id="templatemo_banner">
    
    <div id="templatemo_banner_slider">
    <!-- start of the slider -->
    
    <div id="one" class="contentslider">
            <div class="cs_wrapper">
                <div class="cs_slider">
                
                    <div class="cs_article">
                        <div class="cs_article_inner">
                             <div class="img_frame">
                            <a href="images/templatemo_image_03.jpg" class="pirobox" title="工作流建模工具">
                            <img src="images/templatemo_image_03.jpg" alt="" /></a></div>
                            <h2>工作流自由拖拽</h2>
                            <p>此模式面向有一定软件使用基础的用户，用户可以根据固定的工作流模板解决需求问题，只需要上传相应的输入文件，即可直接执行流程.</p>                             
                        </div>                               
                    </div><!-- End cs_article -->
                    
                    <div class="cs_article">
                        <div class="cs_article_inner">
                            <div class="img_frame">
                        <a href="images/templatemo_image_04.jpg" class="pirobox" title="工作流模板库">
                             <img src="images/templatemo_image_04.jpg" alt="" /></a></div>
                              <h2>工作流模板库</h2>
                              <p>使用工作流模板能够提高数值模拟流程的处理效率，为中小企业用户提供了大量的数值模拟应用模板，涉及材料、化工、机械、土木等广泛领域。</p>
                        </div>
                    </div><!-- End cs_article -->
              
                </div><!-- End cs_slider -->
            </div><!-- End cs_wrapper -->
        </div><!-- End contentslider -->
        
        <!-- Site JavaScript -->
        <script type="text/javascript" src="js/jquery-1.3.1.min.js"></script>
        <script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
        <script type="text/javascript" src="js/jquery.ennui.contentslider.js"></script>
        <script type="text/javascript" src="js/piroBox.1_2.js"></script>
        <script type="text/javascript">
            $(function() {
            $('#one').ContentSlider({
            width : '960px',
            height : '250px',
          	speed : 400,
            easing : 'easeOutSine'
            });
            });
            $(document).ready(function() {
	        $().piroBox({
			my_speed: 600, //animation speed
			bg_alpha: 0.5, //background opacity
			radius: 4, //caption rounded corner
			scrollImage : false, // true == image follows the page, false == image remains in the same open position
			pirobox_next : 'piro_next', // Nav buttons -> piro_next == inside piroBox , piro_next_out == outside piroBox
			pirobox_prev : 'piro_prev',// Nav buttons -> piro_prev == inside piroBox , piro_prev_out == outside piroBox
			close_all : '.piro_close',// add class .piro_overlay(with comma)if you want overlay click close piroBox
			slideShow : 'slideshow', // just delete slideshow between '' if you don't want it.
			slideSpeed : 4 //slideshow duration in seconds(3 to 6 Recommended)
	});
});
        </script>
        <script src="js/jquery.chili-2.2.js" type="text/javascript"></script>
        <script src="js/chili/recipes.js" type="text/javascript"></script>
        <div class="cleaner"></div>
  
  		<!-- end of the slider -->  
  
    
   	  </div> <!-- end of templatemo_popular_posts -->
    
    </div> <!-- end of templatemo_banner -->

</div> <!-- end of templatemo_banner_wrapper -->
</div> <!-- end of templatemo_banner_wrapper_outter -->

<div id="templatemo_content">
    
    <div class="section_w940">
    
        <div class="box margin_r_20 box_border">

            <h2>自由拖拽</h2>
            <div class="box_image_wrapper">
              <img src="images/folder.png" alt="product 1" />
            </div>
            <p>可以对工作流的模板进行直接复用或者修改发布.</p>
            
            <div class="cleaner_h10"></div>
           
                
        </div>
        
        <div class="box margin_r_20 box_border">

            <h2>保存读取</h2>
            <div class="box_image_wrapper">
              <img src="images/paint.png" alt="product 1" />
            </div>
            <p>支持自制工作流文件的本地保存和读取功能.</p>
            
            <div class="cleaner_h10"></div>            
        
                
        </div>
        
        <div class="box">
            <h2>模板定制</h2>
            <div class="box_image_wrapper">
              <img src="images/safe.png" alt="product 1" />
            </div>
            <p>支持根据用户需求，进行工作流模板的定制.</p>
            
            <div class="cleaner_h10"></div>            
                
        </div>
    
    	<div class="cleaner"></div>
    </div>
   
    <div class="cleaner"></div>
</div> <!-- end of templatemo_content -->
 

<div id="templatemo_footer_wrapper">
<div id="templatemo_footer">
    <center>
   Copyright © 2019 <a href="#"> 北京科技大学国家材料服役安全科学中心</a> 
   Validate <a href="http://validator.w3.org/check?uri=referer">XHTML</a> &amp; <a href="http://jigsaw.w3.org/css-validator/check/referer">CSS</a>
    </center>
</div> <!-- end of footer -->
</div> <!-- end of footer wrapper -->

</body>
</html>