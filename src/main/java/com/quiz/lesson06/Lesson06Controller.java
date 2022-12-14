package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.FavoriteBO;
import com.quiz.lesson06.model.Favorite;

@Controller
public class Lesson06Controller {

	@Autowired
	private FavoriteBO favoriteBO;
	
	@RequestMapping("/lesson06/add_favorite_view")
	public String addFavoriteView() {
		return "lesson06/addFavorite";
	}
	
	// AJAX가 호출하는 API => @ResponseBody 있어야함
	@ResponseBody
	@PostMapping("/lesson06/add_favorite")
	public String addFavorite(
			@RequestParam("name") String name,
			@RequestParam("url") String url) {
		
		favoriteBO.addFavorite(name, url);
		
		return "success";
	}
	
	@GetMapping("/lesson06/get_favorite_view")
	public String getFavoriteView(Model model) {
		
		List<Favorite> favoriteList = favoriteBO.getFavoriteList();
		
		model.addAttribute("favoriteList", favoriteList);
		
		return "lesson06/getFavorite";
	}
	
	// quiz02
	@ResponseBody
	@PostMapping("/lesson06/is_duplication_url")
	public Map<String, Boolean> isDuplicationUrl(
			@RequestParam("url") String url) {
		
		Map<String, Boolean> result = new HashMap<>();
		
		Favorite favorite = favoriteBO.getFavoriteByUrl(url);
		if (favorite == null) {
			result.put("isDuplication", false);
		} else {
			result.put("isDuplication", true);
		}
		
		return result;  // json string
	}
	
	// AJAX가 호출 -> ResponseBody
	@ResponseBody
	@DeleteMapping("/lesson06/delete_favorite")
	public Map<String, Object> deleteFavorite(
			@RequestParam("id") int id) {
		Map<String, Object> result = new HashMap<>();
		
		int deleteRow = favoriteBO.deleteFavorite(id);
		if (deleteRow > 0) {
			result.put("code", 100); // 100이면 성공 => 서버가 지정
			result.put("result", "성공");
		} else {
			result.put("code", 500); // 500이면 실패 => 서버가 지정
			result.put("errorMessage", "삭제 실패");
		}
		return result;
	}
}
