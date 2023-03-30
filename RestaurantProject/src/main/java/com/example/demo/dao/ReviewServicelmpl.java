package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.ReviewMapper;
import com.example.demo.model.Review;


@Service //서비스임을 선언
public class ReviewServicelmpl implements ReviewService{

	@Autowired //Mapper와 연결
	private ReviewMapper reviewMapper;
	
	@Override
	public List<Review> selectreviewList(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return reviewMapper.selectreviewList(map);
	}
	
	//관리자 리뷰리스트
	@Override
	public List<Review> adminReviewList(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return reviewMapper.adminReviewList(map);
	}
	// 관리자 리뷰 갯수
	@Override
	public int countAdminRCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return reviewMapper.countAdminRCnt(map);
	}
	// 관리자 리뷰 상세 출력
	@Override
	public HashMap<String, Object> ARevDetail(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Review review = reviewMapper.ARevDetail(map);
		resultMap.put("board", review);
		return resultMap;
	}
	//관리자 리뷰 삭제
	@Override
	public void deleteARev(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		reviewMapper.deleteARev(map);
	}
	
	
	
	//사업자 리뷰리스트
	@Override
	public List<Review> BuReviewList(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return reviewMapper.BuReviewList(map);
	}
	// 사업자 리뷰리스트 갯수
	@Override
	public int BuReviewCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return reviewMapper.BuReviewCnt(map);
	}
	

	@Override
	public void reviewFin(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		reviewMapper.reviewFin(map);
	}
	@Override
	public HashMap<String, Object> detailReviewboard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Review review = reviewMapper.detailReviewboard(map);
		resultMap.put("review", review);
		return resultMap;
	}

	@Override
	public void insertComment(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		reviewMapper.insertComment(map);
		reviewMapper.insertCommentCheck(map);
	}
	@Override
	public List<Review> gradebring(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return reviewMapper.gradebring(map);
	}
	@Override
	public void gradeupgrade(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		reviewMapper.gradeupgrade(map);
	}
	@Override
	public List<Review> Resarray(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return reviewMapper.Resarray(map);
	}
}