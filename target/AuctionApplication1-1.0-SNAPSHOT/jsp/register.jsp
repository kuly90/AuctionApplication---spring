<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="header.jsp" %>

    <section id="form"><!--form-->
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 style="text-align: center;color: orange">Register account</h2> 
                </div>
                 <div class="col-md-12">                    
                    <p style="color: red; font-weight: normal;text-align: center ">${msg4}${msg5}${msg6}</p>
                </div>

            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="signup-form"><!--sign up form-->

                        <label style="float: right;margin-top: 2.5em;padding-left: 10em;color: orange">User Name : </label>
                        <label style="float: right;margin-top: 1.8em;padding-left: 10em;color: orange">Password : </label>
                        <label style="float: right;margin-top: 1.8em;padding-left: 10em;color: orange">Confirm Password : </label>
                        <label style="float: right;margin-top: 1.8em;padding-left: 10em;color: orange">Full Name : </label>
                        <label style="float: right;margin-top: 1.8em;padding-left: 10em;color: orange">Email : </label>
                        <label style="float: right;margin-top: 1.8em;padding-left: 10em;color: orange">Address : </label>
                        <label style="float: right;margin-top: 1.8em;padding-left: 10em;color: orange">Phone Number : </label>
                        <label style="float: right;margin-top: 1.8em;padding-left: 10em;color: orange">Visa Number : </label>
                        <label style="float: right;margin-top: 1.8em;padding-left: 10em;color: orange">Open Date : </label>
                        <label style="float: right;margin-top: 1.8em;padding-left: 10em;color: orange">Valid To Date : </label>
                    </div><!--/sign up form-->
                </div>

                <div class="col-md-4" style="margin-top: 1.7em;">
                    <div class="signup-form"><!--sign up form-->



                        <form name="form_register" action="registerAccount" method="post"  onsubmit="return validaRegister()">
                            <input name="userName" type="text" placeholder="User name" required maxlength="50">
                            <input name="password" type="password" placeholder="Password" minlength="6" maxlength="50" required>
                            <input type="password" name="passwordconfirm" placeholder="Confirm password" minlength="6" required>
                            <input name="name" type="text" placeholder="Full name" required maxlength="50">
                            <input name="email" type="email" placeholder="Email" maxlength="255" required>
                            <input name="address" type="text" placeholder="Address" maxlength="255" required>
                            <input name="phone" type="text" placeholder="Phone number" maxlength="11" required>
                            <input type="text" name="numberAccount" placeholder="Visa Number" maxlength="16" required>
                            <input type="date" name="dateOpen" placeholder="Opening date: dd/MM/yyyy" required>
                            <input type="date" name="validTo" placeholder="Expiration date: dd/MM/yyyy " required>
                            <button type="submit" class="btn btn-default">Register</button>
                        </form>

                    </div><!--/sign up form-->
                </div>
                <div class="col-md-4">
                    <div class="signup-form"><!--sign up form-->

                        <label style="margin-top: 2.7em;"><p style="color: red; font-weight: normal">${msg1}</p></label><br>
                        <label style="margin-top: 1.8em;"></label><br>
                        <label style="margin-top: 2.2em;"></label><p style="color: red;">${msg7}</p><br>
                        <label style="margin-top: 1.8em;"></label><br>
                        <label style="margin-top: 2.2em;"><p style="color: red;font-weight: normal">${msg2}</p></label><br>
                        <label style="margin-top: 1.8em;"></label><br>
                        <label style="margin-top: 1.8em"></label><br>
                        <label style="margin-top: 2.2em;"></label><p style="color: red;">${msg3}</p><br>
                        <label style="margin-top: 1.8em;"></label><br>
                        <label style="margin-top: 1.8em;"></label><br>
                    </div><!--/sign up form-->
                </div>
            </div>
        </div>
    </section><!--/form-->

    <%@include file="footer.jsp" %>


</body>
</html>