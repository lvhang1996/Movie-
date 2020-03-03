package action.movie;

import com.opensymphony.xwork2.ActionSupport;

import model.Movie;
import dao.BaseDao;

@SuppressWarnings("serial")
public class DeleteMovieAction extends ActionSupport{
	private BaseDao dao;
	private Movie movie;
	
	private int id;
	private String moviename;
	
	public String deleteMovie() throws Exception {
		System.out.println(id+"+"+moviename);
		dao.deleteById(Movie.class,id);
		dao.maDeleteMovie(moviename);
		dao.mcDeleteMovie(moviename);
		return SUCCESS;
	}
	
	
	public void setDao(BaseDao dao) {
		this.dao = dao;
	}
	public void setMovie(Movie movie) {
		this.movie = movie;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


	public String getMoviename() {
		return moviename;
	}


	public void setMoviename(String moviename) {
		this.moviename = moviename;
	}
	
}
