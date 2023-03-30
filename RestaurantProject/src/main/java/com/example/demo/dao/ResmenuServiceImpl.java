package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.ResmenuMapper;
import com.example.demo.model.Res;


@Service //서비스임을 선언
public class ResmenuServiceImpl implements ResmenuService{

	@Autowired //Mapper와 연결
	private ResmenuMapper resmenuMapper;
	// 인터페이스 구체화
		@Override
		public List<Res> selectResmenu(HashMap<String, Object> map) throws Exception {
			// TODO Auto-generated method stub
			
			return resmenuMapper.selectResmenu(map); // db를 호출하는 mapper와 연결
		}
		@Override
		public List<Res> selectResmenu1(HashMap<String, Object> map) throws Exception {
			// TODO Auto-generated method stub
			return resmenuMapper.selectResmenu1(map);
		}
		@Override
		public List<Res> selectPaymentmy1(HashMap<String, Object> map) throws Exception {
			// TODO Auto-generated method stub
			return resmenuMapper.selectPaymentmy1(map);
		}
		
		@Override
		public HashMap<String, Object> selectStorecliectedImg(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			Res resimg = resmenuMapper.selectStorecliectedImg(map);
			System.out.println(resimg+"sssssssss");
			resultMap.put("resimg", resimg);
			return resultMap;
		}
		
		//사업자 메뉴관리 페이지에 사용 
		@Override
		public List<Res> selectResmenu2(HashMap<String, Object> map) throws Exception {
			// TODO Auto-generated method stub
			return resmenuMapper.selectResmenu2(map);
		}
		
		//사업자 메뉴관리 페이지 게시물 갯수
		@Override
		public int selectResmenuCnt(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			return resmenuMapper.selectResmenuCnt(map);
		}
		
		@Override
		public int insertreserve(HashMap<String, Object> map) throws Exception {
			// TODO Auto-generated method stub
			return resmenuMapper.insertreserve(map);
		}
		
		// 사업자 예약 관리
		@Override
		public List<Res> businessNowRes(HashMap<String, Object> map) throws Exception {
			// TODO Auto-generated method stub
			return resmenuMapper.businessNowRes(map);
		}
		// 사업자 예약관리 페이지 게시물 갯수
		@Override
		public int NowResCnt(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			return resmenuMapper.NowResCnt(map);
		}
		
		
		// 사업자 판매완료 버튼 이벤트
		@Override
		public void saleFin(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			resmenuMapper.saleFin(map);
		}
		//재고수정
		@Override
		public void editSupply(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			resmenuMapper.editSupply(map);
		}
		
		//사업자 매출관리
		@Override
		public HashMap<String, Object> totalSales(HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> result = new HashMap<String, Object>();
			List<Res> list =  resmenuMapper.totalSales(map);
			int cnt = resmenuMapper.totalSalesCnt(map);	// 사업자 매출관리 갯수
			int total = resmenuMapper.totalCount(map);
			result.put("list", list);
			result.put("cnt", cnt);
			result.put("total", total);
			// TODO Auto-generated method stub
			return result;
		}
		
		
		//일시품절 버튼
		@Override
		public void soldout(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			resmenuMapper.soldout(map);
			
		}
		//다시판매 버튼
		@Override
		public void resell(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			resmenuMapper.resell(map);
			
		}
		@Override
		public void deleteresmenu(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			resmenuMapper.deleteresmenu(map);
		}
		

		
		
		

}