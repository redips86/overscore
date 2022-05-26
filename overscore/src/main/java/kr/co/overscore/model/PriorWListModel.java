package kr.co.overscore.model;

public class PriorWListModel {
	long syncId;
	String userName;
	String status;
	int waitCnt;

	public long getSyncId() {
		return syncId;
	}

	public void setSyncId(long syncId) {
		this.syncId = syncId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getWaitCnt() {
		return waitCnt;
	}

	public void setWaitCnt(int waitCnt) {
		this.waitCnt = waitCnt;
	}
}
