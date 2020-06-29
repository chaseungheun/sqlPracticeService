package com.spring.board;
 
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
 
@Controller
@RequestMapping(value = "/sample")
public class SampleController {
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
    public String getLogin(HttpServletRequest request, HttpServletResponse reponse) throws Exception {        
    	System.out.println(request.getParameter("id")+" "+request.getParameter("pw"));
    	
    	return "info";
    }
    @RequestMapping(value = "/join")
    public String getJoin(HttpServletRequest request, HttpServletResponse reponse) throws Exception {        
    	return "joinForm";
    }
    //ȸ������ �Ѿ���� ó��
    @RequestMapping(value = "/join.do")
    public String doJoin(HttpServletRequest request, HttpServletResponse reponse) throws Exception {        
    	//db�� ȸ������
    	return "home";
    }
    
    
    
}
 
