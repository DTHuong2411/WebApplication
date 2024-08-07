<%@page contentType="text/html" pageEncoding="utf-8" %>	
<%@ page import="dao.DormDAO,entity.Account" %>

<script>
    function alreadyRegistered(event){
        event.preventDefault();
            alert("Bạn đã đăng ký và thanh toán phòng thành công rồi!");
        return true;
    }
    
    function notAlreadyRegistered(event){
        event.preventDefault();
            alert("Bạn chưa đăng ký và thanh toán phòng!");
        return true;
    }
</script>
<!-- Sidebar -->
<div id="sidebar">
    <div class="inner">
        <!-- Menu -->
        <nav id="menu">
            <header class="major">
                <h2>Menu</h2>
            </header>
            <style>
                ul.navigation-menu>li>div{
                    display: none;
                }
                ul.navigation-menu>li:hover>div{
                    display: block;
                }
            </style>
            <ul class="navigation-menu">
                <li><a href="index">Trang chủ</a></li>
                <li><a href="rules.jsp">Nội quy KTX</a></li>
                <li><a href="contact.jsp">Thông tin liên hệ</a></li>
                <c:if test="${sessionScope.accountS==null}">
                    <li>
                        <a href="LoginServlet" class="nav-item nav-link">Login</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.accountS.isAdmin==0}">
                    <li>
                        <a href="RoomSearchServlet" class="nav-item nav-link">Xem và tìm kiếm phòng</a>
                    </li>
                    <li>
                        <%  DormDAO daoCLH = new DormDAO();
                        Account accountCLH = (Account) session.getAttribute("accountS");
                
                        if (daoCLH.checkAlreadySuccessRegistered(accountCLH.getUserid())){%>
                        <a href="#" onclick="alreadyRegistered(event);" class="nav-item nav-link">Quản lý, thanh toán hóa đơn</a>
                        <% } else { %>
                        <a href="LoadPaymentRegistered" class="nav-item nav-link">Quản lý, thanh toán hóa đơn</a>
                        <% } %>
                    </li>
                    <li>
                        <% if (daoCLH.getRegisterRoomByIdAndSemester(accountCLH.getUserid(),daoCLH.getSemesterCurrentTime()) == null) {%>
                        <a href="#" onclick="notAlreadyRegistered(event);" class="nav-item nav-link">Quản lý, thanh toán hóa đơn điện nước</a>
                        <% } else { %>
                        <a href="LoadPaymentElecAndWater" class="nav-item nav-link">Quản lý, thanh toán hóa đơn điện nước</a>
                        <% } %>
                    </li>
                    <li>
                        <a href="TypeRequestServlet" class="nav-item nav-link">Gửi yêu cầu/khiếu nại</a>                    </li>
                    <li>
                        <a href="StudentViewRegistrationServlet" class="nav-item nav-link">Lịch sử đăng ký</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.accountS.isAdmin==1}">
                    <li>
                        <a href="ManageNewsServlet" class="nav-item nav-link">Quản lý thông báo</a>
                    </li>
                    <li>
                        <a href="listStudent.jsp" class="nav-item nav-link">Quản lý sinh viên</a>
                    </li>
                    <li>
                        <a href="ManageRoomServlet" class="nav-item nav-link">Quản lý phòng ở</a>
                    </li>
                    <li>    
                        <a href="ManageElectricAndWaterServlet" class="nav-item nav-link">Quản lý hóa đơn</a>
                    </li>
                    <li>
                        <a href="TypeManageRequestServlet" class="nav-item nav-link">Xem yêu cầu, khiếu nại</a>
                    </li>
                    <li>
                        <a href="StatisticsServlet" class="nav-item nav-link">Thống kê</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.accountS!=null}">
                    <li>
                        <a>Tài khoản: ${sessionScope.accountS.userid}</a>
                        <a href="ManageProfile">Quản lý tài khoản</a>
                        <a href="LogoutServlet">Đăng xuất</a>
                    </li>
                </c:if>    


            </ul>
        </nav>

        <!-- Section -->
        <section>
            <header class="major">
                <h2>Liên hệ</h2>
            </header>
            <ul class="contact">
                <li class="icon solid fa-envelope"><a href="mailto:tuyensinh@hanoi.fpt.edu.vn">tuyensinh@hanoi.fpt.edu.vn</a></li>
                <li class="icon solid fa-phone">(024) 7300.1866</li>
                <li class="icon solid fa-home">Khu Công nghệ cao Hòa Lạc<br /> Km29 Đại lộ Thăng Long, Thạch Thất, TP. HN</li>
            </ul>
        </section>
