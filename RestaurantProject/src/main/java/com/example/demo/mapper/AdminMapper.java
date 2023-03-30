package com.example.demo.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Admin;

@Mapper
public interface AdminMapper {
	// 일반회원 출력
	List<Admin> normalMemList(HashMap<String, Object> map) throws Exception;	
	// 사업자 회원 출력
	List<Admin> BuMemList(HashMap<String, Object> map) throws Exception;
	
	// 일반회원 상세 정보 출력
	Admin detailmem(HashMap<String, Object> map); // xml파일 접근 및 db 호출결과 리턴 받음
	// 사업자 상세 정보 출력
	Admin detailbum(HashMap<String, Object> map); // xml파일 접근 및 db 호출결과 리턴 받음
	
	// 일반회원 정보 수정
	void editmem(HashMap<String, Object> map); 
	// 사업자회원 정보 수정
	void editbum(HashMap<String, Object> map); 
	
	// 일반회원 탈퇴
	void deletemem(HashMap<String, Object> map); 
	// 사업자회원 검색
	List<Admin> searchBum(HashMap<String, Object> map) throws Exception;
	
	// 일반회원 수 세기
	int countMemCnt(HashMap<String, Object> map);
	// 사업자회원 수 세기
	int countBumCnt(HashMap<String, Object> map);
}
