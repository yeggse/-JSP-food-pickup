package com.example.demo.dao;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.MenuMapper;
import com.example.demo.model.Menu;



@Service //서비스임을 선언
public class MenuServiceImpl implements MenuService{

	@Autowired //Mapper와 연결
	private MenuMapper menuMapper;

	// 메뉴 추가
	@Override
	public void addMenu(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		System.out.println(map.get("resnum")+" svim;");
		menuMapper.addMenu(map);	//추가만 존재함으로 return이 필요 없다!
	}
	
	//메뉴 이미지 추가
	@Override
	public void insertMenuImg(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		menuMapper.insertMenuImg(map);
	}

	// 메뉴 상세보기
	@Override
	public HashMap<String, Object> detailMenu(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		// 조회수 
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Menu board = menuMapper.detailMenu(map);
		resultMap.put("board", board);
		return resultMap;
	}	
	// 메뉴 수정
	@Override
	public void editMenu(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		menuMapper.editMenu(map);
	}
}