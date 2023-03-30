package com.example.demo.controller;

import java.io.File;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.dao.ConsumerService;
import com.example.demo.dao.ResmenuService;
import com.example.demo.dao.ReviewService;
import com.example.demo.model.Consumer;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Controller // 컨트롤러라고 선언함
public class ConsumerController {
	// Service 인터페이스 객체 생성 및 연결
    @Autowired
    private ConsumerService consumerService;
    
	@Autowired
	private ResmenuService resmenuService;
	
    @Autowired
    private ReviewService reviewService1;
    
	 @Autowired
		HttpSession session;	
	// Service 인터페이스 객체 생성 및 연결
	 
	 //개인 결제내역
    @RequestMapping("/paymentmy.do") 
    public String main(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	String kind = (String)session.getAttribute("KindSession");
    	String id = (String)session.getAttribute("userIdSession");
    	
    	request.setAttribute("kind", kind);
    	request.setAttribute("userId", id);
    	return "/web_payList/payment_my"; // WEB-INF에서 호출할 파일명
    }
    //개인 결제내역 호출
    
	@RequestMapping(value = "/paymentmy.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String paymentmy(Model model,@RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
   		map.put("startNum", Integer.parseInt((String)map.get("startNum"))); // startNum : 가끔 문자열로 들어갈 때가 있음.. 그때는 직접 숫자형으로 변환해야 함
   		map.put("lastNum", Integer.parseInt((String)map.get("lastNum")));	// lastNum : 가끔 문자열로 들어갈 때가 있음.. 그때는 직접 숫자형으로 변환해야 함
   		
		List<Consumer> list = consumerService.selectPaymentmy(map);
		int cnt = consumerService.PaymentmyCnt(map); 	// 숫자
		resultMap.put("cnt", cnt);	// 숫자
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	
    
    @RequestMapping("/reviewwrite.do") 
    public String review(Model model, HttpServletRequest request, HttpServletResponse response, @RequestParam HashMap<String, Object> map) throws Exception{
    	
    	String kind = (String)session.getAttribute("KindSession");
    	String id = (String)session.getAttribute("userIdSession");
    	String nickname = (String)session.getAttribute("userNicknameSession");
    	System.out.println(map);
    	request.setAttribute("map",map);
    	request.setAttribute("nickname", nickname);
    	request.setAttribute("kind", kind);
    	request.setAttribute("userId", id); 
    	return "/review_write"; // WEB-INF에서 호출할 파일명
    }
  

  
  
    // 웹 주소 : 예약 내역 출력
    @RequestMapping("/reservemy.do") 
      public String reservemy(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
      	HashMap<String, Object> map = new HashMap<String, Object>();
      	String menuname = (String)session.getAttribute("userMenunameSession");
      	String id = (String)session.getAttribute("userIdSession");
      	String kind = (String)session.getAttribute("KindSession");
      	
      	request.setAttribute("map", map);	// request : 해당페이지 호출하면서 해당 객체를 불러오는 것
      	request.setAttribute("userMenuname", menuname);
      	request.setAttribute("userId", id); 
    	request.setAttribute("kind", kind);
    	return "/web_payList/reserve_my"; // WEB-INF에서 호출할 파일명
      }
    
    // 	예약 내역 호출
	@RequestMapping(value = "/reservemy.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String firstBoardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Consumer> list = consumerService.ReserveList(map);
		int cnt = consumerService.ReserveCnt(map);	// 갯수 세기
		resultMap.put("list", list);
		resultMap.put("cnt", cnt);	// 갯수 세기
		return new Gson().toJson(resultMap);
	}
	
	
	 // 리뷰 작성 데이터 호출1
		@RequestMapping(value = "/addReview.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String addReview(Model model, HttpServletRequest request, HttpServletResponse response, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			String img = (String) map.get("img"); //!!!!!!!!!!!!!!!!
			consumerService.addReview(map);
			reviewService1.reviewFin(map);
			resultMap.put("message", "성공");
			resultMap.put("reviewnum", map.get("reviewnum"));//*****
			return new Gson().toJson(resultMap);
		}

		// 리뷰 이미지 추가
		 @RequestMapping("/upload2")	// 게시글 업로드릉 위해 필용
		    public String result(@RequestParam("file3") MultipartFile multi, @RequestParam("reviewnum") int reviewnum, HttpServletRequest request,HttpServletResponse response, Model model)
		    {									// "file2"의 이름을 multi 로 하겠다는 의미
		        String url = null;
		        try {
		            String originFilename = multi.getOriginalFilename();	//파일 이름
		            String extName = originFilename.substring(originFilename.lastIndexOf("."),originFilename.length());	// 파일 확장자
		            long size = multi.getSize();
		            String saveFileName = genSaveFileName(extName);	// 현재시간으로 파일이름을 바꾸어서 img 폴더에 저장함으로써 이름이 중복되지 않도록
		            
		            System.out.println("originFilename : " + originFilename);
		            System.out.println("extensionName : " + extName);
		            System.out.println("size : " + size);
		            System.out.println("saveFileName : " + saveFileName);
		            
		            String path2 = System.getProperty("user.dir");	// 작업하고 있는 프로젝트 경로가 담기게 됨
		            System.out.println("Working Directory = " + path2 + "src\\webapp\\img\\reviewUpload");
		            if(!multi.isEmpty())	//이미지가 있을때 
		            {
		                File file = new File(path2 + "\\src\\main\\webapp\\img\\reviewUpload", saveFileName);	//현재 프로젝트 위치에서 + img폴더에 파일을 넣겠다라는 의미 
		                																						// >> 업로드하면 프로젝트에 현재시간으로 자동 저장
		                multi.transferTo(file);
		                
		                HashMap<String, Object> map = new HashMap<String, Object>();
		                map.put("img", "\\img\\reviewUpload\\" + saveFileName);	//경로+파일명 DB 저장	=> xml 파일에서도 #{img} 로 맞추어 줘야 한다~!!!!!!
		                map.put("reviewnum", reviewnum);	// 게시글 번호 DB저장
		                consumerService.insertReviewImg(map);
		                
		                model.addAttribute("filename", multi.getOriginalFilename());
		                model.addAttribute("uploadPath", file.getAbsolutePath());
		                
		                return "filelist";	// board-add 의   form.append( "file1", $("#file1")[0].files[0] ); 파트로 넘어가서 저장될 수 있도록 함 
		            }
		        }catch(Exception e)
		        {
		            System.out.println(e);
		        }
		        return "redirect:join3.do";
		    }

		    // 현재 시간을 기준으로 파일 이름 생성 for 이미지 추가
		    private String genSaveFileName(String extName) {
		        String fileName = "";
		        
		        Calendar calendar = Calendar.getInstance();
		        fileName += calendar.get(Calendar.YEAR);
		        fileName += calendar.get(Calendar.MONTH);
		        fileName += calendar.get(Calendar.DATE);
		        fileName += calendar.get(Calendar.HOUR);
		        fileName += calendar.get(Calendar.MINUTE);
		        fileName += calendar.get(Calendar.SECOND);
		        fileName += calendar.get(Calendar.MILLISECOND);
		        fileName += extName;
		        
		        return fileName;
		    }
}