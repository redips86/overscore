package kr.co.overscore.model;

public class GameTypeModel implements IMetaModel{
	String typeId;
	String typeName;
	String typeEng;
	String typeKor;

	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}

	public String getTypeEng() {
		return typeEng;
	}

	public void setTypeEng(String typeEng) {
		this.typeEng = typeEng;
	}

	public String getTypeKor() {
		return typeKor;
	}

	public void setTypeKor(String typeKor) {
		this.typeKor = typeKor;
	}

	@Override
	public String getMetaId() {
		return getTypeId();
	}

	@Override
	public String getMetaKey() {
		return getTypeEng();
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

}
