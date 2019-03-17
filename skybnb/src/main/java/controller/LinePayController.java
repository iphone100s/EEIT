package controller;

import org.json.JSONObject;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import model.bean.LinePayBean;

@RestController
public class LinePayController {
	
	@RequestMapping(
			method = RequestMethod.POST,
			path = { "LinePayController" }
			)
	public String linepay(LinePayBean bean) throws Exception {
	String URL =
			"https://sandbox-api-pay.line.me/v2/payments/request";
	RestTemplate template = new RestTemplate();
//產生呼叫REST API的RequestEntity物件
		java.net.URI url = new java.net.URI(URL);
		
		MultiValueMap<String, String> headers = new HttpHeaders();
		headers.add("content-type", "application/json");
		headers.add("x-line-channelid", "1607235379");
		headers.add("x-line-channelsecret", "ea7a809251f571db963eebc648b7c9e8");
		
		LinePayBean beans = new LinePayBean();
		beans.setProductName(bean.getProductName());
		beans.setProductImageUrl(null);
		beans.setAmount(bean.getAmount());
		beans.setCurrency("TWD");
		beans.setConfirmUrl("http://localhost:8080/skybnb/successLinePay.jsp");
		beans.setOrderId(bean.getOrderId());

		
		RequestEntity<?> request = new RequestEntity<>(beans, headers, HttpMethod.POST, url);
		
//		RequestEntity<?> request = new RequestEntity<>(HttpMethod.POST, url);
//利用RestTemplate的exchange()方法送出RequestEntity、並取回ResponseEntity
		ResponseEntity<String> response = 
				template.exchange(request, String.class);
		
//利用ResponseEntity物件取得必要資料
		HttpStatus statusCode = response.getStatusCode();
		HttpHeaders resheaders = response.getHeaders();
		String body = response.getBody();
		
		
		JSONObject jsonbody = new JSONObject(body);
		String website = (String) jsonbody.getJSONObject("info").getJSONObject("paymentUrl").get("web");
		
		return website;
	}

}
