package kr.co.overscore.controller;

import java.util.ArrayList;
import java.util.List;

import kr.co.overscore.model.MainTopHeroesModel;
import kr.co.overscore.service.Top100Service;
import kr.co.overscore.util.OverscoreUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class Top100Controller {
	@Autowired
	Top100Service service;
	
	@RequestMapping(value = "/top100", method = RequestMethod.GET)
	public String index(Model model
			, @RequestParam(value="typeId", required=false, defaultValue="1") int typeId
			, @RequestParam(value="server", required=false, defaultValue="pc") String server
			, @RequestParam(value="order", required=false, defaultValue="vrank") String order
			, @RequestParam(value="heroesId", required=false, defaultValue="2") int heroesId) {
		List<MainTopHeroesModel> mainTop = new ArrayList<MainTopHeroesModel>();
		if(order.equals("vrank"))
			mainTop = service.getTop100Heroes(server, typeId, heroesId);
		else 
			mainTop = service.getTop100HeroesOrder(server, typeId, order, heroesId);
		
		
		for(MainTopHeroesModel main : mainTop){
			main.setTierNumber(OverscoreUtil.getRankToTierNumber(main.getRank()));
		}

		model.addAttribute("Top100", mainTop);
		model.addAttribute("Server", server);
		model.addAttribute("TypeId", typeId);
		model.addAttribute("Order", order);
		model.addAttribute("HeroesId", heroesId);
		return "top100";
	}
}
