package com.example.demo.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dao.ReviewService;
import com.example.demo.model.Review;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Controller // 컨트롤러라고 선언함
public class ReviewController {
	// Service 인터페이스 객체 생성 및 연결
	 
	@Autowired
	private ReviewService reviewservice;

    @Autowired
    HttpSession session;
	
	//리뷰 리스트 검색
    
    @RequestMapping(value = "/searchReview.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchReview(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Review> list = reviewservice.selectreviewList(map); // DB 접근 및 쿼리를 통한 데이터 호출 
		resultMap.put("list1", list);
		return new Gson().toJson(resultMap);
	}
    
    
    //관리자용 식당리뷰 리스트
    @RequestMapping("/reviewadmin.do") 
    public String review1(Model model,HttpServletRequest request, HttpServletResponse response, @RequestParam HashMap<String, Object> map) throws Exception{
    	String kind = (String)session.getAttribute("KindSession");
    	String id = (String)session.getAttribute("userIdSession");
    	
    	request.setAttribute("map", map);
    	request.setAttribute("kind", kind);
    	request.setAttribute("userId", id); 
    	return "/web_review/reviewadmin"; // WEB-INF에서 호출할 파일명
    }
    //관리자용 식당리뷰 리스트 호출
    @RequestMapping(value = "/adminReviewList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
   	@ResponseBody
   	public String searchReviewkind(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
   		HashMap<String, Object> resultMap = new HashMap<String, Object>();
   		map.put("startNum", Integer.parseInt((String)map.get("startNum"))); // startNum : 가끔 문자열로 들어갈 때가 있음.. 그때는 직접 숫자형으로 변환해야 함
   		map.put("lastNum", Integer.parseInt((String)map.get("lastNum")));	// lastNum : 가끔 문자열로 들어갈 때가 있음.. 그때는 직접 숫자형으로 변환해야 함
   		List<Review> list = reviewservice.adminReviewList(map); // DB 접근 및 쿼리를 통한 데이터 호출 
   		int cnt = reviewservice.countAdminRCnt(map);	// 숫자 세기
   		resultMap.put("list1", list);
   		resultMap.put("cnt", cnt);	// 숫자 세기
   		return new Gson().toJson(resultMap);
   	}
    
    // 웹 주소 :  관리자용 리뷰 상세보기
    @RequestMapping("/arevdetail.do") 
    public String ARevDetail(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
    	String id = (String)session.getAttribute("userIdSession");
    	request.setAttribute("map", map);	// request : 해당페이지 호출하면서 해당 객체를 불러오는 것
    	String kind = (String)session.getAttribute("KindSession");
    	request.setAttribute("userId", id);
    	request.setAttribute("kind", kind);
    	return "/web_review/ARevDetail"; // WEB-INF에서 호출할 파일명
    }
    //   관리자용 리뷰 상세 출력 데이터 호출
	@RequestMapping(value = "/ARevDetail.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String ARevDetailList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = reviewservice.ARevDetail(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	//관리자 리뷰 삭제 호출
	@RequestMapping(value = "/deleteARev.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String deleteARevList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		reviewservice.deleteARev(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}	
	
	
	
	 //사업자용 식당리뷰 리스트	
    @RequestMapping("/review.do") 
    public String reviewadmin(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	String kind = (String)session.getAttribute("KindSession");
    	String id = (String)session.getAttribute("userIdSession");
		// 사업자 이면! 
	    	Integer resnum = (Integer)session.getAttribute("userResnumSession");
	    	String reskind = (String)session.getAttribute("userReskindSession");
	    	String resname = (String)session.getAttribute("userResnameSession");
	    	request.setAttribute("reskind", reskind); 
	    	request.setAttribute("resnum",resnum); 
	    	request.setAttribute("resname",resname); 
		
    	request.setAttribute("kind", kind);
    	request.setAttribute("userId", id);
    	return "/web_review/reviewBusiness"; // WEB-INF에서 호출할 파일명
    }
    
  //사업자용 식당리뷰 리스트 호출
    @RequestMapping(value = "/BuReviewList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
   	@ResponseBody
   	public String searchReview2(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
   		HashMap<String, Object> resultMap = new HashMap<String, Object>();
   		map.put("startNum", Integer.parseInt((String)map.get("startNum"))); // startNum : 가끔 문자열로 들어갈 때가 있음.. 그때는 직접 숫자형으로 변환해야 함
   		map.put("lastNum", Integer.parseInt((String)map.get("lastNum")));	// lastNum : 가끔 문자열로 들어갈 때가 있음.. 그때는 직접 숫자형으로 변환해야 함
   		List<Review> list = reviewservice.BuReviewList(map); // DB 접근 및 쿼리를 통한 데이터 호출 
   		int cnt = reviewservice.BuReviewCnt(map); // 숫자 세기
   		resultMap.put("list1", list);
   		resultMap.put("cnt", cnt);	// 숫자 세기
   		return new Gson().toJson(resultMap);
   	}
    
    
    
    
    @RequestMapping(value = "/reviewFin.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String reviewFin(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		reviewservice.reviewFin(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
 // 리뷰관리 주소 :  게시글 상세보기
    @RequestMapping("/review.board.detail.do") 
    public String boardDetail(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
    	String id = (String)session.getAttribute("userIdSession");
    	request.setAttribute("map", map);	// request : 해당페이지 호출하면서 해당 객체를 불러오는 것
    	String kind = (String)session.getAttribute("KindSession");
    	System.out.println(map.get("reviewnum"));
    	request.setAttribute("userId", id);
    	request.setAttribute("kind", kind);
    	return "/web_business/reviewDetail"; // WEB-INF에서 호출할 파일명
    }
    // 리뷰 상세 출력 데이터 호출
   	@RequestMapping(value = "/detailReviewboard.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
   	@ResponseBody
   	public String detailReviewList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
   		HashMap<String, Object> resultMap = new HashMap<String, Object>();
   		resultMap = reviewservice.detailReviewboard(map);
   		resultMap.put("message", "성공");
   		return new Gson().toJson(resultMap);
   	}
 // 리뷰 댓글 출력 데이터 호출
   	@RequestMapping(value = "/reviewcomment.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String comment(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		reviewservice.insertComment(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
 // DB가져오기 호출
   	@PostMapping(value = "/review/gradebring.dox", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String gradebring1(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
   		List<Review> list2 = reviewservice.selectreviewList(map); // DB 접근 및 쿼리를 통한 데이터 호출 
   		resultMap.put("list1", list2);
   		reviewservice.gradeupgrade(map);
   		System.out.println(list2);
   		return new Gson().toJson(resultMap);
	}
   	
}
