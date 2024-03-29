<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="zxx">
<head>
    <title>Home</title>
    <!-- Meta tag Keywords -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8" />
    <meta name="keywords" content="" />
    <script>
        addEventListener("load", function() {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }

    </script>
    <!-- //Meta tag Keywords -->

    <!-- Custom-Files -->
    <link rel="stylesheet" href="css/bootstrap.css">
    <!-- Bootstrap-Core-CSS -->
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
    <link rel="stylesheet" href="css/portfolio.css">
    <link rel="stylesheet" href="css/aos.css">
    <link href='css/aos-animation.css' rel='stylesheet prefetch' type="text/css" media="all" />

    <!-- Style-CSS -->
    <!-- font-awesome-icons -->
    <link href="css/font-awesome.css" rel="stylesheet">
    <!-- //font-awesome-icons -->
    <!-- /Fonts -->
    <link href="http://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700i" rel="stylesheet">
    <!-- //Fonts -->

</head>

<body>
    <!-- mian-content -->
    <div class="main-content" id="home">
        <!-- header -->
        <header class="py-1">
            <div class="container">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <h1>
                        <a class="navbar-brand" href="index.jsp"><i class="fa fa-ravelry" aria-hidden="true"></i></a>
                    </h1>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ml-4 m-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="about.jsp">关于我们 <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					  更多信息 <i class="fa fa-angle-down" aria-hidden="true"></i>
					</a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="features.jsp">特色</a>
                                    <!-- 刘帅 -->
                                    <a class="dropdown-item" href="javascript:void(0);" onclick = "toBlog()">博客</a>
                                    <a class="dropdown-item" href="features.jsp">服务</a>
                                </div>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					  菜单 <i class="fa fa-angle-down" aria-hidden="true"></i>
					</a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="gallery.jsp">画廊</a>
                                    <a class="dropdown-item" href="about.jsp">关于我们</a>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="contact.jsp">建议</a>
                            </li>
                        </ul>
                        <!-- ls -->
                        <c:if test="${empty user }">
                        <div class="header-right">
                            <a href="signin.jsp" class="signin mr-4"> 登录 <i class="fas fa-sign-in-alt"></i></a>
                            <a href="register.jsp" class="contact">启 程</a>
                        </div>
                        </c:if>
                        <c:if test="${not empty user }">
                        <div class="header-right">
                            <a href="information.jsp" class="signin mr-4"> ${user[0].uname } <i class="fas fa-sign-in-alt"></i></a>
                            <a href="javascript:void(0);" class="signin mr-4" onclick = "logout()">注 销</a>
                        </div>
                        </c:if>
                        <!-- ls -->
                    </div>
                </nav>
            </div>
        </header>
        <!-- //header -->
        <!-- banner-w3layouts -->
        <section class="banner-w3layouts">
            <div class="container">
                <div class="row banner-w3layouts-grids">
                    <div class="col-lg-6 banner-w3layouts-info">
                        <h2 data-aos="fade-up">Let's Make Your
                        </h2>
                        <h3 class="mb-3" data-aos="fade-up">Design Great Again</h3>
                        <p class="mb-4" data-aos="fade-up"> Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla mollis dapibus nunc, ut rhoncus turpis sodales quis. Integer sit amet mattis quam, sit amet ultricies velit. Praesent ullamcorper dui turpis.</p>
                        <a href="single.jsp" class="btn">Read More</a>
                    </div>
                    <div class="col-lg-6 banner-w3layouts-image">
                        <div class="effect-w3">
                            <img src="images/img.jpg" alt="" class="img-fluid image1">
                            <img src="images/img.jpg" alt="" class="img-fluid image2">
                            <img src="images/img.jpg" alt="" class="img-fluid image3">
                            <img src="images/img.jpg" alt="" class="img-fluid image4">
                        </div>

                    </div>
                </div>
            </div>
        </section>
        <!-- //banner-w3layouts -->
    </div>
    <!--/ab -->
    <section class="about py-lg-5 py-md-5 py-3">
        <div class="container">
            <div class="inner-sec-wthree py-lg-5 py-3">
                <h3 class="tittle text-uppercase text-center mb-lg-5 mb-3"><span class="sub-tittle">About.</span> Creativity has no Boundaries</h3>
                <div class="feature-grids row mb-lg-5 mb-3">
                    <div class="col-lg-4 p-0" data-aos="fade-up">
                        <div class="bottom-gd p-5">

                            <h3 class="my-3"> <span class="fa fa-crosshairs" aria-hidden="true"></span> Web Interactive</h3>
                            <p>Integer sit amet mattis quam, sit amet ultricies velit. Praesent ullamcorper dui turpis.</p>
                        </div>
                    </div>
                    <div class="col-lg-4 p-0" data-aos="fade-up">
                        <div class="bottom-gd2-active p-5">

                            <h3 class="my-3"> <span class="fa fa-clone" aria-hidden="true"></span> Unique design</h3>
                            <p>Integer sit amet mattis quam, sit amet ultricies velit. Praesent ullamcorper dui turpis.</p>
                        </div>
                    </div>
                    <div class="col-lg-4 p-0" data-aos="fade-up">
                        <div class="bottom-gd p-5">

                            <h3 class="my-3"> <span class="fa fa-laptop" aria-hidden="true"></span> Supporting</h3>
                            <p>Integer sit amet mattis quam, sit amet ultricies velit. Praesent ullamcorper dui turpis.</p>
                        </div>
                    </div>

                </div>
                <!-- services -->
                <div class="fetured-info pt-lg-5">
                    <h3 class="tittle text-uppercase text-center my-lg-5 my-3"><span class="sub-tittle">What we do</span> Our Featured Services</h3>
                    <div class="row fetured-sec mt-lg-5">

                        <div class="col-lg-6 serv_bottom">
                            <div class="featured-left text-center">
                                <div class="bottom-gd fea p-5 my-3" data-aos="fade-left">
                                    <span class="fa fa-lightbulb-o" aria-hidden="true"></span>
                                    <h3 class="my-3 text-uppercase">Creative Design</h3>
                                    <p class="px-lg-3">Integer sit amet mattis quam, sit amet ultricies velit.convallis at tellus. Nulla quis lorem ipnut libero malesuada feugiat. Lorem ipsum dolor sit amet.</p>
                                </div>
                                <div class="bottom-gd fea active p-5" data-aos="fade-left">
                                    <span class="fa fa-laptop" aria-hidden="true"></span>
                                    <h3 class="my-3 text-uppercase">100% Responsive</h3>
                                    <p class="px-lg-3">Integer sit amet mattis quam, sit amet ultricies velit.convallis at tellus. Nulla quis lorem ipnut libero malesuada feugiat. Lorem ipsum dolor sit amet.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 p-0">
                            <img src="images/img1.jpg" class="img-fluid" alt="">
                        </div>
                    </div>
                </div>
                <!-- //services -->
            </div>
        </div>
    </section>
    <!-- //ab -->
    <!--/counter-->
    <section class="stats py-lg-5 py-4">
        <div class="container">
            <div class="row text-center">
                <div class="col">
                    <div class="counter">
                        <h3 class="timer count-title count-number" data-to="100" data-speed="1500"></h3>
                        <p class="count-text ">Support</p>
                    </div>
                </div>
                <div class="col">
                    <div class="counter">
                        <h3 class="timer count-title count-number" data-to="1700" data-speed="1500"></h3>
                        <p class="count-text ">Happy Hours</p>
                    </div>
                </div>
                <div class="col">
                    <div class="counter">
                        <h3 class="timer count-title count-number" data-to="11900" data-speed="1500"></h3>
                        <p class="count-text ">Project Complete</p>
                    </div>
                </div>
                <div class="col">
                    <div class="counter">
                        <h3 class="timer count-title count-number" data-to="157" data-speed="1500"></h3>
                        <p class="count-text ">Cups of Coffee</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--//counter-->
    <div class="tlinks">Collect from <a href="http://www.cssmoban.com/"  title="网站模板">网站模板</a></div>
    <!--//team -->
    <section class="banner-w3layouts-bottom py-lg-5 py-4">
        <div class="container">
            <div class="inner-sec-wthree py-lg-5 py-4 speak">
                <h3 class="tittle text-uppercase text-center my-lg-5 my-3"><span class="sub-tittle">Amazing People</span> Our Great Team</h3>
                <div class="row mt-lg-5 mt-4">
                    <div class="col-md-4 team-gd text-center" data-aos="fade-right">
                        <div class="team-img mb-4">
                            <img src="images/designer1.jpg" class="img-fluid rounded-circle" alt="user-image">
                        </div>
                        <div class="team-info">
                            <h3 class="mt-md-4 mt-3"><span class="sub-tittle-team">Designer</span> 任靖辉</h3>
                            <p>内向的人就像NPC，除非有人和我先说话，不然我们是不会先说话的。.</p>
                            <ul class="social_section_1info mt-md-4 mt-3">
                                <li class="mb-2 facebook"><a href="#"><i class="fa fa-facebook mr-1"></i>facebook</a></li>
                                <li class="mb-2 twitter"><a href="#"><i class="fa fa-twitter mr-1"></i>twitter</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-md-4 team-gd second text-center">
                        <div class="team-img mb-4">
                            <img src="images/designer2.jpg" class="img-fluid rounded-circle" alt="user-image">
                        </div>
                        <div class="team-info">
                            <h3 class="mt-md-4 mt-3"><span class="sub-tittle-team">Designer</span> 刘 帅</h3>
                            <p>活在当下.</p>
                            <ul class="social_section_1info mt-md-4 mt-3">
                                <li class="google"><a href="#"><i class="fa fa-google-plus mr-1"></i>google</a></li>
                                <li class="linkedin"><a href="#"><i class="fa fa-linkedin mr-1"></i>linkedin</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4 team-gd text-center" data-aos="fade-left">
                        <div class="team-img mb-4">
                            <img src="images/designer3.jpg" class="img-fluid rounded-circle" alt="user-image">
                        </div>
                        <div class="team-info">
                            <h3 class="mt-md-4 mt-3"><span class="sub-tittle-team">Designer</span> 高鑫洋</h3>
                            <p>看我用98k狙击你的心❤.</p>
                            <ul class="social_section_1info mt-md-4 mt-3">
                                <li class="mb-2 facebook"><a href="#"><i class="fa fa-facebook mr-1"></i>facebook</a></li>
                                <li class="mb-2 twitter"><a href="#"><i class="fa fa-twitter mr-1"></i>twitter</a></li>
                            </ul>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </section>
    <!--//team -->
    <!-- middle section -->
    <div class="middle-tem-insidel pt-lg-5">
        <div class="progress-info">

            <div class="right-side-img-tem-inside">

            </div>
            <div class="left-build-main-temps">
                <h3 class="tittle text-uppercase text-left my-lg-5 my-3"><span class="sub-tittle">WOrk Abilities</span> Our Skills</h3>
                <div class="progress-one my-lg-5" data-aos="fade-up">
                    <h4 class="progress-tittle">Web Design</h4>
                    <div class="progress">
                        <div class="progress-bar progress-bar-striped" role="progressbar" style="width: 10%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                </div>
                <div class="progress-one" data-aos="fade-up">
                    <h4 class="progress-tittle">Branding</h4>
                    <div class="progress">
                        <div class="progress-bar progress-bar-striped bg-success" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                </div>
                <div class="progress-one my-lg-5" data-aos="fade-up">
                    <h4 class="progress-tittle">PHP Development</h4>
                    <div class="progress">
                        <div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                </div>
                <div class="progress-one" data-aos="fade-up">
                    <h4 class="progress-tittle">Marketing</h4>
                    <div class="progress">
                        <div class="progress-bar progress-bar-striped bg-warning" role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <!--//middle section -->
    <!-- portfolio -->
    <section class="portfolio-flyer pt-5 pb-5" id="gallery">
        <div class="container py-lg-5">
            <h3 class="tittle text-uppercase text-center my-lg-5 my-3"><span class="sub-tittle"> Recent Works </span>Stunning Projects</h3>
            <div class="row mt-lg-4 mt-3">
                <ul class="nav nav-pills mt-3" id="pills-tab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="showall-tab" data-toggle="pill" href="#showall" role="tab" aria-controls="showall" aria-selected="true">All</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="categorys-tab" data-toggle="pill" href="#categorys" role="tab" aria-controls="categorys" aria-selected="false">Tab 1</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="Tab2-Image-tab" data-toggle="pill" href="#Tab2-Image" role="tab" aria-controls="Tab2-Image" aria-selected="false">Tab 2</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="Tab3-Image-tab" data-toggle="pill" href="#Tab3-Image" role="tab" aria-controls="Tab3-Image" aria-selected="false">Tab 3</a>
                    </li>
                </ul>
            </div>
            <div class="container">
                <div class="tab-content" id="pills-tabContent">
                    <div class="tab-pane fade show active" id="showall" role="tabpanel" aria-labelledby="showall-tab">
                        <div class="portfolio" data-aos="zoom-in">
                            <a class="thumbnail" href="#" data-toggle="modal" data-target="#exampleModalCenter5" data-image="images/n1.jpg" data-target="#image-gallery">
                                    <img class="categoryd-img img-fluid" src="images/n1.jpg" alt="Slog" />
                            </a>
                        </div>
                        <div class="portfolio" data-aos="zoom-in">
                            <a class="thumbnail" href="#" data-toggle="modal" data-target="#exampleModalCenter6" data-image="images/n1.jpg" data-target="#image-gallery">
                                    <img class="categoryd-img img-fluid" src="images/n2.jpg" alt="Slog" />
                            </a>
                        </div>
                        <div class="portfolio lost" data-aos="zoom-in">
                            <a class="thumbnail" href="#" data-toggle="modal" data-target="#exampleModalCenter7" data-image="images/n3.jpg" data-target="#image-gallery">
                                    <img class="categoryd-img img-fluid" src="images/n3.jpg" alt="Slog" />
                            </a>
                        </div>
                        <div class="portfolio" data-aos="zoom-in">
                            <a class="thumbnail" href="#" data-toggle="modal" data-target="#exampleModalCenter8" data-image="images/n4.jpg" data-target="#image-gallery">
                                    <img class="categoryd-img img-fluid" src="images/n4.jpg" alt="Slog" />
                            </a>
                        </div>
                        <div class="portfolio" data-aos="zoom-in">
                            <a class="thumbnail" href="#" data-toggle="modal" data-target="#exampleModalCenter9" data-image="images/n9.jpg" data-target="#image-gallery">
                                    <img class="categoryd-img img-fluid" src="images/n9.jpg" alt="Slog" />
                            </a>

                        </div>
                        <div class="portfolio lost" data-aos="zoom-in">
                            <a class="thumbnail" href="#" data-toggle="modal" data-target="#exampleModalCenter10" data-image="images/n5.jpg" data-target="#image-gallery">
                                    <img class="categoryd-img img-fluid" src="images/n5.jpg" alt="Slog" />
                            </a>
                        </div>
                        <div class="portfolio" data-aos="zoom-in">
                            <a class="thumbnail" href="#" data-toggle="modal" data-target="#exampleModalCenter11" data-image="images/g7s.jpg" data-target="#image-gallery">
                                    <img class="categoryd-img img-fluid" src="images/n7.jpg" alt="Slog" />
                            </a>

                        </div>
                        <div class="portfolio" data-aos="zoom-in">
                            <a class="thumbnail" href="#" data-toggle="modal" data-target="#exampleModalCenter12" data-image="images/n8.jpg" data-target="#image-gallery">
                                    <img class="categoryd-img img-fluid" src="images/n8.jpg" alt="Slog" />
                            </a>

                        </div>
                        <div class="portfolio lost" data-aos="zoom-in">
                            <a class="thumbnail" href="#" data-toggle="modal" data-target="#exampleModalCenter13" data-image="images/n6.jpg" data-target="#image-gallery">
                                    <img class="categoryd-img img-fluid" src="images/n6.jpg" alt="Slog" />
                            </a>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="categorys" role="tabpanel" aria-labelledby="categorys-tab">
                        <div class="portfolio" data-aos="zoom-in">
                            <a class="thumbnail" href="#" data-toggle="modal" data-target="#exampleModalCenter6" data-image="images/n1.jpg" data-target="#image-gallery">
                                    <img class="categoryd-img img-fluid" src="images/n2.jpg" alt="Slog" />
                            </a>

                        </div>
                        <div class="portfolio" data-aos="zoom-in">
                            <a class="thumbnail" href="#" data-toggle="modal" data-target="#exampleModalCenter7" data-image="images/n3.jpg" data-target="#image-gallery">
                                    <img class="categoryd-img img-fluid" src="images/n3.jpg" alt="Slog" />
                            </a>

                        </div>
                        <div class="portfolio" data-aos="zoom-in">
                            <a class="thumbnail" href="#" data-toggle="modal" data-target="#exampleModalCenter8" data-image="images/n4.jpg" data-target="#image-gallery">
                                    <img class="categoryd-img img-fluid" src="images/n4.jpg" alt="Slog" />
                            </a>

                        </div>
                    </div>
                    <div class="tab-pane fade" id="Tab3-Image" role="tabpanel" aria-labelledby="Tab3-Image-tab">
                        <div class="portfolio" data-aos="zoom-in">
                            <a class="thumbnail" href="#" data-toggle="modal" data-target="#exampleModalCenter9" data-image="images/n9.jpg" data-target="#image-gallery">
                                    <img class="categoryd-img img-fluid" src="images/n9.jpg" alt="Slog" />
                            </a>

                        </div>
                        <div class="portfolio" data-aos="zoom-in">
                            <a class="thumbnail" href="#" data-toggle="modal" data-target="#exampleModalCenter11" data-image="images/g7s.jpg" data-target="#image-gallery">
                                    <img class="categoryd-img img-fluid" src="images/n7.jpg" alt="Slog" />
                            </a>
                        </div>
                        <div class="portfolio" data-aos="zoom-in">
                            <a class="thumbnail" href="#" data-toggle="modal" data-target="#exampleModalCenter12" data-image="images/n8.jpg" data-target="#image-gallery">
                                    <img class="categoryd-img img-fluid" src="images/n8.jpg" alt="Slog" />
                            </a>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="Tab2-Image" role="tabpanel" aria-labelledby="Tab2-Image-tab">
                        <div class="portfolio" data-aos="zoom-in">
                            <a class="thumbnail" href="#" data-toggle="modal" data-target="#exampleModalCenter9" data-image="images/n9.jpg" data-target="#image-gallery">
                                    <img class="categoryd-img img-fluid" src="images/n9.jpg" alt="Slog" />
                            </a>

                        </div>
                        <div class="portfolio" data-aos="zoom-in">
                            <a class="thumbnail" href="#" data-toggle="modal" data-target="#exampleModalCenter6" data-image="images/n1.jpg" data-target="#image-gallery">
                                    <img class="categoryd-img img-fluid" src="images/n2.jpg" alt="Slog" />
                            </a>

                        </div>
                        <div class="portfolio" data-aos="zoom-in">
                            <a class="thumbnail" href="#" data-toggle="modal" data-target="#exampleModalCenter7" data-image="images/n3.jpg" data-target="#image-gallery">
                                    <img class="categoryd-img img-fluid" src="images/n3.jpg" alt="Slog" />
                            </a>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </section>
    <!-- //portfolio -->
    <!--/model-->
    <div class="modal fade" id="exampleModalCenter5" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header text-left">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="login px-4 mx-auto mw-100 gal-img pb-3">
                        <img class="img-fluid col-md-12" src="images/n1.jpg" alt="Slog">
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="modal fade" id="exampleModalCenter6" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header text-left">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body pb-3">
                    <div class="login px-4 mx-auto mw-100 gal-img pb-3">
                        <img class="img-fluid col-md-12" src="images/n2.jpg" alt="Slog">
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="modal fade" id="exampleModalCenter7" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header text-left">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body pb-3">
                    <div class="login px-4 mx-auto mw-100 gal-img pb-3">
                        <img class="img-fluid col-md-12" src="images/n3.jpg" alt="Slog">
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="modal fade" id="exampleModalCenter8" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header text-left">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body pb-3">
                    <div class="login px-4 mx-auto mw-100 gal-img pb-3">
                        <img class="img-fluid col-md-12" src="images/n4.jpg" alt="Slog">
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="modal fade" id="exampleModalCenter9" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header text-left">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body pb-3">
                    <div class="login px-4 mx-auto mw-100 gal-img pb-3">
                        <img class="img-fluid col-md-12" src="images/n9.jpg" alt="Slog">
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="modal fade" id="exampleModalCenter10" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header text-left">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body pb-3">
                    <div class="login px-4 mx-auto mw-100 gal-img pb-3">
                        <img class="img-fluid col-md-12" src="images/n5.jpg" alt="Slog">
                    </div>
                </div>

            </div>
        </div>
    </div>

    <div class="modal fade" id="exampleModalCenter11" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header text-left">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body pb-3">
                    <div class="login px-4 mx-auto mw-100 gal-img pb-3">
                        <img class="img-fluid col-md-12" src="images/n7.jpg" alt="Slog">
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="modal fade" id="exampleModalCenter12" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header text-left">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body pb-3">
                    <div class="login px-4 mx-auto mw-100 gal-img pb-3">
                        <img class="img-fluid col-md-12" src="images/n8.jpg" alt="Slog">
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="modal fade" id="exampleModalCenter13" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header text-left">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body pb-3">
                    <div class="login px-4 mx-auto mw-100 gal-img pb-3">
                        <img class="img-fluid col-md-12" src="images/n6.jpg" alt="Slog">
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!--//model-->

    <!--//portfolio-->

    <!-- /hand-crafted -->
    <section class="hand-crafted py-4">
        <div class="container py-xl-5 py-lg-3">
            <div class="row banner-w3layouts-grids">
                <div class="col-lg-6 banner-w3layouts-image">
                    <div class="effect-w3">
                        <img src="images/img2.jpg" alt="" class="img-fluid image1">
                        <img src="images/img2.jpg" alt="" class="img-fluid image2">
                        <img src="images/img2.jpg" alt="" class="img-fluid image3">
                        <img src="images/img2.jpg" alt="" class="img-fluid image4">
                    </div>

                </div>
                <div class="col-lg-6 banner-w3layouts-info pl-md-5">

                    <h3 class="mb-3" data-aos="fade-up">Design Great Again</h3>
                    <p class="mb-4" data-aos="fade-up"> Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla mollis dapibus nunc, ut rhoncus turpis sodales quis. Integer sit amet mattis quam, sit amet ultricies velit. Praesent ullamcorper dui turpis.</p>
                    <p class="mb-4" data-aos="fade-up">Nulla mollis dapibus nunc, ut rhoncus turpis sodales quis. Integer sit amet mattis quam, sit amet ultricies velit. Praesent ullamcorper dui turpis.</p>
                    <a href="single.jsp" class="btn">Read More</a>
                </div>
            </div>
        </div>
    </section>
    <!-- //hand-crafted -->

    <!-- testimonials -->
    <div class="testimonials py-md-5 py-5">
        <div class="container py-xl-5 py-lg-3">
            <h3 class="tittle text-uppercase text-center mb-lg-5 mb-3"><span class="sub-tittle">See what people are saying</span> Testimonials</h3>
            <div id="carouselExampleIndicators" class="carousel slide pb-5" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <div class="row">
                            <div class="col-lg-6 testimonials_grid" data-aos="fade-up">
                                <div class="bg-white rounded p-md-5 p-4">
                                    <p class="sub-test"><i class="fa fa-quote-left" aria-hidden="true"></i> Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod possimus, omnis voluptas.
                                    </p>
                                    <div class="row mt-4">
                                        <div class="col-3 testi-img-res">
                                            <img src="images/te1.jpg" alt=" " class="img-fluid rounded-circle" />
                                        </div>
                                        <div class="col-9 testi_grid mt-xl-3 mt-lg-2 mt-md-4 mt-2">
                                            <h5 class="mb-2">Thomas Carl</h5>
                                            <p>Company Name</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 testimonials_grid mt-lg-0 mt-4" data-aos="fade-up">
                                <div class="bg-white rounded p-md-5 p-4">
                                    <p class="sub-test"><i class="fa fa-quote-left" aria-hidden="true"></i> Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod possimus, omnis voluptas.
                                    </p>
                                    <div class="row mt-4">
                                        <div class="col-3 testi-img-res">
                                            <img src="images/te2.jpg" alt=" " class="img-fluid rounded-circle" />
                                        </div>
                                        <div class="col-9 testi_grid  mt-xl-3 mt-lg-2 mt-md-4 mt-2">
                                            <h5 class="mb-2">Adam Ster</h5>
                                            <p>Company Name</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="row">
                            <div class="col-lg-6 testimonials_grid" data-aos="fade-up">
                                <div class="bg-white rounded p-md-5 p-4">
                                    <p class="sub-test"><i class="fa fa-quote-left" aria-hidden="true"></i> Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod possimus, omnis voluptas.
                                    </p>
                                    <div class="row mt-4">
                                        <div class="col-3 testi-img-res">
                                            <img src="images/te3.jpg" alt=" " class="img-fluid rounded-circle" />
                                        </div>
                                        <div class="col-9 testi_grid  mt-xl-3 mt-lg-2 mt-md-4 mt-2">
                                            <h5 class="mb-2">Thomas Carl</h5>
                                            <p>Company Name</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 testimonials_grid mt-lg-0 mt-4" data-aos="fade-up">
                                <div class="bg-white rounded p-md-5 p-4">
                                    <p class="sub-test"><i class="fa fa-quote-left" aria-hidden="true"></i> Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod possimus, omnis voluptas.
                                    </p>
                                    <div class="row mt-4">
                                        <div class="col-3 testi-img-res">
                                            <img src="images/te1.jpg" alt=" " class="img-fluid rounded-circle" />
                                        </div>
                                        <div class="col-9 testi_grid  mt-xl-3 mt-lg-2 mt-md-4 mt-2">
                                            <h5 class="mb-2">Adam Ster</h5>
                                            <p>Company Name</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="row">
                            <div class="col-lg-6 testimonials_grid">
                                <div class="bg-white rounded p-md-5 p-4">
                                    <p class="sub-test"><i class="fa fa-quote-left" aria-hidden="true"></i> Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod possimus, omnis voluptas.
                                    </p>
                                    <div class="row mt-4">
                                        <div class="col-3 testi-img-res">
                                            <img src="images/te2.jpg" alt=" " class="img-fluid rounded-circle" />
                                        </div>
                                        <div class="col-9 testi_grid  mt-xl-3 mt-lg-2 mt-md-4  mt-2">
                                            <h5 class="mb-2">Thomas Carl</h5>
                                            <p>Company Name</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 testimonials_grid mt-lg-0 mt-4" data-aos="fade-up">
                                <div class="bg-white rounded p-md-5 p-4">
                                    <p class="sub-test"><i class="fa fa-quote-left" aria-hidden="true"></i> Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod possimus, omnis voluptas.
                                    </p>
                                    <div class="row mt-4">
                                        <div class="col-3 testi-img-res">
                                            <img src="images/te3.jpg" alt=" " class="img-fluid rounded-circle" />
                                        </div>
                                        <div class="col-9 testi_grid mt-xl-3 mt-lg-2 mt-md-4 mt-2">
                                            <h5 class="mb-2">Adam Ster</h5>
                                            <p>Company Name</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- //testimonials -->
    <!--/newsletter -->
    
    <!--//newsletter-->
    <!--footer -->
    <footer>
        <section class="footer footer_1its py-5">
            <div class="container py-md-4">

                <div class="row footer-top mb-md-5 mb-4">
                    <div class="col-lg-4 col-md-6 footer-grid_section_1its" data-aos="fade-right">
                        <div class="footer-title-w3ls">
                            <h3>Address</h3>
                        </div>
                        <div class="footer-text">
                            <p>Address : 1234 lock, Charlotte, North Carolina, United States</p>
                            <p>Phone : +12 534894364</p>
                            <p>Email : <a href="mailto:info@example.com">info@example.com</a></p>
                            <p>Fax : +12 534894364</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mt-md-0 mt-4 footer-grid_section_1its">
                        <div class="footer-title-w3ls">
                            <h3>Quick Links</h3>
                        </div>
                        <div class="row">
                            <ul class="col-6 links">
                                <li><a href="about.jsp">Why Choose Us </a></li>
                                <li><a href="about.jsp">Overview </a></li>
                                <li><a href="plans.jsp">Pricing Plans</a></li>

                                <li><a href="gallery.jsp">Gallery</a></li>
                                <li><a href="contact.jsp">Contact </a></li>
                            </ul>
                            <ul class="col-6 links">
                                <li><a href="#">Privacy Policy </a></li>
                                <li><a href="#">General Terms </a></li>
                                <li><a href="#faq" class="scroll">Faq's </a></li>
                                <li><a href="#">Knowledge </a></li>
                                <li><a href="#">Forum </a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12 mt-lg-0 mt-4 col-sm-12 footer-grid_section_1its" data-aos="fade-left">
                        <div class="footer-title-w3ls">
                            <h3>Newsletter</h3>
                        </div>
                        <div class="footer-text">
                            <p>By subscribing to our mailing list you will always get latest news and updates from us.</p>
                            <form action="#" method="post">
                                <input type="email" name="Email" placeholder="Enter your email..." required="">
                                <button class="btn1"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
                                <div class="clearfix"> </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="footer-grid_section text-center">
                    <div class="footer-title-w3ls mb-3" data-aos="fade-up">
                        <a href="index.jsp" class="text-uppercase"><i class="fa fa-ravelry" aria-hidden="true"></i> Slog</a>
                    </div>
                    <div class="footer-text">
                        <p data-aos="fade-up">Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Nulla quis lorem ipnut libero malesuada feugiat. Lorem ipsum dolor sit amet, consectetur elit.</p>
                    </div>
                    <ul class="social_section_1info" data-aos="fade-up">
                        <li class="mb-2 facebook"><a href="#"><i class="fa fa-facebook mr-1"></i>facebook</a></li>
                        <li class="mb-2 twitter"><a href="#"><i class="fa fa-twitter mr-1"></i>twitter</a></li>
                        <li class="google"><a href="#"><i class="fa fa-google-plus mr-1"></i>google</a></li>
                        <li class="linkedin"><a href="#"><i class="fa fa-linkedin mr-1"></i>linkedin</a></li>
                    </ul>
                </div>

            </div>
        </section>
    </footer>
    <!-- //footer -->

    <!-- copy-w3layoutsright -->
    <div class="cpy-right text-center py-3">
        <p class="copy-w3layouts">Copyright &copy; 2018.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家"></a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank"></a>
        </p>
    </div>
    <!-- //copy-w3layoutsright -->

    <!--model-forms-->
    <!--/Login-->
    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header text-left">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <div class="login px-4 mx-auto mw-100">
                        <h5 class="text-left mb-4">Login Now</h5>
                        <form action="#" method="post">
                            <div class="form-group">
                                <label class="mb-2">Email address</label>
                                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="" required="">
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>
                            <div class="form-group">
                                <label class="mb-2">Password</label>
                                <input type="password" class="form-control" id="exampleInputPassword1" placeholder="" required="">
                            </div>
                            <div class="form-check mb-2">
                                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                <label class="form-check-label" for="exampleCheck1">Check me out</label>
                            </div>
                            <button type="submit" class="btn btn-primary submit mb-4">Sign In</button>
                            <p class="text-left pb-4">
                                <a href="#" data-toggle="modal" data-target="#exampleModalCenter2"> Don't have an account?</a>
                            </p>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!--//Login-->
    <!--/Register-->
    <div class="modal fade" id="exampleModalCenter2" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header text-left">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="login px-4 mx-auto mw-100">
                        <h5 class="text-left mb-4">Register Now</h5>
                        <form action="#" method="post">
                            <div class="form-group">
                                <label>First name</label>

                                <input type="text" class="form-control" id="validationDefault01" placeholder="" required="">
                            </div>
                            <div class="form-group">
                                <label>Last name</label>
                                <input type="text" class="form-control" id="validationDefault02" placeholder="" required="">
                            </div>

                            <div class="form-group">
                                <label class="mb-2">Password</label>
                                <input type="password" class="form-control" id="password1" placeholder="" required="">
                            </div>
                            <div class="form-group">
                                <label>Confirm Password</label>
                                <input type="password" class="form-control" id="password2" placeholder="" required="">
                            </div>

                            <button type="submit" class="btn btn-primary submit mb-4">Register</button>
                            <p class="text-left pb-4">
                                <a href="#">By clicking Register, I agree to your terms</a>
                            </p>
                        </form>

                    </div>
                </div>

            </div>
        </div>
    </div>
    <!--//Register-->
    <script src="js/jquery-2.2.3.min.js"></script>
    <!--/aos -->
    <script src="js/aos.js"></script>
    <script>
        AOS.init({
            easing: 'ease-out-back',
            duration: 1000
        });

    </script>
    <!--//aos -->
    <!--/counter-->
    <script src="js/counternew.js"></script>
    <!--//counter-->
    <!--/ start-smoth-scrolling -->
    <script src="js/move-top.js"></script>
    <script src="js/easing.js"></script>
    <script>
        jQuery(document).ready(function($) {
            $(".scroll").click(function(event) {
                event.preventDefault();
                $('html,body').animate({
                    scrollTop: $(this.hash).offset().top
                }, 900);
            });
        });

    </script>
    <script>
        $(document).ready(function() {
            $().UItoTop({
                easingType: 'easeOutQuart'
            });

        });

    </script>

    <script src="js/bootstrap.js"></script>
	
	<script>
		//注销
		function logout(){
			$.post("/companyblog/userServlet",{
				op : 'logout'
			},function(data){
				if ( data == 1 ) {
					location.href = "index.jsp";
				} else {
					alert("注销失败！");
				}
			});
		}
		
		//博客页面
		function toBlog(){
			$.post("/companyblog/blogServlet",{
				op : 'toBlog'
			},function(data){
				if ( data == 1 ) {
					location.href = "blogs.jsp";
				} else {
					alert("获取内容失败！");
				}
			});
		}
	</script>
</body>

</html>
