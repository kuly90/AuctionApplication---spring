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
                            <a href="<c:url value="homeManage"/>"><img src="../../resources/images/home/logo2.JPG" alt="" style="width: 250px"/></a>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="shop-menu pull-right">
                            <ul class="nav navbar-nav">
                                
                                <li><a href="<c:url value="/logout"/>" style="color: orange"><i class="glyphicon glyphicon-log-out"></i> Logout</a></li>
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
                                
                            </button>
                        </div>
                        <div class="mainmenu pull-left">
                            <ul class="nav navbar-nav collapse navbar-collapse">
                                <li><a href="homeManage" class="active"><i class="glyphicon glyphicon-home"></i>  Home</a></li>
                                
                                <li><a href="manageAuction" style="color: orange">Auction Manage</a></li> 
                                <li><a href="manageReport" style="color: orange">Report</a></li>
                            </ul>
                        </div>
                       
                    </div>
                </div>
            </div>
        </div><!--/header-bottom-->
    </header>