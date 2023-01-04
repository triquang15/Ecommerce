package com.triquang.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.triquang.entity.Product;

public interface ProductRepository extends JpaRepository<Product, Long> {

}
