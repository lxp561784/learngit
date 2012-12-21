/**
 * 
 * 程序功能：根据id 更新已经修改的办公用品
 *作者：李晓鹏
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
