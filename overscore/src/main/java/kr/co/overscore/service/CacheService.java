package kr.co.overscore.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import kr.co.overscore.model.AchvModel;
import kr.co.overscore.model.GameTypeModel;
import kr.co.overscore.model.HeroesModel;
import kr.co.overscore.model.HeroesStatModel;
import kr.co.overscore.model.ImageModel;
import kr.co.overscore.model.MetaModel;
import kr.co.overscore.model.StatModel;
import kr.co.overscore.model.UserModel;
import kr.co.overscore.persistence.CacheMapper;

@Service
public class CacheService {
	
	@Autowired
	CacheMapper cacheMapper;
	
	@Cacheable(value="MetaCache")
	public MetaModel getMeta(){
		MetaModel meta = new MetaModel();
		
		List<AchvModel> listAchv = cacheMapper.selectAchv();
		for(AchvModel achv : listAchv){
			achv.setAchvDetail(cacheMapper.selectAchvDetail(achv.getAchvId()));
		}
		
		meta.setAchv(listAchv);
		meta.setHeroes(cacheMapper.selectHeroes());
		meta.setStat(cacheMapper.selectStat());
		meta.setStatGroup(cacheMapper.selectStatGroup());
		meta.setGameType(cacheMapper.selectGameType());
		
		return meta;
	}
	@CacheEvict(value="MetaCache")
	public void removeMeta(){
		
	}
	
	@Cacheable(value="HeroesCache")
	public List<HeroesModel> getHeroes(){
		List<HeroesModel> dataList = cacheMapper.selectHeroes();
		return dataList;
	}

	@CacheEvict(value="HeroesCache")
	public void removeHeroes() {

	}
	
	@Cacheable(value="StatCache")
	public List<StatModel> getStat(){
		List<StatModel> dataList = cacheMapper.selectStat();
		return dataList;
	}
	
	@CacheEvict(value="StatCache")
	public void removeStat() {

	}
	
	@Cacheable(value="AchvCache")
	public List<AchvModel> getAchv(){
		List<AchvModel> dataList = cacheMapper.selectAchv();
		return dataList;
	}

	@CacheEvict(value="AchvCache")
	public void removeAchv() {

	}
		
	@Cacheable(value="ImageCache")
	public List<ImageModel> getImage(){
		List<ImageModel> dataList = cacheMapper.selectImage();
		return dataList;
	}
	
	@Cacheable(value="BotCache")
	public List<UserModel> getBot(){
		List<UserModel> dataList = cacheMapper.selectBot();
		return dataList;
	}
	
	public void insertAchv(String achvName, String achvEng, String achvKor){
		cacheMapper.insertAchv(achvName, achvEng, achvKor);
	}
	
	public void insertAchvDetail(String achvId, String achvDetailName, String achvDetailEng, String achvDetailKor){
		cacheMapper.insertAchvDetail(achvId, achvDetailName, achvDetailEng, achvDetailKor);
	}
	
	public HeroesModel putHeroes(String heroesName){
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("heroesName", heroesName);
		params.put("oprt", "admin");
		return cacheMapper.insertHeroes(params);
	}
	
	public void insertGameType(String typeName, String typeEng, String typeKor){
		cacheMapper.insertGameType(typeName, typeEng, typeKor);
	}
	
	public void insertStatGroup(String name, String eng, String kor){
		cacheMapper.insertStatGroup(name, eng, kor);
	}
	
	public StatModel putStat(String statName){
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("statName", statName);
		params.put("oprt", "admin");
		return cacheMapper.insertStat(params);
	}
	
	@Cacheable(value="GameTypeCache")
	public List<GameTypeModel> getGametype() {
		List<GameTypeModel> dataList = cacheMapper.selectGameType();
		return dataList;
	}
	
	@Cacheable(value="HeroesStatCache")
	public List<HeroesStatModel> getHeroesStat() {
		List<HeroesStatModel> dataList = cacheMapper.selectHeroesStat();
		return dataList;
	}
}
