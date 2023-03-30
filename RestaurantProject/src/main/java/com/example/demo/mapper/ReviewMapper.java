package com.example.demo.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Review;

@Mapper
public interface ReviewMapper {
	
	List<Review> selectreviewList(HashMap<String, Object> map) throws Exception;
	
	// 관리자 리뷰 리스트
	List<Review> adminReviewList(HashMap<String, Object> map) throws Exception;
	// 관리자 리뷰 갯수
	int countAdminRCnt(HashMap<String, Object> map);
	// 관리자 리뷰 상세 출력
	Review ARevDetail(HashMap<String, Object> map);
	//관리자 리뷰 삭제
	void deleteARev(HashMap<String, Object> map); 
	
	
	// 사업자 리뷰리스트
	List<Review> BuReviewList(HashMap<String, Object> map) throws Exception;
	// 사업자 리뷰리스트 갯수
	int BuReviewCnt(HashMap<String, Object> map);
	
	
	void reviewFin(HashMap<String, Object> map);
	//리뷰상세출력
	Review detailReviewboard(HashMap<String, Object> map);
	// 댓글
	void insertComment(HashMap<String, Object> map);
	// 댓글 작성 표시
	void insertCommentCheck(HashMap<String, Object> map);
	
	//DB별점넣기 평점순대로 할려고
	List<Review> gradebring(HashMap<String, Object> map) throws Exception;

	void gradeupgrade(HashMap<String, Object> map);
	//평점대 식당나열
	List<Review> Resarray(HashMap<String, Object> map) throws Exception;
}
