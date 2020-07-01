package com.spring.board.controller;
 
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.board.MemberDAO;
import com.spring.board.MemberDto;
 
@Controller
@RequestMapping(value = "/sample")
public class SampleController {
	@ModelAttribute("cp")
	public String getContextPath(HttpServletRequest request) {
		return request.getContextPath();
	}
	
    @RequestMapping(value = "/")
    public String getHome(HttpServletRequest request, HttpServletResponse reponse,Model model,Locale locale) throws Exception {        
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
    	return "home";
    }
    @RequestMapping(value = "/getSample")
    public String getSample(HttpServletRequest request, HttpServletResponse reponse) throws Exception {        
    	return "submit";
    }
    
    @RequestMapping(value = "/login")
    public String getLogin(Model model,HttpServletRequest request, HttpServletResponse reponse) throws Exception {        
    	model.addAttribute("memberDto",new MemberDto());
    	return "login";
    }
    @RequestMapping(value = "/login.do")
    public String doLogin(MemberDto member,HttpServletRequest request) throws Exception {        
    	
    	System.out.println("log1");
    	MemberDto mem = MemberDAO.memberSearch(member);
    	System.out.println(mem.getPw() +"="+member.getPw());
    	if(mem.getPw().equals(member.getPw())) {
    		HttpSession session = request.getSession();
    		session.setAttribute("member", mem);
    	}
    	return "home";
    }
    
    @RequestMapping(value = "/join")
    public String getJoin(Model model, HttpServletRequest request, HttpServletResponse reponse) throws Exception {        
    	model.addAttribute("memberDto",new MemberDto());
    	return "joinForm";
    }
    @RequestMapping(value = "/join.do")
    public String doJoin(@ModelAttribute MemberDto mem, HttpServletResponse reponse) throws Exception {        
    	//db에 회원정보
    	MemberDAO ma = MemberDAO.getInstance();
    	ma.insert(mem);
    	
    	return "home";
    }
    //회원가입 넘어오면 처리
    /*
    @RequestMapping(value = "/join.do")
    public String doJoin(HttpServletRequest request, HttpServletResponse reponse) throws Exception {        
    	//db에 회원정보
    	MemberDto md = new MemberDto();
    	md.setId(request.getParameter("id"));
    	md.setPw(request.getParameter("password"));
    	md.setName(request.getParameter("name"));
    	md.setEmail(request.getParameter("email_1")+request.getParameter("email_2"));
    	md.setPhone(request.getParameter("phone"));
    	MemberDAO ma = MemberDAO.getInstance();
    	ma.insert(md);
    	
    	return "home";
    }*/
    

    /*
    @RequestMapping("/join.do")
    public ModelAndView memberInput() {
        // memberInput.jsp에 commandName이 'member'인 Member 객체를 넘겨줌
        return new ModelAndView("home", "MemberDto", new MemberDto());
    }
    */
    @RequestMapping(value = "/mypage")
    public String getMypage(HttpServletRequest request, HttpServletResponse reponse) throws Exception {        
    	return "mypage";
    	
    }
    @RequestMapping(value = "/problem")
    public String getProblem(HttpServletRequest request, HttpServletResponse reponse) throws Exception {        
    	return "problem";
    }
    @RequestMapping(value = "/problem.do")
    public String doProblem(HttpServletRequest request, HttpServletResponse reponse) throws Exception {        
    	return "problemResult";
    }
    @RequestMapping(value = "/home")
    public String getHome(HttpServletRequest request, HttpServletResponse reponse) throws Exception {        
    	System.out.println(5);
    	return "home";
    }
    @RequestMapping(value = "/rank")
    public String getRank(HttpServletRequest request, HttpServletResponse reponse) throws Exception {        
    	return "rankPage";
    }
    @RequestMapping(value = "/logout.do")
    public String getLogout(HttpServletRequest request, HttpSession session) throws Exception {        
    	session.invalidate();
    	return "home";
    }
    
    
    
}
 
