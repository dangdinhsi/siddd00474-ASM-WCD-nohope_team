package controller;

import entity.Article;
import com.googlecode.objectify.cmd.Query;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.logging.Logger;

import static com.googlecode.objectify.ObjectifyService.ofy;

public class ListArticle extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(ListArticle.class.getName());

    private static final int DEFAULT_LIMIT = 5;
    private static final int DEFAULT_PAGE = 1;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        /*List<Article> list = ofy().load().type(Article.class).filter("status",1).list();
        req.setAttribute("list",list);
        req.getRequestDispatcher("/article/home.jsp").forward(req,resp);*/

        int page = DEFAULT_PAGE;
        int limit = DEFAULT_LIMIT;
        int totalItem = 0;

        Query<Article> query = ofy().load().type(Article.class);
        query = query.filter("status", 1);
        totalItem = query.count();
        try {
            String strPage = req.getParameter("page");
            String strLimit = req.getParameter("limit");
            page = Integer.parseInt(strPage);
            limit = Integer.parseInt(strLimit);
            if (page <= 0) {
                page = DEFAULT_PAGE;
            }
            if (limit <= 0) {
                limit = DEFAULT_LIMIT;
            }
        } catch (Exception ex) {
            LOGGER.warning("Invalid parameter");
        }
        query = query.limit(limit).offset((page - 1) * limit);
        List<Article> list =query.list();
        req.setAttribute("list", list);
        req.setAttribute("currentPage", page);
        req.setAttribute("currentLimit", limit);
        req.setAttribute("totalPage", (totalItem / limit) + (totalItem % limit == 0 ? 0 : 1));
        req.getRequestDispatcher("/article/home.jsp").forward(req,resp);
    }
}
