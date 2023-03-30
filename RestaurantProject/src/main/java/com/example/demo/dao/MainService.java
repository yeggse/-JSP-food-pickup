package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import com.example.demo.model.Area;
import com.example.demo.model.Main;


public interface MainService {
	List<Main> searchStoreList(HashMap<String, Object> map) throws Exception; 
		// TODO Auto-generated method stub
	// 스토어 리스트 : 음식점 출력을 위해 필요
	HashMap<String, Object> getStoreList(HashMap<String, Object> map);
	
	// 데이터 호출을 위한 인터페이스
	List<Main> selectMainList2(HashMap<String, Object> map) throws Exception;
	
	
	// 기본 화면 출력 이벤트 (식당 출력)
	List<Main> getList(HashMap<String, Object> map); // 데이터 호출을 위한 인터페이스
	// 식당명 검색 출력 이벤트
	List<Main> searchList(HashMap<String, Object> map); // 데이터 호출을 위한 인터페이스

	// 메인화면 지역 설정
	List<Main> ListArea(HashMap<String, Object> map); // 데이터 호출을 위한 인터페이스
	Main selectReskind(HashMap<String, Object> map);
	List<Area> selectSiList(HashMap<String, Object> map) throws Exception;
	List<Area> selectGuList(HashMap<String, Object> map) throws Exception;
	List<Area> selectDongList(HashMap<String, Object> map) throws Exception;
	Main searchRes(HashMap<String, Object> map) throws Exception;
}
