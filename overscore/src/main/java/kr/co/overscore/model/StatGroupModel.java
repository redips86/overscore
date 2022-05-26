package kr.co.overscore.model;

public class StatGroupModel implements IMetaModel{
	String groupId;
	String groupEng;
	String groupKor;

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getGroupEng() {
		return groupEng;
	}

	public void setGroupEng(String groupEng) {
		this.groupEng = groupEng;
	}

	public String getGroupKor() {
		return groupKor;
	}

	public void setGroupKor(String groupKor) {
		this.groupKor = groupKor;
	}

	@Override
	public String getMetaId() {
		return getGroupId();
	}

	@Override
	public String getMetaKey() {
		return getGroupEng();
	}

}
