package model;

/**
 * Mc entity. @author MyEclipse Persistence Tools
 */

public class Mc implements java.io.Serializable {

	// Fields

	private Integer id;
	private String moviename;
	private String comment;
	private String nickname;
	private String date;
	private String caozuo;
	private Double score;

	// Constructors

	/** default constructor */
	public Mc() {
	}

	/** full constructor */
	public Mc(String moviename, String comment, String nickname, String date,
			String caozuo, Double score) {
		this.moviename = moviename;
		this.comment = comment;
		this.nickname = nickname;
		this.date = date;
		this.caozuo = caozuo;
		this.score = score;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getMoviename() {
		return this.moviename;
	}

	public void setMoviename(String moviename) {
		this.moviename = moviename;
	}

	public String getComment() {
		return this.comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getNickname() {
		return this.nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getDate() {
		return this.date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getCaozuo() {
		return this.caozuo;
	}

	public void setCaozuo(String caozuo) {
		this.caozuo = caozuo;
	}

	public Double getScore() {
		return this.score;
	}

	public void setScore(Double score) {
		this.score = score;
	}

}