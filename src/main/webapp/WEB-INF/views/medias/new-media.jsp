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

    <link href="<c:url value="/resources/assets/css/ie.css" />" rel="stylesheet"/>


        <link href="<c:url value="/resources/assets/css/gallery/wookmark.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/assets/css/gallery/adipoli.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/assets/css/gallery/jquery.fileupload-ui.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/assets/css/gallery/colorbox.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/assets/css/gallery/modal.css" />" rel="stylesheet">



<script type="text/javascript" src="<c:url value="/resources/assets/js/jquery.min.js" />"></script>


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
                                    <a href="#">Medias</a> <span class="divider">/</span>
                                </li>
                                <li>
                                    Nouveau
                                </li>
                            </ul>
                        </div>
                    </div>

                    <section id="formElement" class="utopia-widget utopia-form-box section">
                        <div class="utopia-widget-title">
                            <img src="<c:url value="/resources/assets/img/icons2/software24.png" />" class="utopia-widget-icon">
                            <span>Ajouter des images</span>
                        </div>

                        <div class="row-fluid">
                            <div class="utopia-widget-content">
                                <div class="span12 utopia-form-freeSpace">
                                    <form class="form-horizontal" id="newMediasForm"
                                    action="${pageContext.request.contextPath}/medias/create.json"
									commandName="fileMeta">
                                        <fieldset>
                                            <div class="control-group">
                                                <label class="control-label" for="observationId">Constat</label>

                                                <div class="controls">
                                                    <select id="observationId" name="observationId" class="span6">
                                                        <option> - </option>
                                                        <option value="1">Jeanne Calmant</option>
                                                        <option value="2">Louis Dupond</option>
                                                        <option value="3">Myriam Soulier</option>
                                                    </select>
                                                </div>
                                            </div>
                                           
                                            <div class="control-group ">

                                                <div class="controls">
                                                    <section class="utopia-widget">
                                                        <div class="utopia-widget-title">
                                                            <img src="../assets/img/icons/upload2.png" class="utopia-widget-icon">
                                                            <span>Ajouter des images</span>
                                                        </div>

                                                        <div class="utopia-widget-content">


                                                            <!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
                                                            <div class="fileupload-buttonbar">

                                                                <div class="span12">
                                                                    <!-- The fileinput-button span is used to style the file input field as button -->
                                                                    <span class="btn btn-warning fileinput-button">
                                                                        <i class="icon-plus icon-white"></i>
                                                                        <span>Ajouter images...</span>
                                                                        <input type="file" id="fileupload" multiple="" name="files[]">
                                                                    </span>

                                                                </div>

                                                            </div>
                                                            <!-- The loading indicator is shown during file processing -->
                                                            <div class="fileupload-loading"></div>
                                                            <br>
                                                            <!-- The table listing the files available for upload/download -->
                                                            <table class="table table-striped" id="utopia-image-upload">
                                                                <tbody data-target="#modal-gallery" data-toggle="modal-gallery" class="files"></tbody>
                                                            </table>


                                                            
                                                            <!-- The template to display files available for upload -->
                                                            <script id="template-upload" type="text/x-tmpl">

                                                                {% for (var i=0, file; file=o.files[i]; i++) { var name = file.name.substring(0, 5); %}
                                                                <tr class="template-upload fade">
                                                                <td class="preview"><span class="fade"></span></td>
                                                                <td class="name"><span>{%=name%}</span></td>
                                                                <td class="size"><span>{%=o.formatFileSize(file.size)%}</span></td>
                                                                {% if (file.error) { %}
                                                                <td class="error" colspan="2"><span
                                                                class="label label-important">{%=locale.fileupload.error%}</span>
                                                                {%=locale.fileupload.errors[file.error] || file.error%}
                                                                </td>
                                                                {% } else { %}
                                                                <td colspan="2"></td>
                                                                {% } %}
                                                                <td class="cancel" id="utopia-upload-cancel">{% if (!i) { %}
                                                                <button class="btn btn-warning">
                                                                <i class="icon-ban-circle icon-white"></i>
                                                                <span>{%=locale.fileupload.cancel%}</span>
                                                                </button>
                                                                {% } %}
                                                                </td>
                                                                </tr>
                                                                {% } %}
                                                            </script>
                                                            <!-- The template to display files available for download -->
                                                            <script id="template-download" type="text/x-tmpl">
                                                                {% for (var i=0, file; file=o.files[i]; i++) { var name = file.name.substring(0, 5); %}
                                                                <tr class="template-upload fade">
                                                                <td class="preview"><span class="fade"></span></td>
                                                                <td class="name"><span>{%=name%}</span></td>
                                                                <td class="size"><span>{%=o.formatFileSize(file.size)%}</span></td>
                                                                {% if (file.error) { %}
                                                                <td class="error" colspan="2"><span
                                                                class="label label-important">{%=locale.fileupload.error%}</span>
                                                                {%=locale.fileupload.errors[file.error] || file.error%}
                                                                </td>
                                                                {% } else { %}
                                                                <td colspan="2"></td>
                                                                {% } %}
                                                                <td class="cancel" id="utopia-upload-cancel">{% if (!i) { %}
                                                                <button class="btn btn-warning">
                                                                <i class="icon-ban-circle icon-white"></i>
                                                                <span>{%=locale.fileupload.cancel%}</span>
                                                                </button>
                                                                {% } %}
                                                                </td>
                                                                </tr>
                                                                {% } %}
                                                            </script>
                                                        </div>
                                                    </section>
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

                </div>
                <!-- Body end -->
            </div>

            <!-- Maincontent end -->

        </div> <!-- end of container -->

        <!-- javascript placed at the end of the document so the pages load faster -->

        <!-- javascript placed at the end of the document so the pages load faster -->
<script type="text/javascript" src="<c:url value="/resources/assets/js/utopia.js" />"></script>


        <script type="text/javascript" src="<c:url value="/resources/assets/js/jquery.wookmark.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/assets/js/jquery.wookmark.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/assets/js/jquery.infinitescroll.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/assets/js/jquery.adipoli.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/assets/js/jquery.adipoli.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/assets/js/jquery.colorbox-min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/assets/js/jquery.colorbox.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/assets/js/jquery.ui.widget.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/assets/js/upload/tmpl.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/assets/js/upload/load-image.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/assets/js/upload/canvas-to-blob.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/assets/js/upload/image-gallery.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/assets/js/upload/jquery.iframe-transport.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/assets/js/upload/jquery.fileupload.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/assets/js/upload/jquery.fileupload-fp.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/assets/js/upload/jquery.fileupload-ui.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/assets/js/upload/locale.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/assets/js/upload/main.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/assets/js/header.js?v1" />"></script>
<script type="text/javascript" src="<c:url value="/resources/assets/js/sidebar.js" />"></script>

        <script type="text/javascript">
            $(document).ready(function() {

            // Full Fluid Gallery Starts

            $('#utopia-tiles li').wookmark({
            container: $('#utopia-woomarks'),
            offset: 10,
            itemWidth: 160,
            autoResize: true

            });

            $(window).trigger("resize");

            // Fix Effect Gallery Starts

            $('.utopia-hover-adipoli').adipoli({
            'startEffect': 'overlay',
            'hoverEffect': 'foldLeft'
            });

            $(".utopia-colorbox3").colorbox({rel: 'utopia-colorbox3', width: '500px'});  // Colorbox for Full Fluid Gallery
            $(".utopia-colorbox4").colorbox({rel: 'utopia-colorbox4', width: '500px'});  // Colorbox for Fix Effect Gallery
			
            
            
            
            });


        </script>
        <script type="text/javascript">
	$(document)
			.ready(
					function() {

						$('#newMediasForm')
								.submit(
										function(event) {

											var observationId = $('#observationId').val();
											var files = $('#fileupload').get(0).files;
											$.each(files,function(i,file){
											var json = {"observationId" : observationId,"fileName" : file.name
													,"fileSize" : file.size,"fileType" : file.type};
											$.ajax({
												url : $('#newMediasForm').attr("action"),
												data : JSON.stringify(json),
												type : "POST",

												beforeSend : function(xhr) {
													xhr.setRequestHeader("Accept","application/json");
													xhr.setRequestHeader("Content-Type","application/json");
													$(".error").remove();
												}
											});
											});

											

											event.preventDefault();
										});

					});
</script>
    </body>
</html>
