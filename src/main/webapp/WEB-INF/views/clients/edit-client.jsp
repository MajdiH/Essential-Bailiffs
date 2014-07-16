<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>L'espace professionnel des huissiers de justice</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="EPSI">

    <!-- styles -->

<link href="<c:url value="/resources/assets/css/baillifswap.css" />" rel="stylesheet">
<link href="<c:url value="/resources/assets/css/baillifswap-responsive.css" />" rel="stylesheet">
<script type="text/javascript" src="<c:url value="/resources/assets/js/jquery.min.js" />"></script>
    <link href="<c:url value="/resources/assets/css/ie.css" />" rel="stylesheet"/>


        <!--[if IE 8]>
        <link href="../assets/css/ie8.css" rel="stylesheet">
        <![endif]-->

        <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

        <!--[if gte IE 9]>
          <style type="text/css">
            .gradient {
               filter: none;
            }
          </style>
        <![endif]-->

    </head>

    <body>

        <div class="container-fluid">

            <!-- Header starts -->
			<%@ include file="/WEB-INF/views/includes/head.jsp" %>
            <!-- Header ends -->

            <div class="row-fluid">

                <!-- Sidebar statrt -->
				<%@ include file="/WEB-INF/views/includes/slidebar.jsp" %>
                <!-- Sidebar end -->

                <!-- Body start -->
                <div class="span10">

                    <div class="row-fluid">
                        <div class="span12">
                            <ul class="breadcrumb">
                                <li>
                                    <a href="#">Home</a> <span class="divider">/</span>
                                </li>
                                <li>
                                    <a href="#">Clients</a> <span class="divider">/</span>
                                </li>
                                <li>
                                    Edit
                                </li>
                            </ul>
                        </div>
                    </div>
					<div id="clientFromResponse">
					</div>
                    <section id="formElement" class="utopia-widget utopia-form-box section">
                        <div class="utopia-widget-title">
                            <img src="<c:url value="/resources/assets/img/icons2/software24.png" />" class="utopia-widget-icon">
                            <span>Editer un client</span>
                        </div>

                        <div class="row-fluid">
                            <div class="utopia-widget-content">
                                <div class="span12 utopia-form-freeSpace">
                                    <form id="newClientForm" class="form-horizontal"
                                    action="${pageContext.request.contextPath}/clients/edit/${client.id}.json
									commandName="client">
                                        <fieldset>
                                            <div class="control-group ">
                                                <label class="control-label" for="firstName">Prénom</label>

                                                <div class="controls">
                                                    <input id="firstName" name="firstName" value="${client.firstName }" class="span6" type="text">

                                                </div>
                                            </div>
                                            <div class="control-group ">
                                                <label class="control-label" for="lastName">Nom</label>

                                                <div class="controls">
                                                    <input id="lastName" name="lastName" value="${client.lastName }" class="span6" type="text">

                                                </div>
                                            </div>
                                            <div class="control-group ">
                                                <label class="control-label" for="tel">Telephone</label>

                                                <div class="controls">
                                                    <input id="tel" name="tel" value="${client.tel }" class="span3" type="text">

                                                </div>
                                            </div>
                                            <div class="control-group ">
                                                <label class="control-label" for="email">Email</label>

                                                <div class="controls">
                                                    <input id="email" name="email" value="${client.email }" class="span6" type="text">

                                                </div>
                                            </div>
                                            <div class="control-group ">
                                                <label class="control-label" for="birthday">Date de naissance</label>

                                                <div class="controls">
                                                    <input id="birthday" name="birthday" value="${client.birthday }" class="span3" type="text">

                                                </div>
                                            </div>
                                            <div class="control-group ">
                                                <label class="control-label" for="profession">Profession</label>

                                                <div class="controls">
                                                    <input id="profession" name="profession" value="${client.profession }" class="span6" type="text">

                                                </div>
                                            </div>
                                            <div class="control-group ">
                                                <label class="control-label" for="adress">Adresse</label>

                                                <div class="controls">
                                                    <input id="adress" name="adress" value="${client.adress }" class="span6" type="text">

                                                </div>
                                            </div>
                                            <div class="control-group ">
                                                <label class="control-label" for="zip">Code postal</label>

                                                <div class="controls">
                                                    <input id="zip" name="zip" value="${client.zip }" class="span2" type="text">

                                                </div>
                                            </div>
                                            <div class="control-group ">
                                                <label class="control-label" for="city">Ville</label>

                                                <div class="controls">
                                                    <input id="city" name="city" value="${client.city }" class="span3" type="text">

                                                </div>
                                            </div>
                                            
                                                    <input id="country" name="country" class="span3" type="hidden" value="France">

                                            <div class="control-group ">

                                                <div class="controls">
                                                    <button class="btn btn-success span3" href="javascript:void(0)">Editer</button>
                                                </div>
                                            </div>
                                        </fieldset>
                                    </form>
                                </div>



                            </div>
                        </div>
                    </section>


                </div><!-- Body end -->
            </div>

            <!-- Maincontent end -->

        </div> <!-- end of container -->

<!-- javascript placed at the end of the document so the pages load faster -->
<script type="text/javascript" src="<c:url value="/resources/assets/js/utopia.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/assets/js/header.js?v1" />"></script>
<script type="text/javascript" src="<c:url value="/resources/assets/js/sidebar.js" />"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {

						$('#newClientForm')
								.submit(
										function(event) {

											var firstname = $('#firstName').val();
											var lastname = $('#lastName').val();
											var tel = $('#tel').val();
											var email = $('#email').val();
											var birthday = $('#birthday').val();
											var profession = $('#profession').val();
											var adress = $('#adress').val();
											var zip = $('#zip').val();
											var city = $('#city').val();
											var country = $('#country').val();
											     
											var json = {
												"firstName" : firstname,
												"lastName" : lastname,
												"tel" : tel,
												"email" : email,
												"birthday" : birthday,
												"profession" : profession,
												"adress" : adress,
												"zip" : zip,
												"city" : city,
												"country" : country
											};

											$
													.ajax({
														url : $(
																"#newClientForm")
																.attr("action"),
														data : JSON
																.stringify(json),
														type : "POST",

														beforeSend: function(xhr) {
											        		xhr.setRequestHeader("Accept", "application/json");
											        		xhr.setRequestHeader("Content-Type", "application/json");
											        		$(".error").remove();
											        	},
														success : function(client) {
															var respContent = "<div class='alert alert-success'><a class='close' data-dismiss='alert' href='#'>×</a><div class='error'>";
															respContent += "le <strong>Client</strong> est bien modifié : [";
															respContent += client.firstName+ " : ";
															respContent += client.lastName+ " : ";
															respContent += client.tel+ " : ";
															respContent += client.email+ " : ";
															respContent += client.birthday+ " : ";
															respContent += client.profession+ " : ";
															respContent += client.adress+ " : ";
															respContent += client.zip+ " : ";
															respContent += client.city+ "]</div></div>";

															$("#clientFromResponse").html(respContent);
															sleep(2000);
															window.location='/clients';
														}

													});

											event.preventDefault();
										});

					});
</script>
    </body>
</html>
