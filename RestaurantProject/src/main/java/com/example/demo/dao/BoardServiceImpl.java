package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.BoardMapper;
import com.example.demo.model.Board;


@Service //서비스임을 선언
public class BoardServiceImpl implements BoardService{

	@Autowired //Mapper와 연결
	private BoardMapper boardMapper;

		// 게시글 기본 출력
		@Override
		public List<Board> firstBoard(HashMap<String, Object> map) throws Exception {
			// TODO Auto-generated method stub
			int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
			int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
			map.put("startNum", startNum);
			map.put("lastNum", lastNum);
			return boardMapper.firstBoardList(map);
		}
		
		//게시글 갯수 세기
		@Override
		public int countBoardCnt(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			return boardMapper.countBoardCnt(map);
		}
		
		
		// 게시글 상세 출력
		@Override
		public HashMap<String, Object> detailBoard(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			// 조회수 
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			boardMapper.updateCnt(map);		//게시글 조회수 상승
		//	List<Board> commentList = boardMapper.selectCommentList(map);
			Board board = boardMapper.detailBoard(map);
		//	resultMap.put("commentList", commentList);
			resultMap.put("board", board);
			return resultMap;
		}

		//게시글 수정
		@Override
		public void editBoard(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			boardMapper.editBoard(map);	//수정만 존재함으로 return이 필요 없다!
		}
		// 게시글 추가
		@Override
		public void insertBoard(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			boardMapper.addBoard(map);	//추가만 존재함으로 return이 필요 없다!
		}
		// 게시글 삭제
		@Override
		public void deleteBoard(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			boardMapper.deleteBoard(map);
		}
		
		//게시글 이미지 추가
		@Override
		public void insertBoardImg(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			boardMapper.insertBoardImg(map);
		}
		


		
}