package model;

/**
 * Card entity. @author MyEclipse Persistence Tools
 */

public class Card implements java.io.Serializable {

	// Fields

	private Integer id;
	private String cardnumber;
	private String cardpassword;
	private Integer cardmoney;

	// Constructors

	/** default constructor */
	public Card() {
	}

	/** full constructor */
	public Card(String cardnumber, String cardpassword, Integer cardmoney) {
		this.cardnumber = cardnumber;
		this.cardpassword = cardpassword;
		this.cardmoney = cardmoney;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCardnumber() {
		return this.cardnumber;
	}

	public void setCardnumber(String cardnumber) {
		this.cardnumber = cardnumber;
	}

	public String getCardpassword() {
		return this.cardpassword;
	}

	public void setCardpassword(String cardpassword) {
		this.cardpassword = cardpassword;
	}

	public Integer getCardmoney() {
		return this.cardmoney;
	}

	public void setCardmoney(Integer cardmoney) {
		this.cardmoney = cardmoney;
	}

}