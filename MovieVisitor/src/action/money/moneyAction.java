package action.money;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import model.Spend;
import model.Visitor;
import model.Card;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import dao.BaseDao;

@SuppressWarnings("serial")
public class moneyAction extends ActionSupport implements SessionAware{
	private BaseDao dao;
	private Spend spend;
	private Visitor visitor;
	private Card card;
	
	private String nickname;
	
	private String buymovie;
	private int buymoney;
	private String buynickname;
	
	private String cardnumber;
	private String cardpassword;
	private int money;
	
	private int sheng;
	private String video;
	
	private Map<String,Object> session;
	private List<Spend> moneyList=new ArrayList<Spend>();
	
	public String qianbao() throws Exception {//查找钱包
		moneyList=dao.findMoney(nickname);
		session.put("moneyList",getMoneyList());
		return SUCCESS;
	}
	
	public String buy() throws Exception {//购票
		System.out.println(buymovie+"+"+buymoney+"+"+buynickname+"+"+sheng);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		spend.setSpenddate(df.format(new Date()));
		spend.setNickname(buynickname);
		spend.setSpendmoney(buymoney);
		spend.setSpendmovie(buymovie);
		dao.save(spend);
		session.put("vMoney",sheng-buymoney);
		System.out.println(sheng-buymoney);
		dao.updateVisitorMoney(buymoney, buynickname);
		
		session.put("v", video);
		System.out.println(video);
		
		return SUCCESS;
	}
	
	public String recharge() throws Exception {//充值
		System.out.println("sMoney="+sheng);
		System.out.println(cardnumber+"+"+cardpassword+"+"+money);
		card.setCardnumber(cardnumber);
		card.setCardpassword(cardpassword);
		List list=dao.findOne(card);
    	if(list.size()==0)
    	{
    		addActionError("银行卡号或银行卡密码错误");
    		return INPUT;
    	}else{
    		if (money<=0) {
    			addActionError("金额不为0");
        		return INPUT;
			}else {
				Card ci=(Card)list.get(0);
	    		if (ci.getCardmoney() <= money) {
	    			addActionError("银行卡余额不足");
	    			return INPUT;
				}else {
					moneyList=dao.findMoney(nickname);
					session.put("moneyList",getMoneyList());
					session.put("vMoney", sheng+money);
					dao.rechargeCard(money, cardnumber);
					dao.rechargeVisitor(money, buynickname);
					return SUCCESS;
	    		}
			}
    	}
	}
	
	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public BaseDao getDao() {
		return dao;
	}
	public void setDao(BaseDao dao) {
		this.dao = dao;
	}
	public Spend getSpend() {
		return spend;
	}
	public void setSpend(Spend spend) {
		this.spend = spend;
	}

	public List<Spend> getMoneyList() {
		return moneyList;
	}

	public void setMoneyList(List<Spend> moneyList) {
		this.moneyList = moneyList;
	}

	public String getBuymovie() {
		return buymovie;
	}

	public void setBuymovie(String buymovie) {
		this.buymovie = buymovie;
	}

	public int getBuymoney() {
		return buymoney;
	}

	public void setBuymoney(int buymoney) {
		this.buymoney = buymoney;
	}

	public String getBuynickname() {
		return buynickname;
	}

	public void setBuynickname(String buynickname) {
		this.buynickname = buynickname;
	}

	public Visitor getVisitor() {
		return visitor;
	}

	public void setVisitor(Visitor visitor) {
		this.visitor = visitor;
	}

	public Card getCard() {
		return card;
	}

	public void setCard(Card card) {
		this.card = card;
	}

	public String getCardnumber() {
		return cardnumber;
	}

	public void setCardnumber(String cardnumber) {
		this.cardnumber = cardnumber;
	}

	public String getCardpassword() {
		return cardpassword;
	}

	public void setCardpassword(String cardpassword) {
		this.cardpassword = cardpassword;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public int getSheng() {
		return sheng;
	}

	public void setSheng(int sheng) {
		this.sheng = sheng;
	}

	public String getVideo() {
		return video;
	}

	public void setVideo(String video) {
		this.video = video;
	}

	
}
