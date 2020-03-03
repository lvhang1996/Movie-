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
    <title>全部电影信息</title>
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
        .all_movie{
            margin-top: 100px;
            position: absolute;
            left: 20%;
            width: 60%;
        }
        .top{
            width: 70%;
            top: 50px;
            height: 150px;
            padding: 20px;
        }
        .center{
            padding-top: 20px;
            top: 280px;
            height: 50px;
            margin-left: 50px;
            width: 30%;
        }
        .bottom{
            padding: 20px;
            top: 380px;
            height: 100%;
            width: 1000px;
        }
        .one_movie{
            height: 250px;
            width: 150px;
            float: left;
            margin-right: 20px;
            margin-top: 20px;
        }
        .fenye{
            margin-top: 20px;
            position: relative;
            width: 35%;
            left: 30%;
            height: 10px;
        }
    </style>

</head>

<body>
<nav class="navbar navbar-default navbar-fixed-top">
        <!-- 第一栏-->
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="index.jsp">电影网</a>
            </div>
            <div class="collapse navbar-collapse">
                <form class="navbar-form navbar-left" action="find" method="post">
                    <div class="form-group">
                        <input name="findName" size="15" style="width:200px" class="form-control" placeholder="查找电影、演员">
                    </div>
                    <button type="submit" class="btn btn-default">搜索</button>
                </form>
                <s:if test='#session.login=="1"'>
                <ul class="nav navbar-nav navbar-right">
                	<li><img class="img-circle" src="http://localhost:8080/MovieVisitor/images/visitorImage/<s:property value="#session.vPicture"/>" width="40px" height="40px"></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false"><s:property value="#session.vNickname"/>的账号 <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="center.action?nickname=<s:property value="#session.vNickname"/>">个人中心</a></li>
                            <li><a href="qianbao.action?nickname=<s:property value="#session.vNickname"/>">我的钱包</a></li>
                            <li><a href="findUpdateVisitor.action?id=<s:property value="#session.vId"/>">账号管理</a></li>
                            <li role="separator" class="divider"></li><!--分割线-->
                            <li><a href="out.action">退出</a></li>
                        </ul>
                    </li>
                </ul>
                </s:if>
                <s:else>
                 <ul class="nav navbar-nav navbar-right">
	                <li><a href="login.jsp" type="button" class="btn" >登录</a></li>
	                <li><a href="register.jsp" type="button" class="btn">注册</a></li>
	            </ul>
	            </s:else>
            </div>
        </div>
        <!-- 第二栏-->
        <div class="container">
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li><a href="allMovie.action?pageNum=1">全部电影</a></li>
                    <li><a href="order.action">排行榜</a></li>
                    <li><a href="allActor.action?pageNum=1">演员</a></li>
                    <li><a href="onshowMovie.action">热映电影</a></li>
                </ul>
            </div>
        </div>
    </nav>
<div class="all_movie">
    <h2 class="modal-title" style="color: green">全部电影</h2>
    <br/>
    <div class="top">
        <div class="row">
            <div class="span8">
                <ul class="nav nav-pills">
                    <li class="active" style="color: green;font-size: 15px"><a href="allMovie.action?pageNum=1">全部类型</a></li>
                    <li><a href="typeMovie.action?lx=jq& pageNum=1">剧情</a></li>
                    <li><a href="typeMovie.action?lx=aq& pageNum=1">爱情</a></li>
                    <li><a href="typeMovie.action?lx=xj& pageNum=1">喜剧</a></li>
                    <li><a href="typeMovie.action?lx=kh& pageNum=1">科幻</a></li>
                    <li><a href="typeMovie.action?lx=dz& pageNum=1">动作</a></li>
                    <li><a href="typeMovie.action?lx=xy& pageNum=1">悬疑</a></li>
                    <li><a href="typeMovie.action?lx=fz& pageNum=1">犯罪</a></li>
                    <li><a href="typeMovie.action?lx=gb& pageNum=1">恐怖</a></li>
                    <li><a href="typeMovie.action?lx=zz& pageNum=1">战争</a></li>
                </ul>
            </div>
        </div>
        <br/>
        <div class="row">
            <div class="span8">
                <ul class="nav nav-pills">
                    <li class="active" style="color: green;font-size: 15px"><a href="allMovie.action?pageNum=1">全部地区</a></li>
                    <li><a href="countryMovie.action?gj=chn& pageNum=1">中国</a></li>
                    <li><a href="countryMovie.action?gj=us& pageNum=1">美国</a></li>
                    <li><a href="countryMovie.action?gj=jap& pageNum=1">日本</a></li>
                    <li><a href="countryMovie.action?gj=kor& pageNum=1">韩国</a></li>
                    <li><a href="countryMovie.action?gj=rus& pageNum=1">俄罗斯</a></li>
                    <li><a href="countryMovie.action?gj=eng& pageNum=1">英国</a></li>
                    <li><a href="countryMovie.action?gj=fra& pageNum=1">法国</a></li>
                    <li><a href="countryMovie.action?gj=ger& pageNum=1">德国</a></li>
                    <li><a href="countryMovie.action?gj=spa& pageNum=1">西班牙</a></li>
                    <li><a href="countryMovie.action?gj=itl& pageNum=1">意大利</a></li>
                    <li><a href="countryMovie.action?gj=ind& pageNum=1">印度</a></li>
                    <li><a href="countryMovie.action?gj=tai& pageNum=1">泰国</a></li>
                    <li><a href="countryMovie.action?gj=can& pageNum=1">加拿大</a></li>
                    <li><a href="countryMovie.action?gj=mo& pageNum=1">墨西哥</a></li>
                    <li><a href="countryMovie.action?gj=rui& pageNum=1">瑞典</a></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="center">
        <div class="btn-group" role="group" aria-label="...">
            <button type="button" class="btn btn-default"><a href="reduOrder.action?pageNum=1">按热度排序</a></button>
            <button type="button" class="btn btn-default"><a href="shijianOrder.action?pageNum=1">按时间排序</a></button>
            <button type="button" class="btn btn-default"><a href="pingfenOrder.action?pageNum=1">按评分排序</a></button>
        </div>
    </div>

    <div class="bottom">
        <s:iterator value="#session.moviePage.list">
            <div class="one_movie">
                <a href="oneMovie.action?id=<s:property value="id"/> & moviename=<s:property value="moviename"/>"> 
                <img src="http://localhost:8080/MovieWeb/image/movieImage/<s:property value="picture"/>" width="150px" height="200px"></a>
                <p style="color: red"><s:property value="score"/></p>
                <a href="oneMovie.action?id=<s:property value="id"/> & moviename=<s:property value="moviename"/>">
                <s:property value="moviename"/></a>
            </div>
        </s:iterator>
    </div>
    <div class="fenye">
         	<ul class="pagination" style="position: relative;left: 30%">
         		<s:if test="#session.moviePage.pageNum-1 >= 1">
					<li><a href="allMovie.action?pageNum=${session.moviePage.pageNum-1 }" >&laquo;</a></li>
				</s:if>
				<s:else>
					<li><a class="disabled">&laquo;</a></li>
				</s:else>
      			<s:iterator begin="1" end="#session.moviePage.pageNum-1" var="i">
      				<li><a href="allMovie.action?pageNum=${i}">${i}</a></li>
      			</s:iterator>
      				<li><a class="active">${session.moviePage.pageNum}</a></li>
      			<s:iterator begin="#session.moviePage.pageNum+1" end="#session.totalPage" var="i">
      				<li><a href="allMovie.action?pageNum=${i}">${i}</a></li>
      			</s:iterator>

      			<s:if test="#session.moviePage.pageNum+1 <= #session.totalPage">
					 <li><a href="allMovie.action?pageNum=${session.moviePage.pageNum+1 }">&raquo;</a></li>
				</s:if>
				<s:else>
					<li><a class="disabled">&raquo;</a></li>
				</s:else>
            </ul>
         </div>
	</div>

  </body>
</html>
