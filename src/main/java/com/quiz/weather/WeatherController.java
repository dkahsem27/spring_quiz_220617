package com.quiz.weather;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.weather.bo.WeatherhistoryBO;
import com.quiz.weather.model.Weatherhistory;

@Controller
public class WeatherController {

	@Autowired
	private WeatherhistoryBO weatherhistoryBO;
	
	/**
	 * 히스토리 목록 화면
	 * @param model
	 * @return
	 */
	@RequestMapping("/weather_history_view")
	public String weatherHistoryView(Model model) {
		
		List<Weatherhistory> weatherhistory = weatherhistoryBO.getWeatherhistory();
		model.addAttribute("weatherhistory", weatherhistory);
		
		return "weather/weatherHistoryView";
	}
	
	/**
	 * 날씨 추가 화면
	 * @return
	 */
	@RequestMapping("/add_weather_history_view")
	public String addWeatherHistoryView() {
		return "weather/addWeatherHistoryView";
	}
	
	@PostMapping("/add_weather_history")
	public String addWeatherHistory(
			// 객체로 받아오기 (추천x)
			// @ModelAttribute Weatherhistory weatherhistory) {
			
			// RequestParam 어노테이션으로 가져오기 (추천)
			// 날짜 포맷으로 변경해주는 어노테이션 붙이기 @RequestParam("date") @DateTimeFormat(pattern="yyyy-MM-dd") Date date
			@RequestParam("date") String date, // String으로 받아오기
			@RequestParam("weather") String weather,
			@RequestParam("temperatures") double temperatures,
			@RequestParam("precipitation") double precipitation,
			@RequestParam("microDust") String microDust,
			@RequestParam("windSpeed") double windSpeed
			) {
		
		// weatherhistoryBO.addWeatherhistory(weatherhistory);
		
		weatherhistoryBO.addWeatherhistory(date, weather, temperatures, precipitation, microDust, windSpeed);
		
   		return "redirect:/weather_history_view";
	}
}
