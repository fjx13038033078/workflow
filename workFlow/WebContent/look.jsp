<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml">
  <head>
	    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	    <title>工作流程查看工具</title>
	    <!--[if lt IE 9]>
	    <?import namespace="v" implementation="#default#VML" ?>
	    <![endif]-->
	    <link href="css/GooFlow.css" rel="stylesheet" />
	    <style type="text/css">
	        * {
	            padding: 0;
	            margin: 0px;
	        }
	
	        body {
	            font-size:13px;
	            font-family: "宋体",Arial;
	        }
           
	    </style>
	    </head>
	  
<body>
    <div id="demo" style="width: 445px; height: 24px"></div>
    <div class="clear"></div>
    <form id="form1" action="${pageContext.request.contextPath }/WorkFlowServlet?method=toSavePage" method="post">
    <textarea id="mydata" name="jcontext" rows="50" cols="40" style="visibility:hidden; height: 22px; width: 1761px">
 	<%-- <%String json = (String)request.getAttribute("json");if(json==null) json="";%><%=json%> --%>
 	${workFlow.wfJson }
 	</textarea>
 	  <!--<div>保存模板到模板库<input class= "login-button" type="submit" value="保存到我的模板库"  onclick="demo.Switch()" style="width: 130px; height: 37px">
 	  下载模板到本地:<input class= "login-button" type="button" value="保存模板到本地" onclick="demo.saveas()" style="width: 130px; height: 37px"></input></div>
 	  <div>请选择模板文件:<input  type="file" id="file" style="width: 247px; "/>
 	  读取模板文件（双击）：<input type="button" class= "login-button" value="读取本地模板" onclick="demo.AsText();" style="width: 144px; height: 34px"/></div>-->
 	</form>
    <script id="jquery_183" src="js/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script src="artDialog5/artDialog.js?skin=default" type="text/javascript"></script>
    <script src="js/GooFunc.js" type="text/javascript"></script>
    <script src="js/GooFlow.js" type="text/javascript"></script>
    <script src="js/json2.js" type="text/javascript"></script>
    <script type="text/javascript">
        var width = $("body").width();
        var property = {
            width:2000,//画板容器面积
            height:700,
            toolBtns: ["start", "end", "chat","task","node"],
            haveHead: true,
            headBtns: ["new", "undo", "redo","test1","test2","test3","test4","switch"],//如果haveHead=true，则定义HEAD区的按钮
            haveTool: true,
            haveGroup: false,
            useOperStack: true
        };
        var remark = {
            cursor: "选择指针",
            direct: "转换连线",
            start: "开始结点",
            end: "结束结点",
            task: "计算软件结点",
            node: "可视化软件结点",
            chat: "建模软件节点",
            state: "状态结点",
            plug: "文件",
            fork: "分支结点",
            join: "联合结点",
            complex: "复合结点",
            group: "组织划分框", 
        };
        
        var remarkHead = {
        		'new': "刷新",
        		undo: "上一步",
        		redo: "下一步",
                test1: "保存到模板库",
                test2: "保存到本地",
                test3: "上传模板文件",
                test4: "读取本地模板（双击）",
                'switch': "执行模板",
            };
        var demo;
        $(document).ready(function () {
            demo = $.createGooFlow($("#demo"), property);
            demo.setNodeRemarks(remark);
            demo.setTitle("工作流修改界面");
            //demo.$editable = false;
            demo.onItemDel = function (id, type) {
                return confirm("确定要删除该单元?");
            }
            demo.New = function () {
                location.reload();
                ClearTextArea();
            }			
            demo.Read = function(){
            demo.onBtnOpenClick();
            }
            demo.AsText =function (){//读取工作流
            demo.readAsText();
            demo.onBtnOpenClick();
            }
            demo.saveas=function(){//保存工作流
                demo.onBtnSaveClick();
                saveAs();
               // var winSave = window.open();//IE浏览器
               // winSave.document.open ("text",'gb2312');
               //winSave.document.write (document.getElementById("mydata").value);
               //try {
               // winSave.document.charset = "gb2312";
               //} catch (err) { }//设置默认GB2312
               //winSave.document.execCommand ('SaveAs',true,'test.txt','.wfl');
               //winSave.document.close();
             }
            demo.Switch=function(){
                var json = demo.exportData();//把工作流界面的工作流流程图导出到变量json中；
			    var jsonLines = json.lines;
			    var jsonNodes = json.nodes;
			    var countSum = 0; //所有节点的数量
			    var countx = 0; //task节点数量
			    var county = 0; //node节点数量
			    var countz = 0; //箭头节点数量
			    
			    for(var k in jsonNodes ) {
			    	if(jsonNodes[k].type == "task") countx++;
			    	if(jsonNodes[k].type == "node") county++;
			    	//if(jsonNodes[k].type == "sl") countz++;
			    	//if(jsonNodes[k].name == "vina") booleany = true;
			    	countSum++;
			    }
			    
			    if(countx > 2 || county > 1) {
			    	alert("无法执行，请检查是否连接正确！如果连接正确，则该工作流尚未开通服务！");
			    	return;
			    }
			    
			    
			    for(var k in jsonLines ){//遍历packJson 对象的每个key/value对,k为key 
			    	
			    	var tempFrom = jsonLines[k].from;
			    	var tempTo = jsonLines[k].to;
			    	if(jsonNodes[tempFrom].type == "task" && jsonNodes[tempTo].type == "task") {
			    		if((jsonNodes[tempFrom].name != "babel" || jsonNodes[tempTo].name != "Vina") && county == 0) {
			    			alert("此流程服务尚未开通！");
			    			return;
			    		}
			    		if((jsonNodes[tempFrom].name != "calculix.ccx" || jsonNodes[tempTo].name != "calculix.cgx" ) && county == 1) {
			    			alert("此流程服务尚未开通！");
			    			return;
			    		} 
			    	}
			    	
			    	if(jsonNodes[tempFrom].type == "node" && jsonNodes[tempTo].type == "task") {
			    		alert("请正确连接流程！");
			    		return;
			    	}
			    	
			    	if(jsonNodes[tempFrom].type == "task" && jsonNodes[tempTo].type == "node") {
			    		/* alert(jsonNodes[tempFrom].name);
			    		alert(jsonNodes[tempTo].name);
			    		alert(county); */
			    		if(((jsonNodes[tempFrom].name != "calculix.cgx" && jsonNodes[tempFrom].name != "Lammps") || jsonNodes[tempTo].name != "Paraview") && county == 1) {
			    			alert("请正确连接流程！");
			    			return;
			    		}
			    	
			    	}
			    	countz++;
			    	//alert("from节点name为：" + jsonNodes[tempFrom].name + "---" + "to节点name为：" + jsonNodes[tempTo].name);
			    	//alert("from节点为：" + jsonLines[k].from + "---" + "to节点为：" + jsonLines[k].to);
			    }  
			    
			    if(countz < 1 && county == 0) {
			    	alert("请正确连接流程！");
	    			return;
			    }
                if(countz < 2 && county == 1) {
			    	alert("请正确连接流程！");
	    			return;
			    }
			    
			    if(countSum - 1 != countz) {
			    	alert("请正确连接流程！");
			    	return;
			    }
			    
			    if(county == 0) {			    			    	
			    	window.open("http://nscc.tbocii.tk:8000/#/Workflow_upload_run?id=1&name=chenyifu");
			    } else if ((county == 1) && (countx == 2) ) {
			    	window.open("http://nscc.tbocii.tk:8000/#/Workflow_upload_run?id=18&name=chenyifu");
			    } else if ((county == 1) && (countx == 1) ) {
			    	window.open("http://nscc.tbocii.tk:8000/#/Workflow_upload_run?id=25&name=chenyifu");
			    }			    			                          
            }
//---------------------------------------------------------------------------------------------------//                         
             demo.readAsText =function (){
	           var file=document.getElementById("file").files[0];
	           var reader=new FileReader();
	           reader.readAsText(file,'GB2312');
	           reader.onload=function(e)
	                     {
		                  var mydata=document.getElementById("mydata");
		                  mydata.innerHTML=this.result;
	                     }
              }                        
            function saveAs(obj,text){//chrome,火狐等现代浏览器保存文本框内容
               obj=document.getElementById("mydata")
               var a=document.createElement('a');
               a.setAttribute('href','data:text;gb2312,'+obj.value);
               a.setAttribute('download',text);
               a.setAttribute('target','_blank');
               a.style.display="none";
               obj.parentNode.appendChild(a);
                a.click();
            }
            demo.onBtnOpenClick = function () {
                 var jsonstr = $("#mydata").val();//把mydata空白文档上的字符串赋值到jsonstr变量上；
                 if (jsonstr != "") {
                    //try {
                        var json = JSON.parse(jsonstr);//把jsonstr字符串格式的变量转化成JSON格式并存在json变量中；
                        demo.loadData(json);//读取json显示在工作界面；
                   // } catch (e) {
                        //alert("请载入模板后再进行读取！！");//如果输入在mydata界面的字符串不符合标准，则发出窗口警告；
                    //}
                }	
            }
            function ClearTextArea(){
		     document.getElementById("mydata").value="";
		    }
            demo.onBtnSaveClick = function () { 
			    var json = demo.exportData();//把工作流界面的工作流流程图导出到变量json中；
                var str = JSON.stringify(json);//把json这个变量转化为字符串；
                $("#mydata").val(str);//将字符串显示在HTML界面的mydata空白文档上；
            };	
            demo.saveMode = function () {
            var json = demo.exportData();
                var jsonLines = json.lines;
			    var jsonNodes = json.nodes;
			    var countSum = 0; //所有节点的数量
			    var countx = 0; //task节点数量
			    var county = 0; //node节点数量
			    var countz = 0; //箭头节点数量
			    var countw = 0; //可视化节点数量
			    for(var k in jsonNodes ) {
			    	if(jsonNodes[k].type == "task") countx++;
			    	if(jsonNodes[k].type == "node") county++;
			    	if(jsonNodes[k].type == "chat") countw++;
			    	countSum++;
			    }
			    if(countx == 0 && county == 0 && countw == 0) {
			    	alert("请不要保存正确流程，谢谢！");
			    	return;
			    }            
                demo.onBtnSaveClick ();
            	document.getElementById("form1").submit();
            }
            
			demo.downloadMode = function () {
				demo.saveas();
            }
			
			demo.selectMode = function () {
            	file.click();
            }
			
			demo.readMode = function () {
				demo.onBtnOpenClick();
				demo.AsText();
            }
        });
    </script>
</body>
</html>
