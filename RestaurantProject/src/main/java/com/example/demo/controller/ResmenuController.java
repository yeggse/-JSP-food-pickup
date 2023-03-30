package com.example.demo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dao.MainService;
import com.example.demo.dao.ResmenuService;
import com.example.demo.model.Main;
import com.example.demo.model.Res;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller // 컨트롤러라고 선언함12
public class ResmenuController {
	// Service 인터페이스 객체 생성 및 연결
	@Autowired
	private ResmenuService resmenuService;
	
	@Autowired
    private MainService mainService;

	@Autowired
    HttpSession session;
	// 웹 주소
	@RequestMapping("/Home.do")
	public String home(Model model) throws Exception {

		return "/main"; // WEB-INF에서 호출할 파일명
	}
	//////////////////테스트 결제///////////////////////
	@RequestMapping("/join3.do")
	public String main2(Model model, HttpServletRequest request, HttpServletResponse response, @RequestParam HashMap<String, Object> map) throws Exception {
		String id = (String)session.getAttribute("userIdSession");	
    	String kind = (String)session.getAttribute("KindSession");
    	String name = (String)session.getAttribute("userNameSession");
    	String phonenum = (String)session.getAttribute("userPhonenumSession");
    	String acc = (String)session.getAttribute("userAccSession");
    	request.setAttribute("map", map);
    	System.out.println(map);
    	request.setAttribute("userName", name);
    	request.setAttribute("userPhonenum", phonenum);
    	request.setAttribute("userAcc", acc);
    	request.setAttribute("userId", id);
    	request.setAttribute("kind", kind);
		Main res = mainService.searchRes(map); // resnum을 통해 레스토랑 찾아주는 과정
		request.setAttribute("res",  new Gson().toJson(res));
		return "/join3"; // WEB-INF에서 호출할 파일명
	}
	
	// 사업자 예약 관리
    @RequestMapping("/reservebusiness.do") 
    public String menumanagement2(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	String kind = (String)session.getAttribute("KindSession");
    	String id = (String)session.getAttribute("userIdSession");
		if(kind.equals("B")) { // 사업자 이면! 
	    	Integer resnum = (Integer)session.getAttribute("userResnumSession");
	    	String reskind = (String)session.getAttribute("userReskindSession");
	    	request.setAttribute("reskind", reskind); 
	    	request.setAttribute("resnum",resnum); 
	    	
		}
		
    	request.setAttribute("kind", kind);
    	request.setAttribute("userId", id);
    	return "/web_business/reservebusiness"; // WEB-INF에서 호출할 파일명
    }
    
    // 사업자 예약관리 호출
    @RequestMapping(value = "/businessNowRes.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String businessNowRes(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		map.put("startNum", Integer.parseInt((String)map.get("startNum"))); // startNum : 가끔 문자열로 들어갈 때가 있음.. 그때는 직접 숫자형으로 변환해야 함
   		map.put("lastNum", Integer.parseInt((String)map.get("lastNum")));   	
		List<Res> list = resmenuService.businessNowRes(map);
		int cnt = resmenuService.NowResCnt(map);	//게시글 갯수 세기
		resultMap.put("list", list);
		resultMap.put("cnt", cnt);	//게시글 갯수 세기
		return new Gson().toJson(resultMap);
	}
    
    //사업자 메뉴관리 페이지 
    @RequestMapping("/menumanagement.do") 
    public String menumanagement(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	String kind = (String)session.getAttribute("KindSession");
    	String id = (String)session.getAttribute("userIdSession");
		if(kind.equals("B")) { // 사업자 이면! 
	    	Integer resnum = (Integer)session.getAttribute("userResnumSession");
	    	String reskind = (String)session.getAttribute("userReskindSession");
	    	request.setAttribute("reskind", reskind); 
	    	request.setAttribute("resnum",resnum); 
	    	System.out.println("메뉴관리 세션 넘어옴"); 
	    	System.out.println(resnum+" resnum");
	    	System.out.println(reskind+" reskind");
		}
    	request.setAttribute("kind", kind);
    	request.setAttribute("userId", id);
    	return "/web_business/menuManagement"; // WEB-INF에서 호출할 파일명1
    }
    
    //사업자 메뉴관리 호출
	@RequestMapping(value = "/selectResmenu2.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String firstResmenu2(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		map.put("startNum", Integer.parseInt((String)map.get("startNum"))); // startNum : 가끔 문자열로 들어갈 때가 있음.. 그때는 직접 숫자형으로 변환해야 함
   		map.put("lastNum", Integer.parseInt((String)map.get("lastNum")));   		
		List<Res> list = resmenuService.selectResmenu2(map);
		int cnt = resmenuService.selectResmenuCnt(map);	
		resultMap.put("list", list);
		resultMap.put("cnt", cnt);
		return new Gson().toJson(resultMap);
	}

	// 데이터 호출
	@RequestMapping(value = "/Res.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String resmenu(Model model,HttpServletRequest request, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Res> list = resmenuService.selectResmenu(map); // DB 접근 및 쿼리를 통한 데이터 호출
		resultMap.put("list", list);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/Res1.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String resmenu1(Model model,@RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Res> list = resmenuService.selectResmenu1(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	//payment_my
	@RequestMapping(value = "/Res2.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String paymentmy(Model model,@RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Res> list = resmenuService.selectPaymentmy1(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/Res/get.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String insertreserve(Model model,@RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int list = resmenuService.insertreserve(map);
		if(list>0) {
 			resultMap.put("result", "success");
 		}else {
 			resultMap.put("result", "fail");
 		}
		resultMap.put("list", list);
		resmenuService.editSupply(map);
		resultMap.put("message", "성공");
		
		return new Gson().toJson(resultMap);
	}
	
	// 사업자 판매완료 버튼 이벤트
	@RequestMapping(value = "/saleFin.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String saleFin(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resmenuService.saleFin(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/deleteresmenu.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String deleteresmenu(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		String json = map.get("list").toString();
		ObjectMapper mapper = new ObjectMapper();
	    List<Map<String, Object>> list = mapper.readValue(json, new TypeReference<ArrayList<Map<String, Object>>>(){});
		map.put("list", list);
	    resmenuService.deleteresmenu(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	
	// 사업자 일시품절 버튼
	@RequestMapping(value = "/soldout.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String soldout(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resmenuService.soldout(map);
			
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	
	// 사업자 다시판매 버튼
	@RequestMapping(value = "/resell.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String resell(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resmenuService.resell(map);
		
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	
	
    // 사업자 매출 출력 페이지
    @RequestMapping("/paymentbusiness.do") 
    public String menumanagement3(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	String kind = (String)session.getAttribute("KindSession");
    	String id = (String)session.getAttribute("userIdSession");
	    Integer resnum = (Integer)session.getAttribute("userResnumSession");
	    String reskind = (String)session.getAttribute("userReskindSession");
	    request.setAttribute("reskind", reskind); 
	    request.setAttribute("resnum",resnum); 
		
    	request.setAttribute("kind", kind);
    	request.setAttribute("userId", id);
    	return "/web_business/totalSales"; // WEB-INF에서 호출할 파일명
    }
    
    // 사업자 매출 출력 페이지 호출
    @RequestMapping(value = "/totalSales.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String reserveBoard1(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		map.put("startNum", Integer.parseInt((String)map.get("startNum"))); // startNum : 가끔 문자열로 들어갈 때가 있음.. 그때는 직접 숫자형으로 변환해야 함
   		map.put("lastNum", Integer.parseInt((String)map.get("lastNum")));
   		resultMap = resmenuService.totalSales(map);
		return new Gson().toJson(resultMap);
	}
}