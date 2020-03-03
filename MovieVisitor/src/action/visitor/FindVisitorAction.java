package action.visitor;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import model.Visitor;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import dao.BaseDao;

@SuppressWarnings("serial")
public class FindVisitorAction extends ActionSupport implements SessionAware{
	private BaseDao dao;
	private Visitor visitor;
	
	private int id;
	
	private Map<String,Object> session;
	
	private List<Visitor> updateVisitorList=new ArrayList<Visitor>();
	
	public String findUpdateVisitor() throws Exception {//查找需要更改的游客
		System.out.println(id);
		visitor=dao.findById(Visitor.class,id);
		updateVisitorList.add(visitor);
		System.out.println(updateVisitorList);
		session.put("updateVisitorList",getUpdateVisitorList());
		System.out.println("findupdatevisitor-OK");
		return SUCCESS;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	public void setVisitor(Visitor visitor) {
		this.visitor = visitor;
	}

	public List<Visitor> getUpdateVisitorList() {
		return updateVisitorList;
	}

	public void setUpdateVisitorList(List<Visitor> updateVisitorList) {
		this.updateVisitorList = updateVisitorList;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
}
