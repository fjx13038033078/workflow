<%@ page language="java" contentType="text/html; charset=GB18030" 
pageEncoding="GB18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>��С��ֵģ����������������ϵͳ</title>
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
            <h1><a href="#">����������ģʽ<span>��С��ҵ��ֵģ�������Ӧ������</span></a></h1>
        </div>
        
        <ul id="templatemo_menu">
            <li><a href="freemode.jsp"><span></span>��ҳ</a></li>
            <!--<li><a href="${pageContext.request.contextPath}/WorkFlowServlet?method=listByPublic"><span></span>ģ���</a></li>
            <li><a href="jmgj.jsp"><span></span>��ģ����</a></li>
            <c:choose>
	            <c:when test="${sessionScope.session_user.username == 'admin'}">
	            	<li><a href="${pageContext.request.contextPath}/WorkFlowServlet?method=listByUser"><span></span>����������</a></li>  
	            </c:when>
            <c:otherwise>
            	<li><a href="${pageContext.request.contextPath}/WorkFlowServlet?method=listByUser"><span></span>�ҵĹ�����</a></li>  
            </c:otherwise>
            </c:choose>-->
            <li><a href="jmgj2.jsp"><span></span>����ʹ��</a></li>
            <li><a href="http://nscc.tbocii.tk:8000/#/"><span></span>��������</a></li>
            <c:if test="${sessionScope.session_user == null }">
            	<li><a href="login.jsp"><span></span>��¼</a></li>
            </c:if>
            <c:if test="${sessionScope.session_user != null }">
            	<li><a href="#"><span></span>${sessionScope.session_user.username}</a></li>
            </c:if>
            <li><a href="${pageContext.request.contextPath}/WorkFlowServlet?method=logout"><span></span>�˳�</a></li>  
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
                            <a href="images/templatemo_image_03.jpg" class="pirobox" title="��������ģ����">
                            <img src="images/templatemo_image_03.jpg" alt="" /></a></div>
                            <h2>������������ק</h2>
                            <p>��ģʽ������һ�����ʹ�û������û����û����Ը��ݹ̶��Ĺ�����ģ�����������⣬ֻ��Ҫ�ϴ���Ӧ�������ļ�������ֱ��ִ������.</p>                             
                        </div>                               
                    </div><!-- End cs_article -->
                    
                    <div class="cs_article">
                        <div class="cs_article_inner">
                            <div class="img_frame">
                        <a href="images/templatemo_image_04.jpg" class="pirobox" title="������ģ���">
                             <img src="images/templatemo_image_04.jpg" alt="" /></a></div>
                              <h2>������ģ���</h2>
                              <p>ʹ�ù�����ģ���ܹ������ֵģ�����̵Ĵ���Ч�ʣ�Ϊ��С��ҵ�û��ṩ�˴�������ֵģ��Ӧ��ģ�壬�漰���ϡ���������е����ľ�ȹ㷺����</p>
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

            <h2>������ק</h2>
            <div class="box_image_wrapper">
              <img src="images/folder.png" alt="product 1" />
            </div>
            <p>���ԶԹ�������ģ�����ֱ�Ӹ��û����޸ķ���.</p>
            
            <div class="cleaner_h10"></div>
           
                
        </div>
        
        <div class="box margin_r_20 box_border">

            <h2>�����ȡ</h2>
            <div class="box_image_wrapper">
              <img src="images/paint.png" alt="product 1" />
            </div>
            <p>֧�����ƹ������ļ��ı��ر���Ͷ�ȡ����.</p>
            
            <div class="cleaner_h10"></div>            
        
                
        </div>
        
        <div class="box">
            <h2>ģ�嶨��</h2>
            <div class="box_image_wrapper">
              <img src="images/safe.png" alt="product 1" />
            </div>
            <p>֧�ָ����û����󣬽��й�����ģ��Ķ���.</p>
            
            <div class="cleaner_h10"></div>            
                
        </div>
    
    	<div class="cleaner"></div>
    </div>
   
    <div class="cleaner"></div>
</div> <!-- end of templatemo_content -->
 

<div id="templatemo_footer_wrapper">
<div id="templatemo_footer">
    <center>
   Copyright �0�8 2019 <a href="#"> �����Ƽ���ѧ���Ҳ��Ϸ��۰�ȫ��ѧ����</a> 
   Validate <a href="http://validator.w3.org/check?uri=referer">XHTML</a> &amp; <a href="http://jigsaw.w3.org/css-validator/check/referer">CSS</a>
    </center>
</div> <!-- end of footer -->
</div> <!-- end of footer wrapper -->

</body>
</html>