<!DOCTYPE html>
<%@ page import="java.util.*, java.text.*"  %> 
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>View Auction | Auction Online</title>
        <%@include file="/jsp/customer/header.jsp"%>
    </head><!--/head-->

    <body>
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 padding-right">
                        <div class="product-details"><!--product-details-->
                            <div class="col-sm-4">
                                <div class="view-product">
                                    <img src="../../resources/images/goods/${auctionEntity.goodsEntity.top1Image}" alt="" />
                                </div>
                                <div  id="similar-product" class="carousel slide" data-ride="carousel">

                                    Wrapper for slides 

                                    <div class="carousel-inner">
                                        <div class="item active">
                                            <c:forEach var="image" items="${auctionEntity.goodsEntity.imageList}">
                                                <a href=""><img src="../../resources/images/goods/${image.imageUrl}" alt="" width="120" height="120"></a>
                                                </c:forEach>
                                        </div>
                                        <c:forEach var="image" items="${auctionEntity.goodsEntity.imageList}">
                                            <div class="item">
                                                <a href=""><img src="../../resources/images/goods/${image.imageUrl}" alt="" width="140" height="140" style="text-align: center"></a>
                                            </div>
                                        </c:forEach>

                                    </div>

                                    <!-- Controls -->
                                    <a class="left item-control" href="#similar-product" data-slide="prev">
                                        <i class="fa fa-angle-left"></i>
                                    </a>
                                    <a class="right item-control" href="#similar-product" data-slide="next">
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <table class="table">                                    
                                    <tr>
                                        <td>
                                            <h2>${auctionEntity.goodsEntity.goodName}</h2>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p>Goods ID: ${auctionEntity.goodsEntity.goodID}</p>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p>Seller: ${auctionEntity.customerEntity.name}</p>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p>End Date: ${auctionEntity.startDate}</p>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <h4>Max Price: ${auctionEntity.maxBidsFormat} &dollar;</h4>
                                            <input type="hidden" id="price" value="${auctionEntity.maxBids}">
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td id = "buttonHide">
                                            <p style="color: red">${msg}</p><br>
                                            <form action="makeaBids" method="post" onsubmit="return validataMake()">
                                                <div class="input-group">
                                                    <input type="hidden" name="idAuction" value="${auctionEntity.auctionID}">
                                                    <input type="number" id="bidmaxNext" name="bidMoney" class="form-control">
                                                    <span class="input-group-btn">
                                                        <input type="submit" class="btn btn-fefault cart" value="Make a bid">
                                                    </span>
                                                </div>
                                            </form>
                                        </td>
                                        <td><p id="auctionResult" style="color: blue; font-size: 30px;">Auction Finish</p></td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-sm-4">
                                <input type="hidden" id ="hh" value="${auctionEntity.hourStart}" />
                                <input type="hidden" id="datestart" value="${auctionEntity.startDate}" />
                                <input type="hidden" id="duration" value="${auctionEntity.duration}" />
                                <input type="hidden" id="mh" value="${auctionEntity.minuteStart}" />
                                <input type="hidden" id="sh" value="${auctionEntity.secondStart}" />
                                <input type="hidden" id="date" value="${auctionEntity.dateOfStartDate}" />
                                <input type="hidden" id="month" value="${auctionEntity.monthOfStartDate}" />
                                <input type="hidden" id="year" value="${auctionEntity.yearOfStartDate}" />
                                <table class="table" id="hidden">
                                    <tr class="text-danger text-center " style="font-weight: bold; font-size: 25px;">
                                        <td id="d"></td>
                                        <td id="h">
                                        </td>
                                        <td id="m"></td>
                                        <td id="s"></td>
                                    </tr>
                                    <tr class="text-center">
                                        <td>Day</td>
                                        <td>Hour</td>
                                        <td>Minutes</td>
                                        <td>Seconds</td>
                                    </tr>
                                </table>
                                <div class="chat-panel panel panel-success">
                                    <div class="panel-heading">
                                        <i class="fa fa-comments fa-fw"></i> Message
                                        <div class="btn-group pull-right">
                                            <a href="#"><i class="fa fa-refresh fa-fw"></i></a>
                                        </div>
                                    </div>
                                    <!-- /.panel-heading -->
                                    <div class="panel-body">
                                        <ul class="chat ">
                                            <c:if test="${broadList.size() == 0}">
                                                <li class="left clearfix">
                                                    <div class="chat-body clearfix">
                                                        <div class="header">
                                                        </div>
                                                        <p>No message</p>
                                                    </div>
                                                </li>
                                            </c:if>
                                            <c:if test="${broadList.size() > 0}">
                                                <c:forEach var="broad" items="${broadList}">
                                                    <li class="right clearfix">
                                                        <div class="chat-body clearfix">
                                                            <div class="header">
                                                                <strong class="primary-font" style="color: green;">${broad.customerEntity.name}</strong>
                                                                <small class="pull-right text-muted">
                                                                    <i class="fa fa-clock-o fa-fw"></i> ${broad.date}
                                                                </small>
                                                            </div>
                                                            <p>${broad.message}</p>
                                                        </div>

                                                    </c:forEach>
                                                </c:if>
                                        </ul>
                                    </div>
                                    <!-- /.panel-body -->

                                    <div class="panel-footer">
                                        <div class="input-group"  style="width: 100%;">
                                            <form action="postAMessage" method="post" onsubmit="return validataPostAMessage()">
                                                <div class="input-group">
                                                    <input type="hidden" name="idAuction" value="${auctionEntity.auctionID}">
                                                    <input id="btn-input" type="text" class="form-control input-sm" name="message" placeholder="Type your message here..." />
                                                    <span class="input-group-btn">
                                                        <button class="btn btn-success btn-sm" id="btn-chat">
                                                            Send
                                                        </button>
                                                    </span>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="panel-footer">
                                        <div class="input-group"  style="width: 100%;">
                                            <form action="postAMessage" method="post" onsubmit="return validataPostAMessage()">
                                                <div class="input-group">
                                                    <h5>Description: ${auctionEntity.goodsEntity.description}</h5>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <!-- /.panel-footer -->
                                </div>
                            </div>

                        </div><!--/product-details-->
                    </div>
                </div>
            </div>
        </section>
        <div style="height: 150px;"></div>


        <%@include file="/jsp/customer/footer.jsp" %>

        <script type="text/javascript" LANGUAGE="JavaScript">
            window.onload = function () {
                start();
            };
            function validataMake()
            {
                var priceBefore = document.getElementById('price').value;
                var priceMakeaBid = document.getElementById('bidmaxNext').value;

                if (Number(priceMakeaBid) <= 0) {
                    alert("Please enter value money make a bid greater than 0.");
                    return false;
                } else if (Number(priceMakeaBid) < Number(priceBefore)) {
                    alert("Please enter value money make a bid greater than Price.");
                    return false;
                } else if (Number(priceMakeaBid) < (Number(priceBefore) + 10)) {
                    alert("Please enter value money make a bid greater than Price  + 10 $.");
                    return false;
                } else
                    return true;
            }
            function validataPostAMessage() {
                var message = document.getElementById('message').value;
                if (message == "") {
                    alert("Please enter a message to Post.");
                    return false;
                } else
                    return true;
            }

        </script>

        <script type="text/javascript" LANGUAGE="JavaScript">

            var d = null; //ngay
            var h = null; // gio
            var m = null; // phut
            //var s = 60 - new Date().getSeconds(); // giay
            var s = null;
            //var count = document.getElementById('count').value;
            window.onload = function ()
            {
                start();
            };
            function start()
            {

                var maxBids = document.getElementById('price').value;
                var maxBidsNext = Number(maxBids) + 10;
                document.getElementById('bidmaxNext').placeholder = maxBidsNext.toString() + " $";
                for (i = 1; i < 2; i++) {
                    var timeout = null; // Timeout
                    d = null; //ngay hien thi
                    h = null; // gio
                    m = null; // phut
                    s = null; // giay
                    var dayAddNow = null;
                    var dayAdd = null;

                    //get ngay gio bat dau
                    var duration = document.getElementById('duration').value;
                    var date = document.getElementById('date').value;
                    var dateFinish = Number(date) + Number(duration);
                    var monthFinish = document.getElementById('month').value;
                    var yearFinish = document.getElementById('year').value;
                    var hourFinish = document.getElementById('hh').value;
                    var minuteFinish = document.getElementById('mh').value;
                    var secondFinish = document.getElementById('sh').value;

                    //lay ngay thang nam hien tai
                    var today = new Date();
                    var dateNow = today.getDate();
                    var monthNow = today.getMonth() + 1;
                    var yearNow = today.getFullYear();
                    var hourNow = today.getHours();
                    var minuteNow = today.getMinutes();
                    var secondNow = today.getSeconds();

                    //doi thang bat dau ra ngay
                    switch (Number(monthFinish)) {
                        case 1:
                        case 3:
                        case 5:
                        case 7:
                        case 8:
                        case 10:
                        case 12:
                            dayAdd = 31;
                            break;
                        case 4:
                        case 6:
                        case 9:
                        case 11:
                            dayAdd = 30;
                            break;
                        case 2:
                            if (Number(yearFinish) % 400 == 0 || (Number(yearFinish) % 4 == 0 && Number(yearFinish) % 100 == 0)) {
                                dayAdd = 29;
                            } else
                                dayAdd = 28;
                            break;
                    }

                    //doi thang hien tai ra ngay
                    switch (Number(monthNow)) {
                        case 1:
                        case 3:
                        case 5:
                        case 7:
                        case 8:
                        case 10:
                        case 12:
                            dayAddNow = 31;
                            break;
                        case 4:
                        case 6:
                        case 9:
                        case 11:
                            dayAddNow = 30;
                            break;
                        case 2:
                            if (Number(yearNow) % 400 == 0 || (Number(yearNow) % 4 == 0 && Number(yearNow) % 100 == 0)) {
                                dayAddNow = 29;
                            } else
                                dayAddNow = 28;
                            break;
                    }

                    //tinh ngay gio
                    if (d === null && h === null && m === null && s === null) {
                        if (Number(yearFinish) - Number(yearNow) >= 0) {
                            if (Number(monthFinish) - Number(monthNow) >= 0) {
                                if ((Number(dateFinish) + Number(dayAdd)) - (Number(dateNow) + Number(dayAddNow)) >= 0) {
                                    if (Number(hourFinish) - Number(hourNow) >= 0) {
                                        if (Number(minuteFinish) - Number(minuteNow) >= 0) {
                                            if (Number(secondFinish) - Number(secondNow) >= 0) {
                                                s = Number(secondFinish) - Number(secondNow);
                                                m = Number(minuteFinish) - Number(minuteNow);
                                                h = Number(hourFinish) - Number(hourNow);
                                                d = (Number(dateFinish) + Number(dayAdd)) - (Number(dateNow) + Number(dayAddNow));
                                            } else {
                                                s = 60 - Number(secondNow) + Number(secondFinish);
                                                m = Number(minuteFinish) - Number(minuteNow) - 1;
                                                h = Number(hourFinish) - Number(hourNow);
                                                d = (Number(dateFinish) + Number(dayAdd)) - (Number(dateNow) + Number(dayAddNow));
                                            }
                                        } else {
                                            if (Number(secondFinish) - Number(secondNow) >= 0) {
                                                s = Number(secondFinish) - Number(secondNow);
                                                m = 60 - Number(minuteNow) + Number(minuteFinish);
                                                h = Number(hourFinish) - Number(hourNow) - 1;
                                                d = (Number(dateFinish) + Number(dayAdd)) - (Number(dateNow) + Number(dayAddNow));
                                            } else {
                                                s = 60 - Number(secondNow) + Number(secondFinish);
                                                m = 60 - Number(minuteNow) + Number(minuteFinish) - 1;
                                                h = Number(hourFinish) - Number(hourNow) - 1;
                                                d = (Number(dateFinish) + Number(dayAdd)) - (Number(dateNow) + Number(dayAddNow));
                                            }
                                        }
                                    } else {
                                        if (Number(minuteFinish) - Number(minuteNow) >= 0) {
                                            if (Number(secondFinish) - Number(secondNow) >= 0) {
                                                s = Number(secondFinish) - Number(secondNow);
                                                m = Number(minuteFinish) - Number(minuteNow);
                                                h = 24 - Number(hourNow) + Number(hourFinish);
                                                d = (Number(dateFinish) + Number(dayAdd)) - (Number(dateNow) + Number(dayAddNow)) - 1;
                                            } else {
                                                s = 60 - Number(secondNow) + Number(secondFinish);
                                                m = Number(minuteFinish) - Number(minuteNow) - 1;
                                                h = 24 - Number(hourNow) + Number(hourFinish);
                                                d = (Number(dateFinish) + Number(dayAdd)) - (Number(dateNow) + Number(dayAddNow)) - 1;
                                            }
                                        } else {
                                            if (Number(secondFinish) - Number(secondNow) >= 0) {
                                                s = Number(secondFinish) - Number(secondNow);
                                                m = 60 - Number(minuteNow) + Number(minuteFinish);
                                                h = 24 - Number(hourNow) + Number(hourFinish) - 1;
                                                d = (Number(dateFinish) + Number(dayAdd)) - (Number(dateNow) + Number(dayAddNow)) - 1;
                                            } else {
                                                s = 60 - Number(secondNow) + Number(secondFinish);
                                                m = 60 - Number(minuteNow) + Number(minuteFinish) - 1;
                                                h = 24 - Number(hourNow) + Number(hourFinish) - 1;
                                                d = (Number(dateFinish) + Number(dayAdd)) - (Number(dateNow) + Number(dayAddNow)) - 1;
                                            }
                                        }
                                    }
                                } else {
                                    d = -1;
                                }
                            } else {
                                d = -1;
                            }
                        } else {
                            if (Number(monthFinish) - Number(monthNow) == 11) {
                                if (Number(dateFinish) - (Number(dateNow) + Number(dayAdd)) >= 0) {
                                    if (Number(hourFinish) - Number(hourNow) >= 0) {
                                        if (Number(minuteFinish) - Number(minuteNow) >= 0) {
                                            if (Number(secondFinish) - Number(secondNow) >= 0) {
                                                s = Number(secondFinish) - Number(secondNow);
                                                m = Number(minuteFinish) - Number(minuteNow);
                                                h = Number(hourFinish) - Number(hourNow);
                                                d = Number(dateFinish) - (Number(dateNow) + Number(dayAdd));
                                            } else {
                                                s = 60 - Number(secondNow) + Number(secondFinish);
                                                m = Number(minuteFinish) - Number(minuteNow) - 1;
                                                h = Number(hourFinish) - Number(hourNow);
                                                d = Number(dateFinish) - (Number(dateNow) + Number(dayAdd));
                                            }
                                        } else {
                                            if (Number(secondFinish) - Number(secondNow) >= 0) {
                                                s = Number(secondFinish) - Number(secondNow);
                                                m = 60 - Number(minuteNow) + Number(minuteFinish);
                                                h = Number(hourFinish) - Number(hourNow) - 1;
                                                d = Number(dateFinish) - (Number(dateNow) + Number(dayAdd));
                                            } else {
                                                s = 60 - Number(secondNow) + Number(secondFinish);
                                                m = 60 - Number(minuteNow) + Number(minuteFinish) - 1;
                                                h = Number(hourFinish) - Number(hourNow) - 1;
                                                d = Number(dateFinish) - (Number(dateNow) + Number(dayAdd));
                                            }
                                        }
                                    } else {
                                        if (Number(minuteFinish) - Number(minuteNow) >= 0) {
                                            if (Number(secondFinish) - Number(secondNow) >= 0) {
                                                s = Number(secondFinish) - Number(secondNow);
                                                m = Number(minuteFinish) - Number(minuteNow);
                                                h = 24 - Number(hourNow) + Number(hourFinish);
                                                d = Number(dateFinish) - (Number(dateNow) + Number(dayAdd)) - 1;
                                            } else {
                                                s = 60 - Number(secondNow) + Number(secondFinish);
                                                m = Number(minuteFinish) - Number(minuteNow) - 1;
                                                h = 24 - Number(hourNow) + Number(hourFinish);
                                                d = Number(dateFinish) - (Number(dateNow) + Number(dayAdd)) - 1;
                                            }
                                        } else {
                                            if (Number(secondFinish) - Number(secondNow) >= 0) {
                                                s = Number(secondFinish) - Number(secondNow);
                                                m = 60 - Number(minuteNow) + Number(minuteFinish);
                                                h = 24 - Number(hourNow) + Number(hourFinish) - 1;
                                                d = Number(dateFinish) - (Number(dateNow) + Number(dayAdd)) - 1;
                                            } else {
                                                s = 60 - Number(secondNow) + Number(secondFinish);
                                                m = 60 - Number(minuteNow) + Number(minuteFinish) - 1;
                                                h = 24 - Number(hourNow) + Number(hourFinish) - 1;
                                                d = Number(dateFinish) - (Number(dateNow) + Number(dayAdd)) - 1;
                                            }
                                        }
                                    }
                                } else {
                                    d = -1;
                                }
                            } else {
                                d = -1;
                            }
                        }
                    }


                    document.getElementById('auctionResult').hidden = true;

                    /*chuyen doi du lieu*/
                    if (d === 0 && m === 0 && h === 0 && s === -1) {
                        s = 0;
                        m = 0;
                        h = 0;
                        d = -1;
                        document.getElementById('hidden').hidden = true;
                        document.getElementById('auctionResult').hidden = false;
                        $('#buttonHide').hide();
                    }
                    if (s === -1) {
                        s = 59;
                        m = m - 1;
                    }
                    if (m === -1) {
                        m = 59;
                        h = h - 1;
                    }
                    if (h === -1) {
                        h = 23;
                        d = d - 1;
                    }

                    if (d <= -1) {
                        s = 0;
                        m = 0;
                        h = 0;
                        d = -1;
                        //alert("Time out");
                        //$('hidden').hide();
                        document.getElementById('hidden').hidden = true;
                        document.getElementById('auctionResult').hidden = false;
                        $('#buttonHide').hide();
                    }
                    /*hien thi dong ho*/
                    //alert(i);
                    document.getElementById('d').innerText = d.toString();
                    document.getElementById('h').innerText = h.toString();
                    document.getElementById('m').innerText = m.toString();
                    document.getElementById('s').innerText = s.toString();
                }

                /*giam phut xuong 1 giay va goi lai sau 1 s */
                timeout = setTimeout(function () {
                    //s--;
                    start();
                }, 1000);
            }
        </script>
    </body>
</html>