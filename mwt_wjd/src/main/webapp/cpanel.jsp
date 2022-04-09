<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>لوحة التحكم</title>
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
	<%
	
		response.setHeader("cache-control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
		response.setHeader("pragma", "no-cache"); // HTTP 1.0
		response.setHeader("Expires", "0"); // Proxies
		if(session.getAttribute("uid") == null){
			response.sendRedirect("login.jsp");
		}
	%>
    <nav class="navbar navbar-light navbar-expand-lg fixed-top bg-white clean-navbar">
        <div class="container"><a class="navbar-brand logo" href="cpanel.jsp"><i class="fa fa-gears" style="color: rgba(82,79,255,0.9);"></i>&nbsp;لوحة التحكم</a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-2"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-2">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item"><a class="nav-link active" href="cpanel.jsp">الرئيسية</a></li>
                    <li class="nav-item"><a class="nav-link" href="incoming_requests.jsp">الطلبات الواردة</a></li>
                    <li class="nav-item"><a class="nav-link" href="incoming_appointements.jsp">جدول المواعيد</a></li>
                    <li class="nav-item dropdown">
                    <a class="dropdown-toggle nav-link link-primary" aria-expanded="false" data-bs-toggle="dropdown" href="#">أهلاً بك ${uname}&nbsp;</a>
                        <div class="dropdown-menu">
	                        <a class="dropdown-item" href="index.jsp">العودة إلى الموقع</a>
	                        <form action="LogoutServlet" method="post">
	                        	<button class="btn btn-outline-link" type="submit">تسجيل الخروج</button>
	                        </form>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/mwt_wjd_db" user="root" password=""/>
	
    <div class="container" style="margin-top: 100px;min-height: 100vh;">
        <div class="row">
            <div class="col-md-6 col-xl-3 mb-4">
                <div class="card shadow border-start-primary py-2">
                    <div class="card-body">
                        <div class="row align-items-center no-gutters">
                            <div class="col me-2">
                                <div class="text-uppercase text-primary fw-bold text-xs mb-1"><span>الطلبات الواردة</span></div>
                                <sql:query var="p_count" dataSource="${db}">
									select * from estates where status = 1
								</sql:query>
                                <div class="text-dark fw-bold h5 mb-0"><span>${p_count.rowCount}</span></div>
                            </div>
                            <div class="col-auto"><i class="fas fa-clipboard-list fa-2x text-gray-300" style="color: rgb(156,156,156);"></i></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-xl-3 mb-4">
                <div class="card shadow border-start-success py-2">
                    <div class="card-body">
                        <div class="row align-items-center no-gutters">
                            <div class="col me-2">
                                <div class="text-uppercase text-success fw-bold text-xs mb-1"><span>الطلبات الموافق عليها</span></div>
                                <sql:query var="p_count" dataSource="${db}">
									select * from estates where status = 2
								</sql:query>
                                <div class="text-dark fw-bold h5 mb-0"><span>${p_count.rowCount}</span></div>
                            </div>
                            <div class="col-auto"><i class="far fa-check-circle fa-2x text-gray-300" style="color: rgb(156,156,156);"></i></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-xl-3 mb-4">
                <div class="card shadow border-start-info py-2">
                    <div class="card-body">
                        <div class="row align-items-center no-gutters">
                            <div class="col me-2">
                                <div class="text-uppercase text-info fw-bold text-xs mb-1"><span class="text-danger">الطلبات المرفوضة</span></div>
                                <sql:query var="p_count" dataSource="${db}">
									select * from estates where status = 3
								</sql:query>
                                <div class="text-dark fw-bold h5 mb-0"><span>${p_count.rowCount}</span></div>                                
                            </div>
                            <div class="col-auto"><i class="far fa-window-close fa-2x text-gray-300" style="color: rgb(156,156,156);"></i></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-xl-3 mb-4">
                <div class="card shadow border-start-warning py-2">
                    <div class="card-body">
                        <div class="row align-items-center no-gutters">
                            <div class="col me-2">
                                <div class="text-uppercase text-warning fw-bold text-xs mb-1"><span>المواعيد المجدولة</span></div>
                                <sql:query var="p_count" dataSource="${db}">
									select * from appointements where status = 2
								</sql:query>
                                <div class="text-dark fw-bold h5 mb-0"><span>${p_count.rowCount}</span></div>
                            </div>
                            <div class="col-auto"><i class="far fa-calendar-alt fa-2x text-gray-300" style="color: rgb(156,156,156);"></i></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-7">
                <div class="card shadow">
                    <div class="card-header py-3">
                        <p class="text-primary m-0 fw-bold">عملاء قاموا برفع عقاراتهم مؤخراً</p>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive table mt-2" id="dataTable-1" role="grid" aria-describedby="dataTable_info">
                            <table class="table table-striped table-hover my-0" id="dataTable">
                                <thead>
                                    <tr>
                                        <th>الاسم</th>
                                        <th>رقم الموبايل 1</th>
                                        <th>رقم الموبايل 2</th>
                                        <th>نوع العقار</th>
                                        <th>نوع العرض</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <sql:query var="rs" dataSource="${db}">
									select * from estates where status = 1 order by uploaded_on desc LIMIT 10 
								</sql:query>
								<c:if test="${rs.rowCount == 0}">
									<tr>
										<td colspan="5">لا يوجد بيانات لعرضها</td>
									</tr>
								</c:if>
								
								<c:forEach  items="${rs.rows}" var="row">
									<tr>
                                        <td><i class="fa fa-user" style="margin: 0px 10px;color: rgb(106,106,106);font-size: 21px;"></i>${row.seller_name}</td>
                                        <td>${row.seller_phone_1}</td>
                                        <td>${row.seller_phone_2}</td>
                                        <c:choose>
											<c:when test="${row.estate_type == 1}">
												<td>منزل</td>
										    </c:when>   
										    <c:when test="${row.estate_type == 2}">
										    	<td>شقة</td>
										    </c:when>  
										    <c:when test="${row.estate_type == 3}">
											    <td>متجر</td>
										    </c:when>  
										    <c:otherwise>
										        <td>غير محدد</td>
										    </c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${row.show_type == 1}">
												<td>بيع</td>
										    </c:when>   
										    <c:when test="${row.show_type == 2}">
										    	<td>تأجير</td>
										    </c:when>  
										    <c:otherwise>
										        <td>غير محدد</td>
										    </c:otherwise>
										</c:choose>
                                    </tr>
								</c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-5">
                <div class="card shadow">
                    <div class="card-header py-3">
                        <p class="text-primary m-0 fw-bold">المواعيد القادمة</p>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive table mt-2" id="dataTable-2" role="grid" aria-describedby="dataTable_info">
                            <table class="table table-striped table-hover my-0" id="dataTable">
                                <thead>
                                    <tr>
                                        <th>الموعد</th>
                                        <th>اسم المشتري</th>
                                        <th>رقم الموبايل</th>
                                    </tr>
                                </thead>
                                <tbody>
		                            <sql:query var="rs" dataSource="${db}">
										select * from appointements where status = 2 order by appointement_time desc LIMIT 10 
									</sql:query>
									<c:if test="${rs.rowCount == 0}">
										<tr>
											<td colspan="3">لا يوجد بيانات لعرضها</td>
										</tr>
									</c:if>
									<c:forEach  items="${rs.rows}" var="row">
										<tr>
	                                        <td><i class="fa fa-clock-o" style="margin: 0px 10px;color: rgb(106,106,106);font-size: 21px;"></i>${row.appointement_time}</td>
	                                        <td>${row.buyer_name}</td>
	                                        <td>${row.buyer_mobile}</td>
	                                    </tr>
									</c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/bs-init.js"></script>
    <script src="assets/js/vanilla-zoom.js"></script>
    <script src="assets/js/theme.js"></script>
    <script src="assets/js/jquery-3.6.0.js"></script>
    <script src="assets/js/app.js"></script>
</body>

</html>