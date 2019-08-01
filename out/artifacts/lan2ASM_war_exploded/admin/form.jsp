<%@ page import="entity.CrawlerSource" %><%--
  Created by IntelliJ IDEA.
  User: Sidang
  Date: 7/26/2019
  Time: 10:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    CrawlerSource.CategoryId[] categoryids =(CrawlerSource.CategoryId[]) request.getAttribute("categoryids");
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <script src="//code.jquery.com/jquery.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
</head>
<body>
<h1 align="center" class="text-primary">Add CrawlerSource</h1>
<div class="container">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6 border" style="background-color:#f9f9f9;border-radius: 10px">
<form action="/admin/addcrawler" method="post">

    <div class="form-group ">
        URL: <input class="form-control" type="text" required name="url">
    </div>
    <div class="form-group">
        Category
        <select name="categoryid">
            <%
                for (int i = 0; i < categoryids.length; i++) {
            %>
            <option value="<%=categoryids[i].getValue()%>"><%=categoryids[i].name()%></option>
            <%
                }
            %>
        </select>
    </div>
    <div class="form-group">
        Link Selector <input class="form-control" type="text" required name="linkSelector">
    </div>
    <div class="form-group">
        Title Selector <input class="form-control" type="text" required name="titleSelector">
    </div>
    <div class="form-group">
        Content Selector <input class="form-control" type="text" required name="contentSelector">
    </div>
    <div class="form-group">
        Description Selector <input class="form-control" type="text" required name="descriptionSelector">
    </div>
    <div class="form-group">
        Thumbnail Selector <input class="form-control" type="text" required name="thumbnailSelector">
    </div>
    <div class="form-group">
        Time Selector <input class="form-control" type="text" required name="timeSelector">
    </div>
    <div class="row form-group">
        <div class="col-md-4"></div>
        <div class="col-md-4"><button class="form-control btn-primary" type="submit">SAVE</button></div>
        <div class="col-md-4"></div>
    </div>
    <div class="row form-group">
        <div class="col-md-4"></div>
        <div class="col-md-4"><button class="form-control btn-success" type="reset">RESET</button></div>
        <div class="col-md-4"></div>
    </div>
</form>
</div>
        <div class="col-md-3"></div>
</div>
</div>
</body>
</html>
