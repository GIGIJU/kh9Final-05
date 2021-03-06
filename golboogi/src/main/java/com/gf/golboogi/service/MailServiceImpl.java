package com.gf.golboogi.service;

import java.text.DecimalFormat;
import java.text.Format;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.gf.golboogi.entity.CertDto;
import com.gf.golboogi.entity.MemberDto;
import com.gf.golboogi.repository.CertDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MailServiceImpl implements MailService {

	@Autowired(required = false)
	private JavaMailSender javaMailSender;

//	@Value("${}")
//	private String emailId;

	@Autowired
	private CertDao certDao;

	private Random r = new Random();
	private Format f = new DecimalFormat("000000");

	@Override
	public void sendPasswordResetMail(MemberDto findDto) throws MessagingException {
		// findDto에 있는 E-mail에 비밀번호 재설정 메일을 보내야 한다.
		// 이메일에서 재설정은 불가능하기 때문에 우리 홈페이지의 특정 페이지 링크를 보내야 한다
		// 재설정은 아무나 하는게 아니고 허락된 사람만 가능해야 한다

		MimeMessage message = javaMailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, false, "UTF-8");

		helper.setTo(findDto.getMemberEmail());
		helper.setSubject("[KH정보교육원] 비밀번호 재설정 메일입니다");

		int certNumber = r.nextInt(1000000);
		String certString = f.format(certNumber);
		String returnUri = ServletUriComponentsBuilder.fromCurrentContextPath()
//						.port(port)
//						.path(contextPath)
				.path("/member/reset").queryParam("memberId", findDto.getMemberId())
				.queryParam("cert", certString)
				.toUriString();
		String content = "<a href='" + returnUri + "'>" + "비밀번호를 재설정하시려면 여기를 누르세요" + "</a>";
		helper.setText(content, true);

		javaMailSender.send(message);

		certDao.insert(CertDto.builder().certTarget(findDto.getMemberId()).certNumber(certString).build());
	}
}
