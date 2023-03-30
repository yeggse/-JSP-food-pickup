package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.AdminMapper;
import com.example.demo.model.Admin;


@Service //서비스임을 선언
public class AdminServiceImpl implements AdminService{

	@Autowired //Mapper와 연결
	private AdminMapper adminMapper;
	
	// 일반회원 출력
	@Override
	public List<Admin> normalMemList(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
		int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
		map.put("startNum", startNum);
		map.put("lastNum", lastNum);
		return adminMapper.normalMemList(map);
	}
	
	// 사업자 회원 출력
	@Override
	public List<Admin> BuMemList(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
		int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
		map.put("startNum", startNum);
		map.put("lastNum", lastNum);
		return adminMapper.BuMemList(map);
	}
	
	// 일반회원 상세 정보 출력
	@Override
	public HashMap<String, Object> detailmem(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		// 조회수 
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
	//	boardMapper.updateCnt(map);
	//	List<Board> commentList = boardMapper.selectCommentList(map);
		Admin admin = adminMapper.detailmem(map);
	//	resultMap.put("commentList", commentList);
		resultMap.put("board", admin);
		return resultMap;
	}
	// 관리자 상세 정보 출력
	@Override
	public HashMap<String, Object> detailbum(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		// 조회수 
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Admin admin = adminMapper.detailbum(map);
		resultMap.put("board", admin);
		return resultMap;
	}
	
	//일반회원 정보 수정
	@Override
	public void editmem(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		adminMapper.editmem(map);
	}
	// 일반회원 탈퇴
	@Override
	public void deletemem(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		adminMapper.deletemem(map);
	}
	
	// 사업자 정보 수정
	@Override
	public void editbum(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		adminMapper.editbum(map);
	}
	// 일반회원 수
	@Override
	public int countMemCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return adminMapper.countMemCnt(map);
	}
	// 사업자 수
	@Override
	public int countBumCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return adminMapper.countBumCnt(map);
	}



		
}