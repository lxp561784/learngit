/**
 * UserDAO接口的一种实现
 */
package dao.impl;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import dao.UserDAO;
import entity.User;

public class UserDaoImpl extends HibernateDaoSupport implements UserDAO {

	public int getByUsername(String username) throws Exception {
		String hql="from User where username=?";
		Object[] params={username};
		User user=(User) this.getHibernateTemplate().get(hql,params);
		int userId=user.getId();
		return userId;
	}

}
