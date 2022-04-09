<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ar">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>البسيط للعقارات</title>
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
                    <li class="nav-item"><a class="nav-link active" href="index.jsp">الرئيسية</a></li>
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
        <section class="clean-block clean-hero" style="color: rgba(9, 162, 255, 0.85);background: url('assets/img/header-bg.jpg') center / cover repeat;">
            <div class="text">
                <h2>أهلاً بك</h2>
                <p>قم باختيار العقار الذي يناسب احتياجاتك و طموحاتك<br>لرؤية كل العروض المتوفرة انقر على عرض الكل</p><a class="btn btn-outline-light btn-lg" role="button" href="#show_estates">استعراض العروض الجديدة</a>
            </div>
        </section>
        <section class="clean-block clean-info dark pb-5">
            <div class="container">
                <div class="block-heading">
                    <h2 class="text-info" id="show_estates">أحدث العروض</h2>
                </div>
                <sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/mwt_wjd_db" user="root" password=""/>

				<sql:query var="rs" dataSource="${db}">
					select * from estates where status = 2 order by uploaded_on desc
				</sql:query>
				
				<c:forEach  items="${rs.rows}" var="row">
					<div class="col-lg-8 card-style shadow">
                        <div class="row g-0 align-items-center">
                            <div class="col-auto col-md-4 text-center">
                            <c:choose>
								<c:when test="${row.estate_type == 1}">
									<i class="fas fa-home" style="width: 98px;font-size: 100px;color: rgb(94,82,241);"></i>
							    </c:when>   
							    <c:when test="${row.estate_type == 2}">
							    	<i class="far fa-building" style="width: 98px;font-size: 100px;color: rgb(71,213,94);"></i>
							    </c:when>  
							    <c:when test="${row.estate_type == 3}">
								    <i class="fas fa-store" style="width: 98px;font-size: 100px;color: rgb(213,71,84);"></i>
							    </c:when>  
							    <c:otherwise>
							        <i class="fas fa-landmark" style="width: 98px;font-size: 100px;color: rgb(213,71,84);"></i>
							    </c:otherwise>
							</c:choose>
                            
                            </div>
                            <div class="col-auto col-md-8">
                                <ul>
                                	<c:choose>
										<c:when test="${row.estate_type == 1}">
											<li>النوع: منزل</li>
									    </c:when>   
									    <c:when test="${row.estate_type == 2}">
									    	<li>النوع: شقة</li>
									    </c:when>  
									    <c:when test="${row.estate_type == 3}">
										    <li>النوع: متجر</li>
									    </c:when>  
									    <c:otherwise>
									        <li>النوع: غير محدد</li>
									    </c:otherwise>
									</c:choose>
									
									<c:choose>
										<c:when test="${row.show_type == 1}">
											<li>نوع العرض: بيع</li>
									    </c:when>   
									    <c:when test="${row.show_type == 2}">
									    	<li>نوع العرض: تأجير</li>
									    </c:when>  
									    <c:otherwise>
									        <li>نوع العرض: غير محدد</li>
									    </c:otherwise>
									</c:choose>
                                    <li>المساحة: <fmt:formatNumber value = "${row.estate_size}"/> م مربع</li>
                                    <li>السعر المطلوب: <fmt:formatNumber value = "${row.price}"/> ل.س</li>
                                    <li>تاريخ العرض: <fmt:formatDate value="${row.uploaded_on}" pattern="yyyy-MM-dd"/></li>
                                    <li>ملاحظات أخرى: ${row.estate_notes}</li>
                                </ul>
                            </div>
                            <div class="col-12">
                                <div class="row">
                                    <div class="col text-start">
                                    <form action="SetAppointement" method="post">
                                    	<input type="hidden" name="estate_id" value="${row.id}" />
                                    	<button class="btn btn-outline-primary btn-lg" type="submit">طلب موعد</button>
                                    </form>
                                    
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
				</c:forEach>
                
            </div>
        </section>
        <section class="clean-block features">
            <div class="container">
                <div class="block-heading">
                    <h2 class="text-info">مهمتنا</h2>
                    <p>نبني على أساسات ثابتة و قواعد عالمية<br></p>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-5 feature-box"><i class="icon-lock icon"></i>
                        <h4>الآمان</h4>
                        <p>خصوصيتك من أهم أولوياتنا، بياناتك محمية و لن يتم الوصول إليها من قبل أي طرف إلى بإعلامك و أخذ موافقتك أولاً.</p>
                    </div>
                    <div class="col-md-5 feature-box"><i class="icon-speedometer icon"></i>
                        <h4>سهولة الوصول</h4>
                        <p>يمكنك بعدة دقائق رفع&nbsp; عقارك و بدء الاستثمار، لن تكون العملية أسهل من ذلك، إنها لا تحتاج إنشاء حساب حتى!</p>
                    </div>
                    <div class="col-md-5 feature-box"><i class="icon-screen-smartphone icon"></i>
                        <h4>البساطة</h4>
                        <p>بساطة التصميم ستتيح لك استخدام خدماتنا من أي مكان و عبر أي جهاز سواء كان هاتف محمول أو حاسوب شخصي.</p>
                    </div>
                    <div class="col-md-5 feature-box"><i class="icon-screen-desktop icon"></i>
                        <h4>الدعم المتواصل</h4>
                        <p>فريقنا موجود على مدار الساعة لاستقبال الطلبات و الرد عليها بأسرع وقت ممكن، لضمان جودة الخدمة.</p>
                    </div>
                </div>
            </div>
        </section>
        <section class="clean-block about-us">
            <div class="container">
                <div class="block-heading pt-1">
                    <h2 class="text-info">من نحن</h2>
                    <p>مجموعة من المطورين نعمل على تسهيل التعامل بين العملاء<br>عن طريق تقديم أنظمة موثوقة و سهلة الاستخدام</p>
                </div>
            </div>
        </section>
    </main>
    <footer class="page-footer dark">
        <div class="footer-copyright">
            <p>© 2022 البسيط للعقارات</p>
        </div>
    </footer>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/bs-init.js"></script>
    <script src="assets/js/theme.js"></script>
    <script src="assets/js/jquery-3.6.0.js"></script>
    <script src="assets/js/app.js"></script>
</body>

</html>