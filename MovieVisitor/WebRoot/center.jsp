<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib  prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>个人中心</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/bootstrap.min.css">
    <script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <style type="text/css">
        body{
            padding: 50px;
        }
        .center{
            position: absolute;
            top: 100px;
            width: 60%;
            left: 20%;
        }
    </style>

</head>

<body>
<a class="btn btn-success" href="index.jsp" style="font-size: 20px"> << 返回到主页 </a>
<div class="center">
    <img class="img-circle" src="http://localhost:8080/MovieVisitor/images/visitorImage/<s:property value="#session.vPicture"/>" width="100px" height="120px"/>
    <h2 class="modal-title"><s:property value="#session.vNickname"/></h2>
    <br/>
    <br/>
    <div id="hd">
        <ul class="nav nav-tabs" role="tablist">
            <li><a href="#comment"  style="color: green">我的评论</a></li>
            <li><a href="#score" style="color: green">我的电影评分</a></li>
        </ul>
    </div>

    <div data-spy="scoll" data-target="#hd" data-offset="0"
         style="height: 500px; overflow: auto; position: relative;"
            ><!--data-offset偏移--><!--height高度设置-->
        <h3 id="comment">我的评论</h3>
        <div style="width: 90%">
            <table class="table table-hover">
                <tr>
                    <th width="10%">电影名</th>
                    <th width="10%">评论时间</th>
                    <th width="55%">评论</th>
                    <th width="15%">操作</th>
                    <th width="10%">删除评论</th>
                </tr>
                <s:iterator value="#session.visitorCommentList" id="v">
                <tr>
                    <td><a href="findMovieDianJi.action?moviename=<s:property value="moviename"/>"><s:property value="moviename"/></a></td>
                    <td><s:property value="date"/></td>
                    <td><s:property value="comment"/></td>
                    <td><s:property value="caozuo"/></td>
                    <s:if test='#v.caozuo=="评论成功"'>
                    	<td><a href="deleteComment.action?id=<s:property value="id"/>&nickname=<s:property value="#session.vNickname"/>" class="btn btn-success btn-sm">删除评论</a></td>
                    </s:if>
                    <s:else>
                    	<td><a href="deleteComment.action?id=<s:property value="id"/>&nickname=<s:property value="#session.vNickname"/>" class="btn btn-success btn-sm">同意</a></td>
                    </s:else>
                </tr>
                </s:iterator>
            </table>
        </div>
        <hr/>
        <hr/>
        <h3 id="score">我的电影评分</h3>
        <div style="width: 250px">
            <table class="table table-hover" >
                <tr>
                    <th width="100px">电影名</th>
                    <th width="100px">给予评分</th>
                </tr>
                <s:iterator value="#session.visitorCommentList">
                <tr>
                    <td><a href="findMovieDianJi.action?moviename=<s:property value="moviename"/>"><s:property value="moviename"/></a></td>
                    <td><s:property value="score"/></td>
                </tr>
                </s:iterator>
            </table>
        </div>
    </div>
</div>

  </body>
</html>
