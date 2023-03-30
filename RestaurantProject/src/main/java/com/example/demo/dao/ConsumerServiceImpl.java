
package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.ConsumerMapper;
import com.example.demo.model.Consumer;

@Service // 서비스임을 선언
public class ConsumerServiceImpl implements ConsumerService {

	@Autowired 	// Mapper와 연결
	private ConsumerMapper consumerMapper;

	// 예약내역 출력
	@Override
	public List<Consumer> ReserveList(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
		int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
		map.put("startNum", startNum);
		map.put("lastNum", lastNum);
		return consumerMapper.ReserveList(map);
	}
	 // 예약 내역 갯수	  
	@Override
	public int ReserveCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return consumerMapper.ReserveCnt(map);
	}
	
	@Override
	public void insertReviewImg(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
			consumerMapper.insertReviewImg(map);
	}
	//리뷰글 추가
	@Override
	public void addReview(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		consumerMapper.addReview(map);
	}
	
	//개인 결제내역	
	@Override
	public List<Consumer> selectPaymentmy(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return consumerMapper.selectPaymentmy(map);
	}
	// 결제내역 개수
	@Override
	public int PaymentmyCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return consumerMapper.PaymentmyCnt(map);
	}

	
}
