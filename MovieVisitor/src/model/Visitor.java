package model;

/**
 * Visitor entity. @author MyEclipse Persistence Tools
 */

public class Visitor implements java.io.Serializable {

	// Fields

	private Integer id;
	private String username;
	private String password;
	private String ipone;
	private String email;
	private String nickname;
	private String picture;
	private Integer money;

	// Constructors

	/** default constructor */
	public Visitor() {
	}

	/** full constructor */
	public Visitor(String username, String password, String ipone,
			String email, String nickname, String picture, Integer money) {
		this.username = username;
		this.password = password;
		this.ipone = ipone;
		this.email = email;
		this.nickname = nickname;
		this.picture = picture;
		this.money = money;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getIpone() {
		return this.ipone;
	}

	public void setIpone(String ipone) {
		this.ipone = ipone;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickname() {
		return this.nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPicture() {
		return this.picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public Integer getMoney() {
		return this.money;
	}

	public void setMoney(Integer money) {
		this.money = money;
	}

}