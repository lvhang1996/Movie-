package action.visitor;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import model.Visitor;
import dao.BaseDao;

@SuppressWarnings("serial")
public class UpdateVisitorAction extends ActionSupport implements SessionAware{
	private BaseDao dao;
	private Visitor visitor;
	
	private Integer id;
	private String username;
	private String password;
	private String ipone;
	private String email;
	private String nickname;
	private String picture;
	private Integer money;
	
	private String passwordAgain;
	
	private String title;//表单中的文件标题字段
	private File upload;//表单中的上传字段。
	private String uploadFileName;//上传的文件名，固定写法，上传字段名称+Filename
	private String uploadContentType;//上传的文件类型，固定写法，	上传字段+ContentType
	private String fileName;
	
	private String dir;
	private double data;
	private HttpServletRequest request;
	
	private Map<String,Object> session;
	
	public void image()
    {
		ServletContext application=ServletActionContext.getServletContext();		
		String directory=application.getRealPath("/images/visitorImage");
		dir="images\\visitorImage\\"+uploadFileName;
		//如果这个真实目录不存在，则创建
		File file=new File(directory);
		data=file.length();
		if(!file.exists())
			file.mkdirs();
		//把临时文件剪切到指定的位置，并且重命名
		upload.renameTo(new File(file,uploadFileName));
    }
	
	//更新游客所有信息
	public String visitorUpdate() throws Exception {
		System.out.println(id+"++"+username+"++"+password+"++"+ipone+"++"+email);
		System.out.println(nickname+"++"+picture);
		List list=dao.findNicknameAgain(nickname,id);
		if(nickname==null||nickname.length()==0){
			addActionError("昵称不为空");
			return INPUT;
		}
		if (list.size()!=0) {
			addActionError("昵称已存在");
			return INPUT;
		}
		if(ipone==null||ipone.length()==0){
			addActionError("手机不为空");
			return INPUT;
		}
		if(ipone.matches("1\\d{10}")==false){
			addActionError("手机格式不正确");
			return INPUT;
		}
		if(email==null||email.length()==0){
			addActionError("邮箱不为空");
			return INPUT;
		}
		if (email.matches("[a-zA-Z0-9_\\-\\.]+@[a-zA-Z0-9]+(\\.(com))")==false) {
			addActionError("邮箱格式不正确");
			return INPUT;
		}
		visitor.setId(id);
		visitor.setUsername(username);
		visitor.setPassword(password);
		visitor.setEmail(email);
		visitor.setIpone(ipone);
		visitor.setNickname(nickname);
    	session.put("vNickname", nickname);
		visitor.setMoney(money);
		
		if (upload==null) {
			System.out.println("无图片");
			visitor.setPicture(picture);
			session.put("vPicture", picture);
		}else {
			System.out.println("有图片");
			visitor.setPicture(uploadFileName);
			session.put("vPicture", uploadFileName);
			image();
		}
		dao.update(visitor);

		return SUCCESS;
	}
	
	//更新游客密码
	public String visitorUpdatePassword() throws Exception {
		System.out.println(id+"++"+username+"++"+password+"++"+ipone+"++"+email);
		System.out.println("*****");
		System.out.println(nickname+"++"+picture);
		System.out.println("*****");
		System.out.println(id+"++"+password+"++"+passwordAgain);
		
		@SuppressWarnings("rawtypes")
		List list2=dao.findNicknameAgain(nickname,id);

		if(password==null||password.length()==0){
			addActionError("密码不为空");
			return INPUT;
		}
		
		if(passwordAgain==null||passwordAgain.length()==0){
			addActionError("确认密码不为空");
			return INPUT;
		}
		
		if(password.equals(passwordAgain)==false){
			addActionError("密码不一致");
			return INPUT;
		}
		if (list2.size()!=0) {
			addActionError("新旧密码一样");
			return INPUT;
		}

		visitor.setId(id);
		visitor.setUsername(username);
		visitor.setPassword(password);
		visitor.setEmail(email);
		visitor.setIpone(ipone);
		visitor.setNickname(nickname);
		visitor.setPicture(picture);
		visitor.setMoney(money);
		dao.update(visitor);
		return SUCCESS;
	}
	
	
	public void setDao(BaseDao dao) {
		this.dao = dao;
	}
	public void setVisitor(Visitor visitor) {
		this.visitor = visitor;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public String getPicture() {
		return picture;
	}
	
	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getDir() {
		return dir;
	}

	public void setDir(String dir) {
		this.dir = dir;
	}

	public double getData() {
		return data;
	}

	public void setData(double data) {
		this.data = data;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public String getPasswordAgain() {
		return passwordAgain;
	}

	public void setPasswordAgain(String passwordAgain) {
		this.passwordAgain = passwordAgain;
	}

	public Integer getMoney() {
		return money;
	}

	public void setMoney(Integer money) {
		this.money = money;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
}
