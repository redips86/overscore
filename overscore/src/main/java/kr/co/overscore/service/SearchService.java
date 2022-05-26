package kr.co.overscore.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.overscore.model.AchvModel;
import kr.co.overscore.model.MostHeroesModel;
import kr.co.overscore.model.SearchModel;
import kr.co.overscore.model.UserModel;
import kr.co.overscore.persistence.SearchMapper;

@Service
public class SearchService {
	
	@Autowired
	SearchMapper searchMapper;
	
	public List<SearchModel> getSearchList(String userName, int searchType){
		return getSearchList(userName, null, searchType);
	}
	
	public List<SearchModel> getSearchList(String userName, List<Integer> userId, int searchType){
		List<SearchModel> dataList = searchMapper.selectSearchList(userName, userId, searchType);
		
		for(SearchModel sm : dataList){
			String type = "1";
			if(sm.getCompRank() == -1)
				type = "2";
			sm.setMostHeroes(searchMapper.getMostHeroesList(String.valueOf(sm.getUserId()), type));
		}
		
		return dataList;
	}

	public List<AchvModel> getComplexTest() {
		List<AchvModel> dataList = searchMapper.selectComplexTest();
		return dataList;
	}
	
	public UserModel getUserInfo(String userName, String userTag) {
		return searchMapper.selectUserInfo(userName, userTag);
	}

	public UserModel getUserBattleTag(int userId) {
		return searchMapper.selectUserBattleTag(userId);
	}

	public List<UserModel> getUserBulk(int start, int end) {
		return searchMapper.selectUserBulk(start, end);
	}
}
