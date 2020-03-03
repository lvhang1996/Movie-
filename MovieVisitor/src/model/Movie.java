package model;

/**
 * Movie entity. @author MyEclipse Persistence Tools
 */

public class Movie implements java.io.Serializable {

	// Fields

	private Integer id;
	private String moviename;
	private Double score;
	private String author;
	private String type;
	private String date;
	private String area;
	private String time;
	private String language;
	private Integer price;
	private String picture;
	private String introduction;
	private String onshow;
	private Integer good;
	private Integer bad;
	private String video;

	// Constructors

	/** default constructor */
	public Movie() {
	}

	/** full constructor */
	public Movie(String moviename, Double score, String author, String type,
			String date, String area, String time, String language,
			Integer price, String picture, String introduction, String onshow,
			Integer good, Integer bad, String video) {
		this.moviename = moviename;
		this.score = score;
		this.author = author;
		this.type = type;
		this.date = date;
		this.area = area;
		this.time = time;
		this.language = language;
		this.price = price;
		this.picture = picture;
		this.introduction = introduction;
		this.onshow = onshow;
		this.good = good;
		this.bad = bad;
		this.video = video;
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

	public Double getScore() {
		return this.score;
	}

	public void setScore(Double score) {
		this.score = score;
	}

	public String getAuthor() {
		return this.author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDate() {
		return this.date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getArea() {
		return this.area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getTime() {
		return this.time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getLanguage() {
		return this.language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public Integer getPrice() {
		return this.price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getPicture() {
		return this.picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getIntroduction() {
		return this.introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getOnshow() {
		return this.onshow;
	}

	public void setOnshow(String onshow) {
		this.onshow = onshow;
	}

	public Integer getGood() {
		return this.good;
	}

	public void setGood(Integer good) {
		this.good = good;
	}

	public Integer getBad() {
		return this.bad;
	}

	public void setBad(Integer bad) {
		this.bad = bad;
	}

	public String getVideo() {
		return this.video;
	}

	public void setVideo(String video) {
		this.video = video;
	}

}