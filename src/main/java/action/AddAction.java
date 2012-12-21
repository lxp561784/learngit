/**
 * ������:��ȡ���е�����,��Article����д�뵽���ݿ���
 * ����:������
 */
package action;

import dao.ArticleDAO;
import entity.Article;

public class AddAction {
	private ArticleDAO articleDao;//ͨ��Spring������artileDao���뵽������
	private String name ;
	private double unitPrice;
	private int amount;
	private String direction;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getDirection() {
		return direction;
	}
	public void setDirection(String direction) {
		this.direction = direction;
	}
	public void setArticleDao(ArticleDAO articleDao) {
		this.articleDao = articleDao;
	}
	public String execute(){
		Article article=new Article();
		article.setName(name);
		article.setUnitPrice(unitPrice);
		article.setAmount(amount);
		article.setDirection(direction);
		try {
			
		 	articleDao.save(article);
			//��user_article���в������� ����ʹ�ü�������
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
}
