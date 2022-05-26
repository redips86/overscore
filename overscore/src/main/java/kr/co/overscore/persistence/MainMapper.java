package kr.co.overscore.persistence;

import java.util.HashMap;
import java.util.List;

import kr.co.overscore.model.AllModel;
import kr.co.overscore.model.MainTopModel;
import kr.co.overscore.model.NoticeModel;
import kr.co.overscore.model.PriorWListModel;
import kr.co.overscore.model.ScoreCardModel;
import kr.co.overscore.model.UserModel;

import org.apache.ibatis.annotations.Param;

public interface MainMapper {
	
	public void upsertAllModel(HashMap<String, String> map);
	
	public List<AllModel> selectApiList(@Param("battleTag") String battleTag);

	public void upsertApiList(List<AllModel> dataList);

	public List<MainTopModel> selectMainTopHeroes();

	public UserModel upsertUser(HashMap<String, Object> map);

	public void insertUserStat(HashMap<String, Object> map);
	
	public void insertUserHeroes(HashMap<String, Object> map);
	
	public List<NoticeModel> getNoticeList();
	
	public NoticeModel getNotice(int noticeId);
	
	public List<NoticeModel> getNoticeRecent(int recentDay);

	public int insertPriorWList(PriorWListModel data);

	public PriorWListModel selectPriorWList(long syncId);

	public void insertErrorList(String url);

	public List<Integer> selectRecentSearch();

	public List<ScoreCardModel> selectSSPlayer();
}