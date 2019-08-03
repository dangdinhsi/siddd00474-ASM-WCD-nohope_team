<%--
  Created by IntelliJ IDEA.
  User: Sidang
  Date: 7/31/2019
  Time: 12:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        img{
            width: 100%;
        }
    </style>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <div class="row text-center">
        <div class="col-12 text-success"><h3>Add Special Content</h3></div>
    </div>
    <div class="row">
        <div class="col-6 " style="margin: auto; padding-top: 5px;">
            <div class="shadow p-3 mb-5 bg-white rounded">

                <form action="#" method="post" class="text-primary">
                    <div class="form-group">
                        <label>URL</label>
                        <input type="text" name="url" class="form-control" placeholder="url..." >
                    </div>
                    <div class="form-group">
                        <label>Title Selector</label>
                        <input type="text" name="titleSelector" class="form-control" placeholder="title...">
                    </div>
                    <div class="form-group">
                        <label>Description Selector</label>
                        <input type="text" name="descriptionSelector" class="form-control" placeholder="description...">
                    </div>
                    <div class="form-group">
                        <label>Content Selector </label>
                        <input type="text" name="contentSelector" class="form-control" placeholder="content...">
                    </div>
                    <div class="form-group" align="center">
                        <button type="button" class="btn-info" id="btn-preview">Preview</button>
                    </div>
                    <div class="form-group" align="center">
                        <button type="button" class="btn-secondary">Reset</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="modal text-center" tabindex="-1" role="dialog" id="modal-preview">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="container">
                        <div class="row"><h5 class="modal-title" id="article-title">Modal title</h5></div>
                        <p class="row"><strong id="article-description">description</strong></p>
                    </div>

                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="article-content">
                    <p>Modal body text goes here.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="btn-save">Save changes</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

    $('#btn-preview').click(function () {
        var data = {
            "url": $('input[name="url"]').val(),
            "titleSelector": $('input[name="titleSelector"]').val(),
            "descriptionSelector": $('input[name="descriptionSelector"]').val(),
            "contentSelector": $('input[name="contentSelector"]').val(),
        };
        var url = "https://1-dot-asmt1708m-dds93.appspot.com/admin/special-content";
        $.ajax({
            "url":url,
            "method": "POST",
            "data": JSON.stringify(data),
            "success": function (data) {
                $('#article-title').text(data.title);
                $('#article-description').text(data.description);
                $('#article-content').html(data.content);
                $('#modal-preview').modal('show');
            },
            "error":function () {
                alert("Error!!!!");
            }
        });
        return false;
    });

    $('#btn-save').click(function () {
        var data ={
            "url":$('input[name="url"]').val(),
            "title":$('#article-title').text(),
            "description":$('#article-description').text(),
            "content":$('#article-content').html(),
        };
        var url = "https://1-dot-asmt1708m-dds93.appspot.com/admin/save-special-content";
        $.ajax({
            "url":url,
            "method":"POST",
            "data":JSON.stringify(data),
            "success":function (data) {
                alert("Okie!!!");
                $('#modal-preview').modal('hide');
                window.location="/admin/list";
            },
            "error":function () {
                alert("Error!!!!");
            }
        });
        return false;
    });
</script>
</body>
</html>