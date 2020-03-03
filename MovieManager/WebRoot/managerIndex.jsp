<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>管理者主页</title>
    
    <link rel="stylesheet" type="text/css" href="css/themes/default/easyui.css"/>
    <script src="js/jquery.min.js" type="text/javascript" charset="UTF-8"></script>
    <script src="js/jquery.easyui.min.js" type="text/javascript" charset="UTF-8"></script>
    
    <style type="text/css">
    	a{
    		font-size:12px
    	}
        #north{
            height: 150px;
        }
        #west{
            width: 20%;
        }

        #second{
            width: 99%;
            height: 97%;
        }

        iframe{
            width: 99%;
            height: 97%;
        }

        ul li span{
            style:"font-size:50px"
        }
    </style>
    <script type="text/javascript">
        $(function(){

            $('#myTree').tree({
                onClick:function(node){
                    var isExist=$("#myTab").tabs("exists",node.text);
                    if (isExist==true)
                    {
                        $("#myTab").tabs("select",node.text)
                    }else{
                        $("#myTab").tabs("add",{
                            title:node.text,
                            content:"<iframe src="+node.attributes.url+" ></iframe>",
                            closable:true
                        })
                    }

                }

            })

        })
    </script>

  </head>
  
  <body class="easyui-layout">
	<div id="north" region="north" title="north" >
	    <p align="center" style="font-size: 20px ">欢迎你：<s:property value="#session.mUsername"/></p>
	    <a href="managerLogin.jsp" style="font-size: 12px; text-align:right" >退出登录</a>
	</div>
		
	<div id="west" region="west" title="west">
	    <ul id="myTree">
	        <li data-options="attributes:{url:'lookMovie.action?pageNum=1'}"><span>查看电影信息</span></li>
	        <li data-options="attributes:{url:'addMovie.jsp'}"><span>添加电影信息</span></li>
	        <li data-options="attributes:{url:'lookOnshowMovie.action?pageNum=1'}"><span>上映电影</span></li>
	        <li data-options="attributes:{url:'lookActor.action?pageNum=1'}"><span>查看演员信息</span></li>
	        <li data-options="attributes:{url:'addActor.jsp'}"><span>添加演员信息</span></li>
	        <li data-options="attributes:{url:'lookMovieC.action?pageNum=1'}"><span>删除评论</span></li>
	    </ul>
	</div>

	<div id="center" region="center" title="center" >
	    <div class="easyui-tabs" fit="true" id="myTab">
	        <div title="首页" style="font-size:50px">
	        	<br>
	            <hr>欢迎管理者进行管理
	        </div>
	    </div>
	</div>
  </body>
  
</html>
