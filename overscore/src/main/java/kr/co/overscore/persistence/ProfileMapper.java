
package kr.co.overscore.persistence;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.overscore.model.MostpickModel;
import kr.co.overscore.model.ScoreCardModel;
import kr.co.overscore.model.SummaryModel;
import kr.co.overscore.model.UserHeroesModel;
import kr.co.overscore.model.UserStatHistoryModel;
import kr.co.overscore.model.UserStatModel;

public interface ProfileMapper {
	
	public SummaryModel selectProfileSummary(@Param("userId") int userId);
	
	public List<MostpickModel> selectProfileMostpick(@Param("userId") int userId, @Param("typeId") int typeId);
	
	public List<UserHeroesModel> selectProfileHeroes(@Param("userId") int userId, @Param("oppositeId") int oppositeId, @Param("typeId") int typeId, @Param("heroesId") int heroesId);
	
	public List<UserStatModel> selectProfileStat(@Param("userId") int userId, @Param("oppositeId") int oppositeId, @Param("typeId") int typeId);
	
	public List<ScoreCardModel> selectProfileScoreCard(@Param("userId") int userId, @Param("oppositeId") int oppositeId, @Param("typeId") int typeId, @Param("heroesId") int heroesId);

	public List<UserStatHistoryModel> selectProfileStatHistory(@Param("userId") int userId, @Param("typeId") int typeId);

}
