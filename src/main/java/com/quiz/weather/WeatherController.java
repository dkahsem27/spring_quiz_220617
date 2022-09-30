package com.quiz.weather;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WeatherController {

	@RequestMapping("/weather_history_view")
	public String weatherHistoryView() {
		
		return "weather/weatherHistoryView";
	}
	
	@RequestMapping("/add_weather_history_view")
	public String addWeatherView() {
		
		return "weather/addWeatherHistoryView";
	}
}
