package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import model.bean.HouseInformationBean;
import model.dao.HouseInformationDAO;

@RestController
public class HouseRESTfulController {
	@Autowired
	private HouseInformationDAO houseInformationDAO;
	
	@GetMapping(value = {"/house/{houseID}"})
	public ResponseEntity<?> testmethod(@PathVariable String houseID) {
		HouseInformationBean bean = houseInformationDAO.select(houseID);
		
		if (bean != null) {
			return new ResponseEntity<>(bean, HttpStatus.OK);
		}else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
	}
}
