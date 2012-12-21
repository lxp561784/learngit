/**
 * 程序功能：查找所有的Article办公用品的数据，显示到页面
 * 作者：李晓鹏
 */
package action;

import java.util.List;

import dao.ArticleDAO;
import entity.Article;

public class ListAction {
	private List<Article> list;
	private ArticleDAO articleDao;

	public void setArticleDao(ArticleDAO articleDao) {
		this.articleDao = articleDao;
	}

	public List<Article> getList() {
		return list;
	}

	public void setList(List<Article> list) {
		this.list = list;
	}
	public String execute(){
		
		try {
			list=articleDao.findAll();
			
			//System.out.println(list.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
}
