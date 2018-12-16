<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <%@include file="/jsp/header.jsp" %>
        
    <section id="form"><!--form-->
        <div class="container">
            <div class="row">
                <div class="col-sm-4 col-sm-offset-1">
                    <div class="login-form"><!--login form-->
                        <h2 style="color: orange">Login</h2>
                        <form action="j_spring_security_check" method="post">
                            <input type="text" name="userName" placeholder="User name" />
                            <input type="password" name="password" placeholder="Password" />
                            <button type="submit" class="btn btn-default">Login</button>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                        </form>
                    </div><!--/login form-->
                </div>
            </div>
        </div>
                        <div style="height: 100px">
                            
                        </div>
    </section><!--/form-->

    <%@include file="/jsp/footer.jsp" %>
</body>
</html>