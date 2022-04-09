package com.mwt_wjd;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mwt_wjd.helper.GetDatabaseConnection;
import com.mwt_wjd.models.User;

@WebServlet("/DeleteRequest")
public class DeleteRequest extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long id = Long.parseLong(request.getParameter("request_id"));
		long rowId;
		Connection conn = GetDatabaseConnection.getConnection();
		String sql = "delete from estates where id = ?";
		PreparedStatement ps;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setLong(1, id);
			
			rowId = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("incoming_requests.jsp");
		rd.forward(request, response);
	}

}
