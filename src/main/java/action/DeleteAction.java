/**
 * 程序功能：删除列表中选定的数据
 * 作者：李晓鹏
 */
package action;

import dao.ArticleDAO;

public class DeleteAction {
 private int id;
 private ArticleDAO articleDao;

public void setArticleDao(ArticleDAO articleDao) {
	this.articleDao = articleDao;
}

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}
 public String execute(){
	 try {
		articleDao.delete(id);
	} catch (Exception e) {
		e.printStackTrace();
	}
	 return "success";
 }
}
