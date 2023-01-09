package com.triquang.service;

import com.triquang.dto.Purchase;
import com.triquang.dto.PurchaseResponse;

public interface CheckoutService {
	PurchaseResponse placeOrder(Purchase purchase);
}
