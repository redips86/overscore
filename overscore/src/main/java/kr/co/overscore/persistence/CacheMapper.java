package kr.co.overscore.persistence;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.overscore.model.AchvDetailModel;
import kr.co.overscore.model.AchvModel;
import kr.co.overscore.model.GameTypeModel;
import kr.co.overscore.model.HeroesModel;
import kr.co.overscore.model.HeroesStatModel;
import kr.co.overscore.model.ImageModel;
import kr.co.overscore.model.StatGroupModel;
import kr.co.overscore.model.StatModel;
import kr.co.overscore.model.UserModel;

public interface CacheMapper {
	
	List<AchvModel> selectAchv();
	
	public List<AchvDetailModel> selectAchvDetail(@Param("achvId") String achvId);
	
	List<HeroesModel> selectHeroes();

	List<StatModel> selectStat();
	
	public List<StatGroupModel> selectStatGroup();
	
	public List<GameTypeModel> selectGameType();

	List<ImageModel> selectImage();

	List<UserModel> selectBot();
	
	void insertAchv(@Param("achvName") String achvName, @Param("achvEng") String achvEng, @Param("achvKor") String achvKor);
	
	void insertAchvDetail(@Param("achvId") String achvId, @Param("achvDetailName") String achvDetailName, @Param("achvDetailEng") String achvDetailEng, @Param("achvDetailKor") String achvDetailKor);
	
	void insertGameType(@Param("typeName") String typeName,@Param("typeEng") String typeEng,@Param("typeKor") String typeKor);
	
	void insertStatGroup(@Param("name") String name,@Param("eng") String eng,@Param("kor") String kor);
	
	StatModel insertStat(HashMap<String, String> params);

	HeroesModel insertHeroes(HashMap<String, String> params);
	
	List<HeroesStatModel> selectHeroesStat();
}