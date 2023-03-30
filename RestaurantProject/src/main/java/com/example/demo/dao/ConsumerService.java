
  package com.example.demo.dao;
  
  import java.util.HashMap;
import java.util.List;

import com.example.demo.model.Consumer;
  
  
  public interface ConsumerService { 
	  // 예약 내역 출력 
	  List<Consumer> ReserveList(HashMap<String, Object> map) throws Exception;
	 // 예약 내역 갯수	  
	  int ReserveCnt(HashMap<String, Object> map);
	//리뷰 이미지 추가
	  void insertReviewImg(HashMap<String, Object> map);
	// 리뷰글 추가
	  void addReview(HashMap<String, Object> map);
	  
	 //개인 결제내역
	  List<Consumer> selectPaymentmy(HashMap<String, Object> map) throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음
	// 결제내역 개수
	  int PaymentmyCnt(HashMap<String, Object> map);
}
 