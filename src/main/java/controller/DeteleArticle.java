package controller;

import entity.Article;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Calendar;

import static com.googlecode.objectify.ObjectifyService.ofy;

public class DeteleArticle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // Cách 1: Xóa mềm phần tử với id truyền lên từ parameter
        /*String id = req.getParameter("id");
        Article article = ofy().load().type(Article.class).id(id).now();
        article.setStatus(0);
        article.setDeletedAt(Calendar.getInstance().getTimeInMillis());
        ofy().save().entity(article).now();
        resp.sendRedirect("/admin/list");
        System.out.println("delete success!!");*/

        //Cách 2: Xóa luôn phần tử khỏi database
        String id = req.getParameter("id");
        ofy().delete().type(Article.class).id(id).now();
        resp.sendRedirect("/admin/list");
    }
}
