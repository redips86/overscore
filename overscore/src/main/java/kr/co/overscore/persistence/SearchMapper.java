package kr.co.overscore.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.overscore.model.AchvModel;
import kr.co.overscore.model.MostHeroesModel;
import kr.co.overscore.model.SearchModel;
import kr.co.overscore.model.UserModel;

public interface SearchMapper {
	
	
	public List<MostHeroesModel> getMostHeroesList(@Param("userId") String userId,@Param("typeId") String typeId);
	
	//public List<SearchModel> selectSearchList(HashMap<String, String> map);

	public List<AchvModel> selectComplexTest();

	public UserModel selectUserInfo(@Param("userName") String userName, @Param("userTag") String userTag);

	public UserModel selectUserBattleTag(@Param("userId") int userId);

	public List<UserModel> selectUserBulk(@Param("start") int start, @Param("end") int end);

	public List<SearchModel> selectSearchList(@Param("userName") String userName, @Param("userId") List<Integer> userId, @Param("searchType") int searchType);

}
