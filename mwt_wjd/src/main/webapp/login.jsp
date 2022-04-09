<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ar">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>تسجيل الدخول</title>
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
		if(session.getAttribute("uid") != null){
			response.sendRedirect("cpanel.jsp");
		}
	%>
    <nav class="navbar navbar-light navbar-expand-lg fixed-top bg-white clean-navbar">
        <div class="container"><a class="navbar-brand logo" href="index.jsp">البسيط للعقارات</a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-2"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-2">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item"><a class="nav-link" href="index.jsp">الرئيسية</a></li>
                    <li class="nav-item"><a class="nav-link active" href="login.jsp">تسجيل الدخول</a></li>
                    <li class="nav-item"><a class="btn btn-primary" role="button" href="upload_estate.jsp">قم بعرض عقارك الآن</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <main class="page landing-page">
        <section class="mt-5 mb-5" style="height: 70vh;">
            <div class="container bg-light bg-gradient border rounded shadow-lg mt-5 mb-5" style="max-width: 800px;">
                <div class="row">
                    <div class="col">
                        <h2 class="text-center text-dark mb-3 mt-5">تسجيل الدخول</h2>
                        <p class="text-center text-muted">إن عملية تسجيل الدخول متاحة فقط للمدراء<br>إذا كنت مديراً، قم بإدخال بياناتك ثم انقر على تسجيل الدخول</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col pb-5">
                        <form class="text-center mt-2" method="post" enctype="application/x-www-form-urlencoded" style="max-width: 500px;margin: auto;" action="LoginServlet">
                            <div class="row">
                                <div class="col-12 mb-3"><input class="border rounded form-control form-control-lg" type="text" name="username" placeholder="اسم المستحدم" required=""></div>
                                <div class="col-12 mb-3"><input class="border rounded form-control form-control-lg" type="password" name="password" placeholder="كلمة المرور" required=""></div>
                                <div class="col-12 mb-3">
                                    <p class="text-end text-danger mb-0 fw-bold" id="login_error">${p_error}</p>
                                    <button class="btn btn-primary btn-lg text-center border rounded mt-3 ps-5 pe-5" type="submit">تسجيل الدخول</button>
                                </div>
                            </div>
                        </form>
                    </div>
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
    <script src="assets/js/vanilla-zoom.js"></script>
    <script src="assets/js/theme.js"></script>
    <script src="assets/js/jquery-3.6.0.js"></script>
    <script src="assets/js/app.js"></script>
</body>

</html>