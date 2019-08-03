<%@ page import="entity.Article" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Sidang
  Date: 8/2/2019
  Time: 10:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Article> list =(List<Article>) request.getAttribute("list");
    int currentPage = (int) request.getAttribute("currentPage");
    int currentLimit = (int) request.getAttribute("currentLimit");
    int totalPage = (int) request.getAttribute("totalPage");
%>
<html>
<head>
    <title>Travel</title>
    <style>
        img{
            border-radius: 17px;
            object-fit: cover
        }
        #travel a:hover{
            background-color: aqua;
            color: red;
        }
    </style>
</head>
<body>
<jsp:include page="/include/navbar.jsp"></jsp:include>
<jsp:include page="/include/jumbotron.jsp"></jsp:include>
<div class="container">

    <div class="row">
        <div class="col-md-9 well" style="height: 1150px">

            <div class="row">
                <%
                    for (int i=0;i<list.size();i++){

                %>
                <div class="col-md-8">
                    <a href="/article/detail?id=<%=list.get(i).getUrl()%>"> <h4><%=list.get(i).getTitle()%>
                    </h4></a>


                </div>
            </div>
            <div class="row">
                <a href="/article/detail?id=<%=list.get(i).getUrl()%>"><img class="col-md-3" src="<%=(list.get(i).getThumbnail()).get(0)%>" width="190px" height="120px" alt=""></a>
                <b>
                    <%=list.get(i).getDescription()%>
                </b>
                <a class="small" href="/article/detail?id=<%=list.get(i).getUrl()%>">đọc tiếp</a>
                <div style="margin-top: 2%" class="text-danger"><%=list.get(i).getTimepost()%></div>
                <div><br><br><br></div>
                <hr>
                <%
                    }
                %>
            </div>
            <div class="row text-success">
                <div class="col-md-4"></div>
                <div class="col-md-4 text-center">
                    <ul>
                        <%
                            if (currentPage > 1){
                        %>
                        <a href="/home/travel?page=1&limit=<%=currentLimit%>"><<</a>
                        <%
                            }
                        %>
                        <%
                            if (currentPage > 1){
                        %>
                        <a href="/home/travel?page=<%=currentPage-1%>&limit=<%=currentLimit%>"><</a>
                        <%
                            }
                        %>

                        <%
                            if (currentPage - 2 > 1){
                        %>
                        <a href="/home/travel?page=<%=currentPage-2%>&limit=<%=currentLimit%>"><%=currentPage - 2%></a>
                        <%
                            }
                        %>
                        <%
                            if (currentPage - 1 > 1){
                        %>
                        <a href="/home/travel?page=<%=currentPage-1%>&limit=<%=currentLimit%>"><%=currentPage - 1%></a>&nbsp;
                        <%
                            }
                        %>

                        <a href="#"><%=currentPage%></a>

                        <%
                            if (currentPage + 1 < totalPage){
                        %>
                        <a href="/home/travel?page=<%=currentPage+1%>&limit=<%=currentLimit%>"><%=currentPage + 1%></a>&nbsp;
                        <%
                            }
                        %>

                        <%
                            if (currentPage + 2 < totalPage){
                        %>
                        <a href="/home/travel?page=<%=currentPage+2%>&limit=<%=currentLimit%>"><%=currentPage + 2%></a>&nbsp;
                        <%
                            }
                        %>

                        <%
                            if (currentPage < totalPage){
                        %>
                        <a href="/home/travel?page=<%=currentPage + 1%>&limit=<%=currentLimit%>">></a>&nbsp;
                        <%
                            }
                        %>
                        <%
                            if (currentPage < totalPage){
                        %>
                        <a href="/home/travel?page=<%=totalPage%>&limit=<%=currentLimit%>">>></a>
                        <%
                            }
                        %>
                    </ul>
                </div>      <%--code phan trang--%>
                <div class="col-md-4"></div>
            </div>

        </div>

        <div class="col-md-3 well" align="center" style="height: 1150px">
            <p style="margin-top: 545px">chỗ này là right content(quảng cáo....)</p>
        </div>
    </div>
</div>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>
