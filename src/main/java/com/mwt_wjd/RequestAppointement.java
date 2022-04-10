package com.mwt_wjd;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mwt_wjd.helper.GetDatabaseConnection;
import com.mwt_wjd.models.Appointement;

@WebServlet("/RequestAppointement")
public class RequestAppointement extends HttpServlet {
	HttpServletRequest req;
	String buyerName, buyerMobile, appointementDate, appDate;
	long estateId;
	Connection conn;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.req = request;
		
		long estateId = Long.parseLong(this.req.getParameter("estate_id"));
		this.req.setAttribute("p_estate_id", estateId);
		conn = GetDatabaseConnection.getConnection();
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
		
		if(isValidForm()) {
			long rowID;
			String year = appointementDate.substring(0, 4);
			String month = appointementDate.substring(6, 7);
			String day = appointementDate.substring(9, 10);
			String hours = appointementDate.substring(11, 13);
			String mins = appointementDate.substring(14, 16);

			appDate = year + "-" + month + "-" + day + " " + hours + ":" + mins + ":00";
			
			Appointement appointement = new Appointement(0,  appDate, estateId, buyerName, buyerMobile, 1);
			
			rowID = insertData(appointement);
						
			this.req.setAttribute("v_buyer_name_value", "");
			this.req.setAttribute("v_buyer_mobile_value", "");
			this.req.setAttribute("v_appointement_time_value", "");
			
			this.req.setAttribute("success_message", "1");
			RequestDispatcher rd = this.req.getRequestDispatcher("appointement.jsp");
			rd.forward(this.req, response);
		}else {
			RequestDispatcher rd = this.req.getRequestDispatcher("appointement.jsp");
			rd.forward(this.req, response);
		}
	}
	
	private long insertData(Appointement app) {
		long id = 0;
		
		String sql = "INSERT INTO appointements(appointement_time, estate_id, buyer_name, buyer_mobile, status)"
                	+ "VALUES(?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, app.getAppointementTime());
            pstmt.setLong(2, app.getEstateId());
            pstmt.setString(3, app.getBuyerName());
            pstmt.setString(4, app.getBuyerMobile());
            pstmt.setInt(5, 1);
            int affectedRows = pstmt.executeUpdate();
            
            if (affectedRows > 0) {
                try (ResultSet rs = pstmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        id = rs.getLong(1);
                    }
                } catch (SQLException ex) {
                    System.out.println(ex.getMessage());
                }
            }
            
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
		return id;
	}
	
	private boolean isValidForm() {
		boolean isValid = true;
		
		try {
			buyerName = new String(this.req.getParameter("buyer_name").getBytes("8859-1"), "UTF-8");
			buyerMobile = this.req.getParameter("buyer_mobile");
			appointementDate = this.req.getParameter("appointement_time");
			this.req.setAttribute("v_buyer_name_value", buyerName);
			this.req.setAttribute("v_buyer_mobile_value", buyerMobile);
			this.req.setAttribute("v_appointement_time_value", appointementDate);
			
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
    	if(isEmptyString(buyerName)) {
			this.req.setAttribute("p_buyer_name_error", "يجب تحديد اسمك الكامل!");
			isValid = false;
		}
    	
    	if(isEmptyString(buyerMobile)) {
    		this.req.setAttribute("p_buyer_mobile_error", "يجب تحديد رقم الموبايل!");
			isValid = false;
		}
    	
    	if(!isValidMobileNumber(buyerMobile)){
    		this.req.setAttribute("p_buyer_mobile_error", "صيغة الرقم غير صحيحة!");
			isValid = false;
		}
    	
    	if(isEmptyString(appointementDate)) {
    		this.req.setAttribute("p_appointement_time_error", "يجب تحديد الموعد!");
			isValid = false;
		}
		
		return isValid;
	}
	public boolean isEmptyString(String value) {
		if(value == null || value.trim().equals("")) {
			return true;
		}else {
			return false;
		}
	}
	
	public boolean isValidMobileNumber(String value) {
		String strPattern = "^[0-9]{10}$";
		if(value.trim().matches(strPattern)) {
			return true;
		}else {
			return false;
		}
	}

}
