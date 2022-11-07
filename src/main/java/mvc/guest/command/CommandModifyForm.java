package mvc.guest.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.guest.model.Message;
import mvc.guest.model.MessageDao;
import mvc.guest.model.MessageException;

public class CommandModifyForm implements Command{

	private String next;
	
	
	
	public CommandModifyForm( String _next ){
		next = _next;
	}
	
	public String execute(HttpServletRequest request, HttpServletResponse response) throws CommandException {
		
		// DAO에서 해당번호에 레코드를 검색하여 request에 저장
try {
		int id =  Integer.parseInt(request.getParameter("id"));
 
		
		Message resultVO = MessageDao.getInstance().selectById(id);
		
		request.setAttribute("result", resultVO);
}catch(MessageException ex) {
	System.out.println("error");
}
		return next;
	}

	
}