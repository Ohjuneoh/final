<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="kr">

<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <meta charset="utf-8">
    <title>HELF</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&family=Rubik:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/resources/lib/animate/animate.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/resources/css/style.css" rel="stylesheet">
</head>

<body>
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner"></div>
    </div>
    <!-- Spinner End -->


    <!-- Topnavbar Start -->
   	<jsp:include page="/WEB-INF/views/common/topnavbar.jsp">
		<jsp:param name="menu" value="홈"/>
	</jsp:include>
    <!-- Topnavbar End -->


    <!-- Navbar Start -->
    <div class="container-fluid position-relative p-0 h-10 ">
		<jsp:include page="/WEB-INF/views/common/navbar.jsp">
			<jsp:param name="menu" value="홈"/>
		</jsp:include>
    <!-- Navbar End -->
        <div class="container-fluid bg-primary py-5 bg-header" style="margin-bottom: 90px;">
            <div class="row py-5">
                <div class="col-12 pt-lg-5 mt-lg-5 text-center">
                    <h1 class="display-4 text-white animated zoomIn">REGISTER COMPLETE</h1>
                    <a href="" class="h5 text-white">회원가입 완료</a>
                </div>
            </div>
        </div>
    </div>
    
    	<div class="row justify-content-center" style="text-align:center">
		
		 <div class="col-lg-5">
		 	  <h2>HELF 헬스장에 가입해주셔서 감사합니다.</h2>
		 	  
		 	  <div doz_type="grid" doz_grid="12" class="col-dz col-dz-12"  style="display: flex; justify-content: center;">
		 	  	<div doz_type="widget" id="w20190820145dcc26dd4ed">
		 	  		<div class="_widget_data " data-widget-name="가로선" data-widget-type="hr" data-widget-anim="none" data-widget-anim-duration="" data-widget-anim-delay="" data-widget-parent-is-mobile="N">
		 	  			<div class="widget line type01 _hide" id="hr_w20190820145dcc26dd4ed">
							<div class="line_box holder" style="width:100px; ">
								<hr style="border-top-width:1px; border-color:rgba(35, 38, 40, 0.65);">	
							</div>
						</div>
					</div>
				</div>
			</div>

		<div doz_type="grid" doz_grid="4" class="col-dz col-dz-4">
		
			<div doz_type="row" doz_grid="4" class="doz_row">
				<div doz_type="grid" doz_grid="4" class="col-dz col-dz-4">
					<div doz_type="widget" id="w2019081545754e13d8cd3">
						<div class="_widget_data  animated wg_animated fadeInUp" data-widget-name="텍스트" data-widget-type="text" data-widget-anim="fadeInUp" data-widget-anim-duration="0.7" data-widget-anim-delay="0" data-widget-parent-is-mobile="N" style="opacity: 1; animation-duration: 0.7s; animation-delay: 0s; visibility: visible;">
							<div doz_type="text" class="widget _text_wrap widget_text_wrap fr-view  default_padding " id="text_w2019081545754e13d8cd3">
								<div class="text-table mt-2">
									<div>
										<i class="bi bi-emoji-laughing-fill" style="font-size: 48px;"></i>
										<p><span style="color: rgb(35, 38, 40); font-size: 22px;">관리자의 승인 후 이용하실 수 있어요.<br>조금만 기다려주세요!</span></p>
										<p><span style="color: rgb(35, 38, 40); font-size: 17px;"></span></p>
									</div>
								</div>		
							</div>
						</div>
					</div>
				</div>
			</div>
			<div doz_type="row" doz_grid="4" class="doz_row">
				<div doz_type="grid" doz_grid="4" class="col-dz col-dz-4">
					<div doz_type="widget" id="w20190820e84e7943d2c5e">
						<div class="_widget_data _ds_animated_except" data-widget-name="여백" data-widget-type="padding" data-widget-parent-is-mobile="N">
							<div class="widget padding" data-height="14" style="margin-top:px; margin-bottom:px;">
								<div id="padding_w20190820e84e7943d2c5e" style="width:100%; min-height:1px; height:14px; "></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div doz_type="row" doz_grid="4" class="doz_row">
				<div doz_type="grid" doz_grid="4" class="col-dz col-dz-4">
					<div doz_type="widget" id="w20190820d73d6bdbeb75d">
						<div class="_widget_data _ds_animated_except" data-widget-name="여백" data-widget-type="padding" data-widget-parent-is-mobile="N">
							<div class="widget padding" data-height="14" style="margin-top:px; margin-bottom:px;">
								<div id="padding_w20190820d73d6bdbeb75d" style="width:100%; min-height:1px; height:14px; "></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div doz_type="row" doz_grid="4" class="doz_row">
				<div doz_type="grid" doz_grid="4" class="col-dz col-dz-4">
					<div doz_type="widget" id="w201908176065896b508a7">
						<div class="_widget_data  animated wg_animated fadeInUp" data-widget-name="텍스트" data-widget-type="text" data-widget-anim="fadeInUp" data-widget-anim-duration="0.7" data-widget-anim-delay="0.4" data-widget-parent-is-mobile="N" style="opacity: 1; animation-duration: 0.7s; animation-delay: 0.4s; visibility: visible;">
							<div doz_type="text" class="widget _text_wrap widget_text_wrap fr-view  default_padding " id="text_w201908176065896b508a7">
										<div class="text-table ">
											<div>
												<p>모두가 즐겨 찾는 서비스로 HELF를 시작해보세요.<br>
													<a href="/" class="btn btn-primary py-2 px-4 ms-3">홈으로가기</a>
												</p>
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



    <!-- Footer start -->
    <div class="modal fade" id="searchModal" tabindex="-1">
        <div class="modal-dialog modal-fullscreen">
            <div class="modal-content" style="background: rgba(9, 30, 62, .7);">
                <div class="modal-header border-0">
                    <button type="button" class="btn bg-white btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body d-flex align-items-center justify-content-center">
                    <div class="input-group" style="max-width: 600px;">
                        <input type="text" class="form-control bg-transparent border-primary p-3" placeholder="Type search keyword">
                        <button class="btn btn-primary px-4"><i class="bi bi-search"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
       
    
   
    
    <div class="container-fluid bg-dark text-light mt-5 wow fadeInUp" data-wow-delay="0.1s">
        <div class="container">
            <div class="row gx-5">
                <div class="col-lg-8 col-md-6">
                    <div class="row gx-5">
                        <div class="col-lg-4 col-md-12 pt-5 mb-5">
                            <div class="section-title section-title-sm position-relative pb-3 mb-4">
                                <h3 class="text-light mb-0">Get In Touch</h3>
                            </div>
                            <div class="d-flex mb-2">
                                <i class="bi bi-geo-alt text-primary me-2"></i>
                                <p class="mb-0">123 Street, New York, USA</p>
                            </div>
                            <div class="d-flex mb-2">
                                <i class="bi bi-envelope-open text-primary me-2"></i>
                                <p class="mb-0">info@example.com</p>
                            </div>
                            <div class="d-flex mb-2">
                                <i class="bi bi-telephone text-primary me-2"></i>
                                <p class="mb-0">+012 345 67890</p>
                            </div>
                            <div class="d-flex mt-4">
                                <a class="btn btn-primary btn-square me-2" href="#"><i class="fab fa-twitter fw-normal"></i></a>
                                <a class="btn btn-primary btn-square me-2" href="#"><i class="fab fa-facebook-f fw-normal"></i></a>
                                <a class="btn btn-primary btn-square me-2" href="#"><i class="fab fa-linkedin-in fw-normal"></i></a>
                                <a class="btn btn-primary btn-square" href="#"><i class="fab fa-instagram fw-normal"></i></a>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12 pt-0 pt-lg-5 mb-5">
                            <div class="section-title section-title-sm position-relative pb-3 mb-4">
                                <h3 class="text-light mb-0">Quick Links</h3>
                            </div>
                            <div class="link-animated d-flex flex-column justify-content-start">
                                <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Home</a>
                                <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>About Us</a>
                                <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Our Services</a>
                                <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Meet The Team</a>
                                <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Latest Blog</a>
                                <a class="text-light" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Contact Us</a>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12 pt-0 pt-lg-5 mb-5">
                            <div class="section-title section-title-sm position-relative pb-3 mb-4">
                                <h3 class="text-light mb-0">Popular Links</h3>
                            </div>
                            <div class="link-animated d-flex flex-column justify-content-start">
                                <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Home</a>
                                <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>About Us</a>
                                <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Our Services</a>
                                <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Meet The Team</a>
                                <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Latest Blog</a>
                                <a class="text-light" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Contact Us</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid text-white" style="background: #061429;">
        <div class="container text-center">
            <div class="row justify-content-end">
                <div class="col-lg-8 col-md-6">
                    <div class="d-flex align-items-center justify-content-center" style="height: 75px;">
                        <p class="mb-0">&copy; <a class="text-white border-bottom" href="#">Your Site Name</a>. All Rights Reserved. 
						
						<!--/*** This template is free as long as you keep the footer authorâs credit link/attribution link/backlink. If you'd like to use the template without the footer authorâs credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
						Designed by <a class="text-white border-bottom" href="https://htmlcodex.com">HTML Codex</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/lib/wow/wow.min.js"></script>
    <script src="/resources/lib/easing/easing.min.js"></script>
    <script src="/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="/resources/lib/counterup/counterup.min.js"></script>
    <script src="/resources/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="/resources/js/main.js"></script>
   
   <script type="text/javascript"></script>
   
   <script>
		
		
	</script>
</body>
</html>