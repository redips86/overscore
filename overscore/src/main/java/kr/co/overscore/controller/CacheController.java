package kr.co.overscore.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.overscore.model.AchvModel;
import kr.co.overscore.model.GameTypeModel;
import kr.co.overscore.model.HeroesModel;
import kr.co.overscore.model.MetaModel;
import kr.co.overscore.model.StatModel;
import kr.co.overscore.service.CacheService;

@Controller
public class CacheController {

	@Autowired
	CacheService service;
	
	@RequestMapping(value = "/cache/getMeta", method = RequestMethod.GET)
	public @ResponseBody MetaModel getMeta(HttpServletResponse response) {
		MetaModel meta = service.getMeta();
		return meta;
	}
	
	@RequestMapping(value = "/cache/getHeroes", method = RequestMethod.GET)
	public @ResponseBody List<HeroesModel> getHeroes(HttpServletResponse response) {
		List<HeroesModel> dataList = service.getHeroes();
		return dataList;
	}
	
	@RequestMapping(value = "/cache/getStat", method = RequestMethod.GET)
	public @ResponseBody List<StatModel> getStat(HttpServletResponse response) {
		List<StatModel> dataList = service.getStat();
		return dataList;
	}
	
	@RequestMapping(value = "/cache/getAchv", method = RequestMethod.GET)
	public @ResponseBody List<AchvModel> getAchv(HttpServletResponse response) {
		List<AchvModel> dataList = service.getAchv();
		return dataList;
	}
	
	@RequestMapping(value = "/cache/getGameType", method = RequestMethod.GET)
	public @ResponseBody List<GameTypeModel> getGametype(HttpServletResponse response) {
		List<GameTypeModel> dataList = service.getGametype();
		return dataList;
	}
	
	@RequestMapping(value = "/cache/removeHeroes", method = RequestMethod.GET)
	public @ResponseBody void removeHeroes(HttpServletResponse response) {
		service.removeHeroes();
	}
	
	@RequestMapping(value = "/cache/removeStat", method = RequestMethod.GET)
	public @ResponseBody void removeStat(HttpServletResponse response) {
		service.removeStat();
	}
	
	@RequestMapping(value = "/cache/removeAchv", method = RequestMethod.GET)
	public @ResponseBody void removeAchv(HttpServletResponse response) {
		service.removeAchv();
	}
}
