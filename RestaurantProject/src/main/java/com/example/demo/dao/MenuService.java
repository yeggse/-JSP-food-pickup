package com.example.demo.dao;

import java.util.HashMap;



public interface MenuService {
	// 메뉴 추가
	void addMenu(HashMap<String, Object> map);	//add / insert
	// 메뉴 이미지 추가
	void insertMenuImg(HashMap<String, Object> map);
	// 메뉴 상세 보기
	HashMap<String, Object> detailMenu(HashMap<String, Object> map);
	// 메뉴 수정
	void editMenu(HashMap<String, Object> map);
}
