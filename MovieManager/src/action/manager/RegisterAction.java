package action.manager;

import java.util.List;
import model.Manager;
import com.opensymphony.xwork2.ActionSupport;
import dao.BaseDao;

@SuppressWarnings("serial")
public class RegisterAction extends ActionSupport{
	private String username;
	private String password;
	private String invite;
	
	private BaseDao dao;
	private Manager manager;
	
	public String managerRegister() throws Exception {
		System.out.println(username+"++"+password+"++"+invite);
    	manager.setUsername(username);
    	manager.setPassword(password);
    	List list=dao.findUsername(username);
    	System.out.println(list.size());
    	if (invite.equals("1080")) {
    		if (manager.getUsername().isEmpty()) {
    			addActionError("用户名不为空");
	    		return INPUT;
			}
    		else if (list.size()!=0) {
    			addActionError("用户名已存在");
    			return INPUT;
			}
    		else {
				if (manager.getPassword().isEmpty()) {
					addActionError("密码不为空");
	    			return INPUT;
				}
				else {
					dao.save(manager);
	    			return SUCCESS;
				}
			}
			
		}
    	else {
    		addActionError("邀请码错误");
    		return INPUT;
		}
	}
    	
    	/*
    	if(invite.equals("1080")){
	    	if(manager.getUsername()!=null)
	    	{
	    		if(manager.getPassword()!=null){
	    			dao.save(manager);
	    			return SUCCESS;
	    		}
	    		else{	
	    			addActionError("密码不为空");
	    			return ERROR;	}	
	    	}else{	
	    		addActionError("用户名不为空");
	    		return ERROR;	}
    	}else
    	{
    		addActionError("邀请码错误");
    		return ERROR;
    	}
    }*/

	

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

	public String getInvite() {
		return invite;
	}
	public void setInvite(String invite) {
		this.invite = invite;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	public void setManager(Manager manager) {
		this.manager = manager;
	}
	
	
}
