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

	public <T> T findById(Class<T> type, Serializable id) {  
        
        return hibernateTemplate.get(type, id);  
    }  
  
    public <T> List<T> findAll(Class<T> type) {  
          
        return hibernateTemplate.loadAll(type);  
    }  
    
    public <Movie> List<Movie> findMovieWithPage(int startIndex,int pageSize) {  //分页查找电影
    	Session session = this.getHibernateTemplate().getSessionFactory().openSession();
		Query   query   =   session.createQuery("from model.Movie as m"); 
		query.setFirstResult(startIndex); 
		query.setMaxResults(pageSize); 
		List<Movie> list= query.list();
		session.close();
		return list;
    }
    
    public <Actor> List<Actor> findActorWithPage(int startIndex,int pageSize) {  //分页查找演员
    	Session session = this.getHibernateTemplate().getSessionFactory().openSession();
		Query   query   =   session.createQuery("from model.Actor as a"); 
		query.setFirstResult(startIndex); 
		query.setMaxResults(pageSize); 
		List<Actor> list= query.list();
		session.close();
		return list;
    }
    
    public <Movie> List<Movie> findActorVagueWithPage(String name,int startIndex,int pageSize) {  //分页模糊查找演员
    	Session session = this.getHibernateTemplate().getSessionFactory().openSession();
		Query   query   =   session.createQuery("from model.Actor as a where a.name like '%"+name+"%'"); 
		query.setFirstResult(startIndex); 
		query.setMaxResults(pageSize); 
		List<Movie> list= query.list();
		session.close();
		return list;
    }
  
    public <T> List<T> findOne(T type) {  
        
        return hibernateTemplate.findByExample(type);  
    }  
    
    public <T> List<T> findUsername(String username) {  //用户名是否存在
        String hql="from model.Manager as m where m.username ='"+username+"'";
        return hibernateTemplate.find(hql);
    }
    
    public <T> List<T> findMovieC(String moviename) {  //电影是否存在
    	String hql="from model.Movie as m where m.moviename='"+moviename+"'";
        return hibernateTemplate.find(hql);
    }
    
    public <T> List<T> findActorC(String name) {  //演员是否存在
    	String hql="from model.Actor as a where a.name='"+name+"'";
        return hibernateTemplate.find(hql);
    }
    
    public <T> List<T> findMovieActor(String role,String moviename) {  //电影人物是否存在
    	String hql="from model.Ma as m where m.role ='"+role+"'and m.moviename='"+moviename+"'";
        return hibernateTemplate.find(hql);
    }
    
    public <T> List<T> findMovieVague(String moviename) {  //模糊查询电影
        String hql="from model.Movie as m where m.moviename like '%"+moviename+"%'";
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
    
    public <T> List<T> findActorVague(String name) {  //模糊查询演员
        String hql="from model.Actor as a where a.name like '%"+name+"%'";
        return hibernateTemplate.find(hql);
    }
    
    public <T> List<T> findMovieInActor(String moviename) {  
        String hql="from model.Ma as ma where ma.moviename ='"+moviename+"'";
        return hibernateTemplate.find(hql);
    }
    
    //评论
    public <Mc> List<Mc> lookMovieComment(String moviename) {  //查询电影的评论
        String hql="from model.Mc as mc where mc.moviename = '"+moviename+"' and mc.caozuo='评论成功'";
        return hibernateTemplate.find(hql);
    }
    
    public <Mc> List<Mc> lookMovieCommentWithPage(String moviename,int startIndex,int pageSize) {  //分页查询电影的评论
    	Session session = this.getHibernateTemplate().getSessionFactory().openSession();
		Query   query   =   session.createQuery("from model.Mc as mc where mc.moviename = '"+moviename+"' and mc.caozuo='评论成功'"); 
		query.setFirstResult(startIndex); 
		query.setMaxResults(pageSize); 
		List<Mc> list= query.list();
		session.close();
		return list;
    }
    
    public <Mc> List<Mc> findMovieCommentVague(String comment) {  //查询电影的评论
        String hql="from model.Mc as mc where mc.comment like '%"+comment+"%' and mc.caozuo='评论成功'";
        return hibernateTemplate.find(hql);
    }
    
    public <Mc> List<Mc> findMovieCommentVagueWithPage(String comment,int startIndex,int pageSize) {  //分页查询电影的评论
    	Session session = this.getHibernateTemplate().getSessionFactory().openSession();
		Query   query   =   session.createQuery("from model.Mc as mc where mc.comment like '%"+comment+"%' and mc.caozuo='评论成功'"); 
		query.setFirstResult(startIndex); 
		query.setMaxResults(pageSize); 
		List<Mc> list= query.list();
		session.close();
		return list;
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
  
    public void saveOrUpdate(Object entity) {  
        hibernateTemplate.saveOrUpdate(entity);  
    }  
  
    public void mcDeleteMovie(String moviename) {  
        this.hibernateTemplate.bulkUpdate("delete model.Mc as m where m.moviename='"+moviename+"'");  
    }  
    
    public void maDeleteMovie(String moviename) {  
        this.hibernateTemplate.bulkUpdate("delete model.Ma as m where m.moviename='"+moviename+"'");  
    }  
    
    public void maDeleteActor(String actor) {  
        this.hibernateTemplate.bulkUpdate("delete model.Ma as m where m.actor='"+actor+"'");  
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
