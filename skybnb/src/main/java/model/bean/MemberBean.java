package model.bean;


import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Member")
public class MemberBean {

	@Id
	private String memberID;
	private String account;
	private String password;
	private String nationality;
	private String language;
	private String name;
	private String phone;
	private String address;
	private String fb_token;
	private String google_token;
	private String fbID;
	private String googleID;
	private Boolean checkMail;
	private Boolean checkPhone;
	private String safetyPoint;
	private Integer bonus;
	private String authority;
	private String memberStatus;
	private String profilePicture;
	@DateTimeFormat( pattern = "yyyy-MM-dd" )
	@Temporal(TemporalType.DATE)	
	private java.util.Date birthday;
	
	
	
	
	

	public String getMemberID() {
		return memberID;
	}
	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNationality() {
		return nationality;
	}
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public java.util.Date getBirthday() {
		return birthday;
	}
	public void setBirthday(java.util.Date birthday) {
		this.birthday = birthday;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getFb_token() {
		return fb_token;
	}
	public void setFb_token(String fb_token) {
		this.fb_token = fb_token;
	}
	public String getGoogle_token() {
		return google_token;
	}
	public void setGoogle_token(String google_token) {
		this.google_token = google_token;
	}
	public String getFbID() {
		return fbID;
	}
	public void setFbID(String fbID) {
		this.fbID = fbID;
	}
	public String getGoogleID() {
		return googleID;
	}
	public void setGoogleID(String googleID) {
		this.googleID = googleID;
	}
	public Boolean getCheckMail() {
		return checkMail;
	}
	public void setCheckMail(Boolean checkMail) {
		this.checkMail = checkMail;
	}
	public Boolean getCheckPhone() {
		return checkPhone;
	}
	public void setCheckPhone(Boolean checkPhone) {
		this.checkPhone = checkPhone;
	}
	public String getSafetyPoint() {
		return safetyPoint;
	}
	public void setSafetyPoint(String safetyPoint) {
		this.safetyPoint = safetyPoint;
	}
	public Integer getBonus() {
		return bonus;
	}
	public void setBonus(Integer bonus) {
		this.bonus = bonus;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public String getMemberStatus() {
		return memberStatus;
	}
	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}
	public String getProfilePicture() {
		return profilePicture;
	}
	public void setProfilePicture(String profilePicture) {
		this.profilePicture = profilePicture;
	}
	

}