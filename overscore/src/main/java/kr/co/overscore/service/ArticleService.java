package kr.co.overscore.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.overscore.model.ArticleModel;
import kr.co.overscore.persistence.ArticleMapper;

@Service
public class ArticleService {
	
	@Autowired
	ArticleMapper articleMapper;
	
	public List<ArticleModel> getArticleList(){
		return articleMapper.getArticleList();
	}
	
	public ArticleModel getArticle(String articleId){
		return articleMapper.getArticle(articleId);
	}
	
}
