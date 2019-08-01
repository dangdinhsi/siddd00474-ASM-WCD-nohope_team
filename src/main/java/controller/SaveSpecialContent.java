package controller;

import com.google.gson.Gson;
import entity.Article;
import org.json.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import utility.StringUTIL;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import static com.googlecode.objectify.ObjectifyService.ofy;

public class SaveSpecialContent extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        String contentString = StringUTIL.convertInputStreamToString(req.getInputStream());
        JSONObject jsonObject = new JSONObject(contentString);
        String url = jsonObject.getString("url");
        String title = jsonObject.getString("title");
        String description =jsonObject.getString("description");
        String content =jsonObject.getString("content");


        Article article = new Article(url);
        article.setTitle(title);
        article.setDescription(description);
        article.setContent(content);
        Document document = Jsoup.connect(url).ignoreContentType(true).get();
        Elements elements = document.select(".tplCaption img");
        String timepost = document.select("span.time").text();
        article.setTimepost(timepost);
        article.setSourceId(Calendar.getInstance().getTimeInMillis());
        if((url.contains("bong-da"))||(url.contains("the-thao"))){
            article.setCategoryid(2);
        }else if(url.contains("thoi-su")){
            article.setCategoryid(1);
        }else if(url.contains("du-lich")){
            article.setCategoryid(3);
        }
        List<String> images =new ArrayList<>();
        for(Element el:elements){
            images.add(el.attr("src"));
            article.setThumbnail(images);
        }
        if(images.size()==0){
            article.setStatus(0);
        }
        if(timepost.length()==0){
            article.setStatus(0);
        }
        if(title.length()==0){
            article.setStatus(0);
        }
        if(description.length()==0){
            article.setStatus(0);
        }
        if(content.length()==0){
            article.setStatus(0);
        }
        ofy().save().entity(article).now();
        resp.getWriter().println(new Gson().toJson(article));
        System.out.println("OK!!!!");
    }
}
