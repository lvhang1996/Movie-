package model;

/**
 * Ma entity. @author MyEclipse Persistence Tools
 */

public class Ma implements java.io.Serializable {

	// Fields

	private Integer id;
	private String moviename;
	private String actor;
	private String role;

	// Constructors

	/** default constructor */
	public Ma() {
	}

	/** full constructor */
	public Ma(String moviename, String actor, String role) {
		this.moviename = moviename;
		this.actor = actor;
		this.role = role;
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

	public String getActor() {
		return this.actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}

	public String getRole() {
		return this.role;
	}

	public void setRole(String role) {
		this.role = role;
	}

}