package com.project.loginservice.controller;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.loginservice.pojo.SellerSignupPojo;
import com.project.loginservice.service.SellerSignupService;

@CrossOrigin
@RestController
@RequestMapping("emart")

public class SellerSignupController {

	static Logger LOG = Logger.getLogger(SellerSignupController.class.getClass());

	@Autowired
	SellerSignupService sellerService;

	@GetMapping("validateseller")
	SellerSignupPojo validateSeller(@RequestHeader("Authorization") String data) {
		BasicConfigurator.configure();
		LOG.info("Entered end point \'emart/sellervalidate \' ");
		LOG.info("Exited end point \'emart/sellervalidate \' ");
		String token[] = data.split(":");
		SellerSignupPojo sellerSignupPojo = new SellerSignupPojo();
		sellerSignupPojo.setUsername(token[0]);
		sellerSignupPojo.setPassword(token[1]);
		return sellerService.validateSeller(sellerSignupPojo);

	}

}
