package com.project.loginservice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.loginservice.dao.SellerSignupDao;
import com.project.loginservice.entity.SellerSignupEntity;
import com.project.loginservice.pojo.SellerSignupPojo;

@Service

public class SellerSignupServiceImpl implements SellerSignupService {
	
	@Autowired
	SellerSignupDao sellerDao;

	@Override
	public SellerSignupPojo validateSeller(SellerSignupPojo sellerSignupPojo) {
		SellerSignupEntity sellerSignupEntity = sellerDao.findByUsernameAndPassword(sellerSignupPojo.getUsername(),sellerSignupPojo.getPassword());
	
		sellerSignupPojo =new SellerSignupPojo(sellerSignupEntity.getId(),sellerSignupEntity.getUsername(),sellerSignupEntity.getPassword(),
				sellerSignupEntity.getCompany(),sellerSignupEntity.getBrief(),sellerSignupEntity.getGst(),sellerSignupEntity.getAddress(),
				sellerSignupEntity.getEmail(),sellerSignupEntity.getWebsite(),sellerSignupEntity.getContact(),null);
	
	return sellerSignupPojo;
	
	}
	

}
