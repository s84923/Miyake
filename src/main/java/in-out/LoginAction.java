package chapter24;

import bean.Customer;
import dao.CustomerDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;
 
public class LoginAction extends Action {
	public String execute(
		HttpServletRequest request, HttpServletResponse response
	) throws Exception {  
		HttpSession session=request.getSession();
		
			String login=request.getParameter("login");
			String password=request.getParameter("password");
			
			CustomerDAO dao=new CustomerDAO();
			Customer customer=dao.search(login,password);
			
			if(customer!=null) {
				session.setAttribute("customer", customer);
				return"login-out.jsp";
			}
			
			return "login-error.jsp";
	}
}