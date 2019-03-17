package model.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="OrderHouseList")
public class OrderHouseBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	private String orderHouseNumber;
	@Column(insertable=false, updatable=false)
	private Integer sorting;
	private String memberID;
	private String houseID;
	@DateTimeFormat( pattern = "yyyy/MM/dd hh:mm:ss" )  
	private java.util.Date orderDate;
	@DateTimeFormat( pattern = "yyyy/MM/dd" )	
	@Temporal(TemporalType.DATE)
	private java.util.Date checkInDate;
	@DateTimeFormat( pattern = "yyyy/MM/dd" )  	
	@Temporal(TemporalType.DATE)
	private java.util.Date checkOutDate;
	private Integer checkoutAmount;
	private Integer numberOfPeople;
	private Boolean cancelReservation;
	private Integer bonus;
	private Integer starCount;
	private String comment;
	private Boolean commentStatus;


	public OrderHouseBean() {
		
	}

	public String getOrderHouseNumber() {
		return orderHouseNumber;
	}

	public void setOrderHouseNumber(String orderHouseNumber) {
		this.orderHouseNumber = orderHouseNumber;
	}

	public Integer getSorting() {
		return sorting;
	}

	public void setSorting(Integer sorting) {
		this.sorting = sorting;
	}

	public String getMemberID() {
		return memberID;
	}

	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}

	public String getHouseID() {
		return houseID;
	}

	public void setHouseID(String houseID) {
		this.houseID = houseID;
	}

	public java.util.Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(java.util.Date orderDate) {
		this.orderDate = orderDate;
	}

	public java.util.Date getCheckInDate() {
		return checkInDate;
	}

	public void setCheckInDate(java.util.Date checkInDate) {
		this.checkInDate = checkInDate;
	}

	public java.util.Date getCheckOutDate() {
		return checkOutDate;
	}

	public void setCheckOutDate(java.util.Date checkOutDate) {
		this.checkOutDate = checkOutDate;
	}

	public Integer getCheckoutAmount() {
		return checkoutAmount;
	}

	public void setCheckoutAmount(Integer checkoutAmount) {
		this.checkoutAmount = checkoutAmount;
	}

	public Integer getNumberOfPeople() {
		return numberOfPeople;
	}

	public void setNumberOfPeople(Integer numberOfPeople) {
		this.numberOfPeople = numberOfPeople;
	}

	public Boolean getCancelReservation() {
		return cancelReservation;
	}

	public void setCancelReservation(Boolean cancelReservation) {
		this.cancelReservation = cancelReservation;
	}

	public Integer getBonus() {
		return bonus;
	}

	public void setBonus(Integer bonus) {
		this.bonus = bonus;
	}

	public Integer getStarCount() {
		return starCount;
	}

	public void setStarCount(Integer starCount) {
		this.starCount = starCount;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Boolean getCommentStatus() {
		return commentStatus;
	}

	public void setCommentStatus(Boolean commentStatus) {
		this.commentStatus = commentStatus;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
	

}
