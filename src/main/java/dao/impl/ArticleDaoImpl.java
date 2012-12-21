/**
 * 
 * ArticleDAO的一种实现
 * 作者：李晓鹏
 */
package dao.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Hibernate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import dao.ArticleDAO;
import entity.Article;
import entity.User;

public class ArticleDaoImpl extends HibernateDaoSupport implements ArticleDAO {

	@SuppressWarnings("unchecked")
	public List<Article> findAll() throws Exception {
		String hql="from Article";
			
			
		List<Article> list=this.getHibernateTemplate().find(hql );
		for (Article article : list) {
			Hibernate.initialize(article);
			//Hibernate.initialize(article.getUser());
			
		}
//		System.out.println(list);
		return list;
	}

	@SuppressWarnings("unchecked")
	public Article findById(int id) throws Exception {
		String hql="from Article where id=?";
	//	System.out.println(id);
		Object[] params={id};
		List<Article> list= this.getHibernateTemplate().find(hql,params);
		Article article=list.get(0);
		return article;
	}

	public void save(Article article) throws Exception {
		
		this.getHibernateTemplate().save(article);
		
	}

	public void delete(int id) throws Exception {
		Article article=(Article) this.getHibernateTemplate().get(Article.class, id);
		this.getHibernateTemplate().delete(article);
	}

	public void update(Article article) throws Exception {
//		System.out.println(article);
//		System.out.println(article.getAmount());
		Article art=(Article) this.getHibernateTemplate().get(Article.class,article.getId());
//		System.out.println(article.getId());
//		System.out.println(art);
		art.setAmount(article.getAmount());
		art.setDirection(article.getDirection());
		art.setName(article.getName());
		art.setUnitPrice(article.getUnitPrice());
		
		this.getHibernateTemplate().update(art);
		
	}

	public boolean getArticle(int id, int amount) throws Exception {
		Article article=(Article) this.getHibernateTemplate().get(Article.class, id);
//		System.out.println(article.getAmount());
//		System.out.println(amount);
		if(article.getAmount()-amount>=0){
			article.setAmount(article.getAmount()-amount);
			this.getHibernateTemplate().update(article);	
			return true;
		}
		return false;
	}

	@SuppressWarnings("unchecked")
	public Set<Article> findUserArticle(int userId) throws Exception {
		userId=1;
		String hql="from User u join fetch u.art ";
		List<User> list=this.getHibernateTemplate().find(hql);
		Set<Article> set =new HashSet();
		for(int i=0;i<list.size();i++){
				if(list.get(i).getId()==userId){
					User u=list.get(i);
					set= u.getArt();
				}
			}
//			System.out.println(set.size());
			
		return set;
	}

}
