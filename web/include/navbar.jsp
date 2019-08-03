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
        color:  #595959;
    }
    #home a:hover{
        background-color: azure;
        color: red;
    }
    #link_admin a:hover{
        color: red;
        background-color: azure;
    }
    .btn-default:hover{
        background-color:	#5bc0de;
    }
    .fomrgroup {
        width: 50%;
        margin: auto;
        display: block;
        height: 50px;
    }
    .fomrgroup input{
        float: right;
        width: 70%;
        height: 25px;
        margin-right: 20px;
        line-height: 50px;
    }
    .fomrgroup b{
        font-size: 20px;
    }
    /* The Modal (background) */
    .modal {
        margin: auto;
        text-align: center;
        width: 50%;
        display: none; /* mặc định được ẩn đi */
        position: fixed; /* vị trí cố định */
        z-index: 1; /* Ưu tiên hiển thị trên cùng */
        padding-top: 100px;
        left: 0;
        top: 0;
        height: 100%;
        overflow: auto;
        background-color: rgb(0,0,0);
        background-color: rgba(0,0,0,0.4);
    }

    /* Modal Content */
    .modal-content {
        background-color: #fefefe;
        margin: auto;
        padding: 20px;
        border: 1px solid #888;
        width: 60%;
    }

    /* The Close Button */
    .close {
        color: #aaaaaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
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
                <li id="home"><a href="/home">HOME</a></li>
                <li id="news"><a href="/home/news">THỜI SỰ</a></li>
                <li id="sport"><a href="/home/sport">THỂ THAO</a></li>
                <li id="travel"><a href="/home/travel">DU LỊCH</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><form class="navbar-form" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search">
                    </div>
                    <button type="submit" class="btn btn-default">SEARCH</button>
                    &nbsp; &nbsp;
                    <button type="button" class="btn btn-default" id="btn-button">LOGIN</button>
                    &nbsp;
                    &nbsp;
                    <button type="button" class="btn btn-default">JOIN NOW</button>
                </form></li>
                <li id="link_admin"><a href="/admin/addcrawler"><b>ADD CRAWLER</b></a></li>
                <li><div style="margin-top: 10px"><a href="/admin/list"><img src="/img/myartsi.png" width="30px" height="30px" alt=""></a></div></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div>
</nav>
<div id="myModal" class="modal">
    <!-- Nội dung form đăng nhập -->
    <div class="modal-content">
        <form action="#">
            <span class="close">&times;</span>
            <div class="fomrgroup">
                Username <input type="text" name="username">
            </div>
            <div class="fomrgroup">
                Password <input type="passWord" name="passWord">
            </div>
            <div class="fomrgroup">
                <button>Đăng nhập</button>
            </div>
        </form>
    </div>
</div>
<script>
    var modal = document.getElementById('myModal');

    // Lấy phần button mở Modal
    var btn = document.getElementById("btn-button");

    // Lấy phần span đóng Modal
    var span = document.getElementsByClassName("close")[0];

    // Khi button được click thi mở Modal
    btn.onclick = function() {
        modal.style.display = "block";
    }

    // Khi span được click thì đóng Modal
    span.onclick = function() {
        modal.style.display = "none";
    }

    // Khi click ngoài Modal thì đóng Modal
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>
</body>
</html>
