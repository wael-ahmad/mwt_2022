package com.mwt_wjd;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.mwt_wjd.helper.GetDatabaseConnection;
import com.mwt_wjd.models.Estate;

@WebServlet("/UploadEstateServlet")
@MultipartConfig
public class UploadEstateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int estateType, purchaseType;
	private double estateSize, price;
	private String estateAddress, estateNotes, sellerName, mobile1, mobile2, fileURL;
	private HttpServletRequest request;
	
	 // location to store file uploaded
    private static final String UPLOAD_DIRECTORY = "upload";
 
    // upload settings
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 1;  // 1MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 3; // 3MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 5; // 5MB
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.request = request;
		
		if(isValidForm()) {
			long rowID;
			Estate estate = new Estate(0, null, estateType, purchaseType, estateSize, estateAddress, estateNotes, sellerName, mobile1, mobile2, price, fileURL, 1);
			rowID = insertData(estate);
			
			this.request.setAttribute("v_estate_type_value", 1);
			this.request.setAttribute("v_purchase_type_value", 1);
			this.request.setAttribute("v_estate_size_value", "");
			this.request.setAttribute("v_estate_address_value", "");
			this.request.setAttribute("v_price_value", "");
			this.request.setAttribute("v_estate_notes_value", "");
			this.request.setAttribute("v_seller_name_value", "");
			this.request.setAttribute("v_mobile1_value", "");
			this.request.setAttribute("v_mobile2_value", "");
			this.request.setAttribute("v_file_value", "");
			
			this.request.setAttribute("success_message", "1");
			RequestDispatcher rd = this.request.getRequestDispatcher("upload_estate.jsp");
			rd.forward(this.request, response);
		}else {
			RequestDispatcher rd = this.request.getRequestDispatcher("upload_estate.jsp");
			rd.forward(this.request, response);
		}
		
	}
	
	private long insertData(Estate es) {
		long id = 0;
		Connection conn = GetDatabaseConnection.getConnection();
		String sql = "INSERT INTO estates(estate_type, show_type, estate_size, estate_address, estate_notes, seller_name, seller_phone_1, seller_phone_2, price, contract_file_url) "
                	+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			pstmt.setInt(1, es.getEstateType());
            pstmt.setInt(2, es.getShowType());
            pstmt.setDouble(3, es.getEstateSize());
            pstmt.setString(4, es.getEstateAddress());
            pstmt.setString(5, es.getNotes());
            pstmt.setString(6, es.getSellerName());
            pstmt.setString(7, es.getMobile1());
            pstmt.setString(8, es.getMobile2());
            pstmt.setDouble(9, es.getPrice());
            pstmt.setString(10, es.getFileURL());
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
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if(isMultipart) {
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setSizeThreshold(MEMORY_THRESHOLD);
			factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
			//factory.setRepository(new File("C:/user"));
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setFileSizeMax(MAX_FILE_SIZE);
			upload.setSizeMax(MAX_REQUEST_SIZE);
			String uploadPath = getServletContext().getRealPath("")
	                + File.separator + UPLOAD_DIRECTORY;
			// creates the directory if it does not exist
	        File uploadDir = new File(uploadPath);
	        if (!uploadDir.exists()) {
	            uploadDir.mkdir();
	        }
	        
			try {
				List<FileItem> items = upload.parseRequest(request);
				Iterator<FileItem> iter = items.iterator();
				while (iter.hasNext()) {
				    FileItem item = iter.next();

				    if (item.isFormField()) {
				    	String name = item.getFieldName();				    	
				        String value = item.getString();
				        if(name.equals("estate_type")) {
				        	request.setAttribute("v_estate_type_value", value);
				        	if(isInteger(value)) {
								estateType = Integer.parseInt(value);
							}else {
								request.setAttribute("p_estate_type_error", "‰Ê⁄ «·⁄ﬁ«— «·„Õœœ €Ì— ’«·Õ!");
								isValid = false;
							}
				        }else if(name.equals("purchase_type")) {
				        	request.setAttribute("v_purchase_type_value", value);
				        	if(isInteger(value)) {
								purchaseType = Integer.parseInt(value);
							}else {
								request.setAttribute("p_purchase_type_error", "‰Ê⁄ «·»Ì⁄ «·„Õœœ €Ì— ’«·Õ!");
								isValid = false;
							}
				        }else if(name.equals("estate_size")) {
				        	request.setAttribute("v_estate_size_value", value);
				        	if(isDouble(value)) {
								estateSize = Double.parseDouble(value);
							}else {
								request.setAttribute("p_size_error", "ÌÃ» √‰  ﬂÊ‰ «·„”«Õ… —ﬁ„«!");
								isValid = false;
							}
				        }else if(name.equals("estate_address")) {
				        	request.setAttribute("v_estate_address_value", new String(value.getBytes("8859_1"), "UTF-8"));
				        	if(isEmptyString(value)) {
								request.setAttribute("p_address_error", "ÌÃ»  ÕœÌœ «·⁄‰Ê«‰!");
								isValid = false;
							}else {
								estateAddress = new String(value.getBytes("8859_1"), "UTF-8").trim();
							}
				        }else if(name.equals("price")) {
				        	request.setAttribute("v_price_value", value);
				        	if(isDouble(value)) {
								price = Double.parseDouble(value);
							}else {
								request.setAttribute("p_price_error", "ÌÃ» √‰ ÌﬂÊ‰ «·”⁄— —ﬁ„«!");
								isValid = false;
							}
				        }else if(name.equals("estate_notes")) {
				        	estateNotes = new String(value.getBytes("8859_1"), "UTF-8").trim();
				        	request.setAttribute("v_estate_notes_value", new String(value.getBytes("8859_1"), "UTF-8"));
				        }else if(name.equals("seller_name")) {
				        	request.setAttribute("v_seller_name_value", new String(value.getBytes("8859_1"), "UTF-8"));
				        	if(isEmptyString(value)) {
								request.setAttribute("p_seller_name_error", "ÌÃ»  ÕœÌœ «·«”„!");
								isValid = false;
							}else {
								sellerName = new String(value.getBytes("8859_1"), "UTF-8").trim();
							}
				        }else if(name.equals("mobile1")) {
				        	request.setAttribute("v_mobile1_value", value);
				        	if(isEmptyString(value)) {
								request.setAttribute("p_mobile1_error", "ÌÃ»  ÕœÌœ —ﬁ„ «·„Ê»«Ì·!");
								isValid = false;
							}else if(!isValidMobileNumber(value)){
								request.setAttribute("p_mobile1_error", "’Ì€… «·—ﬁ„ €Ì— ’ÕÌÕ…!");
								isValid = false;
							}else {
								mobile1 = value.trim();
							}
				        }else if(name.equals("mobile2")) {
				        	request.setAttribute("v_mobile2_value", value);
				        	if(!isEmptyString(value) && !isValidMobileNumber(value)) {
								request.setAttribute("p_mobile2_error", "’Ì€… «·—ﬁ„ €Ì— ’ÕÌÕ…!");
								isValid = false;
							}else {
								mobile2 = value.trim();
							}
				        }else {
				        	System.out.println("unknown");
				        }
				    } else {
						
						/*
						 * String fieldName = item.getFieldName(); String fileName = item.getName();
						 * String contentType = item.getContentType(); boolean isInMemory =
						 * item.isInMemory(); long sizeInBytes = item.getSize();
						 * 
						 * File uploadedFile = new File("E:/"+fileName); item.write(uploadedFile);
						 */
				    	LocalDateTime currentDateTime = LocalDateTime.now();
				    	DateTimeFormatter formatter = DateTimeFormatter.ISO_DATE_TIME;
				    	String formattedDateTime = currentDateTime.format(formatter);
				    	formattedDateTime = formattedDateTime.replace(":", "");
				    	
				    	String fileName = new File(item.getName()).getName();
                        String filePath = uploadPath + File.separator + formattedDateTime + "-" + fileName;
                        File storeFile = new File(filePath);
 
                        // saves the file on disk
                        item.write(storeFile);
                        fileURL = filePath;
						 
				    }
				}
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return isValid;
	}
	
	public boolean isInteger(String value) {
		try {
			int number = Integer.parseInt(value);
			return true;
		}catch(NumberFormatException e) {
			return false;
		}
	}
	
	public boolean isDouble(String value) {
		try {
			double number = Double.parseDouble(value);
			return true;
		}catch(NumberFormatException e) {
			return false;
		}
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
