package com.gf.golboogi.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.Format;
import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Cookie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gf.golboogi.entity.BookingDto;
import com.gf.golboogi.entity.CertDto;
import com.gf.golboogi.entity.MemberDto;
import com.gf.golboogi.error.CannotFindException;
import com.gf.golboogi.repository.AttachmentDao;
import com.gf.golboogi.repository.BookingDao;
import com.gf.golboogi.repository.CertDao;
import com.gf.golboogi.repository.MemberDao;
import com.gf.golboogi.repository.MemberProfileDao;
import com.gf.golboogi.service.MailService;
import com.gf.golboogi.service.MemberService;


@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private MailService mailService;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@Autowired
	private MemberProfileDao memberProfileDao;
	
	@Autowired
	private CertDao certDao;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BookingDao bookingDao;
	
	@GetMapping("/join")
	public String join() {
		return "member/join";
	}
	
	@PostMapping("/join")
	public String join(
			@ModelAttribute MemberDto memberDto,
			@RequestParam MultipartFile memberProfile
				)throws IllegalStateException, IOException {
		MemberDto idfindDto = memberDao.info(memberDto.getMemberId());
		MemberDto nickfindDto = memberDao.selectNick(memberDto.getMemberNick());
		MemberDto phonefindDto = memberDao.selectPhone(memberDto.getMemberPhone());
		boolean check1 = idfindDto != null;
		boolean check2 = nickfindDto != null;
		boolean check3 = phonefindDto != null;
		if(check1) {
			return "redirect:join?error=1";
		}
		if(check2) {
			return "redirect:join?error=2";
		}
		if(check3) {
			return "redirect:join?error=3";
		}
		
		if(!check1 && !check2 && !check3) {
			memberService.join(memberDto, memberProfile);
			return "redirect:join_success";
		}
		throw new CannotFindException();
	}
	
	@GetMapping("/join_success")
	public String joinSuccess() {
		return "member/join_success";
	}
	
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	
	@PostMapping("/login")
	public String login(
			@RequestParam String memberId,
			@RequestParam String memberPw,
			@RequestParam(required=false) String remember,
			HttpSession session,
			HttpServletResponse response) {
		
		MemberDto memberDto = memberDao.login(memberId,memberPw);
		if(memberDto != null && memberDto.getMemberGrade()==1) {
			return "member/blacklist"; // 로그인시 블랙리스트인지 판정 / 이기주
		} 
		
		if(memberDto != null) {//로그인 성공
			//세션
			session.setAttribute("login", memberDto.getMemberId());
			session.setAttribute("auth", memberDto.getMemberGrade());
			
			//쿠키
			if(remember != null) {//체크하고 로그인 했으면 -> 쿠키 발행
				Cookie ck = new Cookie("saveId", memberDto.getMemberId());
				ck.setMaxAge(4 * 7 * 24 * 60 * 60);//4주
				response.addCookie(ck);
			}
			else {//체크안하고 로그인 했으면 -> 쿠키 삭제
				Cookie ck = new Cookie("saveId", memberDto.getMemberId());
				ck.setMaxAge(0);
				response.addCookie(ck);
			}
			return "redirect:/";
		}
		else {//로그인 실패
			return "redirect:login?error";
		}
		
		
	}

	@GetMapping("/blacklist")
	public String blacklist(HttpSession session) {
			return "member/blacklist";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
			session.removeAttribute("login");
			session.removeAttribute("auth");
			return "redirect:/";
	}
	
	@GetMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
		String memberId = (String) session.getAttribute("login");
		
		MemberDto memberDto = memberDao.info(memberId);
		model.addAttribute("memberDto", memberDto);
		
		//프로필 이미지의 다운로드 주소를 추가
		// - member_profile 에서 아이디를 이용하여 단일조회를 수행
		// - http://localhost:8080/home/attachment/download?attachmentNo=OOO
		int attachmentNo = memberProfileDao.info(memberId);
		if(attachmentNo == 0) {
			model.addAttribute("profileUrl", "/images/user.png");
		}
		else {
			model.addAttribute("profileUrl", "/attachment/download?attachmentNo=" + attachmentNo);
		}
		
		return "member/mypage";
	}
	
	@GetMapping("/edit")
	public String edit(HttpSession session, Model model) {
		String memberId = (String) session.getAttribute("login");
		MemberDto memberDto = memberDao.info(memberId);
		model.addAttribute("memberDto", memberDto);
		return "member/edit";
	}
	
	@PostMapping("/edit")
	public String edit(HttpSession session,@ModelAttribute MemberDto memberDto) {
		String memberId = (String) session.getAttribute("login");
		memberDto.setMemberId(memberId);
		memberDao.changeInformation(memberDto);
		return "redirect:mypage";
	}
	
	@GetMapping("/password")
	public String password() {
		return "member/password";
	}
	
	@PostMapping("/password")
	public String password(
			@RequestParam String memberPw,
			@RequestParam String changePw,
			HttpSession session) {
		String memberId = (String) session.getAttribute("login");
		memberDao.ChangePassword(memberId,memberPw,changePw);
		return "redirect:mypage";
	}
	
	@GetMapping("/exit")
	public String exit(
			Model model,
			HttpSession session
			) {
		String memberId = (String) session.getAttribute("login");
		model.addAttribute("memberId",memberId);
		return "member/exit";
	}
	
	@PostMapping("/exit")
	public String exit(HttpSession session,
		@RequestParam String memberPw
			) {
		String memberId = (String)session.getAttribute("login");
		memberDao.exit(memberId, memberPw);
		session.removeAttribute("login");
		return "redirect:exit_success";
	}
	
	@GetMapping("/exit_success")
	public String exitSuccess() {
		return "member/exit_success";
	}
	
	@GetMapping("/find_id")
	public String findId() {
		return "member/find_id";
	}
	
	@PostMapping("/find_id")
	public String findId(
			@ModelAttribute MemberDto memberDto,
			HttpSession session,
			Model model) {
		String memberId = memberDao.findId(memberDto);
		if(memberId == null) {
			return "redirect:find_id?error";
		}
		else {
			model.addAttribute("findUserId", memberId);
			return "member/find_id_success";
		}
	}
	
	@GetMapping("/find_id_success")
	public String findIdSuccess() {
		return "member/find_id_success";
	}
	
	
	@GetMapping("/find_pw")
	public String findPw() {
		return "member/find_pw";
	}
	
	//Email
	@PostMapping("/find_pw")
	public String findPw(@ModelAttribute MemberDto memberDto) throws MessagingException {
		MemberDto findDto = memberDao.findPw(memberDto);
		if(findDto == null) {
//			throw new CannotFindException();
			return "redirect:find_pw?error";
		}
		if(findDto.getMemberEmail() == null) {
			return "redirect:email_is_null";
		}
		
		//남은 회원들(정보도 맞고 이메일도 있는 회원)에개 이메일 발송
		mailService.sendPasswordResetMail(findDto);
		return "redirect:find_pw_send_mail";
	}
	
	@GetMapping("/email_is_null")
	public String emailisNull() {
		return "error/email_is_null";
	}
	
	private Random r = new Random();
	private Format f = new DecimalFormat("000000");
	
	@GetMapping("/reset")
	public String reset(
			@RequestParam String memberId, 
			@RequestParam String cert,
			Model model) {
//		CertDto certDto = new CertDto();
//		certDto.setCertTarget(customerId);
//		certDto.setCertNumber(cert);
		
		CertDto certDto = CertDto.builder().certTarget(memberId).certNumber(cert).build();
		boolean isOk = certDao.check(certDto);
		if(isOk) {
			//추가 인증번호 생성 및 페이지로 전달
			String newCert = f.format(r.nextInt(1000000));
			certDao.insert(CertDto.builder()
					.certTarget(memberId)
					.certNumber(newCert)
					.build());
			model.addAttribute("cert",newCert);
			return "member/reset";
		}else {
			return "redirect:reset?error";
		}
	}
	
	@PostMapping("/reset")
	public String reset(
			@ModelAttribute MemberDto memberDto,
			@RequestParam String cert
			) {
		boolean isOk = certDao.check(CertDto.builder()
				.certTarget(memberDto.getMemberId())
				.certNumber(cert)
				.build());
		
		if(isOk) {
			boolean result = memberDao.changPassword(memberDto);
			if(result) {
				return "redirect:reset_success";
			}
		}
		return "redirect:reset?error";
	}
	
	@GetMapping("/reset_success")
	public String resetSuccess() {
		return "member/reset_success";
	}
	
	
	@GetMapping("/find_pw_send_mail")
	public String findPwSendMail() {
		return "member/find_pw_send_mail";
	}
	
	@GetMapping("/changeInfo")
	public String changeInfo() {
		return "member/changeInfo";
	}
	
	//내예약 
	@GetMapping("/myreservation")
	public String myreservation(HttpSession session,Model model) {
		String memberId = (String)session.getAttribute("login");
		List<BookingDto> list = bookingDao.info(memberId);
		model.addAttribute("list",list);
		return "member/myreservation";
	}
	
	@GetMapping("/memberProfile")
	public String memberProfile(HttpSession session,Model model) {
		String memberId = (String) session.getAttribute("login");
		int attachmentNo = memberProfileDao.info(memberId);
		if(attachmentNo == 0) {
			model.addAttribute("profileUrl", "/images/user.png");
		}
		else {
			model.addAttribute("profileUrl", "/attachment/download?attachmentNo=" + attachmentNo);
		}
		return "member/memberProfile";
	}
	
	@PostMapping("/memberProfile")
	public String memberProfile(HttpSession session,
		@RequestParam MultipartFile memberProfile) throws IllegalStateException, IOException {
		String memberId = (String)session.getAttribute("login");
		memberService.changeProfile(memberId, memberProfile);
		return "redirect:mypage";
	}
}
