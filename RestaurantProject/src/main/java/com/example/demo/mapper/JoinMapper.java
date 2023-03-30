package com.example.demo.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Join;



@Mapper
public interface JoinMapper {
	int insertMember(HashMap<String, Object> map);
	int insertRes(HashMap<String, Object> map);
	int selectCheck(HashMap<String, Object> map) throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음
	int selectresnumCheck(HashMap<String, Object> map) throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음
	int selectnickCheck(HashMap<String, Object> map) throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음
	Join searchpw(HashMap<String, Object> map) throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음
	Join selectLoginList(HashMap<String, Object> map) throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음
	List<Join> searchid(HashMap<String, Object> map) throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음

//	int pwdchange(HashMap<String, Object> map); // xml파일 접근 및 db 호출결과 리턴 받음
//	List<Join> pwdchange(HashMap<String, Object> map); // xml파일 접근 및 db 호출결과 리턴 받음
	void pwdchange(HashMap<String, Object> map); //선생님 버전1
	
	// 회원정보변경
	void datachange(HashMap<String, Object> map); //선생님 버전1


}


