<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Init Auction | Auction Application</title>
        <%@include file="/jsp/customer/header.jsp"%>
        <!--/header-->
    <section id="form">
        <div class="container">
            <div class="row">
                <div class="col-sm-9 padding-right">
                    <form action="initAuctionAccept" method="post" enctype="multipart/form-data" name="form_init">
                        <!-- .panel-heading -->
                        <div class="panel-body">
                            <div class="panel-group" id="accordion">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" style="color: orange">Auction Details</a>
                                        </h4>
                                    </div>
                                    <div id="collapseTwo" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <div class="form-group input-group" style="width: 70%;">
                                                <span class="input-group-addon">Starting Price</span>
                                                <input type="text" class="form-control" name="startPrices">
                                                <span class="input-group-addon">.00</span>
                                            </div>
                                            <div class="form-group input-group" style="width: 70%;">
                                                <div class="table-responsive">
                                                    <table class="table">
                                                        <tr>
                                                            <th>Price($)</th>
                                                            <th>Commission</th>
                                                        </tr>
                                                        <c:forEach var="comission" items="${comList}">
                                                            <tr>
                                                                <td>${comission.minimum} - ${comission.maximum}</td>
                                                                <td>${comission.amountNew}</td>
                                                            </tr>
                                                        </c:forEach>

                                                    </table>
                                                </div>
                                            </div>
                                            <div style="display: none" class="form-group input-group" style="clear: both; width: 70%;">
                                                <span class="input-group-addon">Reserve Price</span>
                                                <input type="text" class="form-control" name="reservePrice" value="1000">
                                                <span class="input-group-addon">.00</span>
                                            </div>
                                            <div class="form-group input-group" style="width: 70%;">
                                                <span class="input-group-addon">End Date</span>
                                                <input type="date" class="form-control" name="startDate">
                                            </div>
                                            <div style="display: none" class="form-group input-group" style="width: 70%; ">
                                                <span class="input-group-addon">Hour</span>
                                                <input type="number" class="form-control" placeholder="" name="hourStart" value="0">
                                                <span class="input-group-addon">Minutes</span>
                                                <input type="number" class="form-control" placeholder="" name="minutesStart" value="0">
                                            </div>
                                            <div class="form-group input-group" style="width: 50%; display: none">
                                                <span class="input-group-addon">Duration</span>
                                                <input type="text" class="form-control" name="duration" value="1">
                                            </div>
                                            <div class="panel-body">
                                                <label>Name (*)</label>
                                                <input type="text" class="form-control" name="goodName"><br>
                                                <label>Description (*)</label>
                                                <textarea class="form-control" rows="5" name="description"></textarea><br>
                                                <div class="form-group">
                                                    <label>Image (*)</label>
                                                    <input type="file" name="image"><br>
                                                    <input type="file" name="image"><br>
                                                    <input type="file" name="image"><br>
                                                    <input type="file" name="image"><br>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <input type="submit" class="btn btn-primary" value="Save listing">
                            <input type="reset" class="btn btn-primary" value="Reset" style="float: right;">
                            <div style="height: 100px">

                            </div>
                        </div>
                        <!-- .panel-body -->

                    </form>
                </div>
            </div>
        </div>
    </section>
    <br><br><br>
    <%@include file="/jsp/customer/footer.jsp" %>
    
</body>
</html>