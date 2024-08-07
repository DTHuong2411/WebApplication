

<%@ include file="/includes/header.jsp" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<form action ="ManageProfile" method ="post"  enctype="multipart/form-data">
    <table>
        <tr>
            <td>ID</td>
            <td><input type="text" name="idPerson" value="${profile.idPerson}" readonly></td>             
        </tr>

        <tr>
            <td>Họ và tên</td>
            <td><input type="text" name="name" value="${profile.name}" required></td>             
        </tr>
        
        <tr>
            <td>CMND/CCCD</td>
            <td><input type="text" name="cmnd" value="${profile.cmnd}" required></td>             
        </tr>
        
        
        <tr>
            <td>Giới tính</td>
            <td>
                <c:choose>
                    <c:when test="${profile.gender==M}">
                        <input type="text" name="gender" value="${profile.gender}"required>
                    </c:when>
                    <c:otherwise>
                        <input type="text" name="gender" value="${profile.gender}"required>
                    </c:otherwise>
                </c:choose>

            </td>

           
        </tr>

        <tr>
            <td>Ngày sinh</td>
            <td><input type="text" name="dob" value="${profile.dob}" required></td>   
        </tr>
        
        <tr>
            <td>Điện thoại</td>
            <td><input type="text" name="phone" value="${profile.phone}" required></td>   
        </tr>
        
        <tr>
            <td>Email</td>
            <td><input type="text" name="email" value="${profile.email}" required></td>   
        </tr>
        
        <tr>
            <td>Địa chỉ</td>
            <td><input type="text" name="address" value="${profile.address}" required></td>   
        </tr>
      
        <tr>
            <td>Image</td>
            <td><img src="images/${profile.img}" value="${profile.img}" height="200px" width="180px">
                <input type="file" name="img">
            </td>   
        </tr>

        <tr>
            <td><button type = "submit"> Cập nhật </button></td>
        </tr>

    </table> 
</form>
</div></div>


<%@ include file="/includes/column_left_home.jsp" %> 
<%@ include file="/includes/footer.jsp" %> 
