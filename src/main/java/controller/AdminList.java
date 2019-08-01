package controller;

import entity.Article;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import static com.googlecode.objectify.ObjectifyService.ofy;

public class AdminList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Article> list = ofy().load().type(Article.class).filter("status",1).list();
        req.setAttribute("list",list);
        req.getRequestDispatcher("/admin/listadmin.jsp").forward(req,resp);
    }
}
