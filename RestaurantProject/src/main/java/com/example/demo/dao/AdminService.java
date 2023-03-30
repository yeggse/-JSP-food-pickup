package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import com.example.demo.model.Admin;


public interface AdminService {
	// 일반회원 출력
	List<Admin> normalMemList(HashMap<String, Object> map) throws Exception; 
	// 사업자 회원 출력
	List<Admin> BuMemList(HashMap<String, Object> map) throws Exception; 
	// 일반회원 상세 정보 출력
	HashMap<String, Object> detailmem(HashMap<String, Object>map); 
	// 사업자 상세 정보 출력
	HashMap<String, Object> detailbum(HashMap<String, Object>map); 
	// 일반회원 정보 수정
	void editmem(HashMap<String, Object> map);
	// 사업자 정보 수정
	void editbum(HashMap<String, Object> map);
	// 일반회원 탈퇴
	void deletemem(HashMap<String, Object> map); 
	// 일반회원 갯수 세기
	int countMemCnt(HashMap<String, Object> map);
	// 사업자 회원 갯수 세기
	int countBumCnt(HashMap<String, Object> map);
}
