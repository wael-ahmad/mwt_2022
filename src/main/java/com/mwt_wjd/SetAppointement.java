package com.mwt_wjd;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mwt_wjd.helper.GetDatabaseConnection;


@WebServlet("/SetAppointement")
public class SetAppointement extends HttpServlet {
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long estateId = Long.parseLong(request.getParameter("estate_id"));
		
		Connection conn = GetDatabaseConnection.getConnection();
		String sql = "select * from estates where id = ?";
		PreparedStatement ps;
		try {
			ps = conn.prepareStatement(sql);
			ps.setLong(1, estateId);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				request.setAttribute("p_estate_id", estateId);
				request.setAttribute("estate_type", rs.getInt(3));
				request.setAttribute("show_type", rs.getInt(4));
				request.setAttribute("estate_size", rs.getDouble(5));
				request.setAttribute("price", rs.getDouble(11));
				request.setAttribute("uploaded_on", rs.getDate(2));
				request.setAttribute("estate_notes", rs.getString(7));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("appointement.jsp");
		rd.forward(request, response);
	}


}
