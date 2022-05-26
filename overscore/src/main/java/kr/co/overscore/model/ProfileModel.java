package kr.co.overscore.model;

public class ProfileModel {
	int userId;
	int oppositeId;
	int typeId;
	String typeKor;
	String typeEng;
	int heroesId;
	String heroesName;
	String heroesKor;
	String heroesEng;
	String heroesImg;
	int groupId;
	String groupKor;
	String groupEng;
	int statId;
	String statKor;
	String statEng;
	String valueType;
	String valueTypeEng;
	String valueTypeKor;
	float value;
	float oppositeValue;
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getOppositeId() {
		return oppositeId;
	}
	public void setOppositeId(int oppositeId) {
		this.oppositeId = oppositeId;
	}
	public int getTypeId() {
		return typeId;
	}
	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}
	public String getTypeKor() {
		return typeKor;
	}
	public void setTypeKor(String typeKor) {
		this.typeKor = typeKor;
	}
	public String getTypeEng() {
		return typeEng;
	}
	public void setTypeEng(String typeEng) {
		this.typeEng = typeEng;
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
	public String getHeroesKor() {
		return heroesKor;
	}
	public void setHeroesKor(String heroesKor) {
		this.heroesKor = heroesKor;
	}
	public String getHeroesEng() {
		return heroesEng;
	}
	public void setHeroesEng(String heroesEng) {
		this.heroesEng = heroesEng;
	}
	public String getHeroesImg() {
		return heroesImg;
	}
	public void setHeroesImg(String heroesImg) {
		this.heroesImg = heroesImg;
	}
	public int getGroupId() {
		return groupId;
	}
	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}
	public String getGroupKor() {
		return groupKor;
	}
	public void setGroupKor(String groupKor) {
		this.groupKor = groupKor;
	}
	public String getGroupEng() {
		return groupEng;
	}
	public void setGroupEng(String groupEng) {
		this.groupEng = groupEng;
	}
	public int getStatId() {
		return statId;
	}
	public void setStatId(int statId) {
		this.statId = statId;
	}
	public String getStatKor() {
		return statKor;
	}
	public void setStatKor(String statKor) {
		this.statKor = statKor;
	}
	public String getStatEng() {
		return statEng;
	}
	public void setStatEng(String statEng) {
		this.statEng = statEng;
	}
	public String getValueType() {
		return valueType;
	}
	public void setValueType(String valueType) {
		this.valueType = valueType;
	}
	public String getValueTypeEng() {
		return valueTypeEng;
	}
	public void setValueTypeEng(String valueTypeEng) {
		this.valueTypeEng = valueTypeEng;
	}
	public String getValueTypeKor() {
		return valueTypeKor;
	}
	public void setValueTypeKor(String valueTypeKor) {
		this.valueTypeKor = valueTypeKor;
	}
	public float getValue() {
		return value;
	}
	public void setValue(float value) {
		this.value = value;
	}
	public float getOppositeValue() {
		return oppositeValue;
	}
	public void setOppositeValue(float oppositeValue) {
		this.oppositeValue = oppositeValue;
	}
	
	public String getValueKor(){
		return convertValue(getValue(),getValueTypeKor());
	}
	public String getValueEng(){
		return convertValue(getValue(),getValueTypeEng());
	}
	
	public String getOppositeValueKor(){
		return convertValue(getOppositeValue(),getValueTypeKor());
	}
	public String getOppositeValueEng(){
		return convertValue(getOppositeValue(),getValueTypeEng());
	}
	
	private String convertValue(float value, String type){
		if("NONE".equals(getValueType())){
			return removeZeroDecimalPoint(value) + type; 
		}
		else if("PERSON".equals(getValueType())){
			return removeZeroDecimalPoint(value) + type;
		}
		else if("PERCENT".equals(getValueType())){
			return String.valueOf(removeZeroDecimalPoint(value * 100)) + type;
		}
		else if("HOUR".equals(getValueType())){
			int iHour = (int)Math.floor(value);
			float fMinute = (value - (float)iHour) * 60;
			int iMinute = (int)Math.floor(fMinute);
			int iSecond = (int)Math.floor((fMinute - (float)iMinute) * 60);
			
			String[] splType = type.split(" ");
			type = "";
			if(iHour != 0){
				type += splType[0] + " ";
			}
			if(iMinute != 0){
				type += splType[1] + " ";
			}
			type += splType[2];
			
			return type.replaceAll("!:0", String.valueOf(iHour)).replaceAll("!:1", String.valueOf(iMinute)).replaceAll("!:2", String.valueOf(iSecond));
		}
		else if("EA".equals(getValueType())){
			return removeZeroDecimalPoint(value)+type;
		}
		else if("TIMES".equals(getValueType())){
			return removeZeroDecimalPoint(value)+type;
		}
		else{
			return removeZeroDecimalPoint(value)+type;
		}
	}
	
	private String removeZeroDecimalPoint(float value){
		if(value % 1.f < 0.001){
			return String.valueOf(Math.round(value));
		}
		return String.valueOf(value);
	}
}
