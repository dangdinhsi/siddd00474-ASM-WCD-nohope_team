<%@ page import="entity.Article" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Sidang
  Date: 8/1/2019
  Time: 6:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Article> list = (List<Article>) request.getAttribute("list");
    int currentPage = (int) request.getAttribute("currentPage");
    int currentLimit = (int) request.getAttribute("currentLimit");
    int totalPage = (int) request.getAttribute("totalPage");
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <script src="//code.jquery.com/jquery.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    <style>
        img{
            width: 100px;
        }
        th{
            text-align: center;
        }
    </style>
    <script>
        function deleletconfig(){

            var del=confirm("Bạn chắc chắn muốn xóa?");
            if (del==true){
                alert ("Xóa thành công!!");
            }else{
                alert("Bạn chắc chắn muốn thoát?");
            }
            return del;
        }
    </script>
</head>
<body>
<div class="container">
    <div class="row">
        <h2 class="text-center text-success">Admin list artile CRUD</h2>
        <h4 class="text-primary text-center"><i>Chức năng thêm,xóa,sửa article </i></h4>
        <div align="center" style="margin-bottom: 5px"><button type="button" onclick="window.location='/home'">Back to home</button></div>
        <div align="center" style="margin-bottom: 20px"><button type="button" onclick="window.location='/admin/addcrawler'">Add Crawler</button></div>
        <table class="table-bordered text-center" align="center" style="margin-bottom: 30px;background-color: azure;padding: 10px">
           <thead>
           <tr>
           <th scope="col">VALUE</th>
           <th scope="col">CATEGORY</th>
           </tr>
           </thead>
            <tbody>
            <tr>
                <th scope="row">1</th>
                <td>NEWS</td>
            </tr>
            <tr>
                <th scope="row">2</th>
                <td>SPORT</td>
            </tr>
            <tr>
                <th scope="row">3</th>
                <td>TRAVEL</td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="row">
        <table class="table table-dark table-bordered" style="background-color: azure">
            <thead>
            <tr>
                <th scope="col" >VALUE</th>
                <th scope="col">ID/URL</th>
                <th scope="col">DESCRIPTION</th>
                <th scope="col">THUMBNAIL</th>
                <th scope="col" colspan="2"><a href="/admin/special-content">Add Special</a></th>
            </tr>
            </thead>
            <tbody>
            <%
                for (int i=0;i<list.size();i++){
            %>
            <tr>
                <th scope="row" style="padding: 25px"><%=list.get(i).getCategoryid()%></th>
                <td><a href="/article/detail?id=<%=list.get(i).getUrl()%>"><%=list.get(i).getUrl()%></a></td>
                <td><%=list.get(i).getDescription()%></td>
                <td><img src="<%=(list.get(i).getThumbnail()).get(0)%>" alt=""></td>
                <td style="padding: 25px"><a href="/admin/delete?id=<%=list.get(i).getUrl()%>" class="text-danger" onclick="return deleletconfig();">DELETE</a></td>
                <td style="padding: 25px"><a href="/admin/article/edit?id=<%=list.get(i).getUrl()%>" class="text-danger">EDIT</a></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
    <div class="row">
        <div class="col-md-12 text-center">
            <ul>
                <%
                    if (currentPage > 1){
                %>
                <a href="/admin/list?page=1&limit=<%=currentLimit%>"><<</a>
                <%
                    }
                %>
                <%
                    if (currentPage > 1){
                %>
                <a href="/admin/list?page=<%=currentPage-1%>&limit=<%=currentLimit%>"><</a>
                <%
                    }
                %>

                <%
                    if (currentPage - 2 > 1){
                %>
                <a href="/admin/list?page=<%=currentPage-2%>&limit=<%=currentLimit%>"><%=currentPage - 2%></a>
                <%
                    }
                %>
                <%
                    if (currentPage - 1 > 1){
                %>
                <a href="/admin/list?page=<%=currentPage-1%>&limit=<%=currentLimit%>"><%=currentPage - 1%></a>&nbsp;
                <%
                    }
                %>

                <a href="#"><%=currentPage%></a>

                <%
                    if (currentPage + 1 < totalPage){
                %>
                <a href="/admin/list?page=<%=currentPage+1%>&limit=<%=currentLimit%>"><%=currentPage + 1%></a>&nbsp;
                <%
                    }
                %>

                <%
                    if (currentPage + 2 < totalPage){
                %>
                <a href="/admin/list?page=<%=currentPage+2%>&limit=<%=currentLimit%>"><%=currentPage + 2%></a>&nbsp;
                <%
                    }
                %>

                <%
                    if (currentPage < totalPage){
                %>
                <a href="/admin/list?page=<%=currentPage + 1%>&limit=<%=currentLimit%>">></a>&nbsp;
                <%
                    }
                %>
                <%
                    if (currentPage < totalPage){
                %>
                <a href="/admin/list?page=<%=totalPage%>&limit=<%=currentLimit%>">>></a>
                <%
                    }
                %>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
