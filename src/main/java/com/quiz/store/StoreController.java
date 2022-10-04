package com.quiz.store;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreController {

	@RequestMapping("/store_list_view")
	public String storeListView(Model model) {
		//List<Store> store = 
		///model.addAttribute("store", store);
		
		return "store/storeListView";
	}
}
