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
            <h1><a href="#">工作流模板库<span>中小企业数值模拟与计算应用社区</span></a></h1>
        </div>
        
        <ul id="templatemo_menu">
            <li><a href="index.jsp"><span></span>首页</a></li>
            <li><a href="biological.jsp"><span></span>模板库</a></li>
            <li><a href="jmgj.jsp"><span></span>建模工具</a></li>     
            <li><a href="http://nscc.tbocii.tk:8000/#/"><span></span>返回社区</a></li>
        </ul>

	</div> <!-- end of templatemo_site_title_bar -->        
       
</div> <!-- end of templatemo_site_title_bar_wrapper -->

<table>
<tr>
<td>
<div class="menu_list" style="float:left"><ul>
            <li><a href="material.jsp"><span></span>材料领域</a></li>
            <li><a href="mechanical.jsp"><span></span>机械领域</a></li>
            <li><a href="chemical.jsp"><span></span>化工领域</a></li>     
            <li><a href="biological.jsp"><span></span>生物领域</a></li>
    </ul>
	</div>
</td>
<td>
<div id="templatemo_content">
    <div class="section_w940" >
                <h3>UG模型材料光学分析</h3>
              	<img src="images/UG.jpg" class="img_fl img_border"/>
                <h4>使用了软件NX8、ANSYS、SIGFIT以及CODEV的连用</h4>
                <p>该工作流支持几何模型的导入，提供NX8进行热网格剖分，使用ANSYS进行求解，并调用了SIGFIT进行了光机拟合，最后使用CODEV进行了光学评价。</p>
                <div style="float:right">
                <input class="login-button" type="button" onclick="demo.Load1()" value="查看流程并使用"/></div>
                <div class="cleaner_h40"></div>
                <h3>G09-NW材料分子解析</h3>
              	<img src="images/1.jpg" class="img_fl img_border"/>
                <h4>使用了软件Gaussian和NWem连用</h4>
                <p>该工作流提供Gaussian09软件+NWChem软件的连用功能，能自动解析Gaussian09输出文件中的分子结构信息，结合用户提供的NWChem的计算方法/基组等，创建NWChem输入文件，并执行相应计算任务，获取结果。使用此工作流需要提供Gaussian输入文件和NWChem软件除去结构信息的输入文件。</p>
                <div style="float:right">
                <input class="login-button" type="button" onclick="demo.Load1()" value="查看流程并使用"/></div>
                <div class="cleaner_h40"></div>
                <h3>Tinker-G09分子解析</h3>
              	<img src="images/2.jpg" alt="" class="img_fl img_border" />
                <h4>使用了软件Tinker和Gaussian连用</h4>
                <p>该工作流提供Tinker 8.4.4+Gaussian 09软件的连用功能。能自动解析Tinker软件输出文件中的结构信息，用于创建Gaussian输入文件，并执行相应计算任务，获取结果。使用此工作流需要提供Tinker输入文件（.xyz和.prm文件）</p>
                <div style="float:right">
                <input class="login-button" type="button" onclick="demo.Load1()"  value="查看流程并使用"/></div>
                <div class="cleaner_h40"></div>
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
    <textarea id="mydata" name="jcontext" rows="50" cols="40" style="visibility:hidden; height:22px; width:1761px">
 	<%String json = (String)request.getAttribute("json");if(json==null) json="";%><%=json%></textarea>
    <form id="form2" action="<c:url value='/BServlet'/>" method="post"></form>
    <form id="form3" action="<c:url value='/BServlet'/>" method="post"></form>
    <form id="form4" action="<c:url value='/BServlet'/>" method="post"></form>
    <script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script src="artDialog5/artDialog.js?skin=default" type="text/javascript"></script>
    <script src="js/GooFunc.js" type="text/javascript"></script>
    <script src="js/GooFlow.js" type="text/javascript"></script>
    <script src="js/json2.js" type="text/javascript"></script>
    <script type="text/javascript">
    alert("敬请期待!")
        $("#searchTrigger").keyup(function(){
  			var searchStr = $("#searchTrigger").val();
  			if(searchStr!=""){
	  			$("tbody>tr").hide().filter(":contains('"+searchStr+"')").show();
  			}else{
  				$("tbody>tr").show();
  			}
  		    }).keyup();
        var width = $("body").width();
        var property = {
            width:1920,//画板容器面积
            height:700,
            toolBtns: [],
            haveHead: true,
            headBtns: ["new", "undo", "redo","down","switch"],//如果haveHead=true，则定义HEAD区的按钮
            haveTool: true,
            haveGroup: true,
            useOperStack: true
        };
        var remark = {
            cursor: "选择指针",
            direct: "转换连线",
            group: "组织划分框", 
        };
        var demo;
        $(document).ready(function () {
            demo = $.createGooFlow($("#demo"), property);
            demo.setNodeRemarks(remark);
            demo.setTitle("工作流模板模式");
            //demo.$editable = false;
            demo.onItemDel = function (id, type) {
                return confirm("确定要删除该单元?");
            }
            demo.New = function () {
                location.reload();
            }			
            demo.Down = function(){
            demo.onBtnSaveClick();
            document.getElementById("form1").submit();
            }
            demo.Load1 = function(){
            document.getElementById("form2").submit();
            }
            demo.Load2 = function(){
            document.getElementById("form3").submit();
            }
            demo.Load3 = function(){
            document.getElementById("form4").submit();
            }		
            demo.onBtnOpenClick = function () {
                 var jsonstr = $("#mydata").val();//把mydata空白文档上的字符串赋值到jsonstr变量上；
                 if (jsonstr != "") {
                    try {
                        var json = JSON.parse(jsonstr);//把jsonstr字符串格式的变量转化成JSON格式并存在json变量中；
                        demo.loadData(json);//读取json显示在工作界面；
                    } catch (e) {
                        alert(e.message);//如果输入在mydata界面的字符串不符合标准，则发出窗口警告；
                    }
                }	
            }
            demo.onBtnSaveClick = function () { 
			    var json = demo.exportData();//把工作流界面的工作流流程图导出到变量json中；
                var str = JSON.stringify(json);//把json这个变量转化为字符串；
                $("#mydata").val(str);//将字符串显示在HTML界面的mydata空白文档上；
            };	
		
        });
    </script>
</body>
</html>