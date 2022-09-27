package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson04.bo.SellerBO;
import com.quiz.lesson04.model.Seller;

@RequestMapping("/lesson04/quiz01")
@Controller
public class Lesson04Quiz01Controller {

	@Autowired
	private SellerBO sellerBO;
	
	// http://localhost:8080/lesson04/quiz01/add_seller_view
	@GetMapping("/add_seller_view")
	public String addSellerView() {
		return "lesson04/add_seller";
	}
	
	// http://localhost:8080/lesson04/quiz01/add_seller
	@PostMapping("/add_seller")
	public String addSeller(
			@RequestParam("nickname") String nickname,
			@RequestParam(value="profileImageUrl", required=false) String profileImageUrl,
			@RequestParam("temperature") double temperature) {
		
		sellerBO.addSeller(nickname, profileImageUrl, temperature);
		
		return "lesson04/after_add_seller";
	}
	
	// http://localhost:8080/lesson04/quiz01/get_seller_info_view
	// http://localhost:8080/lesson04/quiz01/get_seller_info_view?id=1
	@GetMapping("/get_seller_info_view")
	public String GetSellerInfoView(Model model,
			@RequestParam(value="id", defaultValue="1") int id) {
		
		Seller seller = sellerBO.getSellerInfo(id);
				
		model.addAttribute("subject", "판매자 정보");
		model.addAttribute("result", seller);
		
		return "lesson04/getSellerInfo";
	}
}
