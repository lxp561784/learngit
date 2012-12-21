/**
 * 程序功能：给定id 在数据库中查找对应的Article条目
 * 作者：李晓鹏
 */
package action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

import dao.ArticleDAO;
import dao.UserDAO;
import entity.Article;

public class FindAction {
	private int id;
	private Article article;
	private int userId;//通过session中的username 查找userId 传到页面！
	
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Article getArticle() {
		return article;
	}
	public void setArticle(Article article) {
		this.article = article;
	}
	private ArticleDAO articleDao;
	private UserDAO userDao;
	public void setUserDao(UserDAO userDao) {
		this.userDao = userDao;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public ArticleDAO getArticleDao() {
		return articleDao;
	}
	public void setArticleDao(ArticleDAO articleDao) {
		this.articleDao = articleDao;
	}
	public String execute(){
		try {
			article=articleDao.findById(id);//通过id查找Article对象
//			System.out.println(article.getId());
			ActionContext context=ActionContext.getContext();
			Map<String, String> session=(Map)context.getSession();
			if(session.get("username") != null){
				String username=session.get("username");
				userId=userDao.getByUsername(username);
				
			}
			
//			System.out.println(article.getAmount());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
}
