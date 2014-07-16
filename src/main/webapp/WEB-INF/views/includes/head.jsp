	<div class="row-fluid">
        <div class="span12">

            <div class="header-top">

                <div class="header-wrapper">

                    <a href="#" class="utopia-logo"><img src="<c:url value="/resources/assets/img/logo.png" />" alt=""></a>

                    <div class="header-right">

                        <div class="header-divider">&nbsp;</div>
						
			<div class="visible-phone header-divider">
                                <a href="${pageContext.request.contextPath}/medias/new-media.html"><img src="<c:url value="/resources/assets/img/icons/camera.png" />" alt=""></a>
                                
                        </div>
                        
                        <div class="search-panel header-divider visible-desktop">
                            <div class="search-box">
                                <img src="<c:url value="/resources/assets/img/icons/zoom.png" />" alt="Search">
                                <form action="" method="post">
                                    <input type="text" name="search" placeholder="Recherche"/>
                                </form>
                            </div>
                        </div>

                        <div class="user-panel header-divider">
                            <div class="user-info">
                                <img src="<c:url value="/resources/assets/img/icons/user.png" />" alt="">
                                <a href="#">${firstName} ${lastName}</a>
                            </div>

                            <div class="user-dropbox">
                                <ul>
                                    <li class="user"><a href="${pageContext.request.contextPath}/users/edit/${id}.html">Profile</a></li>
                                    <li class="logout"><a href="<c:url value="/j_spring_security_logout" />">Déconnexion</a></li>
                                </ul>
                            </div>

                        </div><!-- User panel end -->

                    </div><!-- End header right -->

                </div><!-- End header wrapper -->

            </div><!-- End header -->

        </div>

    </div>