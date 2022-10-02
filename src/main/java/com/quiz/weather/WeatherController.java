package com.quiz.weather;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.weather.bo.WeatherhistoryBO;
import com.quiz.weather.model.Weatherhistory;

@Controller
public class WeatherController {

	@Autowired
	private WeatherhistoryBO weatherhistoryBO;
	
	@RequestMapping("/weather_history_view")
	public String weatherHistoryView(Model model) {
		
		List<Weatherhistory> weatherhistory = weatherhistoryBO.getWeatherhistory();
		model.addAttribute("weatherhistory", weatherhistory);
		
		return "weather/weatherHistoryView";
	}
	
	@RequestMapping("/add_weather_history_view")
	public String addWeatherHistoryView() {
		
		return "weather/addWeatherHistoryView";
	}
	
	@PostMapping("/add_weather_history")
	public String addWeatherHistory(
			@ModelAttribute Weatherhistory weatherhistory) {
		
		weatherhistoryBO.addWeatherhistory(weatherhistory);
		
   		return "redirect:/weather_history_view";
	}
}
