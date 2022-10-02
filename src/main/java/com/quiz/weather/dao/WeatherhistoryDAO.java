package com.quiz.weather.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.quiz.weather.model.Weatherhistory;

@Repository
public interface WeatherhistoryDAO {

	public List<Weatherhistory> selectWeatherhistory();
	
	public void insertWeatherhistory(Weatherhistory weatherhistory);
}
