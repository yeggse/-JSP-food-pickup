package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import com.example.demo.model.Join;

public interface JoinService {
     int getMemberList(HashMap<String, Object> map);
     int getRes(HashMap<String, Object> map);
     int getresnumCheck(HashMap<String, Object> map) throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음
     int getCheck(HashMap<String, Object> map) throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음
     int getnickCheck(HashMap<String, Object> map) throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음
     Join searchpw(HashMap<String, Object> map) throws Exception; 
     Join selectLoginList(HashMap<String, Object> map) throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음
     
 	 List<Join> searchid(HashMap<String, Object> map) throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음
//     int pwdchange(HashMap<String, Object> map);
//     List<Join> pwdchange(HashMap<String, Object> map);
     
     void pwdchange(HashMap<String, Object> map); //선생님 버전
     
     // 회원 정보변경
     void datachange(HashMap<String, Object> map); //선생님 버전1
}
