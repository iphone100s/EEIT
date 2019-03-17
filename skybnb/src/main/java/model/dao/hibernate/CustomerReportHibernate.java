package model.dao.hibernate;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.CustomerReportBean;
import model.dao.CustomerReportDAO;

@Repository
public class CustomerReportHibernate implements CustomerReportDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public CustomerReportBean select(String id) {

		return null;
	}

	@Override
	public CustomerReportBean insert(CustomerReportBean bean) {

		if (bean != null) {
			this.getSession().save(bean);
			return bean;
		}
		return null;
	}

	@Override
	public boolean update(String reportNumber, boolean reportStatus) {

		CustomerReportBean bean = this.getSession().get(CustomerReportBean.class, reportNumber);

		if (bean != null) {
			bean.setReportStatus(reportStatus);

			return true;

		}
		return false;
	}

	@Override
	public List<CustomerReportBean> select() {
//		 String sql ="select * from CustomerReport where reportStatus = ";
		 String Hsql= "from  CustomerReportBean c "+" where c.reportStatus = :reportStatus";
		// HQL語法
		List<CustomerReportBean> list = this.getSession().createQuery(Hsql,CustomerReportBean.class).setParameter("reportStatus", false).list();
		return list;
		
	}

	

}
