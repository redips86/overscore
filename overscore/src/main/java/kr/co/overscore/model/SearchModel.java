package kr.co.overscore.model;

import java.util.List;

import kr.co.overscore.util.OverscoreUtil;

public class SearchModel {
	int userId;
	String userName;
	String server;
	String rankImage;
	String avatar;
	String tier;
	int compRank;
	int games;
	int level;
	int losses;
	int ties;
	float winRate;
	int wins;
	float kpd;
	float timePlayed;

	List<MostHeroesModel> mostHeroes;

	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
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
	public void setAvatar(String avater) {
		this.avatar = avater;
	}
	public String getTier() {
		return tier;
	}
	public void setTier(String tier) {
		this.tier = tier;
	}
	public String getTierImage() {
		return OverscoreUtil.getRankToTierNumber(this.compRank);
	}
	public int getCompRank() {
		return compRank;
	}
	public void setCompRank(int compRank) {
		this.compRank = compRank;
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
	public String getLevelColor(){
		if(level < 600){
			return "label-bronze";
		}
		else if(level < 1200){
			return "label-silver";
		}
		else{
			return "label-gold";
		}
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
	public float getWinRate() {
		return winRate;
	}
	public void setWinRate(float winRate) {
		this.winRate = winRate;
	}
	public String getWinRateColor() {
		if(this.winRate < 50.f){
			return "progress-white";
		}
		else if(this.winRate < 55.f) {
			return "progress-green";
		}
		else if(this.winRate < 60.f) {
			return "progress-blue";
		}
		else {
			return "progress-orange";
		}
	}
	public int getWins() {
		return wins;
	}
	public void setWins(int wins) {
		this.wins = wins;
	}
	public float getKpd() {
		return kpd;
	}
	public void setKpd(float kpd) {
		this.kpd = kpd;
	}
	public String getKpdColor() {
		if(this.kpd < 2.0f){
			return "btn-primary";
		}
		else if(this.kpd < 3.5f){
			return "btn-success";
		}
		else if(this.kpd < 5.0f){
			return "btn-warning";
		}
		else{
			return "btn-danger";
		}
	}
	public float getTimePlayed() {
		return timePlayed;
	}
	public void setTimePlayed(float timePlayed) {
		this.timePlayed = timePlayed;
	}
	public String getTimePlayedColor() {
		if(timePlayed < 10.f){
			return "label-white";
		}
		else if(timePlayed < 30.f){
			return "label-green";
		}
		else if(timePlayed < 100.f){
			return "label-blue";
		}
		else {
			return "label-orange";
		}
	}
	public List<MostHeroesModel> getMostHeroes() {
		return mostHeroes;
	}
	public void setMostHeroes(List<MostHeroesModel> mostHeroes) {
		this.mostHeroes = mostHeroes;
	}
}
