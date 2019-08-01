package filter;

import com.googlecode.objectify.ObjectifyService;
import entity.Article;
import entity.CrawlerSource;

import javax.servlet.*;
import java.io.IOException;

public class MyRegisterFilter implements Filter {
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        ObjectifyService.register(CrawlerSource.class);
        ObjectifyService.register(Article.class);
        chain.doFilter(request,response);
    }

    public void destroy() {

    }
}
