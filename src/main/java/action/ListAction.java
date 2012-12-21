/**
 * �����ܣ��������е�Article�칫��Ʒ�����ݣ���ʾ��ҳ��
 * ���ߣ�������
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
