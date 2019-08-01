package entity;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

import java.util.Calendar;

@Entity
public class CrawlerSource {
    @Id
    private long id;
    @Index
    private String url;
    @Index
    private int categoryid;
    private String linkSelector;
    private String titleSelector;
    private String contentSelector;
    private String thumbnailSelector;
    private String descriptionSelector;
    private String timeSelector;
    @Index
    private int status;

    public CrawlerSource() {
        this.id = Calendar.getInstance().getTimeInMillis();
        this.status =1;
    }

    public enum CategoryId{
        NEWS(1),SPORT(2),TRAVEL(3);
        int value;
        CategoryId(int value){
            this.value=value;
        }
        public int getValue(){
            return value;
        }
        public static CategoryId findByValue(int value){
            for(CategoryId categoryid: CategoryId.values()){
                if (categoryid.getValue() == value) {
                    return categoryid;
                }
            }
            return null;
        }
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(CrawlerSource.CategoryId categoryid) {
        this.categoryid = categoryid.getValue();
    }

    public String getLinkSelector() {
        return linkSelector;
    }

    public void setLinkSelector(String linkSelector) {
        this.linkSelector = linkSelector;
    }

    public String getTitleSelector() {
        return titleSelector;
    }

    public void setTitleSelector(String titleSelector) {
        this.titleSelector = titleSelector;
    }

    public String getContentSelector() {
        return contentSelector;
    }

    public void setContentSelector(String contentSelector) {
        this.contentSelector = contentSelector;
    }

    public String getDescriptionSelector() {
        return descriptionSelector;
    }

    public void setDescriptionSelector(String descriptionSelector) {
        this.descriptionSelector = descriptionSelector;
    }

    public String getTimeSelector() {
        return timeSelector;
    }

    public void setTimeSelector(String timeSelector) {
        this.timeSelector = timeSelector;
    }
    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getThumbnailSelector() {
        return thumbnailSelector;
    }

    public void setThumbnailSelector(String thumbnailSelector) {
        this.thumbnailSelector = thumbnailSelector;
    }
}
