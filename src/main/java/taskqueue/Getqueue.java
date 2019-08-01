package taskqueue;

import com.google.appengine.api.taskqueue.Queue;
import com.google.appengine.api.taskqueue.QueueFactory;
import com.google.appengine.api.taskqueue.TaskHandle;
import entity.Article;
import entity.CrawlerSource;
import org.json.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

import static com.googlecode.objectify.ObjectifyService.ofy;

public class Getqueue extends HttpServlet {
    private static Queue q = QueueFactory.getQueue("queue-green");
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<TaskHandle> tasks = q.leaseTasks(30, TimeUnit.SECONDS,1);
        if(tasks.size()>0){
            TaskHandle taskHandle = tasks.get(0);
            String taskContent = new String(taskHandle.getPayload());
            JSONObject jsonObject = new JSONObject(taskContent);
            String link = jsonObject.getString("link");
            long sourceId = jsonObject.getLong("sourceId");
            CrawlerSource crawlerSource = ofy().load().type(CrawlerSource.class).id(sourceId).now();
            if(crawlerSource==null){
                return;
            }
            System.out.println(link);
            Document document = Jsoup.connect(link).ignoreContentType(true).get();
            String title = document.select(crawlerSource.getTitleSelector()).text();
            String content = document.select(crawlerSource.getContentSelector()).html();
            String description =document.select(crawlerSource.getDescriptionSelector()).text();
            String timepost = document.select(crawlerSource.getTimeSelector()).text();
            Article article = new Article(link);
            article.setTimepost(timepost);
            article.setTitle(title);
            article.setContent(content);
            article.setDescription(description);
            article.setCategoryid(crawlerSource.getCategoryid());
            article.setSourceId(crawlerSource.getId());
            Elements elements = document.select(crawlerSource.getThumbnailSelector());
            List<String> images =new ArrayList<>();
            for(Element el:elements){
                images.add(el.attr("src"));
                article.setThumbnail(images);
            }
            if(images.size()==0){
                article.setStatus(0);
            }
            String str1="#box_comment";
            if(link.contains(str1)){
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
            q.deleteTask(taskHandle);
        }
    }
}
