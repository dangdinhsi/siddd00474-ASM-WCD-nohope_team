import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class TestingClass {
    public static void main(String[] args) throws IOException {
        Document document = Jsoup.connect("https://vnexpress.net/the-thao/tiger-woods-va-dau-hoi-the-luc-sau-that-bai-o-the-open-3960130.html").ignoreContentType(true).get();
        Elements elements = document.select(".tplCaption img");
        List<String> images = new ArrayList<>();
        for (Element element:elements){
            String txtURL =element.attr("src");
            images.add(txtURL);
            System.out.println(txtURL);
        }
        System.out.println(images.size());
        System.out.println("link chú mày cần là:"+images.get(0));


    }
}
