/**
 * 程序功能：领取办公用品
 * 作者：李晓鹏
 */
package action;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import dao.ArticleDAO;

public class GetAction {
	private int id;
	private int amount;
	private boolean flag;
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
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public boolean isFlag() {
		return flag;
	}
	public void setFlag(boolean flag) {
		this.flag = flag;
	}
	public String execute(){
		try {
			flag=articleDao.getArticle(id, amount);
			HttpServletResponse response = ServletActionContext.getResponse();
			response.getWriter().print(flag);
//			System.out.println(amount);
			//TODO 向user_article中插入数据
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
}
