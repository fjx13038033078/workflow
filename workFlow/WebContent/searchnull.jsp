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

function collect(obj) {
	var price = document.getElementById("price"+obj.id).value;
	var account = document.getElementById("account").value;
	//var repeat = document.getElementById("repeat").value;
	//alert("account"+accnout);
	//alert("price"+price);
	if(confirm("确定要收藏该模板吗?需"+price+"块钱")) {
		
		if(price > account) {
			alert("您的余额为"+account+"，不够支付！");
			return false;
		}	/* else {
			alert("收藏成功！");
		} */

		
		
	} else {
		return false;
	}
	
	
	
}
</script>

</head>
<body>
<div id="templatemo_site_title_bar_wrapper">
	<div id="templatemo_site_title_bar">
    	<div id="site_title">
            <h1><a href="#">工作流模板库<span>中小企业数值模拟与计算应用社区</span></a></h1>
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
<td>
<div class="menu_list" style="float:left"><ul>
            <li><a href="#"><span></span>材料领域</a></li>
            <li><a href="#"><span></span>机械领域</a></li>
            <li><a href="#"><span></span>化工领域</a></li>     
            <li><a href="#"><span></span>生物领域</a></li>
    </ul>
	</div>
</td>
<td>
<div id="templatemo_content">
    <div class="section_w940" >
				<form action="SearchWorkFlowServelt"  method="post">	
    						请输入信息：<input type="text" id="info" name="info" value="${info }"/>										
    						<input type="submit" value="搜索"  />	  						
    			</form><br/>  			   		
    		    <p><font size="5" face="arial" color="red">不好意思，没有找到相关模板！</font></p><br/>   			
    			<p><font size="4" face="arial" color="black">您是不是想要搜索以下内容：</font></p>
    			<c:forEach items="${workList }" var="workFlow" varStatus="status">
                <h3>${workFlow.wfName } (价格：${workFlow.wfPrice })</h3>
                <input type="hidden" id="price${status.index}" value="${workFlow.wfPrice }"/>
                <input type="hidden" id="account" value="${userAccount }"/>
              	<img src="${workFlow.wfImagePath}" class="img_fl img_border"/>
                <h4>${workFlow.wfPrinciple}</h4>
                <p>${workFlow.wfDescription}</p>
                <div style="float:right">
                <c:choose>
	            <c:when test="${sessionScope.session_user.username == 'admin'}"> 
	            	<a href="${pageContext.request.contextPath}/WorkFlowServlet?method=deleteWorkFlow2&wid=${workFlow.wid}" onclick="javascript:alert('删除成功！');"><font size="4">删除</font></a>	           
	            </c:when>
                <c:otherwise>
            	   <a id="${status.index}" href="${pageContext.request.contextPath}/WorkFlowServlet?method=collect&wid=${workFlow.wid}" onclick="return collect(this)"><font size="4">收藏</font></a>  
                </c:otherwise>
                </c:choose>
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