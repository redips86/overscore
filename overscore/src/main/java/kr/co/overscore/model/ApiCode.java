package kr.co.overscore.model;

public enum ApiCode {
	//EBAY(1), ALI(2), RAKUTEN(3), QOO10_SG(4), QOO10_JPN(5), LAZADA_SG(6), LAZADA_MY(7);
	API_1(1), API_2(2);

	private int value;

	ApiCode(int value) {
		this.value = value;
	}
	 
	public int getValue(){
		return value;
	}
}