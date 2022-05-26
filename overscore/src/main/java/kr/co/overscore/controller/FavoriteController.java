package kr.co.overscore.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import kr.co.overscore.model.SearchModel;
import kr.co.overscore.model.UserModel;
import kr.co.overscore.service.SearchService;

@Controller
public class FavoriteController {
	@Autowired
	SearchService service;
	
	@RequestMapping(value = "/favorite", method = RequestMethod.GET)
	public ModelAndView favorite(HttpServletRequest request, Model model) {
		Cookie favoriteCookie = WebUtils.getCookie(request, "favorite");
		
		List<SearchModel> listSearch = new ArrayList<SearchModel>();
		if(favoriteCookie != null){
			String cookie = favoriteCookie.getValue().replaceAll("%2C", ",");
			String[] splitCookie = cookie.split(",");
			
			List<Integer> userId = new ArrayList<Integer>();
			for(String sc : splitCookie)
				userId.add(Integer.parseInt(sc));

			listSearch = service.getSearchList("", userId, 2);
		}
		model.addAttribute("users", listSearch);
		return new ModelAndView("favorite");
	}
}
