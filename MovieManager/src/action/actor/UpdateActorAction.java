package action.actor;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import util.PageBean;

import com.opensymphony.xwork2.ActionSupport;
import model.Actor;
import dao.BaseDao;

@SuppressWarnings("serial")
public class UpdateActorAction extends ActionSupport implements SessionAware{
	
	private BaseDao dao;
	private Actor actor;
	
	private Integer id;
	private String name;
	private String sex;
	private String picture;
	private String birth;
	private String country;
	
	private String title;//表单中的文件标题字段
	private File upload;//表单中的上传字段。
	private String uploadFileName;//上传的文件名，固定写法，上传字段名称+Filename
	private String uploadContentType;//上传的文件类型，固定写法，	上传字段+ContentType
	
	private String dir;
	private double data;
	private HttpServletRequest request;
	
	private int pageNum;
	
	private Map<String,Object> session;
	private List<Actor> allActorList=new ArrayList<Actor>();
	
	public void image()
    {
		ServletContext application=ServletActionContext.getServletContext();		
		String directory=application.getRealPath("/image/actorImage");
		dir="image\\actorImage\\"+uploadFileName;	
		//如果这个真实目录不存在，则创建
		File file=new File(directory);
		data=file.length();

		if(!file.exists())
			file.mkdirs();
		//把临时文件剪切到指定的位置，并且重命名
		upload.renameTo(new File(file,uploadFileName));
    }
	
	public String updateActor() throws Exception {
		if (name==null||name.length()==0) {
			addActionError("名字不为空");
			return INPUT;
		}else if (country==null||country.length()==0) {
			addActionError("国籍不为空");
			return INPUT;
		}else if (sex==null||sex.length()==0) {
			addActionError("性别不为空");
			return INPUT;
		}else if (birth==null||birth.length()==0) {
			addActionError("出生日期不为空");
			return INPUT;
		}else {
			actor.setId(id);
			actor.setBirth(birth);
			actor.setCountry(country);
			actor.setName(name);
			if (upload==null) {
				actor.setPicture(picture);
			}else {
				actor.setPicture(uploadFileName);
				image();
			}
			actor.setSex(sex);
			dao.update(actor);
			allActorList=dao.findAll(Actor.class);
			int totalRecord=allActorList.size();
			int pageSize=5;
			PageBean pb=new PageBean(pageNum, pageSize, totalRecord);
			int startIndex=pb.getStartIndex();
			pb.setList(dao.findActorWithPage(startIndex, pageSize));
			session.put("actorPage",pb);
			session.put("totalPage",totalRecord/pageSize+1);
			return SUCCESS;
		}
		
	}
	
	
	public void setDao(BaseDao dao) {
		this.dao = dao;
	}
	public void setActor(Actor actor) {
		this.actor = actor;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
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

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public List<Actor> getAllActorList() {
		return allActorList;
	}

	public void setAllActorList(List<Actor> allActorList) {
		this.allActorList = allActorList;
	}
	
	
}
