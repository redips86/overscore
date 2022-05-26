package kr.co.overscore;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

import kr.co.overscore.model.MainTopHeroesModel;
import kr.co.overscore.model.MainTopModel;
import kr.co.overscore.model.MostHeroesModel;
import kr.co.overscore.model.ScoreCardModel;
import kr.co.overscore.model.SearchModel;
import kr.co.overscore.service.MainService;
import kr.co.overscore.service.SearchService;
import kr.co.overscore.util.OverscoreUtil;
import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	MainService service;
	
	@Autowired
	SearchService searchService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return index(locale, model);
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		List<MainTopModel> mainTop = service.getMainTopHeroes();
		for(MainTopModel main : mainTop){
			List<MainTopHeroesModel> subTop = main.getMainTopHeroesModel();
			for(MainTopHeroesModel sub : subTop){
				sub.setTierNumber(OverscoreUtil.getRankToTierNumber(sub.getRank()));
			}
		}

		List<MainTopModel> attackTop = new ArrayList<MainTopModel>();
		List<MainTopModel> defenseTop = new ArrayList<MainTopModel>();
		List<MainTopModel> tankTop = new ArrayList<MainTopModel>();
		List<MainTopModel> supportTop = new ArrayList<MainTopModel>();
		
		for(MainTopModel data : mainTop){
			if(data.getHeroesType().equals("attack"))
				attackTop.add(data);
			if(data.getHeroesType().equals("defense"))
				defenseTop.add(data);
			if(data.getHeroesType().equals("tank"))
				tankTop.add(data);
			if(data.getHeroesType().equals("support"))
				supportTop.add(data);
		}
		
		Collections.shuffle(attackTop);
		Collections.shuffle(defenseTop);
		Collections.shuffle(tankTop);
		Collections.shuffle(supportTop);
		
		model.addAttribute("AttackTop", attackTop);
		model.addAttribute("DefenseTop", defenseTop);
		model.addAttribute("TankTop", tankTop);
		model.addAttribute("SupportTop", supportTop);
		
		List<Integer> userId = service.getRecentSearch();
		List<SearchModel> searchList = searchService.getSearchList("", userId, 2);
		List<SearchModel> lastList = new ArrayList<SearchModel>();
		
		for(int id : userId){
			for(int i=0; i<searchList.size(); i++){
				if(searchList.get(i).getUserId() == id){
					lastList.add(searchList.get(i));
					break;
				}
			}
		}

		model.addAttribute("RecentList", JSONArray.fromObject(lastList));
		
		List<ScoreCardModel> ssUserId = service.getSSPlayer();
		userId = new ArrayList<Integer>();
		for(ScoreCardModel id : ssUserId){
			userId.add(id.getUserId());
		}
		searchList = searchService.getSearchList("", userId, 2);
		lastList = new ArrayList<SearchModel>();
		
		for(ScoreCardModel id : ssUserId){
			for(int i=0; i<searchList.size(); i++){
				if(searchList.get(i).getUserId() == id.getUserId()){
					List<MostHeroesModel> mostHeroesList = new ArrayList<MostHeroesModel>();
					MostHeroesModel mostHeroesModel = new MostHeroesModel();
					mostHeroesModel.setHeroesId(String.valueOf(id.getHeroesId()));
					mostHeroesModel.setHeroesImg(id.getHeroesImg());
					mostHeroesList.add(mostHeroesModel);
					
					searchList.get(i).setMostHeroes(mostHeroesList);
					lastList.add(searchList.get(i));
					break;
				}
			}
		}

		model.addAttribute("SSList", JSONArray.fromObject(lastList));

		
		return "index";
	}
	
	@RequestMapping(value = "/heroes", method = RequestMethod.GET)
	public String heroes(Locale locale, Model model) {
		return "heroes";
	}
	
	@RequestMapping(value = "/ladder", method = RequestMethod.GET)
	public String ladder(Locale locale, Model model) {
		return "ladder";
	}
	
	@RequestMapping(value = "/video", method = RequestMethod.GET)
	public String video(Locale locale, Model model) {
		return "video";
	}
	
	@RequestMapping(value = "/news", method = RequestMethod.GET)
	public String news(Locale locale, Model model) {
		return "news";
	}
	
	@RequestMapping(value = "/report", method = RequestMethod.GET)
	public String report(Locale locale, Model model) {
		return "report";
	}
	
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String about(Locale locale, Model model) {
		return "about";
	}
	
	@RequestMapping(value = "/feedback", method = RequestMethod.GET)
	public String feedback(Locale locale, Model model) {
		return "feedback";
	}
	
	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public String faq(Locale locale, Model model) {
		return "faq";
	}
	
/*	@RequestMapping(value = "/skin-config", method = RequestMethod.GET)
	public String skinConfig(Locale locale, Model model) {
		return "skin-config";
	}*/
	
	@RequestMapping(value = "/naver44cd88a733bf66faf4338723b5e26992.html", method = RequestMethod.GET)
	public String naverHtml(Model model) {
		return "naver44cd88a733bf66faf4338723b5e26992";
	}
	
	@RequestMapping(value = "/google1bfc77f403c85a35.html", method = RequestMethod.GET)
	public String googleHtml(Model model) {
		return "google1bfc77f403c85a35";
	}
	
	@RequestMapping(value = "/robots.txt", method = RequestMethod.GET)
	public String robots(Model model) {
		return "robots";
	}
	
}
