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

import com.gf.golboogi.entity.BookingDto;
import com.gf.golboogi.entity.GolfFieldDto;
import com.gf.golboogi.entity.MemberDto;
import com.gf.golboogi.entity.PackageDto;
import com.gf.golboogi.entity.PackageReserveDto;
import com.gf.golboogi.entity.StayDto;
import com.gf.golboogi.error.CannotFindException;
import com.gf.golboogi.repository.GolfFieldDao;
import com.gf.golboogi.repository.MemberDao;
import com.gf.golboogi.repository.PackageDao;
import com.gf.golboogi.repository.PackageReserveDao;
import com.gf.golboogi.repository.StayDao;
import com.gf.golboogi.service.KakaoPayService;
import com.gf.golboogi.vo.KakaoPayApproveRequestVO;
import com.gf.golboogi.vo.KakaoPayReadyRequestVO;
import com.gf.golboogi.vo.KakaoPayReadyResponseVO;
import com.gf.golboogi.vo.PackageVO;
import com.gf.golboogi.vo.ReserveVO;
import com.gf.golboogi.vo.Teetime1VO;


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
	private PackageReserveDao packageReserveDao;
	

    //패키지 목록
	@GetMapping("/list")
	public String list(Model model) {
		List<PackageVO> list = packageDao.list();
		model.addAttribute("list",list);
		return "package/list";
	}
	
	//패키지 상세
	@GetMapping("/detail")
	public String detail(@RequestParam int packageNo, Model model ) {
		PackageVO packageVo = packageDao.one(packageNo);
		model.addAttribute("packageVo", packageVo);
		return "package/detail";
	}

	//패키지 예약내역 확인 페이지 
	@GetMapping("/reserve")
	public String reserve(@RequestParam int packageNo, Model model ) {
		PackageVO packageVo = packageDao.one(packageNo);
		model.addAttribute("packageVo", packageVo);
		return "package/reserve";
	}
	
	@PostMapping("/reserve")
	public String reserve(@ModelAttribute int packageNo, PackageReserveDto packageReserveDto, HttpSession session ) {
		String memberId = (String) session.getAttribute("login");
		MemberDto memberDto = memberDao.info(memberId);
		String memberName = memberDto.getMemberName();
		packageReserveDto.setMemberId(memberId);
		packageReserveDao.reserve(packageReserveDto);
		return "redirect:reserve_finish";
	}
	
	@GetMapping("/reserve_finish")
	public String reserveFinish() {
		return "booking/reserve_finish";
	}
}
	