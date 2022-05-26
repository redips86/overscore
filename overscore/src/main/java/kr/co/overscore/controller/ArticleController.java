package kr.co.overscore.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.overscore.model.ArticleModel;
import kr.co.overscore.service.ArticleService;

@Controller
public class ArticleController {
	
	@Autowired
	ArticleService articleService;
	
	// TEST
	@RequestMapping(value = "/article", method = RequestMethod.GET)
	public String article(Model model) {
		model.addAttribute("Article", articleService.getArticleList());
		return "article";
	}
	
	@RequestMapping(value = "/article/{id}", method = RequestMethod.GET)
	public String article(Model model, @PathVariable("id") String id) {
		
		List<ArticleModel> listArticle = new ArrayList<ArticleModel>();
		
		if("".equals(id)){
			listArticle = articleService.getArticleList();
		}
		else{
			listArticle.add(articleService.getArticle(id));
		}
		
		model.addAttribute("Article", listArticle);
		
		return "article";
	}
	
	@RequestMapping(value = "/article/write", method = RequestMethod.GET)
	public String articleWrite() {
		return "articleWrite";
	}
	
	
}