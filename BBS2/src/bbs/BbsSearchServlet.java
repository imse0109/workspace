package bbs;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.jni.User;

import user.UserDAO;

@WebServlet("/BbsSearchServlet")
public class BbsSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html);charset=UTF-8");
		String userID = request.getParameter("userID");
		response.getWriter().write(getJSON(userID));
	}
	
	public String getJSON(String userID) {
		if(userID == null) userID = "";
		StringBuffer result = new StringBuffer("");
		result.append("{\result\":[");
		BbsDAO BbsDAO = new BbsDAO();
		ArrayList<Bbs> bbsList = BbsDAO.getLists();
		for(int i = 0; i<bbsList.size();i++) {
			result.append("[{\"value\": \"" + bbsList.get(i).getUserID() + "\"},");
			result.append("{\"value\": \"" + bbsList.get(i).getUserID() + "\"},");
			result.append("{\"value\": \"" + bbsList.get(i).getUserID() + "\"},");
			result.append("{\"value\": \"" + bbsList.get(i).getUserID() + "\"}],");
		}
		
		return result.toString();
	}

}
