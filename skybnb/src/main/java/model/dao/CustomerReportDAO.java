package model.dao;

import java.util.List;

import model.bean.CustomerReportBean;

public interface CustomerReportDAO {
public abstract CustomerReportBean select (String id);
public abstract List<CustomerReportBean> select();
public abstract CustomerReportBean insert(CustomerReportBean bean);
public abstract boolean update(String reportNumber,boolean reportStatus);
}
