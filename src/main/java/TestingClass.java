import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class TestingClass {
    public static void main(String[] args) throws IOException {
        Document document = Jsoup.connect("https://vnexpress.net/the-thao").ignoreContentType(true).get();
        Elements elements = document.select("section.sidebar_1 article.list_news h4.title_news a");
        for (Element el:elements) {
            String link = el.attr("href");
            System.out.println(link);
        }

    }
}
