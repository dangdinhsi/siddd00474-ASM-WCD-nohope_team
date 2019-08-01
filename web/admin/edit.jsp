<%--
  Created by IntelliJ IDEA.
  User: Sidang
  Date: 7/31/2019
  Time: 11:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="/include/navbar.jsp"></jsp:include>

<div class="container">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <form method="POST">
                <div class="form-group">
                    <label >Title</label>
                    <input type="text" class="form-control" required name="title">
                </div>
                <div class="form-group">
                    <label >Description</label>
                    <input type="text" class="form-control" required name="description">
                </div>
                <div class="form-group">
                    <label >Content</label>
                    <input type="text" class="form-control" required name="content" placeholder="content dạng html...">
                </div>
                <div class="form-group">
                    <label>Time</label>
                    <input type="text" class="form-control" required name="time">
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary form-control">Send Edit</button>
                    <button type="reset" class="btn btn-info form-control">Reset</button>
                </div>
            </form>
        </div>
    </div>
</div>
<div style="position: fixed;width: 100%;bottom: 0">
    <jsp:include page="/include/footer.jsp"></jsp:include>
</div>
</body>
</html>
