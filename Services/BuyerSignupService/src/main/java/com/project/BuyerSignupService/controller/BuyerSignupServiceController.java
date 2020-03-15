package com.project.BuyerSignupService.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.BuyerSignupService.model.BuyerSignupServicePojo;
import com.project.BuyerSignupService.service.BuyerSignupService;


@RestController
@CrossOrigin
@RequestMapping("emart")

public class BuyerSignupServiceController {
	
	@Autowired
	BuyerSignupService buyerSignupService;
	@PostMapping("buyer")
	BuyerSignupServicePojo addBuyer(@RequestBody BuyerSignupServicePojo buyerSignupServicePojo)
	{
		return buyerSignupService.addBuyer(buyerSignupServicePojo);
	}

}
