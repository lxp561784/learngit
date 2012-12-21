/**
 * 程序功能：登陆功能，校对用户名是否正确，跳转页面
 * 作者：李晓鹏
 * 
 */
package action;

import java.util.List;
import java.util.Map;

import service.LoginService;

import com.opensymphony.xwork2.ActionContext;

import entity.Article;
import entity.User;


public class LoginAction {
	private String username;
	private String password;
	private List<Article> list;
	public List<Article> getList() {
		return list;
	}

	public void setList(List<Article> list) {
		this.list = list;
	}

	

	@SuppressWarnings("unchecked")
	public String execute(){
	//	System.out.println("ssssssssssssssssssssssss");
//		System.out.println(username);
		ActionContext context=ActionContext.getContext();
		Map<String, String> session=(Map)context.getSession();
		session.put(username, "username");
		User user=new User();
		user.setId(1);
		user.setPassword(password);
		user.setUsername(username);
		
		
		if("lixiaopeng".equals(username)&&"123456".equals(password)){
			//list=loginService.findAll();
			//System.out.println(list.size());
			return "success";
		}
		return "false";
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
