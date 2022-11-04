package mvc.guest.control;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.guest.command.Command;
import mvc.guest.command.CommandDelete;
import mvc.guest.command.CommandException;
import mvc.guest.command.CommandInput;
import mvc.guest.command.CommandList;
import mvc.guest.command.CommandNull;

/**
 * Servlet implementation class GuestControl
 */
public class GuestControl extends HttpServlet {
	
	private HashMap commandMap;
	private String	jspDir = "/05_mvc_class/2_mvcGuest/";
	private String  error = "error.jsp";
	

    public GuestControl() {
        super();       
		initCommand();
	}

	private void initCommand(){
		//Key값에 따라 객체를 생성하여 HashMap에 담아둠
		commandMap = new HashMap();
		
		//Key값에 따라 객체 생성(보낼 경로를 만드는 과정)
		//해당 값으로 요청이 들어오면 컨트롤에서 해당하는 내용을 출력해서 보내줌
		commandMap.put("main-page",	new CommandNull("main.jsp") );
		commandMap.put("list-page",	new CommandList("listMessage.jsp") );
		// 나머지도 추가하기	
		commandMap.put("input-form", new CommandNull("insertMessage.jsp"));
		commandMap.put("input-do", new CommandInput("saveMessage.jsp"));
		commandMap.put("delete-form", new CommandNull("deleteMessage.jsp"));
		commandMap.put("delete-do", new CommandDelete("deleteConfirm.jsp"));
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	

	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String nextPage = "";
		String cmdKey	= request.getParameter("cmd");//cmd = list-page를 받아옴
		if( cmdKey == null ){
			cmdKey = "main-page";//Key값을 새롭게 부여
		}

		
		Command cmd = null;

		try{
			//list-page가 들어 있으면
			//HashMap 안에 cmdKey와 동일한 값이 있을 경우, 해당 되는 해쉬맵을 가져오도록 get( ) 메소드 수행
			if( commandMap.containsKey( cmdKey ) ){
				//가져온 해쉬맵을 Command타입으로 형 변환하여 변수 cmd에 담는다. 
				cmd = (Command)commandMap.get( cmdKey);
			}else{
				throw new CommandException("지정할 명령어가 존재하지 않음");
			}
			// cmd에 해당하는 execute( ) 메소드를 호출하고 그 결과를 nextPage라는 String타입 변수에 담는다. 
			nextPage = cmd.execute( request, response  );

		}catch( CommandException e ){
			request.setAttribute("javax.servlet.jsp.jspException", e );
			nextPage = error;
			System.out.println("오류 : " + e.getMessage() );
		}

		RequestDispatcher reqDp = getServletContext().getRequestDispatcher( jspDir + nextPage );
		reqDp.forward( request, response );
		
	}

}
