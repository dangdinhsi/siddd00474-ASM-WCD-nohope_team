package entity;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

import java.util.Calendar;
import java.util.List;

@Entity
public class Article {
    @Id
    private String url;
    private String title;
    private String content;
    private List<String> thumbnail;
    private String description;
    private String timepost;
    @Index
    private int status;
    @Index
    private int categoryid;
    @Index
    private long sourceId;
    private long createdAt;
    private long updatedAt;
    private long deletedAt;

    public Article() {
    }

    public Article(String url) {
        this.url = url;
        this.status=1;
        this.createdAt = Calendar.getInstance().getTimeInMillis();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTimepost() {
        return timepost;
    }

    public void setTimepost(String timepost) {
        this.timepost = timepost;
    }
    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(int categoryid) {
        this.categoryid = categoryid;
    }

    public long getSourceId() {
        return sourceId;
    }

    public void setSourceId(long sourceId) {
        this.sourceId = sourceId;
    }

    public List<String> getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(List<String> thumbnail) {
        this.thumbnail = thumbnail;
    }

    public long getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(long createdAt) {
        this.createdAt = createdAt;
    }

    public long getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(long updatedAt) {
        this.updatedAt = updatedAt;
    }

    public long getDeletedAt() {
        return deletedAt;
    }

    public void setDeletedAt(long deletedAt) {
        this.deletedAt = deletedAt;
    }
}
