package controller;

import entity.Article;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Calendar;

import static com.googlecode.objectify.ObjectifyService.ofy;

public class EditArticle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/admin/edit.jsp").forward(req,resp);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        Article existArticle = ofy().load().type(Article.class).id(id).now();
        String title = req.getParameter("title");
        String content = req.getParameter("content");
        String description =req.getParameter("description");
        String time = req.getParameter("time");
        existArticle.setTitle(title);
        existArticle.setDescription(description);
        existArticle.setContent(content);
        existArticle.setTimepost(time);
        existArticle.setUpdatedAt(Calendar.getInstance().getTimeInMillis());
        ofy().save().entity(existArticle).now();
        resp.sendRedirect("/admin/list");
        System.out.println("update success!!");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPut(req,resp);
    }
}
