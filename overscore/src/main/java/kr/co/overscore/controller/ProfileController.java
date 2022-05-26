package kr.co.overscore.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import kr.co.overscore.model.ImageModel;
import kr.co.overscore.model.MostpickModel;
import kr.co.overscore.model.ProfileModel;
import kr.co.overscore.model.ScoreCardModel;
import kr.co.overscore.model.SummaryModel;
import kr.co.overscore.model.UserHeroesModel;
import kr.co.overscore.model.UserModel;
import kr.co.overscore.model.UserStatHistoryModel;
import kr.co.overscore.model.UserStatModel;
import kr.co.overscore.service.CacheService;
import kr.co.overscore.service.ProfileService;
import kr.co.overscore.util.OverscoreUtil;
import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ProfileController {
	
	@Autowired
	CacheService cacheService;
	
	@Autowired
	ProfileService service;
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile(Model model,
			@RequestParam("userId") int userId,
			@RequestParam(value="syncId", required=false, defaultValue="0") long syncId,
			@RequestParam(value="oppositeId", required=false, defaultValue="0") int oppositeId, 
			@RequestParam(value="heroesId", required=false, defaultValue="0") int heroesId,
			@RequestParam(value="expand", required=false, defaultValue="0") int expand,
			@RequestParam(value="typeId", required=false, defaultValue="0") int typeId,
			@RequestParam(value="error", required=false) String error) {
		
		model.addAttribute("syncId", syncId);
		model.addAttribute("expand", expand);
		
		SummaryModel summary = service.getProfileSummary(userId);
		if(summary.getTypeId() == 1)
			setTierImage(cacheService.getImage(), summary);
		if(typeId == 0){
			if(summary.getComprank() > 0){
				typeId = 1;
			}
			else
				typeId = 2;
		}

		// fakeid through tier
		List<UserModel> botList = cacheService.getBot();
		if(oppositeId == 0){
			String botTag = OverscoreUtil.getBotTag(summary.getServer(), summary.getComprank());
			for(UserModel bot : botList){
				if(bot.getUserTag().equals(botTag))
					oppositeId = bot.getUserId();
			}
		}
		
		List<UserModel> botListFinal = new ArrayList<UserModel>();
		for(UserModel bot : botList){
			if(summary.getServer().equals(bot.getServer()))
				botListFinal.add(bot);
		}
		model.addAttribute("Bot", botListFinal);

		SummaryModel oppositeSummary = service.getProfileSummary(oppositeId);
		if(oppositeSummary.getTypeId() == 1)
			setTierImage(cacheService.getImage(), oppositeSummary);
		
		// if heroesId is zero, gotta get most hero id
		if(heroesId == 0){
			List<MostpickModel> mostpick = service.getProfileMostpick(userId, typeId);
			heroesId = mostpick.get(0).getHeroesId();
		}
		model.addAttribute("TypeId", typeId);
		model.addAttribute("MySummary", summary);
		model.addAttribute("OppositeSummary", oppositeSummary);
		
		List<ScoreCardModel> scoreCardList = service.getProfileScoreCard(userId, oppositeId, typeId, heroesId);
		ScoreCardModel myScoreCard = new ScoreCardModel();
		ScoreCardModel oppositeScoreCard = new ScoreCardModel();
		for(ScoreCardModel data : scoreCardList){
			if(data.getUserId() == userId)
				myScoreCard = data;
			if(data.getUserId() == oppositeId)
				oppositeScoreCard = data;
		}
		model.addAttribute("MyScoreCard", myScoreCard);
		model.addAttribute("OppositeScoreCard", oppositeScoreCard);
		
		List<UserHeroesModel> userHeroesList = service.getProfileHeroes(userId, oppositeId, typeId, heroesId);
		UserHeroesModel myHeroes = new UserHeroesModel();
		UserHeroesModel oppositeHeroes = new UserHeroesModel();
		for(UserHeroesModel data : userHeroesList){
			if(data.getUserId() == userId)
				myHeroes = data;
			if(data.getUserId() == oppositeId)
				oppositeHeroes = data;
		}
				
		model.addAttribute("MyHeroes", myHeroes);
		model.addAttribute("OppositeHeroes", oppositeHeroes);
		
		
		List<UserStatModel> userStatList = service.getProfileStat(userId, oppositeId, typeId);
		UserStatModel myStat = new UserStatModel();
		UserStatModel oppositeStat = new UserStatModel();
		for(UserStatModel data : userStatList){
			if(data.getUserId() == userId)
				myStat = data;
			if(data.getUserId() == oppositeId)
				oppositeStat = data;
		}
		
		List<UserStatHistoryModel> userStatHistoryList = service.getProfileStatHistory(userId, typeId);
		
		model.addAttribute("HistoryStat", JSONArray.fromObject(userStatHistoryList));
	
		model.addAttribute("MyStat", myStat);
		model.addAttribute("OppositeStat", oppositeStat);
		model.addAttribute("error", (error == null) ? "" : error);
		return "profile";
	}
	
	public void setTierImage(List<ImageModel> dataList, SummaryModel summary){
		for(ImageModel im : dataList){
			if(im.getImageName().equals(OverscoreUtil.getRankToTier(summary.getComprank()))){
				summary.setTierImage(im.getImageValue());
				break;
			}
		}
	}
	
	
	
	@RequestMapping(value = "/profile/heroes", method = RequestMethod.POST)
	public @ResponseBody List<UserHeroesModel> getProfileHeroes(HttpServletResponse response, int userId,
			int oppositeId, int typeId, int heroesId) {
		return service.getProfileHeroes(userId, oppositeId, typeId, heroesId);
	}
	
	@RequestMapping(value = "/profile/scorecard", method = RequestMethod.POST)
	public @ResponseBody List<ScoreCardModel> getProfileScoreCard(HttpServletResponse response, int userId,
			int oppositeId, int typeId, int heroesId) {
		return service.getProfileScoreCard(userId, oppositeId, typeId, heroesId);
	}
}