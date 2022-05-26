package kr.co.overscore.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import org.springframework.web.util.WebUtils;

import kr.co.overscore.model.PriorWListModel;
import kr.co.overscore.model.SearchModel;
import kr.co.overscore.model.UserModel;
import kr.co.overscore.service.CacheService;
import kr.co.overscore.service.MainService;
import kr.co.overscore.service.SearchService;

@Controller
public class SearchController {
	
	@Autowired
	SearchService service;
	
	@Autowired
	MainService mainService;
	
	@Autowired
	CacheService cacheService;
	
	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	
	@RequestMapping(value = "/getSearchList", method = RequestMethod.GET)
	public @ResponseBody List<SearchModel> getSearchList(HttpServletResponse response, String userName) {
		List<SearchModel> dataList = service.getSearchList(userName, 1);
		return dataList;
	}
	
	@RequestMapping(value = "/search/getUserInfo", method = RequestMethod.GET)
	public @ResponseBody UserModel getUserInfo(HttpServletRequest request, Model model, @RequestParam("name") String name) throws UnsupportedEncodingException {
		name = (name.length() > 40) ? name.substring(0, 40) : new String(name.getBytes("ISO-8859-1"),"UTF-8");
		String[] names = name.split("#");
		return service.getUserInfo(names[0], names[1]);
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public ModelAndView search(Model model, @RequestParam("name") String name) throws Exception {
		name = (name.length() > 40) ? name.substring(0, 40) : new String(name.getBytes("ISO-8859-1"),"UTF-8"); 
		String[] names = name.split("#");
		
		// List<SearchModel> listSearch = new ArrayList<SearchModel>();
		
		if(!name.equals("")){
			UserModel user;
			
			// redips#31459,  redips#psn, redips#xbl
			if(names.length == 2){
				user = service.getUserInfo(names[0], names[1]);
				// not found. put it to PriorQueue. and waiting.
				if(user == null){
					long syncId = putUserData(name);
					model.addAttribute("syncId", syncId);	
				}
				// found. redirect to profile page.
				else{
					return new ModelAndView(new RedirectView("/profile?userId=" + user.getUserId()));
				}
			}
			// redips -> page script
			/*else if (names.length == 1){
				listSearch = service.getSearchList(name, 1);
			}*/
		}
		// nope
		model.addAttribute("error", "");
		// model.addAttribute("users", listSearch);
		model.addAttribute("name", name);
		return new ModelAndView("search");		
	}
	
	@RequestMapping(value = "/search/update", method = RequestMethod.GET)
	public ModelAndView update(Model model, @RequestParam("userId") String userId) throws Exception {
		UserModel user = service.getUserBattleTag(Integer.parseInt(userId));
		long syncId = putUserData(user.getUserName());
		model.addAttribute("userId", userId);
		model.addAttribute("syncId", syncId);	
		
		//return new ModelAndView("profile");
		return new ModelAndView(new RedirectView("/profile")); 
	}
	
	// for cache user
	@RequestMapping(value = "/searchWithUpdate", method = RequestMethod.GET)
	public ModelAndView searchWithUpdate(Model model, @RequestParam("userId") String userId) throws Exception {
		UserModel user = service.getUserBattleTag(Integer.parseInt(userId));
		long syncId = putUserData(user.getUserName());
		model.addAttribute("userId", userId);
		model.addAttribute("syncId", syncId);	
		
		//return new ModelAndView("profile");
		return new ModelAndView(new RedirectView("/profile")); 
	}
	
	@RequestMapping(value = "/search/checkUpdate", method = RequestMethod.GET)
	public @ResponseBody PriorWListModel checkUpdate(HttpServletRequest request, Model model, @RequestParam("syncId") long syncId) {
		return  mainService.getPriorWList(syncId);
	}
	
	@RequestMapping(value = "/search/list", method = RequestMethod.GET)
	public @ResponseBody List<SearchModel> list(HttpServletRequest request, Model model, @RequestParam("name") String name) throws UnsupportedEncodingException {
		name = (name.length() > 40) ? name.substring(0, 40) : new String(name.getBytes("ISO-8859-1"),"UTF-8");
		return service.getSearchList(name, 1);
	}

	@RequestMapping(value = "/search/getSearchModal", method = RequestMethod.GET)
	public @ResponseBody List<SearchModel> getSearchModal(HttpServletRequest request, Model model, @RequestParam("name") String name, @RequestParam("difftype") int difftype) throws UnsupportedEncodingException {
		name = (name.length() > 40) ? name.substring(0, 40) : new String(name.getBytes("ISO-8859-1"),"UTF-8"); 
		// String[] names = name.split("#");
		
		if(name.contains("%23")){
			String[] names = name.split("%23");
			name = names[0];
		}
		
		List<SearchModel> dataList = new ArrayList<SearchModel>();
		
		// normal
		if(difftype == 1){
			 dataList = service.getSearchList(name, 1);
		}
		// favorite
		if(difftype ==2){
			Cookie favoriteCookie = WebUtils.getCookie(request, "favorite");
			
			if(favoriteCookie != null){
				String cookie = favoriteCookie.getValue().replaceAll("%2C", ",");
				String[] splitCookie = cookie.split(",");
				
				List<Integer> userId = new ArrayList<Integer>();
				for(String sc : splitCookie)
					userId.add(Integer.parseInt(sc));

				dataList = service.getSearchList("", userId, 2);
			}
		}
			
		return dataList;
	}
	
	private long putUserData(String name) {	
		PriorWListModel data = new PriorWListModel();
		data.setUserName(name);
		
		mainService.putPriorWList(data);
		
		return data.getSyncId();
	}
	
	

}