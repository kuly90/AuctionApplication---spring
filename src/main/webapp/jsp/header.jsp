<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<link href="<c:url value="resources/style/css/bootstrap.min.css" />" rel="stylesheet">
<link href="<c:url value="resources/style/css/font-awesome.min.css" />" rel="stylesheet">
<link href="<c:url value="resources/style/css/prettyPhoto.css" />" rel="stylesheet">
<link href="<c:url value="resources/style/css/price-range.css" />" rel="stylesheet">
<link href="<c:url value="resources/style/css/animate.css" />" rel="stylesheet">
<link href="<c:url value="resources/style/css/main.css" />" rel="stylesheet">
<link href="<c:url value="resources/style/css/responsive.css" />" rel="stylesheet">
</head><!--/head-->
<body>
    <header id="header">
        <div class="header-middle"><!--header-middle-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-4">
                        <div class="logo pull-left">
                            <a href="<c:url value="index?pages=1&pagesFN=1"/>"><img src="resources/images/home/logo2.JPG" alt="" style="width: 250px"/></a>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="shop-menu pull-right">
                            <ul class="nav navbar-nav">
                                <li class="dropdown"><a href="<c:url value="jsp/customer/resultPage?pages=1&pagesFN=1"/>" style="color: orange"><i class="glyphicon glyphicon-log-in"></i> Login</a></li>
                                <li><a href="register" style="color: orange"><i class="glyphicon glyphicon-star-empty"></i> Register</a></li>
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
                                <li><a href="index?pages=1&pagesFN=1" class="active"><i class="glyphicon glyphicon-home"></i>  Home</a></li>
                                <li class="dropdown"><a href="jsp/customer/init" style="color: orange">Make Auction</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div><!--/header-bottom-->
    </header>