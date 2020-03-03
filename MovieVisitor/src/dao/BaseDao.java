package dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateTemplate;

public class BaseDao {
	private HibernateTemplate hibernateTemplate;
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

    //验证
    public <T> List<T> findUsername(String username) {  //用户名是否存在
        String hql="from model.Visitor as v where v.username ='"+username+"'";
        return hibernateTemplate.find(hql);
    }
    public <T> List<T> findNickname(String nickname) {  //昵称是否存在
        String hql="from model.Visitor as v where v.nickname ='"+nickname+"'";
        return hibernateTemplate.find(hql);
    }
    public <T> List<T> findNicknameAgain(String nickname, int id) {  //昵称是否存在
        String hql="from model.Visitor as v where v.nickname ='"+nickname+"'and v.id<>'"+id+"'";
        return hibernateTemplate.find(hql);
    }
    public <T> List<T> findPasswordAgain(String password, int id) {  //密码是否存在
        String hql="from model.Visitor as v where v.password ='"+password+"'and v.id='"+id+"'";
        return hibernateTemplate.find(hql);
    }
    
    //查询
    public <Movie> List<Movie> findMovieWithPage(int startIndex,int pageSize) {  //分页查找电影
    	Session session = this.getHibernateTemplate().getSessionFactory().openSession();
		Query   query   =   session.createQuery("from model.Movie as m"); 
		query.setFirstResult(startIndex); 
		query.setMaxResults(pageSize); 
		List<Movie> list= query.list();
		session.close();
		return list;
    }
    
    public <T> List<T> findTypeMovie(String type) {  //查询类型电影总数
        String hql="from model.Movie as m where m.type like '%"+type+"%'";
        return hibernateTemplate.find(hql);
    }
    
    public <Movie> List<Movie> findTypeMovieWithPage(String type,int startIndex,int pageSize) {  //分页查找类型电影
    	Session session = this.getHibernateTemplate().getSessionFactory().openSession();
		Query   query   =   session.createQuery("from model.Movie as m where m.type like '%"+type+"%'"); 
		query.setFirstResult(startIndex); 
		query.setMaxResults(pageSize); 
		List<Movie> list= query.list();
		session.close();
		return list;
    }
    
    //首页的2个查询
    public <Movie> List<Movie> findIndexOnshowMovie() {  //5个热映电影
        Session session = this.getHibernateTemplate().getSessionFactory().openSession();
		Query   query   =   session.createQuery("from model.Movie as m where m.onshow = '已上映' order by m.date desc"); 
		query.setFirstResult(0); 
		query.setMaxResults(5); 
		List<Movie> list= query.list();
		session.close();
		return list;
    }
    
    public <Movie> List<Movie> findIndexRemenMovie() {  //10个热门电影
        Session session = this.getHibernateTemplate().getSessionFactory().openSession();
		Query   query   =   session.createQuery("from model.Movie as m order by m.score desc"); 
		query.setFirstResult(0); 
		query.setMaxResults(12); 
		List<Movie> list= query.list();
		session.close();
		return list;
    }
    
    
    
    public <T> List<T> findOnshowMovie() {  //查询热映电影
        String hql="from model.Movie as m where m.onshow = '已上映' order by m.date desc";
        return hibernateTemplate.find(hql);
    }
    
    public <T> List<T> findCountryMovie(String area) {  //查询国家电影总数
        String hql="from model.Movie as m where m.area = '"+area+"'";
        return hibernateTemplate.find(hql);
    }
    
    public <Movie> List<Movie> findCountryMovieWithPage(String area,int startIndex,int pageSize) {  //分页查找地区电影
    	Session session = this.getHibernateTemplate().getSessionFactory().openSession();
		Query   query   =   session.createQuery("from model.Movie as m where m.area = '"+area+"'"); 
		query.setFirstResult(startIndex); 
		query.setMaxResults(pageSize); 
		List<Movie> list= query.list();
		session.close();
		return list;
    }
    
    
    public <T> List<T> findMovieVague(String moviename) {  //模糊查询电影
        String hql="from model.Movie as m where m.moviename like '%"+moviename+"%'";
        return hibernateTemplate.find(hql);
    }
    
    public <T> List<T> findActorVague(String name) {  //模糊查询演员
        String hql="from model.Actor as a where a.name like '%"+name+"%'";
        return hibernateTemplate.find(hql);
    }
	
    public <Movie> List<Movie> findMovieVagueWithPage(String moviename,int startIndex,int pageSize) {  //分页模糊查找电影
    	Session session = this.getHibernateTemplate().getSessionFactory().openSession();
		Query   query   =   session.createQuery("from model.Movie as m where m.moviename like '%"+moviename+"%'"); 
		query.setFirstResult(startIndex); 
		query.setMaxResults(pageSize); 
		List<Movie> list= query.list();
		session.close();
		return list;
    }
    
    //总排序-好
    public <Movie> List<Movie> findMovieGood() {
    	Session session = this.getHibernateTemplate().getSessionFactory().openSession();
		Query   query   =   session.createQuery("from model.Movie as m order by m.score desc "); 
		query.setMaxResults(10); 
		List<Movie> list= query.list();
		session.close();
		return list;
    }
    
    //总排序-坏
    public <Movie> List<Movie> findMovieBad() {
    	Session session = this.getHibernateTemplate().getSessionFactory().openSession();
		Query   query   =   session.createQuery("from model.Movie as m order by m.score asc "); 
		query.setMaxResults(10); 
		List<Movie> list= query.list();
		session.close();
		return list;
    }
    
    //总排序-月
    public <Movie> List<Movie> findMovieYue() {
    	Session session = this.getHibernateTemplate().getSessionFactory().openSession();
		Query   query   =   session.createQuery("from model.Movie as m where m.date between '2018-05-01' and '2018-05-31'	order by m.score desc"); 
		query.setMaxResults(10); 
		List<Movie> list= query.list();
		session.close();
		return list;
    }
    
    //热度排序
    public <Movie> List<Movie> findReduOrderWithPage(int startIndex,int pageSize) {
    	Session session = this.getHibernateTemplate().getSessionFactory().openSession();
		Query   query   =   session.createQuery("from model.Movie as m order by m.good desc "); 
		query.setFirstResult(startIndex); 
		query.setMaxResults(pageSize); 
		List<Movie> list= query.list();
		session.close();
		return list;
    }
    
    //时间排序
    public <Movie> List<Movie> findShijianOrderWithPage(int startIndex,int pageSize) {
    	Session session = this.getHibernateTemplate().getSessionFactory().openSession();
		Query   query   =   session.createQuery("from model.Movie as m order by m.date desc "); 
		query.setFirstResult(startIndex); 
		query.setMaxResults(pageSize); 
		List<Movie> list= query.list();
		session.close();
		return list;
    }
    
    //评分排序
    public <Movie> List<Movie> findPingfenOrderWithPage(int startIndex,int pageSize) {
    	Session session = this.getHibernateTemplate().getSessionFactory().openSession();
		Query   query   =   session.createQuery("from model.Movie as m order by m.score desc "); 
		query.setFirstResult(startIndex); 
		query.setMaxResults(pageSize); 
		List<Movie> list= query.list();
		session.close();
		return list;
    }
    //电影信息-演员表
    public <T> List<T> findMovieActor(String moviename) {  
        String hql="from model.Ma as ma where ma.moviename ='"+moviename+"'";
        return hibernateTemplate.find(hql);
    }
    //电影信息-评论
    public <T> List<T> findMovieComment(String moviename) {  
        String hql="from model.Mc as mc where mc.moviename ='"+moviename+"' and mc.caozuo='评论成功'";
        return hibernateTemplate.find(hql);
    }
    
    //个人中心
    public <T> List<T> findVisitorComment(String nickname) {  
        String hql="from model.Mc as mc where mc.nickname ='"+nickname+"'";
        return hibernateTemplate.find(hql);
    }
    
    //钱包
    public <T> List<T> findMoney(String nickname) {  
        String hql="from model.Spend as s where s.nickname ='"+nickname+"'";
        return hibernateTemplate.find(hql);
    }
    
    //演员
    public <Actor> List<Actor> findActorWithPage(int startIndex,int pageSize) {  //分页查找演员
    	Session session = this.getHibernateTemplate().getSessionFactory().openSession();
		Query   query   =   session.createQuery("from model.Actor as a"); 
		query.setFirstResult(startIndex); 
		query.setMaxResults(pageSize); 
		List<Actor> list= query.list();
		session.close();
		return list;
    }
    
    public <T> List<T> findCountryActor(String country) {  //查询国家演员总数
        String hql="from model.Actor as a where a.country = '"+country+"'";
        return hibernateTemplate.find(hql);
    }
    
    public <Movie> List<Movie> findCountryActorWithPage(String country,int startIndex,int pageSize) {  //分页查找国家演员
    	Session session = this.getHibernateTemplate().getSessionFactory().openSession();
		Query   query   =   session.createQuery("from model.Actor as a where a.country = '"+country+"'"); 
		query.setFirstResult(startIndex); 
		query.setMaxResults(pageSize); 
		List<Movie> list= query.list();
		session.close();
		return list;
    }
    
    public <T> List<T> findActorMovie(String actor) {  
        String hql="from model.Ma as ma where ma.actor ='"+actor+"'";
        return hibernateTemplate.find(hql);
    }
    
    //电影里点击演员名
    public <T> List<T> findActor(String actorname) {  
        String hql="from model.Actor as a where a.name = '"+actorname+"'";
        return hibernateTemplate.find(hql);
    }
    
    //个人中心里点击电影
    public <T> List<T> findMovie(String moviename) {  
        String hql="from model.Movie as m where m.moviename = '"+moviename+"'";
        return hibernateTemplate.find(hql);
    }
    
    
	public <T> T findById(Class<T> type, Serializable id) {  
        
        return hibernateTemplate.get(type, id);  
    }  
  
    public <T> List<T> findAll(Class<T> type) {  
          
        return hibernateTemplate.loadAll(type);  
    }  
    
    public <T> List<T> findOne(T type) {  
        
        return hibernateTemplate.findByExample(type);  
    }  
    
    public void save(Object... entities) {  
        for (Object entity: entities) {  
            hibernateTemplate.save(entity);  
        }  
              
    }  
  
    public void update(Object... entities) {  
        for (Object entity : entities) {  
            hibernateTemplate.update(entity);  
        }  
    } 
  
    public void updateVisitorMoney(int money,String nickname) {  
        this.hibernateTemplate.bulkUpdate("update model.Visitor as v set v.money=v.money-"+money+" where v.nickname='"+nickname+"'");
    }  
    
    public void rechargeVisitor(int money,String nickname) {  
        this.hibernateTemplate.bulkUpdate("update model.Visitor as v set v.money=v.money+"+money+" where v.nickname='"+nickname+"'");
    }  
    
    public void rechargeCard(int cardmoney,String cardnumber) {  
        this.hibernateTemplate.bulkUpdate("update model.Card as c set c.cardmoney=c.cardmoney-"+cardmoney+" where c.cardnumber='"+cardnumber+"'");
    }  
    
    
    public void saveOrUpdate(Object entity) {  
        hibernateTemplate.saveOrUpdate(entity);  
    }  
  
    public void mcDeleteNickname(String nickname) {  
        this.hibernateTemplate.bulkUpdate("delete model.Mc as m where m.nickname='"+nickname+"'");  
    }  
    
    public void spendDeleteNickname(String nickname) {  
        this.hibernateTemplate.bulkUpdate("delete model.Spend as s where s.nickname='"+nickname+"'");  
    }  
    
    
    public void delete(Object... entities) {  
        for (Object entity : entities) {  
            if(entity!=null){  
                hibernateTemplate.delete(entity);  
            }  
        }  
    }  
  
    public void deleteById(Class<?> type, Serializable id) {  
        if(id==null)  
            return;  
        Object entity=findById(type, id);  
        if(entity==null)  
            return;  
        delete(entity);  
    }  
  
    public void refresh(Object... entities) {  
        for (Object entity : entities) {  
            hibernateTemplate.refresh(entity);  
        }  
    }  
  
    public void flush() {  
        hibernateTemplate.flush();  
    }

	public <T> List<T> find(Object entity) {
		// TODO Auto-generated method stub
		return hibernateTemplate.find((String) entity);
	} 
	
}
