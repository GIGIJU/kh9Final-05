package com.gf.golboogi.controller;

import java.text.DecimalFormat;
import java.text.Format;
import java.util.Random;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gf.golboogi.entity.CertDto;
import com.gf.golboogi.entity.MemberDto;
import com.gf.golboogi.repository.CertDao;
import com.gf.golboogi.repository.MemberDao;
import com.gf.golboogi.service.MailService;


@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private MailService mailService;
	
	@Autowired
	private CertDao certDao;
	
	@GetMapping("/join")
	public String join() {
		return "member/join";
	}
	
	@PostMapping("/join")
	public String join(@ModelAttribute MemberDto memberDto) {
		memberDao.join(memberDto);
		return "redirect:join_success";
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
			HttpSession session) {
		MemberDto memberDto = memberDao.login(memberId,memberPw);
		if(memberDto == null) {
			return "redirect:login?error";
		}else {
			session.setAttribute("login", memberDto.getMemberId());
			return "redirect:/";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("login");
		return "redirect:/";
	}
	
	@GetMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
		String memberId = (String) session.getAttribute("login");
		
		MemberDto memberDto = memberDao.info(memberId);
		model.addAttribute("memberDto", memberDto);
		
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
		
		boolean success = memberDao.changeInformation(memberDto);
		if(success) {
			return "redirect:mypage";
		}
		else {
			return "redirect:edit?error";
		}
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
		boolean isSuccess = memberDao.ChangePassword(memberId,memberPw,changePw);
		if(isSuccess) {
			return "redirect:mypage";
		}else {
			return "redirect:password?error";
		}
	}
	
	@GetMapping("/exit")
	public String exit() {
		return "member/exit";
	}
	
	@PostMapping("/exit")
	public String exit(HttpSession session,@RequestParam String memberPw) {
		String memberId = (String) session.getAttribute("login");
		boolean success = memberDao.exit(memberId,memberPw);
		if(success) {
			session.removeAttribute("login");
			return "redirect:exit_success";
		}else {
			return "redirect:exit?error";
		}
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
	
	
}