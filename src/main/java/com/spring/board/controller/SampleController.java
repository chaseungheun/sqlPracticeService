package com.spring.board.controller;
 
import java.text.DateFormat;
import java.util.ArrayList;
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
import com.spring.board.ProblemDAO;
import com.spring.board.ProblemDto;
 
@Controller
@RequestMapping(value = "/sample")
public class SampleController {
	@ModelAttribute("cp")
	public String getContextPath(HttpServletRequest request) {
		return request.getContextPath();
	}
	
    @RequestMapping(value = "/")
    public String getHome(Model model,HttpServletRequest request, HttpServletResponse reponse) throws Exception {        
		ProblemDAO pd = ProblemDAO.getInstance();
		ArrayList<ProblemDto> list = pd.select_all();
    	
		model.addAttribute("list",list);
		for(int i=0;i<list.size();i++) {
			System.out.println(list.get(i).getP_title());
		}
    	return "home";
    }
    
    @RequestMapping(value = "/login")
    public String getLogin(Model model,HttpServletRequest request, HttpServletResponse reponse) throws Exception {        
    	model.addAttribute("memberDto",new MemberDto());
    	return "login";
    }
    @RequestMapping(value = "/login.do")
    public String doLogin(MemberDto member,HttpServletRequest request) throws Exception {        
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
    	//db�� ȸ������
    	MemberDAO ma = MemberDAO.getInstance();
    	ma.insert(mem);
    	
    	return "home";
    }
    //ȸ������ �Ѿ���� ó��
    /*
    @RequestMapping(value = "/join.do")
    public String doJoin(HttpServletRequest request, HttpServletResponse reponse) throws Exception {        
    	//db�� ȸ������
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
        // memberInput.jsp�� commandName�� 'member'�� Member ��ü�� �Ѱ���
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
    @RequestMapping(value = "/problemCreate")
    public String getProblemCreate(Model model, HttpServletRequest request, HttpServletResponse reponse) throws Exception {        
    	model.addAttribute("problemDto",new ProblemDto());
    	return "problemCreate";
    }
    @RequestMapping(value = "/problemCreate.do")
    public String doProblemCreate(@ModelAttribute ProblemDto mem, HttpServletRequest request, HttpServletResponse response,Model model) throws Exception {        
    	System.out.println(mem.getP_title() +"??");
    	ProblemDAO pa = ProblemDAO.getInstance();
    	pa.insert(mem);
    	
    	return getHome(model,request,response);
    }
    @RequestMapping(value = "/problem.do")
    public String doProblem(Model model,HttpServletRequest request, HttpServletResponse reponse) throws Exception {        
		HttpSession session = request.getSession();
		
		MemberDto md = (MemberDto)session.getAttribute("member");	
    	md.setSql(request.getParameter("sql"));
		System.out.println(md.getId() +"," + md.getSql());
		
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
 
