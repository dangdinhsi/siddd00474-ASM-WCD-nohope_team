<%--
  Created by IntelliJ IDEA.
  User: Sidang
  Date: 7/29/2019
  Time: 7:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<style type="text/css">
    #vnclock{
        font-weight:bold;
        text-align:center;
        font-size:15px;
        padding:10px;
        color: #00070E;
    }
    #home a:hover{
        background-color: azure;
        color: red;
    }
    #link_admin a:hover{
        color: red;
        background-color: azure;
    }
</style>
    <script>
        window.setTimeout("showTime()", 1000);
        function getVNTime(){
            var time = new Date();
            var dow = time.getDay();
            if(dow==0)
                dow = "CN";
            else if (dow==1)
                dow = "T2";
            else if (dow==2)
                dow = "T3";
            else if (dow==3)
                dow = "T4";
            else if (dow==4)
                dow = "T5";
            else if (dow==5)
                dow = "T6";
            else if (dow==6)
                dow = "T7";
            var day = time.getDate();
            var month = time.getMonth()+1;
            var year = time.getFullYear();
            var hr = time.getHours();
            var min = time.getMinutes();
            var sec = time.getSeconds();
            day = ((day < 10) ? "0" : "") + day;
            month = ((month < 10) ? "0" : "") + month;
            hr = ((hr < 10) ? "0" : "") + hr;
            min = ((min < 10) ? "0" : "") + min;
            sec = ((sec < 10) ? "0" : "") + sec;
            return dow + " " + day + "/" + month + "/" + year + " " + hr + ":" + min + ":" + sec+"&nbsp(GMT+7)";
        }
        function showTime(){
            var vnclock = document.getElementById("vnclock");
            if (vnclock != null)
                vnclock.innerHTML = getVNTime();
            setTimeout("showTime()", 1000);
        }
    </script>

</head>
<body>
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><span id="vnclock"></span></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav">
                <li class="active" id="home"><a href="/home">HOME</a></li>
                <li><a href="#">THỜI SỰ</a></li>
                <li><a href="#">THỂ THAO</a></li>
                <li><a href="#">DU LỊCH</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><form class="navbar-form" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search">
                    </div>
                    <button type="submit" class="btn btn-default">SEARCH</button>
                    &nbsp; &nbsp;
                    <button type="button" class="btn btn-default">LOGIN</button>
                    &nbsp;
                    &nbsp;
                    <button type="button" class="btn btn-info">JOIN NOW</button>
                </form></li>
                <li id="link_admin"><a href="/admin/addcrawler">ADD CRAWLER</a></li>
                <li><div style="margin-top: 10px"><a href="/admin/list"><img src="/img/myartsi.png" width="30px" height="30px" alt=""></a></div></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div>
</nav>
</body>
</html>
