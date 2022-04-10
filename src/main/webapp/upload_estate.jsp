<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ar">

<head>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>رفع عقار</title>
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
        <section class="mt-5 mb-5">
            <div class="container bg-light bg-gradient border rounded shadow-lg mt-5 mb-5" style="max-width: 800px;">
                <div class="row">
                    <div class="col">
                        <h2 class="text-center text-dark mb-3 mt-1">قم بعرض عقارك الآن</h2>
                        <p class="text-center text-muted">أنت على بعد دقائق من تحقيق الأرباح<br>قم بملء الخانات أدناه ثم انقر على تحميل الطلب لنشر عقارك على العالم</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col pb-5">
                        <form class="text-center mt-2" method="post" enctype="multipart/form-data" style="max-width: 500px;margin: auto;" action="UploadEstateServlet">
                            <div class="row">
                                <div class="col-12 mb-3">
                                <select class="form-select" name="estate_type">
                                    <optgroup label="نوع العقار">
										<c:choose>
											<c:when test="${v_estate_type_value == 1}">
												<option value="1" selected>منزل</option>
												<option value="2">شقة</option>
												<option value="3">متجر</option>
										    </c:when>   
										    <c:when test="${v_estate_type_value == 2}">
											    <option value="1">منزل</option>
											    <option value="2" selected>شقة</option>
											    <option value="3">متجر</option>
										    </c:when>  
										    <c:when test="${v_estate_type_value == 3}">
											    <option value="1">منزل</option>
											    <option value="2">شقة</option>
											    <option value="3" selected>متجر</option>
										    </c:when>  
										    <c:otherwise>
										        <option value="1">منزل</option>
												<option value="2">شقة</option>
												<option value="3">متجر</option>
										    </c:otherwise>
										</c:choose>
                                    </optgroup>
                                </select>
                                <p class="text-end text-danger mb-0 fw-bold" id="estate_type_error">${p_estate_type_error}</p>
                                </div>
                                <div class="col-12 mb-3">
                                <select class="form-select" name="purchase_type">
                                    <optgroup label="نوع العرض">
                                    	<c:choose>
											<c:when test="${v_purchase_type_value == 1}">
												<option value="1" selected>بيع</option>
											    <option value="2">تأجير</option>
										    </c:when>   
										    <c:when test="${v_purchase_type_value == 2}">
											    <option value="1">بيع</option>
											    <option value="2" selected>تأجير</option>
										    </c:when>  
										    <c:otherwise>
										        <option value="1">بيع</option>
                                        		<option value="2">تأجير</option>
										    </c:otherwise>
										</c:choose>
                                    </optgroup>
                                </select>
                                <p class="text-end text-danger mb-0 fw-bold" id="purchase_type_error">${p_purchase_type_error}</p>
                                </div>
                                <div class="col-12 mb-3">
                                <input class="form-control" type="text" name="estate_size" placeholder="مساحة العقار بالمتر المربع" value="${v_estate_size_value}">
                                <p class="text-end text-danger mb-0 fw-bold" id="size_error">${p_size_error}</p>
                                </div>
                                <div class="col-12 mb-3">
                                <input class="form-control" type="text" name="estate_address" placeholder="عنوان العقار" value="${v_estate_address_value}">
                                <p class="text-end text-danger mb-0 fw-bold" id="address_error">${p_address_error}</p>
                                </div>
                                <div class="col-12 mb-3">
                                <input class="form-control" type="text" name="price" placeholder="السعر" value="${v_price_value}">
                                <p class="text-end text-danger mb-0 fw-bold" id="price_error">${p_price_error}</p>
                                </div>
                                <div class="col-12 mb-3">
                                <input class="form-control" type="text" name="estate_notes" placeholder="ملاحظات أخرى" value="${v_estate_notes_value}">
                                </div>
                                <div class="col-12 mb-3">
                                <input class="form-control" type="text" name="seller_name" placeholder="الاسم الكامل" value="${v_seller_name_value}">
                                <p class="text-end text-danger mb-0 fw-bold" id="seller_name_error">${p_seller_name_error}</p>
                                </div>
                                <div class="col-12 mb-3">
                                <input class="form-control" type="text" name="mobile1" placeholder="رقم الموبايل 1" value="${v_mobile1_value}">
                                <p class="text-end text-danger mb-0 fw-bold" id="mobile1_error">${p_mobile1_error}</p>
                                </div>
                                <div class="col-12 mb-3">
                                <input class="form-control" type="text" name="mobile2" placeholder="رقم الموبايل 2" value="${v_mobile2_value}">
                                <p class="text-end text-danger mb-0 fw-bold" id="mobile2_error">${p_mobile2_error}</p>
                                </div>
                                <div class="col-12 mb-3">
                                    <div class="text-end">
                                    <label class="form-label">قم برفع عقد الملكية رجاءاً</label></div>
                                    <input class="form-control" type="file" name="contract_file" accept="image/*" value="${v_file_value}">
                                </div>
                                <div class="col-12 mb-3">
                                    <p class="text-end text-danger mb-0 fw-bold" id="login_error"></p><button class="btn btn-primary btn-lg text-center border rounded mt-3 ps-5 pe-5" type="submit">تحميل الطلب</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </main>
    
    <c:if test="${success_message == 1}">
		<div class="modal fade" role="dialog" tabindex="-1" id="upload_success_modal">
	        <div class="modal-dialog" role="document">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <h4 class="modal-title">تم الرفع</h4><button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                </div>
	                <div class="modal-body">
	                    <p>تمت عملية الرفع بنجاح!</p>
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
    	 if( $('#upload_success_modal').length)
    	 {
    		 $('#upload_success_modal').modal('show');    
    	 }
    });
    </script>
</body>

</html>