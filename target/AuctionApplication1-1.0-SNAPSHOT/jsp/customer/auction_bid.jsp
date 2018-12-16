<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*, java.text.*"  %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Home | Auction Application</title>
        <%@include file="/jsp/customer/header.jsp"%>
        <!--/header-->
    <section id="form">
        
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <h2 class="title text-center">Auction Bid</h2>
                    <table class="table" style="border: 1px solid #ddd; border-collapse: collapse;">

                        <thead style="border: 1px solid #ddd; border-collapse: collapse;">
                            <tr>
                                <th style="text-align: center;">Bidding History</th>
                                <th style="text-align: center;">Max Bid</th>
                                <th style="text-align: center;">Actions</th>
                            </tr>
                        </thead>
                        <tbody style="border: 1px solid #ddd; border-collapse: collapse;">
                            <c:forEach var="auction" items="${listAuctionDebid}">
                                <tr>
                                    <td style="vertical-align: middle;">
                                        <b><a href="viewAuction?id=${auction[0]}">${auction[1]}</a></b><br>
                                        <span>${auction[4]} ${auction[5]}:${auction[6]}</span> |
                                        <span>Auction status: <c:set var="status" value="${auction[8]}"/>
                                            <c:if test="${status == 1}">Online</c:if>
                                            <c:if test="${status != 1}">Finish</c:if>
                                        </span>
                                    </td>
                                    <td style="text-align: center;">
                                        <p>You Bid: ${auction[3]}</p>
                                        <p>Max bid: ${auction[7]}</p>
                                    </td>
                                    <td style="text-align: center;">
                                        <a href="viewAuction?id=${auction[0]}" class="btn btn-default add-to-cart" style="margin-bottom: 0;">View Auction</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div style="height: 300px">
                            
                        </div>
    </section>
    <%@include file="/jsp/customer/footer.jsp" %>


</body>
</html>


