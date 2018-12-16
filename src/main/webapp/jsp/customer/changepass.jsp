<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password Page</title>
        <%@include file="/jsp/customer/header.jsp" %>

    <section id="form"><!--form-->
        <div class="container">
            <div class="row">
                <div class="col-sm-4">

                </div>   
                <div class="col-sm-4">
                    <div class="signup-form"><!--sign up form-->
                        <h2 style="color: orange ; font-weight: bold;font-size: 200%">Change Password</h2>
                        <p style="color: orange;">${msg1}${msg2}</p>
                        <form name="form_pass" action="updatePass" method="post">
                            <input name="customerID" type="hidden" value="${customer.customerID}">
                            <input name="passwordcheck" type="hidden" value="${customer.password}">
                            <input name="passwordold" type="password" placeholder="Old password" minlength="6" maxlength="50" required>
                            <input name="passwordnew" type="password" placeholder="New password" minlength="6" maxlength="50" required>
                            <input name="passwordconfirm" type="password"  placeholder="Confirm new password" minlength="6" required>
                            <button type="submit" class="btn btn-default">Update</button>
                        </form>
                    </div><!--/sign up form-->
                </div>
                <div class="col-sm-4">
                    <div class="signup-form"><!--sign up form-->
                        
                         <label></label><br>
                        <label></label><br>
                        <label style="margin-top: 2.5em;"></label><p style="color: orange;">${msg4}</p><br>
                        <label style="margin-top: 0.8em;"></label><br>
                        <label style="margin-top: 2.5em;"></label><p style="color: orange;">${msg3}</p><br>
                    </div><!--/sign up form-->
                </div>    
            </div>
        </div>
    </section><!--/form-->
    <div style="height: 63px;"></div>

    <%@include file="/jsp/customer/footer.jsp" %>


</body>
</html>
