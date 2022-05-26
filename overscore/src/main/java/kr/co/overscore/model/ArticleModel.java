package kr.co.overscore.model;

public class ArticleModel {
	String articleId;
	String articleTitle;
	String articleContent;
	String articleWriter;
	String insDate;
	
	public String getArticleId() {
		return articleId;
	}
	public void setArticleId(String articleId) {
		this.articleId = articleId;
	}
	public String getArticleTitle() {
		return articleTitle;
	}
	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle;
	}
	public String getArticleContent() {
		return articleContent;
	}
	public void setArticleContent(String articleContent) {
		this.articleContent = articleContent;
	}
	public String getArticleWriter() {
		return articleWriter;
	}
	public void setArticleWriter(String articleWriter) {
		this.articleWriter = articleWriter;
	}
	public String getInsDate() {
		String[] splDate_Time=insDate.split(" ");
		String[] splDate = splDate_Time[0].split("-");
		String[] splTime = splDate_Time[1].split(":");
		
		return splDate[0]+"년 "+splDate[1]+"월 "+splDate[2]+"일 "+splTime[0]+"시 "+splTime[1]+"분";
	}
	public void setInsDate(String insDate) {
		this.insDate = insDate;
	}
	
}
