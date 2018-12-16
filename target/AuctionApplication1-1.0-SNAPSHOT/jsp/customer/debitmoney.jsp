<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Debit Money | Auction Application</title>
        <%@include file="header.jsp"%>
        <!--/header-->
    <section id="form">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="features_items"><!--features_items-->
                        <h2 class="title text-center">Deposit Money</h2>
                        <p style="color: orange; padding-left: 13px;text-align: center">${msg1}${msg3}</p>

                    </div><!--features_items-->
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4 padding-right">
                    <div class="features_items"><!--features_items-->
                        <label style="float: right;margin-top: .8em;padding-left: 10em">Number Account : </label>
                        <label style="float: right;margin-top: 1.6em;padding-left: 10em">Amount : </label>
                    </div><!--features_items-->
                </div>
                <div class="col-sm-4 padding-right">
                    <div class="features_items"><!--features_items-->

                        <div class="col-sm-3">
                            <div class="shopper-info">

                                <form action="debitRequest" method="post" name="form_debit">
                                    <input type="text" placeholder="Number Account" name="numberAccount" value="${cardEntity.numberAccount}" style="width: 500px;">
                                    <input type="text" placeholder="Amount" name="amount" style="width: 500px;">
                                    <input type="submit" class="btn btn-primary" value="Debit">
                                </form>
                            </div>
                        </div>
                    </div><!--features_items-->
                </div>
                <div class="col-sm-4 padding-right">
                    <div class="features_items"><!--features_items-->
                        <p style="color: orange; padding-top: 4.3em">${msg2}</p>
                    </div><!--features_items-->
                </div>
            </div>
        </div>
    </section>
    <div style="height: 40px;"></div>
    <br><br><br>
    <%@include file="footer.jsp" %>
</body>
</html>