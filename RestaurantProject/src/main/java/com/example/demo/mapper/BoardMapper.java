package com.example.demo.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Board;


@Mapper
public interface BoardMapper {
	// 게시글 기본출력
	List<Board> firstBoardList(HashMap<String, Object> map) throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음
	
	// 게시글 갯수 세기
	int countBoardCnt(HashMap<String, Object> map);
	
	
	// 게시글 상세 출력
	Board detailBoard(HashMap<String, Object> map); // xml파일 접근 및 db 호출결과 리턴 받음
	
	// 게시글 수정
	void editBoard(HashMap<String, Object> map);	//update
	
	// 게시글 추가
	void addBoard(HashMap<String, Object> map);	//insert
	
	// 게시글 삭제
	void deleteBoard(HashMap<String, Object>map);	// delete
	
	//게시글 이미지 추가
	void insertBoardImg(HashMap<String, Object> map);
	// 게시글 조회수 상승
	void updateCnt(HashMap<String, Object> map);	
}
