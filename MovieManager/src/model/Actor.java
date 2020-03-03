package model;

/**
 * Actor entity. @author MyEclipse Persistence Tools
 */

public class Actor implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String sex;
	private String picture;
	private String birth;
	private String country;

	// Constructors

	/** default constructor */
	public Actor() {
	}

	/** full constructor */
	public Actor(String name, String sex, String picture, String birth,
			String country) {
		this.name = name;
		this.sex = sex;
		this.picture = picture;
		this.birth = birth;
		this.country = country;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPicture() {
		return this.picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getBirth() {
		return this.birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getCountry() {
		return this.country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

}