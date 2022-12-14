package com.quiz.weather.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.weather.dao.WeatherhistoryDAO;
import com.quiz.weather.model.Weatherhistory;

@Service
public class WeatherhistoryBO {

	@Autowired
	private WeatherhistoryDAO weatherhistoryDAO;
	
	public List<Weatherhistory> getWeatherhistory() {
		return weatherhistoryDAO.selectWeatherhistory();
	}
	
	// public void addWeatherhistory(Weatherhistory weatherhistory) {
	// 	weatherhistoryDAO.insertWeatherhistory(weatherhistory);
	// }
	
	public void addWeatherhistory(String date, String weather, double temperatures, double precipitation, String microDust, double windSpeed) {
		weatherhistoryDAO.insertWeatherhistory(date, weather, temperatures, precipitation, microDust, windSpeed);
	}
}
