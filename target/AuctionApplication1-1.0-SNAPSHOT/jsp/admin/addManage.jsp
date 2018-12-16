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
                <div class="col-sm-4">

                </div>
                <div class="col-sm-4">
                    <div class="signup-form"><!--sign up form-->
                        <h2>Add Manage</h2>
                        <p style="color: orange;">${msg4}${msg5}</p>
                        <form name="form_manage" action="addNewManage" method="post"  onsubmit="return validaRegister()">
                            <input name="userName" type="text" placeholder="User name" required maxlength="50">
                            <input name="password" type="password" placeholder="Password" minlength="6" maxlength="50" required>
                            <input type="password" name="passwordconfirm" placeholder="Confirm password" minlength="6" required>
                            <input name="name" type="text" placeholder="Full name" required maxlength="50">
                            <input name="email" type="email" placeholder="Email" maxlength="255" required>
                            <input name="address" type="text" placeholder="Address" maxlength="255" required>
                            <input name="phone" type="text" placeholder="Phone number" maxlength="11" required>

                            <button type="submit" class="btn btn-default">Add Manage</button>
                        </form>
                    </div><!--/sign up form-->
                </div>
                <div class="col-sm-4">
                    <div class="signup-form"><!--sign up form-->
                        <label style="margin-top: 6em;"><p style="color: orange; font-weight: normal">${msg1}</p></label><br>
                        <label style="margin-top: 2.2em;"></label><br>
                        <label style="margin-top: 2.5em;"><p style="color: orange; font-weight: normal">${msg3}</p></label><br>
                        <label style="margin-top: 1.8em"></label><br>
                        <label style="margin-top: 3.1em;"><p style="color: orange; font-weight: normal">${msg2}</p></label><br>
                        <label style="margin-top: 1.8em;"></label><br>
                        <label style="margin-top: 1.8em;"></label><br>
                    </div><!--/sign up form-->
                </div>
            </div>
        </div>
    </section><!--/form-->



</body>
</html>

