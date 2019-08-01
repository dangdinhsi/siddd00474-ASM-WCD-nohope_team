<%@ page import="entity.Article" %><%--
  Created by IntelliJ IDEA.
  User: Sidang
  Date: 7/31/2019
  Time: 12:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Article article =(Article) request.getAttribute("article");
%>
<html>
<head>
    <title>Title</title>
    <style>
        img{
            width: 100%;}
    </style>
</head>
<body>
<jsp:include page="/include/navbar.jsp"></jsp:include>
<jsp:include page="/include/jumbotron.jsp"></jsp:include>
<div class="container">
    <div class="row text-center text-primary">
        <div class="col-md-12 col-xs-12"><h1><%=article.getTitle()%></h1></div>
    </div>
    <div class="row text-center text-danger">
        <strong><%=article.getTimepost()%></strong>
    </div>
    <div class="row text-center">
        <h4><%=article.getDescription()%></h4>
    </div>
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8 col-xs-12"><%=article.getContent()%></div>
    </div>
</div>
<div style="position: fixed;bottom: 0;width: 100%">
<jsp:include page="/include/footer.jsp"></jsp:include>
</div>
</body>
</html>
