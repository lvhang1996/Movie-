package action.manager;

import java.util.List;
import java.util.Map;
import model.Manager;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.SessionAware;

import dao.BaseDao;

@SuppressWarnings("serial")
public class LoginAction extends ActionSupport implements SessionAware{
	private String username;
	private String password;
	
	private BaseDao dao;
	private Manager manager;

	
	public String managerLogin() throws Exception {
    	manager.setUsername(username);
    	manager.setPassword(password);
    	System.out.println(username+"++"+password);
    	List list=dao.findOne(manager);
    	System.out.println(list.size());
		if (manager.getUsername().isEmpty()) {
			 addActionError("用户名不为空");
   		return INPUT;
		}
		if (manager.getPassword().isEmpty()) {
			 addActionError("密码不为空");
  		return INPUT;
		}
    	if(list.size()==0)
    	{
    		addActionError("用户名或密码错误");
    		return INPUT;
    	}else{
        	session.put("mUsername", manager.getUsername());
    		return SUCCESS;
    	}
    	
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

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	public void setManager(Manager manager) {
		this.manager = manager;
	}
	public Manager getManager() {
		return manager;
	}

	private Map<String, Object> session;
	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		this.session = session;
	}
}
