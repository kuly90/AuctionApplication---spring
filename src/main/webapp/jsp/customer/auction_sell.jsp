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
        <form action="searchGoods" method="post" style="padding-left: 920px">
            <input class="text" style="width: 300px;" type="text" name="search" placeholder="Search by goods name...."/>
            <button style="width: 95px;" type="submit" class="btn btn-default get submit">Search</button>
        </form>
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <h2 class="title text-center">Auction You Sell</h2>
                    <h5 style="color: red">NOTE</h5>
                        <h6 style="color: blue">Status (0) = Auction pending </h6>
                        <h6 style="color: blue">Status (1) = Auction online </h6>
                        
                    <p class="title text-center" style="color: red;">${msg}</p>
                    <div class="panel-body">
                        <table width="100%" class="table table-striped table-bordered table-hover table-responsive" id="dataTables-example">
                            <thead>
                                <tr>
                                    <td>STT</td>
                                    <td>Good Name</td>
                                    <td>End date</td>
                                    <td>Duration</td>
                                    <td>Start Price</td>
                                    <td>Bids Number</td>
                                    <td>Max Bid</td>
                                    <td>Buyer</td>
                                    <td>Status</td>
                                    <td>Action</td>
                                </tr>
                            </thead>
                            <tbody>
                                <% int i = 1; %>
                                <c:forEach var="auction" items="${listAuctionSell}">
                                    <tr>
                                        <td><% out.print(i); %></td>
                                        <td>${auction.goodsEntity.goodName}</td>
                                        <td>${auction.startDate}</td>
                                        <td>${auction.duration}</td>
                                        <td>${auction.minimunPrice}</td>
                                        <c:if test="${auction.countBids == 0}">
                                            <td>Not bid</td>
                                            <td>Not bid</td>
                                            <td>Not bid</td>
                                        </c:if>
                                        <c:if test="${auction.countBids != 0}">
                                            <td>${auction.countBids}</td>
                                            <td>${auction.maxBidsFormat}</td>
                                            <td>${auction.customerNameByMaxBid}</td>
                                        </c:if>
                                        <td>${auction.status}</td>
                                        <c:if test="${auction.status == 0}">

                                            <td><a href="cancelAuction?id=${auction.auctionID}">Cancle Auction</a></td>
                                        </c:if>
                                        <c:if test="${auction.status == 1}">

                                            <td><a href="viewAuction?id=${auction.auctionID}">View Auction</a></td>
                                        </c:if>
                                        <c:if test="${auction.status == 2}">

                                            <td><a href="viewAuction?id=${auction.auctionID}">View Auction</a></td>
                                        </c:if>
                                    </tr>
                                    <% i++;%>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div style="height: 150px">

        </div>
    </section>
    <%@include file="/jsp/customer/footer.jsp" %>


</body>
</html>


