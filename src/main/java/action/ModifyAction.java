/**
 * 
 * �����ܣ�����id �����Ѿ��޸ĵİ칫��Ʒ
 *���ߣ�������
 */
package action;

import dao.ArticleDAO;
import entity.Article;

public class ModifyAction {
	private Article article;
	private ArticleDAO articleDao;
	

	public void setArticleDao(ArticleDAO articleDao) {
		this.articleDao = articleDao;
	}

	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}
	public String execute(){
		
		try {
			System.out.println(article.getId());
			articleDao.update(article);
//			System.out.println(article);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
}
