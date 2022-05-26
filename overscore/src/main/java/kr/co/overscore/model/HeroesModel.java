package kr.co.overscore.model;

public class HeroesModel implements IMetaModel {
	String heroesId;
	String heroesName;
	String heroesType;
	String heroesEng;
	String heroesKor;
	String heroesImg;

	public String getHeroesId() {
		return heroesId;
	}

	public void setHeroesId(String heroesId) {
		this.heroesId = heroesId;
	}

	public String getHeroesName() {
		return heroesName;
	}

	public void setHeroesName(String heroesName) {
		this.heroesName = heroesName;
	}

	public String getHeroesType() {
		return heroesType;
	}

	public void setHeroesType(String heroesType) {
		this.heroesType = heroesType;
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

	@Override
	public String getMetaId() {
		return getHeroesId();
	}

	@Override
	public String getMetaKey() {
		return getHeroesName();
	}
}
