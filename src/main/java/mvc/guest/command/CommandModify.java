package mvc.guest.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.guest.model.Message;
import mvc.guest.model.MessageDao;
import mvc.guest.model.MessageException;

public class CommandModify implements Command 
{
	private String next;

	public CommandModify( String _next ){
		next = _next;
	}

	public String execute( HttpServletRequest request , HttpServletResponse response  ) throws CommandException{
		try{
			int messageId = Integer.parseInt(request.getParameter("messageId"));
			String message = request.getParameter("message");
			
		    int result = MessageDao.getInstance().update(message, messageId );	
		    request.setAttribute("result", result );
		    
		    

		}catch( MessageException ex ){
			throw new CommandException("CommandModify.java < 목록보기시 > " + ex.toString() ); 
		}
		
		return next;
	}
	
}