package kr.co.overscore.model;

public class StatModel implements IMetaModel {
	String statId;
	String statEng;
	String statKor;

	public String getStatId() {
		return statId;
	}

	public void setStatId(String statId) {
		this.statId = statId;
	}

	public String getStatEng() {
		return statEng;
	}

	public void setStatEng(String statEng) {
		this.statEng = statEng;
	}

	public String getStatKor() {
		return statKor;
	}

	public void setStatKor(String statKor) {
		this.statKor = statKor;
	}

	@Override
	public String getMetaId() {
		return getStatId();
	}

	@Override
	public String getMetaKey() {
		return getStatEng();
	}

}
