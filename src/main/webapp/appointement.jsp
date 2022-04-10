<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page import="java.util.*" %>
<%@ page import="java.time.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.mwt_wjd.helper.GetDatabaseConnection" %>
<%@ page import="com.mwt_wjd.models.Estate" %>
<!DOCTYPE html>
<html lang="ar">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>حجز موعد</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,400i,700,700i,600,600i">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Cairo&amp;display=swap">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/simple-line-icons.min.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css">
    <link rel="stylesheet" href="assets/css/app.css">
</head>

<body>
    <nav class="navbar navbar-light navbar-expand-lg fixed-top bg-white clean-navbar">
        <div class="container"><a class="navbar-brand logo" href="index.jsp">البسيط للعقارات</a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-2"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-2">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item"><a class="nav-link" href="index.jsp">الرئيسية</a></li>
                    <%
						if(session.getAttribute("uid") == null){
							out.println("<li class='nav-item'><a class='nav-link' href='login.jsp'>تسجيل الدخول</a></li>");
						}else{
							out.println("<li class='nav-item'><a class='nav-link' href='cpanel.jsp'>لوحة التحكم</a></li>");
						}
					%>
                    <li class="nav-item"><a class="btn btn-primary" role="button" href="upload_estate.jsp">قم بعرض عقارك الآن</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <main class="page landing-page">
        <section class="mt-5 mb-5" style="height: 100vh;">
            <div class="container bg-light bg-gradient border rounded shadow-lg mt-5 mb-5">
                <div class="row">
                    <div class="col-lg-5">
                        <div class="row">
                            <div class="col">
                                <h2 class="text-center text-dark mb-3 mt-5">طلب موعد</h2>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col pb-5">
                                <form class="text-center mt-2" method="post" style="max-width: 500px;margin: auto;" action="RequestAppointement">
                                    <div class="row">
                                        <div class="col-12 mb-3">
                                        <input class="form-control" type="hidden" name="estate_id" value="${p_estate_id}">
                                        
                                        <input class="border rounded form-control form-control-lg" type="text" name="buyer_name" placeholder="اسمك الكامل" value="${v_buyer_name_value}">
                                        <p class="text-end text-danger mb-0 fw-bold" id="buyer_name_error">${p_buyer_name_error}</p>
                                        </div>
                                        <div class="col-12 mb-3">
                                        <input class="border rounded form-control form-control-lg" type="text" name="buyer_mobile" placeholder="الجوال" value="${v_buyer_mobile_value}">
                                        <p class="text-end text-danger mb-0 fw-bold" id="buyer_mobile_error">${p_buyer_mobile_error}</p>
                                        </div>
                                        <div class="col-12 mb-3">
                                        <input class="form-control form-control-lg" type="datetime-local" name="appointement_time" step="30" value="${v_appointement_time_value}">
                                        <p class="text-end text-danger mb-0 fw-bold" id="appointement_time_error">${p_appointement_time_error}</p>
                                        </div>
                                        <div class="col-12 mb-3">
                                            <p class="text-end text-danger mb-0 fw-bold" id="login_error"></p>
                                            <button class="btn btn-primary btn-lg text-center border rounded mt-3 ps-5 pe-5" type="submit">حجز موعد</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="row">
                            <div class="col">
                                <div class="row">
                                    <div class="col">
                                        <h2 class="text-center text-dark mb-3 mt-5">لقد قمت باختيار</h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <section class="clean-block clean-info dark">
                            <div class="container">
                                <div class="row align-items-center">
                                    <div class="col-12 card-style shadow">
                                        <div class="row g-0 align-items-center">
                                            <div class="col-auto col-md-3">
                                            <c:choose>
												<c:when test="${estate_type == 1}">
													<i class="fas fa-home" style="width: 98px;font-size: 100px;color: rgb(94,82,241);"></i>
											    </c:when>   
											    <c:when test="${estate_type == 2}">
											    	<i class="far fa-building" style="width: 98px;font-size: 100px;color: rgb(71,213,94);"></i>
											    </c:when>  
											    <c:when test="${estate_type == 3}">
												    <i class="fas fa-store" style="width: 98px;font-size: 100px;color: rgb(213,71,84);"></i>
											    </c:when>  
											    <c:otherwise>
											        <i class="fas fa-landmark" style="width: 98px;font-size: 100px;color: rgb(213,71,84);"></i>
											    </c:otherwise>
											</c:choose>
                                            </div>
                                            <div class="col-auto col-md-9">
                                                <ul>
                                                    <c:choose>
														<c:when test="${estate_type == 1}">
															<li>النوع: منزل</li>
													    </c:when>   
													    <c:when test="${estate_type == 2}">
													    	<li>النوع: شقة</li>
													    </c:when>  
													    <c:when test="${estate_type == 3}">
														    <li>النوع: متجر</li>
													    </c:when>  
													    <c:otherwise>
													        <li>النوع: غير محدد</li>
													    </c:otherwise>
													</c:choose>
                                                    <c:choose>
														<c:when test="${show_type == 1}">
															<li>نوع العرض: بيع</li>
													    </c:when>   
													    <c:when test="${show_type == 2}">
													    	<li>نوع العرض: تأجير</li>
													    </c:when>  
													    <c:otherwise>
													        <li>نوع العرض: غير محدد</li>
													    </c:otherwise>
													</c:choose>
													<li>المساحة: <fmt:formatNumber value = "${estate_size}"/> م مربع</li>
				                                    <li>السعر المطلوب: <fmt:formatNumber value = "${price}"/> ل.س</li>
				                                    <li>تاريخ العرض: <fmt:formatDate value="${uploaded_on}" pattern="yyyy-MM-dd"/></li>
				                                    <li>ملاحظات أخرى: ${estate_notes}</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </section>
    </main>
    
     <c:if test="${success_message == 1}">
		<div class="modal fade" role="dialog" tabindex="-1" id="appointement_success_modal">
	        <div class="modal-dialog" role="document">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <h4 class="modal-title">تم الرفع</h4><button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                </div>
	                <div class="modal-body">
	                    <p>تم تسجيل موعدك بنجاح!</p>
	                </div>
	                <div class="modal-footer">
	                    <div class="row">
	                        <div class="col d-flex justify-content-between">
	                        	<button class="btn btn-primary" id="close-delete-request-modal" type="button" data-bs-dismiss="modal">حسناً</button>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
    </c:if> 
    <footer class="page-footer dark">
        <div class="footer-copyright">
            <p>© 2022 البسيط للعقارات</p>
        </div>
    </footer>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/bs-init.js"></script>
    <script src="assets/js/vanilla-zoom.js"></script>
    <script src="assets/js/theme.js"></script>
    <script src="assets/js/jquery-3.6.0.js"></script>
    <script src="assets/js/app.js"></script>
    <script>
    $(document).ready(function(event) {
    	 if( $('#appointement_success_modal').length)
    	 {
    		 $('#appointement_success_modal').modal('show');    
    	 }
    });
    </script>
</body>

</html>
