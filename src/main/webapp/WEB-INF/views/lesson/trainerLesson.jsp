<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="kr">

<head>
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
    <!-- Date Picker  -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>

<body>
<!-- Spinner Start -->
<div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
    <div class="spinner"></div>
</div>
<!-- Spinner End -->


<!-- Topnavbar Start -->
<jsp:include page="/WEB-INF/views/common/topnavbar.jsp" />
<!-- Topnavbar End -->


<!-- Navbar Start -->
<div class="container-fluid position-relative p-0 h-10 ">
    <jsp:include page="/WEB-INF/views/common/navbar.jsp">
        <jsp:param name="menu" value="수업"/>
    </jsp:include>
    <!-- Navbar End -->
    <div class="container-fluid bg-primary py-5 bg-header" style="margin-bottom: 10px;">
        <div class="row py-5">
            <div class="col-12 pt-lg-5 mt-lg-5 text-center">
                <h1 class="display-4 text-white animated zoomIn">LESSONLIST</h1>
                <a href="" class="h5 text-white">수업 목록</a>
            </div>
        </div>
    </div>
</div>
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
<div class="container-fluid py-0 wow fadeInUp" data-wow-delay="0.1s" style="margin-top: 1px;">
    <div class="container py-5">
        <div class="row mb-3">
            <div class="col-12">
            	<div>
				    <button class="btn btn-outline-primary mb-1" type="button" >개인수업</button>
				    <button class="btn btn-outline-primary mb-1" type="button">그룹수업</button>
				</div>
                <div class="card" >
                    <div class="card-header bg-dark" style="color: #ffffff">
                        수업 목록
                    </div>
                    <!-- GroupLesson start -->
                    <div class="card-body">
                        <table class="table" id="table-lessons">
                            <thead>
                            <tbody>
                            <tr>
                                <th style="width: 15%">레슨 번호</th>
                                <th style="width: 20%">수업명</th>
                                <th style="width: 20%">신청인원/총 인원</th>
                                <th style="width: 20%">레슨시간</th>
                                <th style="width: 25%">출석체크</th>
                            </tr>
                            </tbody>
                            </thead>
                            <tbody>
                            <c:forEach var="lesson" items="${createList }">
                                <tr>
                                    <td>${lesson.no }</td>
                                    <td>${lesson.name }</td>
                                    <td>${lesson.reqCnt }/${lesson.quota }</td>
                                    <td><fmt:formatDate value="${lesson.date }" pattern="yyyy년 M월 d일" /> ${lesson.time }시</td>
                                    <td><button type="button" data-lesson-no="${lesson.no}" data-bs-toggle="modal" data-bs-target="#insert" class="btn btn-primary btn-sm">출석</button></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <!-- 트레이너가 출석버튼 클릭시 뜨는 모달 창 -->
                        <div class="modal fade" id="insert" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">

                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">출석</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>

                                    <div class="modal-body">
                                        <input type="hidden" id="current-lesson-no" />
                                        <table class="table" id="table-users" >
                                            <thead>
                                            <tr>
                                                <th style="width:35%">수강생 명</th>
                                                <th style="width:30%">출석상태</th>
                                                <th style="width:35%">출석체크</th>
                                            </tr>
                                            </thead>
                                            <tbody></tbody>
                                        </table>
                                    </div>

                                    <div class="modal-footer">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- GroupLesson end -->
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Footer End -->
<jsp:include page="/WEB-INF/views/common/footernavbar.jsp" />


<!-- Back to Top -->
<a href="#" class="btn btn-lg btn-primary btn-lg-square rounded back-to-top"><i class="bi bi-arrow-up"></i></a>


<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="/resources/lib/wow/wow.min.js"></script>
<script src="/resources/lib/easing/easing.min.js"></script>
<script src="/resources/lib/waypoints/waypoints.min.js"></script>
<script src="/resources/lib/counterup/counterup.min.js"></script>
<script src="/resources/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Template Javascript -->
<script src="/resources/js/main.js"></script>

<script>
    // 트레이너가 개설한 수업에 대해서 수강생 조회
    $(function() {
        $("#table-lessons tbody button").click(function() {

            let $tbody = $('#table-users tbody').empty();

            let lessonNo = $(this).attr('data-lesson-no');
            $("#current-lesson-no").val(lessonNo);
            $.getJSON("trainer-user-apply", {lessonNo:lessonNo}, function(LessonApplies) {
                LessonApplies.forEach(function(apply, index) {
                    console.log(apply);
                    let tr = `
                    <tr>
                        <td>\${apply.user.name }</td>
                        <td>\${apply.attendanceStatus }</td>
                        <td>
                            <button type="button" class="btn btn-primary btn-sm" data-select="\${apply.user.id }">출석</button>
                            <button type="button" class="btn btn-danger btn-sm" data-select="\${apply.user.id }">결석</button>
                        </td>
                    </tr>
                `;
                    $tbody.append(tr);
                })
            })
        });
        // 모달창에 출석버튼 클릭 시
        $("#table-users tbody").on('click', '.btn-primary', function(){
            let $button1 = $(this);
            let $button2 = $(this).next();
            let lessonNo = $('#current-lesson-no').val();
            let userId = $button1[0].dataset.select;
            $.getJSON("trainer-user-attendance", {lessonNo:lessonNo,status:'Y', userId:userId}, function() {
                $button1.addClass('disabled');
                $button2.removeClass('disabled');
            })
        })
        // 모달창에 결석버튼 클릭 시
        $("#table-users tbody").on('click', '.btn-danger', function() {
            let $button1 = $(this).next;
            let $button2 = $(this);
            let lessonNo = $('#current-lesson-no').val();
            let userId = $button2[0].dataset.select;
            $.getJSON("trainer-user-attendance", {lessonNo:lessonNo,status:'N', userId:userId}, function() {
                $button1.removeClass('disabled');
                $button2.addClass('disabled');
            })
        })
    })
</script>


</body>

</html>