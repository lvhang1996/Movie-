package action.visitor;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import model.Visitor;
import dao.BaseDao;

@SuppressWarnings("serial")
public class OutAction extends ActionSupport implements SessionAware{
	
	public String out() throws Exception {
    	session.put("login", 0);
		return SUCCESS;
    }


	private Map<String, Object> session;
	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		this.session = session;
	}
}
