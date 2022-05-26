package kr.co.overscore.model;

public class MostpickModel {
	int userId;
	int typeId;
	int heroesId;
	String heroesName;
	String heroesEng;
	String heroesKor;
	String heroesImg;
	int rank;

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getTypeId() {
		return typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	public int getHeroesId() {
		return heroesId;
	}

	public void setHeroesId(int heroesId) {
		this.heroesId = heroesId;
	}

	public String getHeroesName() {
		return heroesName;
	}

	public void setHeroesName(String heroesName) {
		this.heroesName = heroesName;
	}

	public String getHeroesEng() {
		return heroesEng;
	}

	public void setHeroesEng(String heroesEng) {
		this.heroesEng = heroesEng;
	}

	public String getHeroesKor() {
		return heroesKor;
	}

	public void setHeroesKor(String heroesKor) {
		this.heroesKor = heroesKor;
	}

	public String getHeroesImg() {
		return heroesImg;
	}

	public void setHeroesImg(String heroesImg) {
		this.heroesImg = heroesImg;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

}
