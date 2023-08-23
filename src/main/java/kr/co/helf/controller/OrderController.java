package kr.co.helf.controller;

import java.util.List;

import static kr.co.helf.controller.OrderEnum.*;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.helf.dto.MembershipJoinCategory;
import kr.co.helf.dto.OptionJoinDetail;
import kr.co.helf.form.AddOrderForm;
import kr.co.helf.kakaopay.KakaoPayReadyResponse;
import kr.co.helf.kakaopay.KakaoPayService;
import kr.co.helf.service.OrderService;
import kr.co.helf.vo.Membership;
import kr.co.helf.vo.Option;
import kr.co.helf.vo.Period;
import kr.co.helf.vo.Rank;
import kr.co.helf.vo.User;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/order")
@RequiredArgsConstructor
@SessionAttributes({"addOrderForm", "tid"})
public class OrderController {
	
	private final OrderService orderService;
	private final KakaoPayService kakaoPayService;
	
	@GetMapping("/list")
	public String list(Model model) {
		List<Membership> memberships = orderService.getAllMembership();
		model.addAttribute("memberships", memberships);
		
		return "order/membership-list";
	}
	
	@GetMapping("/condition")
	@PreAuthorize("hasRole('ROLE_USER')")
	public String condition(@RequestParam("no") int no, @AuthenticationPrincipal User user, Model model) {

		try {
			orderService.checkUseMyMembership(no, user.getId());
		} catch (RuntimeException ex) {
			return "redirect:list?error=dup";
		}
		
		MembershipJoinCategory membershipJoinCat = orderService.getMembershipJoinCatByNo(no);
		model.addAttribute("membershipJoinCat", membershipJoinCat);
		
		AddOrderForm form = new AddOrderForm();
		form.setMembershipNo(no);
		form.setMembershipName(membershipJoinCat.getName());
		form.setMembershipDefaltPrice(membershipJoinCat.getPrice());

		model.addAttribute("addOrderForm", form);
		
		return "order/step1";
	}
	
	@GetMapping("/period")
	@PreAuthorize("hasRole('ROLE_USER')")
	public String period(@ModelAttribute("addOrderForm") AddOrderForm form, Model model,
						 @AuthenticationPrincipal User user) {
		
		if(form == null) {
			return "redirect:order/list?error=fail";
		}
		
		MembershipJoinCategory membershipJoinCat = orderService.getMembershipJoinCatByNo(form.getMembershipNo());

		if(membershipJoinCat.getCatName().equals(ONE_DAY.getOrderEnum())) {
			orderService.setOneDay(membershipJoinCat, form, user);
			
			model.addAttribute("membershipJoinCat", membershipJoinCat);
			model.addAttribute("user", user);
			model.addAttribute("form", form);
			
			return "order/step3";
		}
		
		List<Option> options = orderService.getOptions();
		model.addAttribute("options", options);
		
		List<OptionJoinDetail> optionJoinDetails = orderService.getAllOptionJoinDetail();
		model.addAttribute("optionJoinDetails", optionJoinDetails);
		
		List<Period> periods = orderService.getAllPeriodByType(membershipJoinCat.getCatProperty());
		model.addAttribute("periods", periods);
		
		return "order/step2";
	}
	
	@PostMapping("/check")
	@PreAuthorize("hasRole('ROLE_USER')")
	public String orderCheck(@ModelAttribute("addOrderForm") AddOrderForm form, Model model, 
							 @AuthenticationPrincipal User user) {
		
		if(form == null) {
			return "redirect:order/list?error=fail";
		}
		
		Period period = orderService.getPeriodByNo(form.getPeriodNo());
		form.setMembershipPrice(form.getMembershipDefaltPrice() + period.getAddPrice());
		form.setPeriodDuration(period.getDuration());
		
		if(period.getType().equals(TIME.getOrderEnum())) {
			form.setRemainderCnt(period.getProperty());
		}

		OptionJoinDetail locker = orderService.getOptionJoinDetailByNo(form.getLockerNo());
		OptionJoinDetail wear = orderService.getOptionJoinDetailByNo(form.getWearNo());
		
		form.setLockerName(locker.getName());
		form.setLockerPrice(locker.getPrice()*period.getDuration());
		form.setWearName(wear.getName());
		form.setWearPrice(wear.getPrice()*period.getDuration());
		
		form.membershipOptionPrice();
		form.surtax();
		form.totalPrice();
		
		Rank rank = orderService.getRankByNo(user.getRank().getNo());
		int savePoint = (int)(form.getMembershipOptionPrice()*rank.getPointRate());
		form.setSavePoint(savePoint);
		
		model.addAttribute("form", form);
		model.addAttribute("user", user);
		
		return "order/step3";
	}
	
	@PostMapping("/kakaopay-ready")
	@ResponseBody
	public KakaoPayReadyResponse kakaoReady(@ModelAttribute AddOrderForm form, Model model) {
		
		KakaoPayReadyResponse ready = kakaoPayService.kakaoPayReadyResponse(form);
		model.addAttribute("tid", ready.getTid());
		// 카카오에서 받은 응답을 KakaoPayReadyResponse 클래스에 저장한다.
		// 응답으로 받은 tid를  tid 라는 이름으로 세션에 저장한다.
		
		return ready;
		// 성공할시 ready가 kakaopay-progress로 전달된다.
	}
	
	@GetMapping("/kakaopay-progress")
	public String order(@ModelAttribute("addOrderForm")  AddOrderForm form, @AuthenticationPrincipal User user, 
						@ModelAttribute("tid")  String tid, @RequestParam("pg_token") String pgToken,
						SessionStatus sessionStatus) {
		
		kakaoPayService.approveResponse(tid, pgToken);
		orderService.updateUser(form, user);
		orderService.insertOrder(form, user);
		
		sessionStatus.setComplete();
		
		return "redirect:/order/completed";
	}
	
	@GetMapping("/completed")
	@PreAuthorize("hasRole('ROLE_USER')")
	public String orderCompleted() {
		return "order/completed";
	}
	
	@GetMapping("/kakaopay-fail")
	public String orderFail() {
		return "redirect:list?error=kakaopay-fail";
	}

	@GetMapping("/kakaopay-cancle")
	public String orderCancle() {
		return "redirect:list?error=kakaopay-cancle";
	}
}
