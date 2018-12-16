<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Home | Auction Application</title>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <link href="<c:url value="../../resources/style/css/bootstrap.min.css" />" rel="stylesheet">
        <link href="<c:url value="../../resources/style/css/font-awesome.min.css" />" rel="stylesheet">
        <link href="<c:url value="../../resources/style/css/prettyPhoto.css" />" rel="stylesheet">
        <link href="<c:url value="../../resources/style/css/price-range.css" />" rel="stylesheet">
        <link href="<c:url value="../../resources/style/css/animate.css" />" rel="stylesheet">
        <link href="<c:url value="../../resources/style/css/main.css" />" rel="stylesheet">
        <link href="<c:url value="../../resources/style/css/responsive.css" />" rel="stylesheet">
    </head><!--/head-->
    <body>
        <header id="header">
            <div class="header-middle"><!--header-middle-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="logo pull-left">
                                <a href="<c:url value="resultPage?pages=1&pagesFN=1"/>"><img src="../../resources/images/home/logo2.JPG" alt="" style="width: 250px"/></a>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <div class="shop-menu pull-right">
                                <ul class="nav navbar-nav">
                                    <li class="dropdown"><a href="<c:url value=""/>" style="color: orange"><i class="fa fa-user "></i> Account<i class="fa fa-angle-down"></i></a>
                                        <ul role="menu" class="sub-menu">
                                            <li><a href="auction_bid">Auction You Bid</a></li>
                                            <li><a href="auction_sell">Auction You Sell</a></li>
                                            <li><a href="viewCard">Account Number</a></li> 
                                            <li><a href="debit">Deposit Money</a></li>
                                            <li><a href="changePass">Change Password</a></li> 
                                            <li><a href="editAccount">Edit Account</a></li> 
                                        </ul>
                                    </li>
                                    <li><a href="<c:url value="/logout"/>" style="color: orange"> <i class="glyphicon glyphicon-log-out"></i> Logout</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--/header-middle-->

            <div class="header-bottom"><!--header-bottom-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-9">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div>
                            <div class="mainmenu pull-left">
                                <ul class="nav navbar-nav collapse navbar-collapse">
                                    <li><a href="resultPage?pages=1&pagesFN=1" class="active"><i class="glyphicon glyphicon-home"></i>  Home</a></li>
                                    <li class="dropdown"><a href="init" style="color: orange">Make Auction</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="search_box pull-right">
                                <!--<input type="text" placeholder="Search"/>-->
                                <nav>
                                    <ul class="ext-nav">
                                        <li id="login">
                                            <a  href="">Search</a>
                                            <form id="login-form" action="search?pages=1&pagesFN=1" method="post">
                                                <p><input class="text" style="width: 200px;" type="text" name="searchName" placeholder="Search by goods name"/></p>

                                                <p><button style="width: 95px;" type="submit" class="btn btn-default get submit">Search</button></p>
                                            </form>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--/header-bottom-->
        </header>
        <!--/header-->
        <section>
            <!--        <a href="debit">Debit</a>
                    <a href="init">Init</a>-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="features_items"><!--features_items-->
                            <div data-countdown="12/05/2011"></div>
                            <h2 class="title text-center">Auction List</h2>
                            <% int i = 1;%>
                            <c:forEach var="auctionNotFinish" items="${auctionListNotFinish}">
                                <div class="col-sm-3" id="parent<% out.print(i);%>">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo1 text-center" >
                                                <a href="viewAuction?id=${auctionNotFinish.auctionID}"><img src="../../resources/images/goods/${auctionNotFinish.goodsEntity.top1Image}" width="250" height="180" class="img-thumbnail" alt=""  /></a>
                                                <h2>&dollar; ${auctionNotFinish.formattedMinimunPrice}</h2>
                                                <p style="min-height: 38px;">${auctionNotFinish.goodsEntity.goodName}</p>

                                                <a href="viewAuction?id=${auctionNotFinish.auctionID}" class="btn btn-default add-to-cart" id="buttonHide<% out.print(i);%>"><i class="glyphicon glyphicon-usd"></i>Bids Now </a>
                                                <div class="text-center">
                                                    <input type="hidden" id ="hh<% out.print(i);%>" value="${auctionNotFinish.hourStart}" />
                                                    <input type="hidden" id="datestart<% out.print(i);%>" value="${auctionNotFinish.startDate}" />
                                                    <input type="hidden" id="duration<% out.print(i);%>" value="${auctionNotFinish.duration}" />
                                                    <input type="hidden" id="mh<% out.print(i);%>" value="${auctionNotFinish.minuteStart}" />
                                                    <input type="hidden" id="sh<% out.print(i);%>" value="${auctionNotFinish.secondStart}" />
                                                    <input type="hidden" id="date<% out.print(i);%>" value="${auctionNotFinish.dateOfStartDate}" />
                                                    <input type="hidden" id="month<% out.print(i);%>" value="${auctionNotFinish.monthOfStartDate}" />
                                                    <input type="hidden" id="year<% out.print(i);%>" value="${auctionNotFinish.yearOfStartDate}" />
                                                    <input type="hidden" id="count" value="${auctionListNotFinishSize}" />
                                                    <table class="table" id="hidden<% out.print(i);%>" style="margin-bottom: 8px;">
                                                        <tr class="text-danger text-center " style="font-weight: bold; font-size: 25px;">
                                                            <td id="d<% out.print(i);%>"></td>
                                                            <td id="h<% out.print(i);%>">
                                                            </td>
                                                            <td id="m<% out.print(i);%>"></td>
                                                            <td id="s<% out.print(i);%>"></td>
                                                        </tr>
                                                        <tr class="text-center">
                                                            <td>Day</td>
                                                            <td>Hour</td>
                                                            <td>Minutes</td>
                                                            <td>Seconds</td>
                                                        </tr>
                                                    </table>
                                                    <p id="auctionResult<% out.print(i);%>" style="padding: 15px 0 0 0; font-size: 30px; color: #FE980F;">Auction Finish</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <% i++;%>
                            </c:forEach>
                        </div><!--features_items-->

                        <ul class="pagination">
                            <li><a href="">«</a></li>
                                <c:forEach var="i" begin="1" end="${totalPages}">
                                    <c:set var="active" value="${pages}"/>
                                <li <c:if test="${active == i}">class="active"</c:if>><a href="resultPage?pages=<c:out value="${i}"/>&pagesFN=${pagesFN}"><c:out value="${i}"/></a></li>
                                </c:forEach>
                            <li><a href="">»</a></li>
                        </ul>
                    </div>
                </div>
            </div>
                            <div style="height: 435px;"></div>  
        </section>
        <%@include file="/jsp/customer/footer.jsp" %>


        <script type="text/javascript" LANGUAGE="JavaScript">

            var d = null; //ngay
            var h = null; // gio
            var m = null; // phut
            //var s = 60 - new Date().getSeconds(); // giay
            var s = null;
            var i = 0;
            var count = document.getElementById('count').value;
            window.onload = function ()
            {
                start();
            };
            function start()
            {


                for (i = 1; i < Number(count) + 1; i++) {
                    var timeout = null; // Timeout
                    d = null; //ngay hien thi
                    h = null; // gio
                    m = null; // phut
                    s = null; // giay
                    var dayAddNow = null;
                    var dayAdd = null;

                    //get ngay gio bat dau
                    var duration = document.getElementById('duration' + i).value;
                    var date = document.getElementById('date' + i).value;
                    var dateFinish = Number(date) + Number(duration);
                    var monthFinish = document.getElementById('month' + i).value;
                    var yearFinish = document.getElementById('year' + i).value;
                    var hourFinish = document.getElementById('hh' + i).value;
                    var minuteFinish = document.getElementById('mh' + i).value;
                    var secondFinish = document.getElementById('sh' + i).value;

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

                    document.getElementById('auctionResult' + i).hidden = true;
                    $('#buttonView' + i).hide();
                    /*chuyen doi du lieu*/
                    if (d === 0 && m === 0 && h === 0 && s === -1) {
                        s = 0;
                        m = 0;
                        h = 0;
                        d = -1;
                        document.getElementById('hidden' + i).hidden = true;
                        document.getElementById('auctionResult' + i).hidden = false;
                        $('#buttonHide' + i).hide();
                        document.getElementById('parent'+i).hidden=true;
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
                        document.getElementById('hidden' + i).hidden = true;
                        document.getElementById('auctionResult' + i).hidden = false;
                        $('#buttonHide' + i).hide();
                        document.getElementById('parent'+i).hidden=true;
                    }
                    /*hien thi dong ho*/
                    //alert(i);
                    document.getElementById('d' + i).innerText = d.toString();
                    document.getElementById('h' + i).innerText = h.toString();
                    document.getElementById('m' + i).innerText = m.toString();
                    document.getElementById('s' + i).innerText = s.toString();
                }

                /*giam phut xuong 1 giay va goi lai sau 1 s */
                timeout = setTimeout(function () {
                    //s--;
                    start();
                }, 1000);
            }
        //                   $(document).ready(function(){
        //    start();// goi lan dau
        //    setInterval('start()', 1000); // sau 1s goi ham do
        //})
        </script>
        <script>
            $("#login").hover(function () {
                $("#login-form").slideToggle();
            });
        </script>
    </body>
</html>


