<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>الطلبات الواردة</title>
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
                    <li class="nav-item"><a class="nav-link" href="cpanel.jsp">الرئيسية</a></li>
                    <li class="nav-item"><a class="nav-link active" href="incoming_requests.jsp">الطلبات الواردة</a></li>
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
    <%-- <sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/mwt_wjd_db" user="root" password=""/> --%>
    <%-- <sql:setDataSource var="db" driver="org.postgresql.Driver" url="jdbc:postgresql://localhost:5432/mwt_wjd_db" user="postgres" password="123"/> --%>
    <sql:setDataSource var="db" driver="org.postgresql.Driver" url="jdbc:postgresql://ec2-52-30-67-143.eu-west-1.compute.amazonaws.com:5432/d9di4fco067fro" user="eyaynajizzxvfh" password="2180de3b721c3b93072c3bc9742eef6693792c1f92dc33d310192f69655c2725"/>
    <div class="container" style="margin-top: 100px;">
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
            <div class="col">
                <div class="card shadow">
                    <div class="card-header py-3">
                        <div class="row align-items-center">
                            <div class="col">
                                <p class="text-primary m-0 fw-bold">الطلبات الواردة</p>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive table mt-2" id="dataTable-1" role="grid" aria-describedby="dataTable_info">
                            <table class="table table-striped table-hover my-0" id="dataTable">
                                <thead>
                                    <tr>
                                        <th>تم الرفع في</th>
                                        <th>النوع</th>
                                        <th>نوع البيع</th>
                                        <th>العنوان</th>
                                        <th>السعر</th>
                                        <th><strong>اسم البائع</strong><br></th>
                                        <th>الحالة</th>
                                        <th>العمليات</th>
                                    </tr>
                                </thead>
                                <tbody>
	                                <sql:query var="rs" dataSource="${db}">
										select * from estates order by uploaded_on desc
									</sql:query>
									<c:if test="${rs.rowCount == 0}">
										<tr>
											<td colspan="8">لا يوجد بيانات لعرضها</td>
										</tr>
									</c:if>
									
									<c:forEach  items="${rs.rows}" var="row">
										<tr>
											<td><i class="fa fa-sign-in" style="margin: 0px 10px;color: rgb(106,106,106);font-size: 21px;"></i>${row.uploaded_on}</td>
	                                        <c:choose>
												<c:when test="${row.estate_type == 1}">
													<td class="estate_type">منزل</td>
											    </c:when>   
											    <c:when test="${row.estate_type == 2}">
											    	<td class="estate_type">شقة</td>
											    </c:when>  
											    <c:when test="${row.estate_type == 3}">
												    <td class="estate_type">متجر</td>
											    </c:when>  
											    <c:otherwise>
											        <td class="estate_type">غير محدد</td>
											    </c:otherwise>
											</c:choose>
	                                        <c:choose>
												<c:when test="${row.show_type == 1}">
													<td class="show_type">بيع</td>
											    </c:when>   
											    <c:when test="${row.show_type == 2}">
											    	<td class="show_type">تأجير</td>
											    </c:when>  
											    <c:otherwise>
											        <td class="show_type">غير محدد</td>
											    </c:otherwise>
											</c:choose>
	                                        <td class="estate_address">${row.estate_address}</td>
	                                        <td class="price"><fmt:formatNumber value = "${row.price}"/> ل.س</td>
	                                        <td class="seller_name">${row.seller_name}</td>
	                                        <td class="estate_notes d-none">${row.estate_notes}</td>
	                                        <td class="estate_size d-none"><fmt:formatNumber value = "${row.estate_size}"/> م مربع</td>
	                                        <td class="seller_phone_1 d-none">${row.seller_phone_1}</td>
	                                        <td class="seller_phone_2 d-none">${row.seller_phone_2}</td>
	                                        <c:choose>
												<c:when test="${row.status == 1}">
													<td class="status" data-id="1">جديد</td>
											    </c:when>   
											    <c:when test="${row.status == 2}">
											    	<td class="status" data-id="2">تمت الموافقة</td>
											    </c:when>  
											    <c:when test="${row.status == 3}">
												    <td class="status" data-id="3">مرفوض</td>
											    </c:when>  
											    <c:otherwise>
											        <td>غير محدد</td>
											    </c:otherwise>
											</c:choose>
	                                        <td>
	                                            <div class="btn-group btn-group-sm border rounded" role="group">
	                                            <button class="btn btn-primary ms-2 request_details_btn" data-bs-toggle="tooltip" data-bss-tooltip="" type="button" title="عرض التفاصيل" data-id="${row.id}">
	                                            <i class="fa fa-search"></i>
	                                            </button>
	                                            <a class="btn btn-success ms-2 download_contract_btn" role="button" data-bs-toggle="tooltip" data-bss-tooltip="" title="تحميل عقد الملكية" data-id="${row.id}" href="${row.contract_file_url}" download="">
	                                            <i class="fa fa-download"></i>
	                                            </a>
	                                            <button class="btn btn-danger ms-2 delete_request_btn" data-bs-toggle="tooltip" data-bss-tooltip="" type="button" title="حذف الطلب" data-id="${row.id}">
	                                            <i class="fa fa-trash-o"></i>
	                                            </button>
	                                            </div>
	                                        </td>
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
    <div class="modal fade" role="dialog" tabindex="-1" id="confirm_delete_request">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">حذف طلب</h4><button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>هل أنت متأكد من عملية الحذف؟</p>
                </div>
                <div class="modal-footer">
                    <form class="flex-grow-1" method="post" action="DeleteRequest">
                    <input class="form-control" type="hidden" id="request-id" name="request_id">
                        <div class="row">
                            <div class="col d-flex justify-content-between">
                            <button class="btn btn-light" id="close-delete-request-modal" type="button" data-bs-dismiss="modal">إلغاء الأمر</button>
                            <button class="btn btn-danger" id="confirm-delete-request" type="submit">تأكيد الحذف</button></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" role="dialog" tabindex="-1" id="request_details_modal">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">بيانات الطلب</h4><button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form class="flex-grow-1" method="post" action="UpdateRequestStatus">
                    <input class="form-control" type="hidden" id="request_id2" name="request_id2">
                        <div class="row">
                            <div class="col-lg-6">
	                            <label class="form-label">النوع</label>
	                            <input class="form-control" type="text" disabled="" name="estate_type" id="m_estate_type">
                            </div>
                            <div class="col-lg-6">
	                            <label class="form-label">نوع البيع</label>
	                            <input class="form-control" type="text" disabled="" name="show_type" id="m_show_type">
                            </div>
                            <div class="col-lg-6">
	                            <label class="form-label">المساحة</label>
	                            <input class="form-control" type="text" disabled="" name="estate_size" id="m_estate_size">
                            </div>
                            <div class="col-lg-6">
	                            <label class="form-label">السعر</label>
	                            <input class="form-control" type="text" disabled="" name="price" id="m_price">
                            </div>
                            <div class="col-12">
	                            <label class="form-label">العنوان</label>
	                            <input class="form-control" type="text" disabled="" name="estate_address" id="m_estate_address">
                            </div>
                            <div class="col-12">
	                            <label class="form-label">ملاحظات أخرى</label>
	                            <input class="form-control" type="text" disabled="" name="estate_notes" id="m_estate_notes">
                            </div>
                            <div class="col-12">
	                            <label class="form-label">اسم البائع</label>
	                            <input class="form-control" type="text" disabled="" name="seller_name" id="m_seller_name">
                            </div>
                            <div class="col-lg-6">
	                            <label class="form-label">الموبايل 1</label>
	                            <input class="form-control" type="text" disabled="" name="seller_mobile1" id="m_seller_mobile1">
                            </div>
                            <div class="col-lg-6">
	                            <label class="form-label">الموبايل 2</label>
	                            <input class="form-control" type="text" disabled="" name="seller_mobile2" id="m_seller_mobile2">
                            </div>
                            <div class="col-lg-6">
                            	<label class="form-label">الحالة</label>
                            	<select class="form-select" id="m_status" name="status">
                                    <optgroup label="قم بتحديد حالة العرض">
                                        <option value="1" selected="">جديد</option>
                                        <option value="2">مقبول</option>
                                        <option value="3">مرفوض</option>
                                    </optgroup>
                                </select>
                            </div>
                            <div class="col-lg-6 d-xl-flex justify-content-end align-items-end">
                            <a class="btn btn-dark" role="button" href="" download="" id="m_file_url">
                            <i class="fa fa-download"></i>&nbsp; تحميل عقد البيع</a>
                            </div>
                        </div>
                        <div class="row mt-4">
                            <div class="col d-flex justify-content-between">
                            <button class="btn btn-light" type="button" data-bs-dismiss="modal">إلغاء الأمر</button>
                            <button class="btn btn-primary" type="submit">حفظ</button>
                            </div>
                        </div>
                    </form>
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