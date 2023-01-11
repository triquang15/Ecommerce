package com.triquang.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.triquang.entity.Customer;

public interface CustomerRepository extends JpaRepository<Customer, Long> {
	
	Customer findByEmail(String theEmail);
	
}
