package kr.co.overscore.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.overscore.model.MostpickModel;
import kr.co.overscore.model.ProfileModel;
import kr.co.overscore.model.ScoreCardModel;
import kr.co.overscore.model.SummaryModel;
import kr.co.overscore.model.UserHeroesModel;
import kr.co.overscore.model.UserStatHistoryModel;
import kr.co.overscore.model.UserStatModel;
import kr.co.overscore.persistence.ProfileMapper;

@Service
public class ProfileService {
	
	@Autowired
	ProfileMapper mapper;
	
	public SummaryModel getProfileSummary(int userId){
		SummaryModel dataList = mapper.selectProfileSummary(userId);
		return dataList;
	}
	
	public List<MostpickModel> getProfileMostpick(int userId, int typeId){
		List<MostpickModel> dataList = mapper.selectProfileMostpick(userId, typeId);
		return dataList;
	}
	
	public List<UserHeroesModel> getProfileHeroes(int userId, int oppositeId, int typeId, int heroesId){
		List<UserHeroesModel> dataList = mapper.selectProfileHeroes(userId, oppositeId, typeId, heroesId);
		return dataList;
	}
	
	public List<UserStatModel> getProfileStat(int userId, int oppositeId, int typeId){
		List<UserStatModel> dataList = mapper.selectProfileStat(userId, oppositeId, typeId);
		return dataList;
	}

	public List<ScoreCardModel> getProfileScoreCard(int userId, int oppositeId, int typeId, int heroesId) {
		List<ScoreCardModel> dataList = mapper.selectProfileScoreCard(userId, oppositeId, typeId, heroesId);
		return dataList;
	}

	public List<UserStatHistoryModel> getProfileStatHistory(int userId, int typeId) {
		List<UserStatHistoryModel> dataList = mapper.selectProfileStatHistory(userId, typeId);
		return dataList;
	}
	
}
