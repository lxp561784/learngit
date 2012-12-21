/**
 * ArticleDAO½Ó¿Ú
 * 
 * 
 */
package dao;

import java.util.List;
import java.util.Set;

import entity.Article;

public interface ArticleDAO {
	public List<Article> findAll()throws Exception;
	public Article findById(int id)throws Exception;
	public void save(Article article)throws Exception;
	public void delete(int id)throws Exception;
	public void update(Article article)throws Exception;
	public boolean getArticle(int id,int amount)throws Exception;
	public Set<Article> findUserArticle(int userId)throws Exception;
}
