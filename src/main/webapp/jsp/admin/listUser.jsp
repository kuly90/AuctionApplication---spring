<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Manage User | Administrator | Auction Application</title>
        <%@include file="header.jsp"%>
        <!--/header-->
    <section>
        <form action="searchCustomer" method="post" style="padding-left: 740px; padding-bottom: 5px;">
            <input class="text" style="width: 500px;" type="text" name="search" placeholder="Search by name...."/>
            <button style="width: 95px;" type="submit" class="btn btn-default get submit">Search</button>
        </form>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 style="color: orange">List User</h3>
                            </div>

                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <table width="100%" class="table table-striped table-bordered table-hover table-responsive" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Phone</th>

                                            <th>UserName</th>
                                            <th>PassWord</th>
                                            <th>Role</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% int j = 1; %>
                                        <c:forEach var="cus" items="${cusList}">

                                            <c:if test ="${cus.roleEntity.roleID == 3}">
                                                <tr class="odd gradeX">
                                                    <td>${cus.name}</td>
                                                    <td>${cus.phone}</td>
                                                    <td>${cus.userName}</td>
                                                    <td>${cus.password}</td>
                                                    <td>
                                                        User

                                                    </td>
                                                    <td>
                                                        <c:if test="${cus.status == true}">
                                                            Enable
                                                        </c:if>
                                                        <c:if test="${cus.status == false}">
                                                            Disable
                                                        </c:if>
                                                    </td>
                                                    <td>
                                                        <c:if test="${cus.status == true}">
                                                            <a href="deActiveUser?id=${cus.customerID}">DeActive</a>
                                                        </c:if>
                                                        <c:if test="${cus.status == false}">
                                                            <a href="ActiveUser?id=${cus.customerID}">Active</a>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                            </c:if>
                                            <% j++;%>

                                        </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
            </div>
    </section>
    <footer>

    </footer>

</body>
</html>

