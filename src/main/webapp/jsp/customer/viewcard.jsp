<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Credit Card Page</title>
        <%@include file="/jsp/customer/header.jsp" %>

    <section id="form"><!--form-->
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="signup-form"><!--sign up form-->
                        <label style="float: right;margin-top: 6.5em;padding-left: 10em">Number Account : </label>
                        <label style="float: right;margin-top: 1.8em;padding-left: 10em">Date Open : </label>
                        <label style="float: right;margin-top: 1.8em;padding-left: 10em">Valid To : </label>
                        <label style="float: right;margin-top: 1.8em;padding-left: 10em">Amount : </label>                        
                    </div>
                </div>
                <div class="col-md-4 ">
                    <div class="signup-form"><!--sign up form-->
                        <h2 style="color: orange;font-weight: bold;font-size: 200%">Credit Account information</h2>
                        <form name="form_credit" action="viewCard" method="post">
                            <input name="customerID" type="hidden" value="${cardEntity.customerID}">
                            <input type="text" name="numberAccount" value="${cardEntity.numberAccount}" required readonly>
                            <input type="date" name="dateOpen" value="${cardEntity.dateOpen}" required readonly>
                            <input type="date" name="validTo" value="${cardEntity.validTo}" required readonly>
                            <input type="text" name="amount" value="${cardEntity.amount}" required readonly>
                        </form>
                    </div><!--/sign up form-->
                </div>
            </div>
        </div>
    </section><!--/form-->
    <div style="height: 45px;"></div>

    <%@include file="/jsp/customer/footer.jsp" %>

</body>
</html>
