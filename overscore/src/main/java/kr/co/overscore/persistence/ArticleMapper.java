package kr.co.overscore.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.overscore.model.ArticleModel;

public interface ArticleMapper {
	public List<ArticleModel> getArticleList();
	public ArticleModel getArticle(@Param("articleId") String articleId);
}
