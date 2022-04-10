package com.mwt_wjd;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mwt_wjd.helper.GetDatabaseConnection;
import com.mwt_wjd.models.User;

@WebServlet("/UpdateAppointementStatus")
public class UpdateAppointementStatus extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int status = Integer.parseInt(request.getParameter("status"));
		long id = Long.parseLong(request.getParameter("appointement_id"));
		
		Connection conn = GetDatabaseConnection.getConnection();
		String sql = "update appointements set status = ? where id = ?";
		PreparedStatement ps;
		User user = null;
		int uid = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, status);
			ps.setLong(2, id);
			
			int rowId = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("incoming_appointements.jsp");
		rd.forward(request, response);
	}

}
