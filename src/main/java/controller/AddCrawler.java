package controller;

import entity.CrawlerSource;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.googlecode.objectify.ObjectifyService.ofy;

public class AddCrawler extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("categoryids", CrawlerSource.CategoryId.values());
        req.getRequestDispatcher("/admin/form.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getParameter("url");
        String linkSelector = req.getParameter("linkSelector");
        String titleSelector = req.getParameter("titleSelector");
        String contentSelector = req.getParameter("contentSelector");
        String descriptionSelector = req.getParameter("descriptionSelector");
        String thumbnailSelector = req.getParameter("thumbnailSelector");
        int categoryid = Integer.parseInt(req.getParameter("categoryid"));
        String timeSelector =req.getParameter("timeSelector");
        CrawlerSource crawlerS = new CrawlerSource();
        crawlerS.setUrl(url);
        crawlerS.setLinkSelector(linkSelector);
        crawlerS.setTitleSelector(titleSelector);
        crawlerS.setContentSelector(contentSelector);
        crawlerS.setThumbnailSelector(thumbnailSelector);
        crawlerS.setDescriptionSelector(descriptionSelector);
        crawlerS.setTimeSelector(timeSelector);
        crawlerS.setCategoryid(CrawlerSource.CategoryId.findByValue(categoryid));
        ofy().save().entity(crawlerS).now();
        resp.sendRedirect("/admin/list");
    }
}
