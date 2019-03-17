package model.bean;

import java.io.Serializable;

public class LinePayBean  implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String productName;
	private String productImageUrl;
	private Integer amount;
	private String currency;
	private String confirmUrl;
	private String orderId;
	
	public LinePayBean() {

	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductImageUrl() {
		return productImageUrl;
	}
	public void setProductImageUrl(String productImageUrl) {
		this.productImageUrl = productImageUrl;
	}
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public String getConfirmUrl() {
		return confirmUrl;
	}
	public void setConfirmUrl(String confirmUrl) {
		this.confirmUrl = confirmUrl;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
