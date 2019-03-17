package model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.bean.CustomerReportBean;
import model.dao.CustomerReportDAO;

@Service
public class CustomerReportService {
	@Autowired
	private CustomerReportDAO customerReportDAO;

	public CustomerReportBean insert(CustomerReportBean bean) {
		CustomerReportBean reportBean = null;
		if (bean != null) {
			reportBean = customerReportDAO.insert(bean);
		}
		return reportBean;
	}
  public List<CustomerReportBean> select(CustomerReportBean bean){
	 List<CustomerReportBean> list = null;
	 if(bean !=null && bean.getReportNumber().equals(null)) {
		 CustomerReportBean customerReportBean = customerReportDAO.select(bean.getReportNumber()); 
	   if(customerReportBean!=null) {
		 list = new ArrayList<CustomerReportBean>();
		 list.add(customerReportBean);
	   }
	}else {
		list = customerReportDAO.select();
	}
	  return list;
	  
  }

  public boolean update(CustomerReportBean bean) {
	     boolean update = false ;
	  if (bean!= null) {
		 update  = customerReportDAO.update(bean.getReportNumber(),bean.getReportStatus());
	  }
	  return update;
  }
  
  
}
