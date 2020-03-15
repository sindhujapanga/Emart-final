package com.project.BuyerSignupService.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.BuyerSignupService.dao.BuyerSignupServiceDao;
import com.project.BuyerSignupService.dao.entity.BuyerSignupServiceEntity;
import com.project.BuyerSignupService.model.BuyerSignupServicePojo;

@Service
public class BuyerSignupServiceImpl implements BuyerSignupService  {
	
	@Autowired
	BuyerSignupServiceDao buyerDao;

	@Override
	public BuyerSignupServicePojo addBuyer(BuyerSignupServicePojo buyerPojo) {

		BuyerSignupServiceEntity buyerEntity=new BuyerSignupServiceEntity(buyerPojo.getId(),buyerPojo.getUsername(),buyerPojo.getPassword(),buyerPojo.getEmail(),buyerPojo.getMobile(),buyerPojo.getDate());
		buyerEntity=buyerDao.saveAndFlush(buyerEntity);
		buyerPojo.setId(buyerEntity.getId());
		return buyerPojo;
		
	}
	
	

}
