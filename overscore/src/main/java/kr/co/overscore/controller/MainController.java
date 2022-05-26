package kr.co.overscore.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.overscore.model.AllModel;
import kr.co.overscore.model.MetaModel;
import kr.co.overscore.model.NoticeModel;
import kr.co.overscore.service.CacheService;
import kr.co.overscore.service.MainService;

@Controller
public class MainController {
	
	@Autowired
	MainService service;
	
	@Autowired
	CacheService cacheService;
	
	@RequestMapping(value = "/meta", method = RequestMethod.GET)
	public @ResponseBody MetaModel getMeta(HttpServletResponse response) {
		return cacheService.getMeta();
	}
	
/*	@RequestMapping(value = "/main/getApiList", method = RequestMethod.GET)
	public @ResponseBody List<AllModel> getApiList(HttpServletResponse response, String battleTag) {
		try {
			battleTag = new String(battleTag.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		List<AllModel> listAllModel = new ArrayList<AllModel>();
		try {
			listAllModel = service.getApiList(battleTag, cacheService);
			for(AllModel allModel : listAllModel){
				service.upsertAllModel(allModel);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listAllModel;
	}
	*/
	/*@RequestMapping(value = "/main/getApi", method = RequestMethod.GET)
	public @ResponseBody List<AllModel> getApi(HttpServletResponse response, String battleTag) {
		try {
			battleTag = new String(battleTag.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		List<AllModel> listAllModel = new ArrayList<AllModel>();
		try {
			listAllModel = service.getApi(battleTag, cacheService);
			for(AllModel allModel : listAllModel){
				service.upsertAllModel(allModel);
			}
			return listAllModel;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listAllModel;
	}*/
	
	@RequestMapping(value = "/main/notice", method = RequestMethod.POST)
	public @ResponseBody List<NoticeModel> getNoticeList(HttpServletResponse response) {
		return service.getNoticeList();
	}
	
	
	@RequestMapping(value = "/main/notice/recent", method = RequestMethod.POST)
	public @ResponseBody List<NoticeModel> getNoticeRecent(HttpServletResponse response, int recentDay) {
		List<NoticeModel> listNotice = service.getNoticeRecent(recentDay); 
		return listNotice;
	}
	
	@RequestMapping(value = "/error", method = RequestMethod.POST)
	public @ResponseBody void putErrorList(HttpServletResponse response, String url) {
		service.putErrorList(url);
	}
}