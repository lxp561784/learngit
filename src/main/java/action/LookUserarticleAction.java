/**
 * �����ܣ�ͨ��userId ���ҵ�ǰ�û���ȡ�İ칫��Ʒ
 * ���ߣ�������
 * 
 */
package action;

import java.util.Set;

import dao.ArticleDAO;
import entity.Article;

public class LookUserarticleAction {
	private int userId;
	private Set<Article> list;
	public Set<Article> getList() {
		return list;
	}
	public void setList(Set<Article> list) {
		this.list = list;
	}


	private ArticleDAO articleDao;
	public void setArticleDao(ArticleDAO articleDao) {
		this.articleDao = articleDao;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	
	public String execute(){
		
		try {
			list=articleDao.findUserArticle(userId);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
}
