<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="/jsp/customer/header.jsp" %>

    <section id="form"><!--form-->
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 style="padding-left: 400px ;color: orange">Update Account</h2>
                </div>
                <div class="col-md-12">                    
                    <p style="color: orange;padding-left: 400px">${msg}</p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="signup-form"><!--sign up form-->
                        <label style="float: right;margin-top: .8em;padding-left: 10em">User Name : </label>
                        <label style="float: right;margin-top: 1.8em;padding-left: 10em">Name : </label>
                        <label style="float: right;margin-top: 1.8em;padding-left: 10em">Email : </label>
                        <label style="float: right;margin-top: 1.8em;padding-left: 10em">Address : </label>
                        <label style="float: right;margin-top: 1.8em;padding-left: 10em">Phone Number : </label>
                    </div><!--/sign up form-->
                </div>
                <div class="col-md-4">
                    <div class="signup-form"><!--sign up form-->

                        <form name="form_edit" action="updateAccount" method="post">
                            <input name="customerID" type="hidden" value="${customer.customerID}">
                            <input name="userName" type="text" value="${customer.userName}" placeholder="User name" required readonly>
                            <input name="name" type="text" value="${customer.name}" placeholder="Full name" maxlength="50" required>
                            <input name="email" type="email" value="${customer.email}" placeholder="Email" required readonly>
                            <input name="address" type="text" value="${customer.address}" placeholder="Address" maxlength="255" required>
                            <input name="phone" type="text" value="${customer.phone}" placeholder="Phone number" maxlength="11" required>
                            <button type="submit" class="btn btn-default">Update</button>
                        </form>
                    </div><!--/sign up form-->
                </div>
            </div>
        </div>
    </section><!--/form-->

    <%@include file="/jsp/customer/footer.jsp" %>
</body>
</html>