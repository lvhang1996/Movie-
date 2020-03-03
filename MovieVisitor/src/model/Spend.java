package model;

/**
 * Spend entity. @author MyEclipse Persistence Tools
 */

public class Spend implements java.io.Serializable {

	// Fields

	private Integer id;
	private String nickname;
	private Integer spendmoney;
	private String spenddate;
	private String spendmovie;

	// Constructors

	/** default constructor */
	public Spend() {
	}

	/** full constructor */
	public Spend(String nickname, Integer spendmoney, String spenddate,
			String spendmovie) {
		this.nickname = nickname;
		this.spendmoney = spendmoney;
		this.spenddate = spenddate;
		this.spendmovie = spendmovie;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNickname() {
		return this.nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Integer getSpendmoney() {
		return this.spendmoney;
	}

	public void setSpendmoney(Integer spendmoney) {
		this.spendmoney = spendmoney;
	}

	public String getSpenddate() {
		return this.spenddate;
	}

	public void setSpenddate(String spenddate) {
		this.spenddate = spenddate;
	}

	public String getSpendmovie() {
		return this.spendmovie;
	}

	public void setSpendmovie(String spendmovie) {
		this.spendmovie = spendmovie;
	}

}