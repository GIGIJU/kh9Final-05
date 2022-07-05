package com.gf.golboogi.controller;

import java.net.URISyntaxException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gf.golboogi.entity.GolfFieldDto;
import com.gf.golboogi.entity.StayDto;
import com.gf.golboogi.error.CannotFindException;
import com.gf.golboogi.repository.GolfFieldDao;
import com.gf.golboogi.repository.StayDao;
import com.gf.golboogi.service.KakaoPayService;
import com.gf.golboogi.vo.KakaoPayApproveRequestVO;
import com.gf.golboogi.vo.KakaoPayReadyRequestVO;
import com.gf.golboogi.vo.KakaoPayReadyResponseVO;
import com.gf.golboogi.vo.ReserveVO;


@Controller
@RequestMapping("/package") 
public class PackageController {
	
	@Autowired
	private StayDao stayDao;
	
	@Autowired
	private GolfFieldDao golfFieldDao;
	
	@Autowired
	private KakaoPayService kakaoPayService;
	
	

	//패키지 목록
	@GetMapping("/list")
	public String list(Model model) {
	    List<StayDto> list = stayDao.list();
	    List<GolfFieldDto> list2 = golfFieldDao.selectList();
		model.addAttribute("list",list);
		model.addAttribute("list2",list2);
		return "package/list";
	}
	
	@GetMapping("/detail")
	public String insert(@RequestParam int stayNo, Model model) {
		StayDto stayDto = stayDao.one(stayNo);
		model.addAttribute("stayDto", stayDto);
		return "package/detail";
	}
	
	@GetMapping("/edit")
	public String edit() {
		return "package/edit";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam int stayNo){
		boolean success = stayDao.delete(stayNo);
		if(success) {
			return "redirect:list";
		}
		else {
			throw new CannotFindException();
		}
	}
	
	@GetMapping("/reserve")
	public String reserve(@RequestParam int stayNo, Model model) {
		StayDto stayDto = stayDao.one(stayNo);
		model.addAttribute("stayDto",stayDto);
		return "package/reserve";
	}

//	@PostMapping("/reserve")
//	public String reserve(
//				//@RequestParam int no, @RequestParam int quantity
//				@ModelAttribute ReserveVO reserveVO, HttpSession session
//			) throws URISyntaxException {
//		
//		StayDto stayDto = stayDao.one(reserveVO.getStayNo());
//		//상품이 없다면 결제가 진행되지 않도록 처리
//		if(stayDto  == null) {
//			return "redirect:reserve";
//		}
//		
//		//결제 준비(ready) 요청을 진행
//		int totalAmount =stayDto.getStayPrice() * 4; //패키지금액으로 변경 예정
//		KakaoPayReadyRequestVO requestVO = 
//									KakaoPayReadyRequestVO.builder()
//												.partner_order_id(UUID.randomUUID().toString())
//												.partner_user_id("testuser1") //멤버 이름으로 변경 예정
//												.item_name(stayDto.getStayName())
//												.quantity(reserveVO.getQuantity())
//												.total_amount(totalAmount)
//											.build();
//		KakaoPayReadyResponseVO responseVO = kakaoPayService.ready(requestVO);
//		
//		//결제성공 페이지에서 승인요청을 보내기 위해 알아야할 데이터 3개를 세션에 임시로 추가한다
//		//-> 결제가 성공할지 실패할지 취소될지 모르기 때문에 모든 경우에 추가한 데이터를 지워야 한다
//		session.setAttribute("pay", KakaoPayApproveRequestVO.builder()
//																.tid(responseVO.getTid())
//																.partner_order_id(requestVO.getPartner_order_id())
//																.partner_user_id(requestVO.getPartner_user_id())
//															.build());
//		//추가적으로 결제성공 페이지에서 완료정보를 등록하기 위해 알아야 할 상품구매개수 정보를 같이 전달
//		session.setAttribute("reserve", reserveVO);//상품이 1개라면
//
//		
//		//결제 번호도 세션으로 전달
////		session.setAttribute("stayNo", stayNo);
//		
//		return "redirect:"+responseVO.getNext_redirect_pc_url();
//	}

}
	