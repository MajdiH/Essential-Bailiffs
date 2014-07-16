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
<link href="<c:url value="/resources/assets/css/jquery.cleditor.css" />" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/assets/css/gallery/wookmark.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/assets/css/gallery/adipoli.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/assets/css/gallery/jquery.fileupload-ui.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/assets/css/gallery/colorbox.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/assets/css/gallery/modal.css" />" rel="stylesheet">
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
                                    <a href="#">Constats</a> <span class="divider">/</span>
                                </li>
                                <li>
                                    Nouveau
                                </li>
                            </ul>
                        </div>
                    </div>
					<div id="clientFromResponse">
					</div>
                    <section id="formElement" class="utopia-widget utopia-form-box section">
                        <div class="utopia-widget-title">
                            <img src="<c:url value="/resources/assets/img/icons2/software24.png" />" class="utopia-widget-icon">
                            <span>Ajouter un constat</span>
                        </div>

                        <div class="row-fluid">
                            <div class="utopia-widget-content">
                                <div class="span12 utopia-form-freeSpace">
                                    <form id="newClientForm" class="form-horizontal"
                                    action="${pageContext.request.contextPath}/observations/create.json"
									commandName="client">
									<input type="hidden" value="${id}" id="userId" name="userId"> 
                                        <fieldset>
                                            <div class="control-group">
                                                <label class="control-label" for="clientId">Client</label>

                                                <div class="controls">
                                                    <select id="clientId" name="clientId" class="span6">
                                                        <option> - </option>
                                                        <option value="1">Jeanne Calmant</option>
                                                        <option value="2">Louis Dupond</option>
                                                        <option value="3">Myriam Soulier</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="control-group ">
                                                <label class="control-label" for="statement">Avis</label>

                                                <div class="controls visible-desktop">
                                                    <textarea id="statement" name="statement"></textarea>
                                                </div>
												<div class="controls visible-tablet visible-phone">
                                                    <textarea id="statement" name="statement"></textarea>
                                                </div>
                                            </div>
                                            <div class="control-group ">
                                                <label class="control-label" for="comment">Commentaire</label>

                                                <div class="controls visible-desktop">
                                                    <textarea id="comment" name="comment"></textarea>
                                                </div>
												<div class="controls visible-tablet visible-phone">
                                                    <textarea name="comment"></textarea>
                                                </div>
                                            </div>
                                            
                                            <div class="control-group ">

                                                <div class="controls">
                                                    <button class="btn btn-success span3" href="javascript:void(0)">Ajouter</button>
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
<script type="text/javascript" src="<c:url value="/resources/assets/js/jquery.cleditor.js" />"></script>
        <script type="text/javascript">
            $(document).ready(function() {
            $.cleditor.defaultOptions.width = '';
            $.cleditor.defaultOptions.height = '250';
            $("#statement").cleditor();
            $("#comment").cleditor();
            });
        </script>
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

											var userId = $('#userId').val();
											var clientId = $('#clientId').val();
											var statement = $('#statement')
													.val();
											var comment = $('#comment').val();

											var json = {
												"userId" : userId,
												"clientId" : clientId,
												"statement" : statement,
												"comment" : comment
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
														success : function(observation) {
															var respContent = "<div class='alert alert-success'><a class='close' data-dismiss='alert' href='#'>×</a><div class='error'>";
															respContent += "le nouveau <strong>Constat</strong> est bien ajouté : [";
															respContent += observation.id+"]</div></div>";

															$("#clientFromResponse").html(respContent);
															sleep(2000);
															window.location='/observations';
														}

													});

											event.preventDefault();
										});

					});
</script>
    </body>
</html>
