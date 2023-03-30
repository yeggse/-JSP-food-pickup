package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.MainMapper;
import com.example.demo.model.Area;
import com.example.demo.model.Main;

@Service //서비스임을 선언
public class MainServiceImpl implements MainService{

	@Autowired //Mapper와 연결
	private MainMapper mainMapper;

	// 인터페이스 구체화
	@Override
	public List<Main> searchStoreList(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
		return mainMapper.searchStoreList(map); // db를 호출하는 mapper와 연결
	}
	
	// 인터페이스 구체화
		@Override
		public List<Main> selectMainList2(HashMap<String, Object> map) throws Exception {
			// TODO Auto-generated method stub
			
			return mainMapper.selectMainList2(map); // db를 호출하는 mapper와 연결
		}

		@Override
		public HashMap<String, Object> getStoreList(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			// 조회수 
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			// mainMapper.updateCnt(map);	: 음식점 조회수 올리기
//			List<Main> commentList = boardMapper.selectCommentList(map);	>>??
			Main store = mainMapper.selectstore(map);
			// resultMap.put("commentList", commentList);	>>??
			resultMap.put("store", store);
			return resultMap;
		}
		
		
		// 기본 화면 출력 이벤트 (식당 출력)
		@Override
		public List<Main> getList(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			return mainMapper.firstList(map);
		}
		
		// 식당명 검색 출력 이벤트
		@Override
		public List<Main> searchList(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			return mainMapper.searchList(map);
		} 
		
		// 지역 검색 이벤트
		@Override
		public List<Main> ListArea(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			return mainMapper.regionSearch(map);
		}
		@Override
		public List<Area> selectSiList(HashMap<String, Object> map) throws Exception {
			// TODO Auto-generated method stub
			return mainMapper.selectSiList(map);
		}

		@Override
		public Main selectReskind(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			return mainMapper.selectReskind(map);
		}
		
		@Override
		public Main searchRes(HashMap<String, Object> map) throws Exception {
			return mainMapper.searchRes(map);
		}
		@Override
		public List<Area> selectDongList(HashMap<String, Object> map) throws Exception {
			// TODO Auto-generated method stub
			return mainMapper.selectDongList(map);
		}
		@Override
		public List<Area> selectGuList(HashMap<String, Object> map) throws Exception {
			// TODO Auto-generated method stub
			return mainMapper.selectGuList(map);
		}
}