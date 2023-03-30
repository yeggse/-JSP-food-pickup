package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import com.example.demo.model.Res;


public interface ResmenuService {
	List<Res> selectResmenu(HashMap<String, Object> map) throws Exception; // 데이터 호출을 위한 인터페이스
	List<Res> selectResmenu1(HashMap<String, Object> map) throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음
	List<Res> selectPaymentmy1(HashMap<String, Object> map) throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음
	
	//	사업자 메뉴관리 페이지에 사용 
	List<Res> selectResmenu2(HashMap<String, Object> map) throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음
	
	//사업자 매출관리
	HashMap<String, Object> totalSales(HashMap<String, Object> map) throws Exception;
	
	// 사업자 예약 관리
	List<Res> businessNowRes(HashMap<String, Object> map) throws Exception;
	// 사업자 예약관리 페이지 게시물 갯수
	int NowResCnt(HashMap<String, Object> map);
	
	HashMap<String, Object> selectStorecliectedImg(HashMap<String, Object> map);
	int insertreserve(HashMap<String, Object> map) throws Exception;
	
	// 사업자 판매완료 버튼 이벤트
	void saleFin(HashMap<String, Object> map);	//update
	// 재고수정
	void editSupply(HashMap<String, Object> map);
	
	void deleteresmenu(HashMap<String, Object>map);
	//일시품절 버튼
	void soldout(HashMap<String, Object> map);	
	//다시판매 버튼
	void resell(HashMap<String, Object> map);
	
	//사업자 메뉴관리 페이지 게시물 갯수
	int selectResmenuCnt(HashMap<String, Object> map);	

}
