/**
 * �����ܣ�����id �����ݿ��в��Ҷ�Ӧ��Article��Ŀ
 * ���ߣ�������
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
	private int userId;//ͨ��session�е�username ����userId ����ҳ�棡
	
	
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
			article=articleDao.findById(id);//ͨ��id����Article����
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
