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
    
    <title>查看电影信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/movieMessage.css">
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/bootstrap-3.3.4.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link href="./css/star-rating.css" media="all" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <script src="./js/star-rating.js" type="text/javascript"></script>
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
  	 <div class="all">
  	 	<s:iterator value="#session.oneMovieList" id="m">
        <div class="main">
            <div class="main_left">
                <div class="main_left_img">
                    <img src="http://localhost:8080/MovieWeb/image/movieImage/<s:property value="picture"/>" width="150px" height="200px" alt=""/>
                </div>
                <div class="main_left_mes">
                    <table>
                        <tr>
                            <td style="font-size: 30px">电影名:</td>
                            <td style="font-size: 30px"><s:property value="moviename"/></td>
                        </tr>
                        <tr>
                            <td>导演</td>
                            <td><s:property value="author"/></td>
                        </tr>
                        <tr>
                            <td>类型</td>
                            <td><s:property value="type"/></td>
                        </tr>
                        <tr>
                            <td>制片国家</td>
                            <td><s:property value="area"/></td>
                        </tr>
                        <tr>
                            <td>语言</td>
                            <td><s:property value="language"/></td>
                        </tr>
                        <tr>
                            <td>上映日期</td>
                            <td><s:property value="date"/></td>
                        </tr>
                        <tr>
                            <td>片长</td>
                            <td><s:property value="time"/></td>
                        </tr>
                    </table>
                </div>
                <div class="main_left_jianjie">
                    <h3 style="color: green">剧情简介</h3>
                    <p><s:property value="introduction"/></p>
                </div>
            </div>

            <div class="main_right">
                <h3>评分:</h3><h4><s:property value="score"/></h4>
                <s:if test='#m.onshow=="未上映"'>
                	<a class="btn btn-lg btn-success disabled" data-toggle="modal" data-target="#buy">购票观影</a>
                </s:if>
                <s:else>
                	<a class="btn btn-lg btn-success" data-toggle="modal" data-target="#buy">购票观影</a>
                </s:else>
                <br/>
                <hr/>
                <a class="btn btn-sm btn-success" data-toggle="modal" data-target="#write">写影评/打评分</a>
                
			  	<s:if test='#session.login=="1"'>
			  		<!-- 写影评 -->
					<div class="modal fade" id="write" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					    <div class="modal-dialog" role="document">
					        <div class="modal-content" style="padding: 10px">
					            <div class="modal-header">
					                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					                <h4 class="modal-title" id="myModalLabel">评论、评分</h4>
					            </div>
					            <s:form action="addComment" method="post">
						            <div class="modal-body" >
						            	<h4>用户：<s:property value="#session.vNickname"/></h4>
						            	<p>（删除评论请到个人中心）</p>
						            	<input type="hidden" name="nickname" value="<s:property value="#session.vNickname"/>"/>
						            	<input type="hidden" name="moviename" value="<s:property value="moviename"/>"/>
						            	<input type="hidden" name="id" value="<s:property value="id"/>"/>
						                <h5>评分</h5>
						                <input id="input-21d" type="text" name="score" class="rating" data-min=0 data-max=5 data-step=0.5 data-size="sm"/>
						                <br/>
						                <h5>影评</h5>
						                <table>
						                	<s:textarea name="comment" rows="6" cols="60"/>
						                </table>
						                <br/>
						                <button type="submit" class="btn btn-success">提交</button>
						            </div>
					            </s:form>
					        </div>
					    </div>
					</div>
			    	<!-- 购票观影 -->
			    	<div class="modal fade" id="buy" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					    <div class="modal-dialog" role="document">
					        <div class="modal-content">
					            <div class="modal-header">
					                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					                <h4 class="modal-title" id="myModalLabel">删除评论</h4>
					            </div>
					            <s:if test='#session.vMoney >= #m.price'>
					            	<h4>此次消费¥ <s:property value="price"/></h4>
					            	<div class="modal-footer">
						                <a href="buy.action?buymovie=<s:property value="moviename"/>&buynickname=<s:property value="#session.vNickname"/>&buymoney=<s:property value="price"/>&sheng=<s:property value="#session.vMoney"/>&video=<s:property value="video"/>" 
						                type="button" class="btn btn-success">确认购票</a>
						            </div>
					            </s:if>
					            <s:else>
					            	<h4>您的账户余额不足¥ <s:property value="price"/>，请先充值</h4>
					            	<div class="modal-footer">
						                <a href="rechange.jsp" type="button" class="btn btn-success">充值</a>
						            </div>
					            </s:else>
					        </div>
					    </div>
					</div>
					
			    </s:if>
			    <s:else>
					<div class="modal fade" id="write" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					    <div class="modal-dialog" role="document">
					        <div class="modal-content" style="padding: 10px">
					            <div class="modal-header">
					                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					                <h4 class="modal-title" id="myModalLabel">还未登录</h4>
					            </div>
					            <br/>
					            <h3>很抱歉，您还没有登录！</h3>
					            <h3><a href="loginS.jsp?mid=<s:property value="id"/>&mname=<s:property value="moviename"/>" type="button" class="btn btn-success btn-lg" > >>去登录</a></h3>
					            <br/>
					        </div>
					    </div>
					</div>
					<div class="modal fade" id="buy" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					    <div class="modal-dialog" role="document">
					        <div class="modal-content" style="padding: 10px">
					            <div class="modal-header">
					                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					                <h4 class="modal-title" id="myModalLabel">还未登录</h4>
					            </div>
					            <br/>
					            <h3>很抱歉，您还没有登录！</h3>
					            <h3><a href="loginS.jsp?mid=<s:property value="id"/>&mname=<s:property value="moviename"/>" type="button" class="btn btn-success btn-lg" > >>去登录</a></h3>
					            <br/>
					        </div>
					    </div>
					</div>
			    </s:else>

            </div>
        </div>
        </s:iterator>

        <div class="biaoqian">
            <ul id="myTab" class="nav nav-tabs">
                <li class="active">
                    <a href="#yanyuan" data-toggle="tab">演员表</a>
                </li>
                <li><a href="#pinglun" data-toggle="tab">评论</a></li>
            </ul>
            <div id="myTabContent" class="tab-content">
                <div class="tab-pane fade in active" id="yanyuan">
                    <table class="table table-hover" width="150px">
                        <tr>
                            <th width="50px">演员名</th>
                            <th width="50px">饰演角色</th>
                        </tr>
                        <s:iterator value="#session.movieActorList">
                        <tr>
                            <td><a href="oneActorFM.action?actorname=<s:property value="actor"/>"><s:property value="actor"/></a></td>
                            <td><s:property value="role"/></td>
                        </tr>
                        </s:iterator>
                    </table>
                </div>
                <div class="tab-pane fade" id="pinglun">
                    <table class="table" width="80%">
                        <tr>
                            <th width="10%">用户</th>
                            <th width="10%">评分</th>
                            <th width="20%">时间</th>
                            <th width="60%">评论</th>
                        </tr>
                        <s:iterator value="#session.movieCommentList">
                        <tr>
                            <td><s:property value="nickname"/></td>
                            <td><s:property value="score"/></td>
                            <td><s:property value="date"/></td>
                            <td><s:property value="comment"/></td>
                        </tr>
						</s:iterator>
                    </table>
                </div>
            </div>
        </div>
    </div>
  	
  	
  </body>
</html>
