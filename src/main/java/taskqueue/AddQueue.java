package taskqueue;

import com.google.appengine.api.taskqueue.Queue;
import com.google.appengine.api.taskqueue.QueueFactory;
import com.google.appengine.api.taskqueue.TaskOptions;
import com.google.gson.Gson;
import entity.CrawlerSource;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import static com.googlecode.objectify.ObjectifyService.ofy;

public class AddQueue extends HttpServlet {
    private static Queue q = QueueFactory.getQueue("queue-green");
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<CrawlerSource> list = ofy().load().type(CrawlerSource.class).list();
        if(list.size()==0){
            return;
        }
        for (CrawlerSource crawlerSource:list){
            Document document = Jsoup.connect(crawlerSource.getUrl()).ignoreContentType(true).get();
            Elements elements = document.select(crawlerSource.getLinkSelector());
            for (Element el:elements){
                String link =el.attr("href");
                HashMap<String,Object> hashMapQueue = new HashMap<String, Object>();
                hashMapQueue.put("link",link);
                hashMapQueue.put("sourceId",crawlerSource.getId());
                System.out.println(link);
                q.add(TaskOptions.Builder.withMethod(TaskOptions.Method.PULL).payload(new Gson().toJson(hashMapQueue)));
            }
        }
    }
}
