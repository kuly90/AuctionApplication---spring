<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Manage Page</title>
        <%@include file="header.jsp"%>
        <!--/header-->
    <section>
        <div class="row">
            <h2 class="title text-center">Choose date to report</h2>
            <form class="form-inline text-center" action="choseDateToReport" method="post">
                  <div class="form-group">
                        <label for="fromdate">From Date</label>
                        <input type="date" class="form-control" id="fromdate" name="fromdate">
                      </div>
                  <div class="form-group">
                        <label for="toDate">To Date</label>
                        <input type="date" class="form-control" id="toDate" name="toDate">
                      </div>
                
                  <button type="submit" class="btn btn-danger">Search</button>
            </form>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="features_items"><!--features_items-->
                        <div data-countdown="12/05/2011"></div>
                        <h2 class="title text-center">Auction List</h2>
                        
                        
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover table-responsive" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <td>Auction ID  </td>
                                        <td>Good Name</td>
                                        <td>Seller</td>
                                        <td>End date</td>
                                        
                                        <td>Start Price</td>
                                        <td>Bids Number</td>
                                        <td>Max Bid</td>
                                        <td>Buyer</td>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="auction" items="${auctionList}">
                                        <tr>
                                            <td>${auction.auctionID}</td>
                                            <td>${auction.goodsEntity.goodName}</td>
                                            <td>${auction.customerEntity.name}</td>
                                            <td>${auction.startDate}</td>
                                           
                                            <td>${auction.minimunPrice}</td>
                                            <td>${auction.countBids}</td> 
                                            <td>${auction.maxBidsFormat}</td> 
                                            <td>${auction.customerNameByMaxBid}</td> 
                                                                                    
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <footer>
    </footer>
    
</body>
</html>