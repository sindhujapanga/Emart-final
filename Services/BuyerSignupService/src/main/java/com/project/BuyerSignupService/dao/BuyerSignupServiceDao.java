package com.project.BuyerSignupService.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.project.BuyerSignupService.dao.entity.BuyerSignupServiceEntity;


@Repository
public interface BuyerSignupServiceDao extends JpaRepository<BuyerSignupServiceEntity,Integer> {

}
