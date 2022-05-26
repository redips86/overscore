package kr.co.overscore.model;

public class ScoreCardModel {
	int userId;
	int typeId;
	int heroesId;
	int atk;
	int block;
	int heal;
	int hit;
	int carry;
	int skill;
	int vrank;
	int vtier;
	int rank;
	int tier;
	float total;
	
	String heroesImg;
	
	String atkColor;
	String blockColor;
	String healColor;
	String hitColor;
	String carryColor;
	String skillColor;
	String totalColor;
	
	int playtimeOn;
	
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
	public int getAtk() {
		return atk;
	}
	public void setAtk(int atk) {
		this.atk = atk;
	}
	public int getBlock() {
		return block;
	}
	public void setBlock(int block) {
		this.block = block;
	}
	public int getHeal() {
		return heal;
	}
	public void setHeal(int heal) {
		this.heal = heal;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getCarry() {
		return carry;
	}
	public void setCarry(int carry) {
		this.carry = carry;
	}
	public int getSkill() {
		return skill;
	}
	public void setSkill(int skill) {
		this.skill = skill;
	}
	public int getVrank() {
		return vrank;
	}
	public void setVrank(int vrank) {
		this.vrank = vrank;
	}
	public int getVtier() {
		return vtier;
	}
	public void setVtier(int vtier) {
		this.vtier = vtier;
	}
	public String getAtkColor() {
		return getColor(this.atk);
	}
	public String getBlockColor() {
		return getColor(this.block);
	}
	public String getHealColor() {
		return getColor(this.heal);
	}
	public String getHitColor() {
		return getColor(this.hit);
	}
	public String getCarryColor() {
		return getColor(this.carry);
	}
	public String getSkillColor() {
		return getColor(this.skill);
	}
	public String getTotalColor() {
		return getTotalColor(this.total);
	}
	
	
	public String getTotal() {
		double cTotal = Math.ceil(this.total);
		if(cTotal >= 95)
			return "SS";
		else if(cTotal >= 90)
			return "S";
		else if(cTotal >= 75)
			return "A";
		else if(cTotal >= 60)
			return "B";
		else if(cTotal>= 40)
			return "C";
		else if(cTotal >= 20)
			return "D";
		else if(cTotal > 0)
			return "F";
		else
			return "";
	}
	
	
	public void setTotal(float total) {
		this.total = total;
	}
	
	
	private String getColor(int score){
		if(score>=80)
			return "text-danger";
		else if(score>=60)
			return "text-warning";
		else if(score>=40)
			return "text-success";
		else
			return "text-primary";
	}
	
	private String getTotalColor(float total){
		String totalStr = getTotal();
		if(totalStr.equals("SS"))
			return "text-danger font-bold font-italic";
		else if(totalStr.equals("S"))
			return "text-danger font-bold";
		else if(totalStr.equals("A"))
			return "text-warning font-bold";
		else if(this.total >= 50)
			return "text-success font-bold";
		else if(this.total >= 30)
			return "text-primary font-bold";
		else
			return "text-primary";
	}
	public int getPlaytimeOn() {
		return playtimeOn;
	}
	public void setPlaytimeOn(int playtimeOn) {
		this.playtimeOn = playtimeOn;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public int getTier() {
		return tier;
	}
	public void setTier(int tier) {
		this.tier = tier;
	}
	public String getHeroesImg() {
		return heroesImg;
	}
	public void setHeroesImg(String heroesImg) {
		this.heroesImg = heroesImg;
	}

	
	
}
