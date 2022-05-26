package kr.co.overscore.model;

public class ItemModel {
	private String keyword;
	private int siteId;
	private String siteNm;
	private String category;

	private String imageUrl;
	private String itemNo;
	private String itemNm;
	private float price;
	private float sourcePrice;
	private String status;
	
	private String itemUrl;
	private int itemRank;

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getSiteId() {
		return siteId;
	}

	public void setSiteId(int siteId) {
		this.siteId = siteId;
	}

	public String getSiteNm() {
		return siteNm;
	}

	public void setSiteNm(String siteNm) {
		this.siteNm = siteNm;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getItemNo() {
		return itemNo;
	}

	public void setItemNo(String itemNo) {
		this.itemNo = itemNo;
	}

	public String getItemNm() {
		return itemNm;
	}

	public void setItemNm(String itemNm) {
		this.itemNm = itemNm;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getItemUrl() {
		return itemUrl;
	}

	public void setItemUrl(String itemUrl) {
		this.itemUrl = itemUrl;
	}

	public int getItemRank() {
		return itemRank;
	}

	public void setItemRank(int itemRank) {
		this.itemRank = itemRank;
	}

	public float getSourcePrice() {
		return sourcePrice;
	}

	public void setSourcePrice(float sourcePrice) {
		this.sourcePrice = sourcePrice;
	}

}