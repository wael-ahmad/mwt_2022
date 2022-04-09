package com.mwt_wjd;

import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mwt_wjd.helper.GetDatabaseConnection;

import com.mwt_wjd.models.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		User user = checkCredentials(username, password);
		
		if(user.getId() != 0) {
			HttpSession session = request.getSession();
			session.setAttribute("uid", user.getId());
			session.setAttribute("uname", user.getFullName());
			
			response.sendRedirect("cpanel.jsp");
		}else {
			request.setAttribute("p_error", "«”„ «·„” Œœ„ √Ê ﬂ·„… «·„—Ê— €Ì— ’ÕÌÕ!");
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}
	}
	
	public User checkCredentials(String username, String password) {
		Connection conn = GetDatabaseConnection.getConnection();
		String sql = "select * from users where username = ? and password = ? and role = 1 and status = 1";
		PreparedStatement ps;
		User user = null;
		int uid = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				user = new User(rs.getInt("id"), 
								rs.getString("username"), 
								rs.getString("password"), 
								rs.getString("fullname"), 
								rs.getInt("role"), 
								rs.getInt("status"), 
								rs.getDate("date_created"), 
								rs.getDate("date_modified"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return user;
	}

}
