package model.bean;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="HouseInformation")
public class HouseInformationBean implements Serializable{
	private static final long serialVersionUID = 1L;
		@Id
		private String houseID;
		private String memberID;
		private String houseName;
		private String houseType;
		private Boolean houseSpace;
		private Integer maxPeopleAvailable;
		private String country;
		private String city;
		private String address;
		private Double mapLongitude;
		private Double mapLatitude;
		private String housePicture1;
		private String housePicture2;
		private String housePicture3;
		private String housePicture4;
		private String facility;
		private String houseIntroduction;
		private String houseRules;
		private Integer price;
		@DateTimeFormat( pattern = "yyyy/MM/dd" )
		@Temporal(TemporalType.DATE)
		private java.util.Date startRentTime;
		@DateTimeFormat( pattern = "yyyy/MM/dd" )
		@Temporal(TemporalType.DATE)	
		private java.util.Date endRentTime;
		private Boolean freeCancel;
		private String disabledDates;
		private String orderedDates;
		private Double starCountAverage;
		private Integer totalComment;
		
		public HouseInformationBean() {

		}
		

		public String getHouseID() {
			return houseID;
		}
		public void setHouseID(String houseID) {
			this.houseID = houseID;
		}
		public String getMemberID() {
			return memberID;
		}
		public void setMemberID(String memberID) {
			this.memberID = memberID;
		}
		public String getHouseName() {
			return houseName;
		}
		public void setHouseName(String houseName) {
			this.houseName = houseName;
		}
		public String getHouseType() {
			return houseType;
		}
		public void setHouseType(String houseType) {
			this.houseType = houseType;
		}
		public Boolean getHouseSpace() {
			return houseSpace;
		}
		public void setHouseSpace(Boolean houseSpace) {
			this.houseSpace = houseSpace;
		}
		public Integer getMaxPeopleAvailable() {
			return maxPeopleAvailable;
		}
		public void setMaxPeopleAvailable(Integer maxPeopleAvailable) {
			this.maxPeopleAvailable = maxPeopleAvailable;
		}
		public String getCountry() {
			return country;
		}
		public void setCountry(String country) {
			this.country = country;
		}
		public String getCity() {
			return city;
		}
		public void setCity(String city) {
			this.city = city;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		public Double getMapLongitude() {
			return mapLongitude;
		}
		public void setMapLongitude(Double mapLongitude) {
			this.mapLongitude = mapLongitude;
		}
		public Double getMapLatitude() {
			return mapLatitude;
		}
		public void setMapLatitude(Double mapLatitude) {
			this.mapLatitude = mapLatitude;
		}
		public String getHousePicture1() {
			return housePicture1;
		}
		public void setHousePicture1(String housePicture1) {
			this.housePicture1 = housePicture1;
		}
		public String getHousePicture2() {
			return housePicture2;
		}
		public void setHousePicture2(String housePicture2) {
			this.housePicture2 = housePicture2;
		}
		public String getHousePicture3() {
			return housePicture3;
		}
		public void setHousePicture3(String housePicture3) {
			this.housePicture3 = housePicture3;
		}
		public String getHousePicture4() {
			return housePicture4;
		}
		public void setHousePicture4(String housePicture4) {
			this.housePicture4 = housePicture4;
		}
		public String getFacility() {
			return facility;
		}
		public void setFacility(String facility) {
			this.facility = facility;
		}
		public String getHouseIntroduction() {
			return houseIntroduction;
		}
		public void setHouseIntroduction(String houseIntroduction) {
			this.houseIntroduction = houseIntroduction;
		}
		public String getHouseRules() {
			return houseRules;
		}
		public void setHouseRules(String houseRules) {
			this.houseRules = houseRules;
		}
		public Integer getPrice() {
			return price;
		}
		public void setPrice(Integer price) {
			this.price = price;
		}
		public java.util.Date getStartRentTime() {
			return startRentTime;
		}
		public void setStartRentTime(java.util.Date startRentTime) {
			this.startRentTime = startRentTime;
		}
		public java.util.Date getEndRentTime() {
			return endRentTime;
		}
		public void setEndRentTime(java.util.Date endRentTime) {
			this.endRentTime = endRentTime;
		}
		public Boolean getFreeCancel() {
			return freeCancel;
		}
		public void setFreeCancel(Boolean freeCancel) {
			this.freeCancel = freeCancel;
		}
		public String getDisabledDates() {
			return disabledDates;
		}
		public void setDisabledDates(String disabledDates) {
			this.disabledDates = disabledDates;
		}
		public Double getStarCountAverage() {
			return starCountAverage;
		}
		public void setStarCountAverage(Double starCountAverage) {
			this.starCountAverage = starCountAverage;
		}
		public Integer getTotalComment() {
			return totalComment;
		}
		public void setTotalComment(Integer totalComment) {
			this.totalComment = totalComment;
		}
		public static long getSerialversionuid() {
			return serialVersionUID;
		}
		public String getOrderedDates() {
			return orderedDates;
		}
		public void setOrderedDates(String orderedDates) {
			this.orderedDates = orderedDates;
		}	
		

}

