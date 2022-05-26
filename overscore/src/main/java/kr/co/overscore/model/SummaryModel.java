package kr.co.overscore.model;

public class SummaryModel {
	int userId;
	int typeId;
	String userName;
	String server;
	String rankImage;
	String avatar;
	String tier;
	String tierImage;
	int comprank;
	int games;
	int level;
	int wins;
	int losses;
	int ties;
	int winRate;
	int quickWins;
	String isFake;
	String latestUpdate;

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

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getServer() {
		return server;
	}

	public void setServer(String server) {
		this.server = server;
	}

	public String getRankImage() {
		return rankImage;
	}

	public void setRankImage(String rankImage) {
		this.rankImage = rankImage;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getTier() {
		return tier;
	}

	public void setTier(String tier) {
		this.tier = tier;
	}

	public String getTierImage() {
		return tierImage;
	}

	public void setTierImage(String tierImage) {
		this.tierImage = tierImage;
	}

	public int getComprank() {
		return comprank;
	}

	public void setComprank(int comprank) {
		this.comprank = comprank;
	}

	public int getGames() {
		return games;
	}

	public void setGames(int games) {
		this.games = games;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getWins() {
		return wins;
	}

	public void setWins(int wins) {
		this.wins = wins;
	}

	public int getLosses() {
		return losses;
	}

	public void setLosses(int losses) {
		this.losses = losses;
	}

	public int getTies() {
		return ties;
	}

	public void setTies(int ties) {
		this.ties = ties;
	}

	public int getWinRate() {
		return winRate;
	}

	public void setWinRate(int winRate) {
		this.winRate = winRate;
	}

	public int getQuickWins() {
		return quickWins;
	}

	public void setQuickWins(int quickWins) {
		this.quickWins = quickWins;
	}

	public String getIsFake() {
		return isFake;
	}

	public void setIsFake(String isFake) {
		this.isFake = isFake;
	}

	public String getLatestUpdate() {
		return latestUpdate;
	}

	public void setLatestUpdate(String latestUpdate) {
		this.latestUpdate = latestUpdate;
	}

}
