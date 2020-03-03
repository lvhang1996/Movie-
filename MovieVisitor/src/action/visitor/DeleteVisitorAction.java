package action.visitor;

import com.opensymphony.xwork2.ActionSupport;

import model.Mc;
import model.Spend;
import model.Visitor;
import dao.BaseDao;

@SuppressWarnings("serial")
public class DeleteVisitorAction extends ActionSupport{
	private BaseDao dao;
	private Visitor visitor;
	private Mc mc;
	private Spend spend;
	
	private int id;
	private String nickname;
	
	public String visitorDelete() throws Exception {
		System.out.println(id+"+"+nickname);
		dao.deleteById(Visitor.class,id);
		dao.mcDeleteNickname(nickname);
		dao.spendDeleteNickname(nickname);
		return SUCCESS;
	}
	
	public void setDao(BaseDao dao) {
		this.dao = dao;
	}
	public void setVisitor(Visitor visitor) {
		this.visitor = visitor;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Mc getMc() {
		return mc;
	}

	public void setMc(Mc mc) {
		this.mc = mc;
	}

	public Spend getSpend() {
		return spend;
	}

	public void setSpend(Spend spend) {
		this.spend = spend;
	}

	public BaseDao getDao() {
		return dao;
	}

	public Visitor getVisitor() {
		return visitor;
	}
	
}
