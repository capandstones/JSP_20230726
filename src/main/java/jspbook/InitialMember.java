package jspbook;

import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;


@WebListener
public class InitialMember implements ServletContextListener {


    
    //프로젝트가 로드되면 서버에 제일먼저 저장됨
    public void contextInitialized(ServletContextEvent sce)  { 
    	  ServletContext context=sce.getServletContext();
          ArrayList<Member> datas= new ArrayList<Member>();
          
          for(int i=0;i<8;i++) {
         	 Member data = new Member("김자바"+i,"test"+"@test.net");
         	 datas.add(data);
          }
          
          //email이 누락된 데이터 생성
          datas.add(new Member("홍길동",null));
          datas.add(new Member("김길동",null));
          
          context.setAttribute("members", datas);
          context.setAttribute("member", new Member());
    }
    
    
    

    public void contextDestroyed(ServletContextEvent sce)  { 
       
    }

	
	
}
