package service;

import java.util.ArrayList;
import java.util.List;

import dao.ArticleDAO;
import entity.Article;

public class LoginService {
	private ArticleDAO articleDao;

	public void setArticleDao(ArticleDAO articleDao) {
		this.articleDao = articleDao;
	}
	
	public List<Article> findAll(){
		List<Article> list=new ArrayList<Article>();
		try {
			list=articleDao.findAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
