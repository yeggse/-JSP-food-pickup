package com.example.demo.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Area;
import com.example.demo.model.Main;


@Mapper
public interface MainMapper {
	List<Main> searchStoreList(HashMap<String, Object> map) throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음
	List<Main> selectMainList2(HashMap<String, Object> map) throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음
	Main selectstore(HashMap<String, Object> map);
	
	// 기본 화면 출력 이벤트 (식당 출력)
	List<Main> firstList(HashMap<String, Object> map); // xml파일 접근 및 db 호출결과 리턴 받음

	// 식당명 검색 출력 이벤트
	List<Main> searchList(HashMap<String, Object> map); // xml파일 접근 및 db 호출결과 리턴 받음	
//	List<Main> searchListArea(HashMap<String, Object> map);
	
	// 지역 검색 출력 이벤트
	List<Main> regionSearch(HashMap<String, Object> map);	
	Main selectReskind(HashMap<String, Object> map);
	List<Area> selectSiList(HashMap<String, Object> map) throws Exception;
	List<Area> selectGuList(HashMap<String, Object> map) throws Exception;
	List<Area> selectDongList(HashMap<String, Object> map) throws Exception;
	// 사진 클릭 후 레스토랑 검색(resnum통함)
	Main searchRes(HashMap<String, Object> map) throws Exception;
}
