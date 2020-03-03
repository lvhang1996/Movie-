package action.visitor;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import model.Visitor;
import com.opensymphony.xwork2.ActionSupport;
import dao.BaseDao;

@SuppressWarnings("serial")
public class RegisterAction extends ActionSupport{
	private String username;
	private String password;
	private String ipone;
	private String email;
	private String nickname;
	
	private BaseDao dao;
	private Visitor visitor;
	
	public String visitorRegister() throws Exception {
		System.out.println(username+"++"+password+"++"+ipone+"++"+email+"++"+nickname);
		visitor.setUsername(username);
		visitor.setPassword(password);
		visitor.setEmail(email);
		visitor.setIpone(ipone);
		visitor.setNickname(nickname);
		visitor.setMoney(0);
		visitor.setPicture("wu.jpg");
		List list=dao.findUsername(username);
		List list2=dao.findNickname(nickname);
		if (visitor.getUsername().isEmpty()) {
			 addActionError("用户名不为空");
    		return INPUT;
		}
		if (list.size()!=0) {
			addActionError("用户名已存在");
			return INPUT;
		}
		if (visitor.getPassword().isEmpty()) {
			addActionError("密码不为空");
			return INPUT;
		}
		if(visitor.getNickname().isEmpty()){
			addActionError("昵称不为空");
			return INPUT;
		}
		if (list2.size()!=0) {
			addActionError("昵称已存在");
			return INPUT;
		}
		if(visitor.getIpone().isEmpty()){
			addActionError("手机不为空");
			return INPUT;
		}
		if(visitor.getIpone().matches("1\\d{10}")==false){
			addActionError("手机格式不正确");
			return INPUT;
		}
		if(visitor.getEmail().isEmpty()){
			addActionError("邮箱不为空");
			return INPUT;
		}
		if (visitor.getEmail().matches("[a-zA-Z0-9_\\-\\.]+@[a-zA-Z0-9]+(\\.(com))")==false) {
			addActionError("邮箱格式不正确");
			return INPUT;
		}
		dao.save(visitor);
		return SUCCESS;
		
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
	
	public String getIpone() {
		return ipone;
	}

	public void setIpone(String ipone) {
		this.ipone = ipone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	public void setVisitor(Visitor visitor) {
		this.visitor = visitor;
	}
	
}
