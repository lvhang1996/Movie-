package action.movie;

import java.io.File;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;

import model.Movie;
import dao.BaseDao;

@SuppressWarnings("serial")
public class AddMovieAction extends ActionSupport{
	private String moviename;
	private String author;
	private String type;
	private String date;
	private String area;
	private String time;
	private String language;
	private String picture;
	private String introduction;
	private String onshow;
	private int good;
	private int bad;
	
	private BaseDao dao;
	private Movie movie;
	
    private String title;//表单中的文件标题字段
	private File upload;//表单中的上传字段。
	private String uploadFileName;//上传的文件名，固定写法，上传字段名称+Filename
	private String uploadContentType;//上传的文件类型，固定写法，	上传字段+ContentType
	
	private String dir;
	private double data;
	private HttpServletRequest request;
	
	public void image()
    {
		ServletContext application=ServletActionContext.getServletContext();		
		String directory=application.getRealPath("/image/movieImage");
		dir="image\\movieImage\\"+uploadFileName;	
		//如果这个真实目录不存在，则创建
		File file=new File(directory);
		data=file.length();
		System.out.println(dir);
		if(!file.exists())
			file.mkdirs();
		//把临时文件剪切到指定的位置，并且重命名
		upload.renameTo(new File(file,uploadFileName));
		System.out.println(upload);
    }
	
	
	public String addMovie() throws Exception {
		System.out.println(moviename+"++"+author+"++"+type+"++"+date+"++"+area);
		System.out.println(time+"++"+language+"++"+picture+"++"+introduction+"++"+uploadFileName);
		
		List list=dao.findMovieC(moviename);
		
		if (moviename==null||moviename.length()==0) {
			addActionError("电影名不为空");
			return INPUT;
		}else if (author==null||author.length()==0) {
			addActionError("作者不为空");
			return INPUT;
		}else if (type==null||type.length()==0) {
			addActionError("类型不为空");
			return INPUT;
		}else if (date==null) {
			addActionError("上映日期不为空");
			return INPUT;
		}else if (language==null||language.length()==0) {
			addActionError("语言不为空");
			return INPUT;
		}else if (time==null) {
			addActionError("片长不为空");
			return INPUT;
		}else if (upload==null||upload.length()==0) {
			addActionError("电影图片不为空");
			return INPUT;
		}else if (introduction==null||introduction.length()==0) {
			addActionError("电影介绍不为空");
			return INPUT;
		}else if (area==null||area.length()==0) {
			addActionError("国家不为空");
			return INPUT;
		}
		else {
			if(list.size()!=0){
				addActionError("该电影已存在");
	    		return INPUT;
	    	}else {
	    		movie.setMoviename(moviename);
				movie.setArea(area);
				movie.setAuthor(author);
				movie.setType(type);
				movie.setDate(date);
				movie.setLanguage(language);
				movie.setTime(time);
				movie.setPicture(uploadFileName);
				movie.setIntroduction(introduction);
				movie.setOnshow("未上映");
				movie.setGood(0);
				movie.setBad(0);
				dao.save(movie);
				image();
				return SUCCESS;
			}
		}
	}
	
	
	
	public void setDao(BaseDao dao) {
		this.dao = dao;
	}
	public void setMovie(Movie movie) {
		this.movie = movie;
	}
	
	public String getMoviename() {
		return moviename;
	}
	public void setMoviename(String moviename) {
		this.moviename = moviename;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getOnshow() {
		return onshow;
	}
	public void setOnshow(String onshow) {
		this.onshow = onshow;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getBad() {
		return bad;
	}
	public void setBad(int bad) {
		this.bad = bad;
	}



	
	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
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
	
}
