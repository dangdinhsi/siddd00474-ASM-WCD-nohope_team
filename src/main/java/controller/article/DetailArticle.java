package controller.article;

import entity.Article;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.googlecode.objectify.ObjectifyService.ofy;

public class DetailArticle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        Article article = ofy().load().type(Article.class).id(id).now();
        req.setAttribute("article",article);
        req.getRequestDispatcher("/article/detail.jsp").forward(req,resp);
        System.out.println("get detail success!!!");
    }
}
