package com.gf.golboogi.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gf.golboogi.entity.GolfCourseDto;
import com.gf.golboogi.entity.GolfFieldDto;
import com.gf.golboogi.entity.GolfManagerDto;
import com.gf.golboogi.entity.MemberDto;
import com.gf.golboogi.entity.PackageDto;
import com.gf.golboogi.entity.StayDto;
import com.gf.golboogi.repository.AdminDao;
import com.gf.golboogi.repository.AttachmentDao;
import com.gf.golboogi.repository.FieldProfileDao;
import com.gf.golboogi.repository.GolfCourseDao;
import com.gf.golboogi.repository.GolfFieldDao;
import com.gf.golboogi.repository.PackageDao;
import com.gf.golboogi.repository.StayDao;
import com.gf.golboogi.repository.StayProfileDao;
import com.gf.golboogi.service.GolfFieldService;
import com.gf.golboogi.service.StayService;
import com.gf.golboogi.vo.AdminVO;
import com.gf.golboogi.vo.FieldDetailVO;
import com.gf.golboogi.vo.FieldProfileVO;
import com.gf.golboogi.vo.GolfFieldVO;
import com.gf.golboogi.vo.PackageVO;
import com.gf.golboogi.vo.StayProfileVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminDao adminDao;
	@Autowired
	private GolfFieldDao golfFieldDao;
	@Autowired
	private GolfFieldService golfFieldService;
	@Autowired
	private GolfCourseDao golfCourseDao;
	@Autowired
	private StayService stayService;
	@Autowired
	private StayDao stayDao;
	@Autowired
	private StayProfileDao stayProfileDao;
	@Autowired
	private PackageDao packageDao;
	@Autowired
	private AttachmentDao attachmentDao;
	@Autowired
	private FieldProfileDao fieldProfileDao;
	
	
	/* ---------------- 골프장 관리자 관련 ---------------- */
	@GetMapping("/list")
	public String list(Model model) {
		List<AdminVO> vo = adminDao.list();
		model.addAttribute("adminVO", vo);
		//
		List<GolfFieldDto> golfFieldDto = golfFieldDao.searchSimple();
		model.addAttribute("golfFieldDto", golfFieldDto);
		//
		return "admin/list";
	}
	
	@GetMapping("/detail")
	public String detail(@RequestParam String golfManagerId, Model model ) {
		AdminVO adminVO = adminDao.detail(golfManagerId);
		model.addAttribute("adminVO",adminVO);
		return "admin/detail";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam String golfManagerId) {
		boolean success = adminDao.delete(golfManagerId);
		if(success) {
			return "redirect:/admin/list";
		} else {
			return "redirect:/admin/list?error";
		}
	}
	
	@GetMapping("/insert")
	public String insert(Model model) {
		List<GolfFieldDto> golfFieldDto = golfFieldDao.searchSimple();
		model.addAttribute("golfFieldDto", golfFieldDto);
		
		return "admin/insert";
	}
	
	@PostMapping("/insert")
	public String insert(
			@ModelAttribute AdminVO adminVO
			) {
		adminDao.insertManager(adminVO);
		return "redirect:/admin/list";
	}
	
	/* ---------------- 일반회원 관련 ---------------- */
	@GetMapping("/member_list")
	public String memberList(Model model) {
		List<MemberDto> memberList = adminDao.memberList();
		model.addAttribute("memberList" , memberList);
		return "admin/member_list";
	}
	
	@GetMapping("/member_detail")
	public String memberDetail(@RequestParam String memberId, Model model) {
		MemberDto memberDto = adminDao.memberDetail(memberId);
		model.addAttribute("memberDto", memberDto);
		return "admin/member_detail";
	}
	
	@GetMapping("/member_blacklist")
	public String memberBlacklist(@RequestParam String memberId, Model model) {
		MemberDto memberDto = adminDao.memberDetail(memberId);
		model.addAttribute("memberDto", memberDto);
		return "admin/member_blacklist";
	}
	
	@PostMapping("/member_blacklist")
	public String memberBlacklist(@ModelAttribute MemberDto memberDto) {
		String memberId = memberDto.getMemberId();
		boolean success = adminDao.blacklist(memberDto);
		if(success) {
			return "redirect:/admin/member_blacklist?memberId="+memberId;
		} else {
			return "redirect:/admin/member_blacklist?error";
		}
	}
	
	/* ---------------- 관리자 로그인 관련 ---------------- */
	@GetMapping("/login")
	public String login() {
		return "admin/login";
	}
	
	@PostMapping("/login")
	public String login(
			@RequestParam String golfManagerId,
			@RequestParam String golfManagerPw,
			HttpSession session) {
		
		GolfManagerDto golfManagerDto = adminDao.login(golfManagerId, golfManagerPw);
		if(golfManagerDto == null) {
			return "redirect:/admin/login?error";
		} else {
			session.setAttribute("adminLogin", golfManagerDto.getGolfManagerId());
			session.setAttribute("auth", golfManagerDto.getGolfManagerGrade());
			return "redirect:/";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("adminLogin");
		session.removeAttribute("auth");
		return "redirect:/";
	}
	
	/* ---------------- 골프장 관련 ---------------- */
	@GetMapping("/field_insert")
	public String fieldInsert() {
		return "admin/field_insert";
	}
	
	@PostMapping("/field_insert")
	public String fieldInsert(
			@ModelAttribute GolfFieldDto golfFieldDto,
			@RequestParam(value="courseName", required=false) List<String> courseName,
//			@RequestParam(value="courseHole", required=false) List<String> courseHole,
			@RequestParam List<MultipartFile> fieldProfile
			) throws IllegalStateException, IOException {
		
		System.err.println(golfFieldDto);
		System.err.println(courseName);
//		System.err.println(courseHole);
		golfFieldService.insert(golfFieldDto, courseName, fieldProfile);
		
		return "redirect:/admin/field_list";
	}
	
	
	@GetMapping("/field_list")
	public String fieldList(Model model) {
		List<GolfFieldVO> golfFieldVO = golfFieldService.selectFieldList();
		model.addAttribute("golfFieldVO", golfFieldVO);
		
		return "admin/field_list";
	}
	
	@GetMapping("/field_detail")
	public String fieldDetail(@RequestParam int fieldNo, Model model) {
		GolfFieldDto golfFieldDto = golfFieldDao.selectOne(fieldNo);
//		golfFieldDto.setFieldNo(fieldNo);
		model.addAttribute("golfFieldDto", golfFieldDto);
//		System.err.println("golfFieldDto = " + golfFieldDto);
		
		List<GolfCourseDto> golfCourseDto = golfCourseDao.searchCourseList(fieldNo);
		model.addAttribute("golfCourseDto", golfCourseDto);
		System.err.println("golfCourseDto = " + golfCourseDto);
//		log.info("list = {}", list);
		
		return "admin/field_detail";
	}
	
	@PostMapping("/field_detail") 
	public String fieldDetail(
			@ModelAttribute FieldDetailVO fieldDetailVO,
			@RequestBody List<GolfCourseDto> golfCourseDto
			) {
		System.err.println("golfCourseDto ="+fieldDetailVO.getGolfFieldDto());
		System.out.println("1"+fieldDetailVO);
		System.out.println("2"+fieldDetailVO.getGolfFieldDto());
		//golfFieldService.infoEdit(fieldDetailVO.golfFieldDto, golfCourseDto);
//		adminDao.infoEdit(golfFieldDto, golfCourseDto);
		//adminDao.infoEditVO(fieldDetailVO);
		
		return "redirect:/admin/field_list";
	}
	
	@GetMapping("/field_delete")
	public String fieldDelete(@RequestParam int fieldNo) {
		boolean success = golfFieldDao.delete(fieldNo);
		if(success) {
			return "redirect:/admin/field_list";
		} else {
			return "redirect:/admin/field_list?error";
		}
	}
	
	
	@GetMapping("/field_file")
	public String fieldFile(@RequestParam int fieldNo, Model model) {
		GolfFieldDto golfFieldDto = golfFieldDao.selectOne(fieldNo);
//		System.err.println("1234 = " + golfFieldDto);
		model.addAttribute(golfFieldDto);
		List<FieldProfileVO> list = fieldProfileDao.multiInfo(fieldNo);
//		System.err.println("4321 = " + list);
		model.addAttribute("list", list);
		if(list == null) {
			model.addAttribute("profileUrl", "/images/golf-dummy.jpg");
		}
		else {
			model.addAttribute("profileUrl", "/attachment/download?attachmentNo=");
		}
		
		return "admin/field_file";
	}
	
	@GetMapping("/field_file_delete")
	public String fieldFileDelete(@RequestParam int attachmentNo) {
		boolean success = attachmentDao.delete(attachmentNo);
		if(success) {
			return "redirect:/admin/field_list";
		} else {
			return "redirect:/admin/field_list?error";
		}
	}
	
	@GetMapping("/field_file_update")
	public String fieldFileUpdate(@RequestParam int fieldNo, Model model) {
		model.addAttribute("fieldNo", fieldNo);
		return "admin/field_file_update";
	}
	
	@PostMapping("/field_file_update")
	public String fieldFileUpdate(
			@ModelAttribute GolfFieldDto golfFieldDto,
			@RequestParam List<MultipartFile> fieldProfile
			) throws IllegalStateException, IOException{
		int fieldNo = golfFieldDto.getFieldNo();
		System.err.println("1234 = " + golfFieldDto.getFieldNo());
		golfFieldService.update(fieldNo, fieldProfile);
		
		return "redirect:/admin/field_list";
	}
	
	/* ---------------- 숙소 관련 ---------------- */
	
	//숙소 등록 @이기주
	@GetMapping("/stay_insert")
	public String stayInsert() {
		return "admin/stay_insert";
	}
	
	@PostMapping("/stay_insert")
	public String stayInsert(
			@ModelAttribute StayDto stayDto,
			@RequestParam List<MultipartFile> stayProfile
			) throws IllegalStateException, IOException {
		
		stayService.insert(stayDto, stayProfile);
		
		return "redirect:/admin/stay_list";
		
	}
	
	@GetMapping("/stay_list")
	public String stayList(Model model) {
		List<StayDto> stayDto = stayDao.list();
		model.addAttribute("stayDto", stayDto);
		return "admin/stay_list";
	}
	
	@GetMapping("/stay_detail")
	public String stayDetail(@RequestParam int stayNo, Model model) {
		StayDto stayDto = stayDao.one(stayNo);
		stayDto.setStayNo(stayNo);
		model.addAttribute("stayDto", stayDto);
		
		return "admin/stay_detail";
	}
	
	@PostMapping("/stay_detail") 
	public String stayDetail(@ModelAttribute StayDto stayDto) {
		System.err.println("stayDto = " + stayDto);
		stayDao.infoEdit(stayDto);
		return "redirect:/admin/stay_list";
	}
	
	@GetMapping("/stay_delete")
	public String stayDelete(@RequestParam int stayNo) {
		boolean success = stayDao.delete(stayNo);
		if(success) {
			return "redirect:/admin/stay_list";
		} else {
			return "redirect:/admin/stay_list?error";
		}
	}
	
	
	@GetMapping("/stay_file")
	public String stayFile(@RequestParam int stayNo, Model model) {
		StayDto stayDto = stayDao.one(stayNo);
		log.debug("stayDto = {}", stayDto);
		model.addAttribute(stayDto);
		List<StayProfileVO> list = stayProfileDao.multiInfo(stayNo);
		model.addAttribute("list", list);
		if(list == null) {
			model.addAttribute("profileUrl", "/images/golf-dummy.jpg");
		}
		else {
			model.addAttribute("profileUrl", "/attachment/download?attachmentNo=");
		}
		
		return "admin/stay_file";
	}
	
	@GetMapping("/stay_file_delete")
	public String stayFileDelete(@RequestParam int attachmentNo) {
		boolean success = attachmentDao.delete(attachmentNo);
		if(success) {
			return "redirect:/admin/stay_list";
		} else {
			return "redirect:/admin/list?error";
		}
	}
	
	@GetMapping("/stay_file_update")
	public String stayFileUpdate(@RequestParam int stayNo, Model model) {
		model.addAttribute("stayNo", stayNo);
		return "admin/stay_file_update";
	}
	
	@PostMapping("/stay_file_update")
	public String stayFileUpdate(
			@ModelAttribute StayDto stayDto,
			@RequestParam List<MultipartFile> stayProfile
			) throws IllegalStateException, IOException{
		
		stayService.update(stayDto, stayProfile);
		
		return "redirect:/admin/stay_list";
	}
	
	/* ---------------- 패키지 관련 ---------------- */
	
	// 패키지 상품 등록
	@GetMapping("/package_insert")
	public String packageInsert(Model model) {
		List<GolfFieldDto> golfFieldDto = golfFieldDao.searchSimple();
		model.addAttribute("golfFieldDto", golfFieldDto);
		List<StayDto> stayDto = stayDao.list();
		model.addAttribute("stayDto", stayDto);
		return "admin/package_insert";
	}
	
	@PostMapping("/package_insert")
	public String packageInsert(
			@ModelAttribute PackageDto packageDto
			) {
		packageDao.insert(packageDto);
		
		return "redirect:/admin/package_list";
	}
	
	// 패키지 상품 리스트
	@GetMapping("/package_list")
	public String packageList(Model model) {
		List<PackageVO> packageVO = packageDao.list();
		model.addAttribute("packageVO", packageVO);
		return "/admin/package_list";
	}
	
	@GetMapping("/package_delete")
	public String packageDelete(@RequestParam int packageNo) {
		boolean success = packageDao.delete(packageNo);
		if(success) {
			return "redirect:/admin/package_list";
		} else {
			return "redirect:/admin/package_list?error";
		}
	}

	
	@GetMapping("/reset_commission/{fieldNo}")
	public String resetCommission(@PathVariable int fieldNo) {
		golfFieldDao.resetCommission(fieldNo);
		
		return "redirect:/admin/field_list";
	}
	
	
	
	
	
}