package kr.co.overscore.model.scrap;

public class FeaturedStats {
	
	
	//1 : quick, 2:competive
	int type;
	
	private String statsName;
	private String statsValue;
	
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getStatsName() {
		return statsName;
	}
	public void setStatsName(String statsName) {
		this.statsName = statsName;
	}
	public String getStatsValue() {
		return statsValue;
	}
	public void setStatsValue(String statsValue) {
		this.statsValue = statsValue;
	}
	
	
}
