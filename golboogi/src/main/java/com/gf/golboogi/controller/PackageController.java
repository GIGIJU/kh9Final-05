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
import com.gf.golboogi.entity.PackageDto;
import com.gf.golboogi.entity.StayDto;
import com.gf.golboogi.error.CannotFindException;
import com.gf.golboogi.repository.GolfFieldDao;
import com.gf.golboogi.repository.PackageDao;
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
	

    //패키지 목록
//	@GetMapping("/list")
//	public String list(Model model) {
//		List<PackageDto> list = packageDao.list();
//		model.addAttribute("list",list);
//		return "package/list";
//	}
	
	//패키지 상세
//	@GetMapping("/detail")
//	public String detail(@RequestParam int packageNo, Model model) {
//		PackageDto packageVo = packageDao.one(packageNo);
//		model.addAttribute("packageDto", packageDto);
//		return "package/detail";
//	}

	//패키지 예약내역 확인 페이지 
//	@GetMapping("/reserve")
//	public String reserve(@RequestParam int stayNo, Model model) {
//		StayDto stayDto = stayDao.one(stayNo);
//		model.addAttribute("stayDto",stayDto);
//		return "package/reserve";
//	}

}
	