package com.gf.golboogi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gf.golboogi.entity.MemberDto;
import com.gf.golboogi.entity.PackageReserveDto;
import com.gf.golboogi.repository.GolfFieldDao;
import com.gf.golboogi.repository.MemberDao;
import com.gf.golboogi.repository.PackageDao;
import com.gf.golboogi.repository.PackageReserveDao;
import com.gf.golboogi.repository.PaymentDao;
import com.gf.golboogi.repository.StayDao;
import com.gf.golboogi.repository.StayProfileDao;
import com.gf.golboogi.vo.PackageReserveVO;
import com.gf.golboogi.vo.PackageVO;
import com.gf.golboogi.vo.StayProfileVO;


@Controller
@RequestMapping("/package") 
public class PackageController {
	
	@Autowired
	private StayDao stayDao;
	
	@Autowired
	private PackageDao packageDao;
	
	
	@Autowired
	private GolfFieldDao golfFieldDao;
	
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private PaymentDao paymentDao;
	
	@Autowired
	private StayProfileDao stayProfileDao;
	
	@Autowired
	private PackageReserveDao packageReserveDao;
	

    //패키지 목록
//	@GetMapping("/list")
//	public String list(Model model) {
//		List<PackageVO> list = packageDao.list();
//		model.addAttribute("list",list);
//		return "package/list";
//	}
	
	//패키지 상세
	@GetMapping("/detail")
	public String detail(@RequestParam int packageNo, int stayNo, Model model ) {
		PackageVO packageVo = packageDao.one(packageNo);
		System.out.println("packageVo >>>" + packageVo);
		System.out.println("packageVo.getStayNo() >>>" + packageVo.getStayNo());
		//StayDto no = stayDao.one(stayNo);
		model.addAttribute("packageVo", packageVo);
		//model.addAttribute("no", no);
		
		//프로필 받아오는 부분 
		List<StayProfileVO> list = stayProfileDao.profileOne(packageVo.getStayDto().getStayNo());
		model.addAttribute("list", list);
		if(list == null) {
			//System.out.println("111 >>>" + list);
			model.addAttribute("profileUrl", "/images/no-round.svg");
		}
		else {
			//System.out.println("222 >>>" + list);
			model.addAttribute("profileUrl", "/attachment/download?attachmentNo=");
		}
		
		System.out.println("list = " + list);
		return "package/detail";
	}
	
	//패키지 검색
	@GetMapping("/list")
	public String list(
			@RequestParam (required = false) String stayPrice, 
			//@RequestParam(required = false) String packageDepart,
			@RequestParam(required = false) String stayLocal,
			Model model) {
		List<PackageVO> list = packageDao.list(stayPrice,stayLocal);
		model.addAttribute("list",list);
		
		return "package/list";
	}

	//패키지 예약내역 확인 페이지 
	@GetMapping("/reserve")
	public String reserve(@RequestParam int packageNo,
			Model model, MemberDto memberDto, PackageReserveDto packageReserveDto,HttpSession session ) {
		PackageVO packageVo = packageDao.one(packageNo);
		
		String memberId = (String) session.getAttribute("login");  
		memberDto = memberDao.info(memberId); 
		packageReserveDto.setMemberId(memberId);
		
		//예약자 이름. 이메일. 번호 가져오기 
		String memberName = memberDto.getMemberName();
		String memberEmail = memberDto.getMemberEmail();
		String memberPhone = memberDto.getMemberPhone();
		
		model.addAttribute("memberDto", memberDto );
		model.addAttribute("packageVo", packageVo);
		model.addAttribute("packageReserveDto",packageReserveDto);

		return "package/reserve";
	}
	
	//예약
	@PostMapping("/reserve")
	public String reserve(@RequestParam int packageNo, Model model, PackageReserveDto packageReserveDto, HttpSession session) {
		PackageVO packageVo = packageDao.one(packageNo);
		
		String memberId = (String) session.getAttribute("login");
		MemberDto memberDto = memberDao.info(memberId);
		packageReserveDto.setMemberId(memberId);
		
		model.addAttribute("memberDto", memberDto );
		model.addAttribute("packageVo", packageVo);
		model.addAttribute("packageReserveDto",packageReserveDto);
		
		packageReserveDao.reserve(packageReserveDto);
		return "redirect:reserve_finish";
	}
	
	@GetMapping("/reserve_finish")
	public String reserveFinish() {
		return "package/reserve_finish";
	}
	
	//예약 목록 보기
	@GetMapping("/reserve_list")
	public String reserveList(Model model,HttpSession session) {
		String memberId = (String) session.getAttribute("login");  
		List<PackageReserveVO> reserveList = packageReserveDao.reserveList(memberId);
		
		System.out.println("list = " + paymentDao.list());
		model.addAttribute("list", paymentDao.list());
		
		System.out.println("reserveList = " + reserveList);
		//System.out.println("reserveList >>> = " + JSONObject.wrap(reserveList)  );
		//System.out.println("reserveList >>> = " + reserveList.get(0).getClass(). );  // GolfFieldDto
		model.addAttribute("reserveList", reserveList);
		return "package/reserve_list";
	}
	
	@GetMapping("/cancel/{packageBookingNo}")
	public String cancel(@PathVariable int packageBookingNo, HttpSession session){
		System.out.println("packageBookingNo >>> " + packageBookingNo);
		packageReserveDao.cancel(packageBookingNo);
	
		return "redirect:/package/reserve_list";
	}
	
	@PostMapping("/reserveConfirm")
	@ResponseBody
	public Map<String, Integer> reserveConfirm(PackageReserveDto packageReserveDto) {
		int count = packageReserveDao.reserveConfirm(packageReserveDto);
		Map<String, Integer> result = new HashMap<>();
		result.put("count", count);
		return result;
	}
	
}
	