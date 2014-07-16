		<div class="span2 sidebar-container">

            <div class="sidebar">

                <div class="navbar sidebar-toggle">
                    <div class="container">

                        <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </a>

                    </div>
                </div>

                <div class="nav-collapse collapse leftmenu">

                    <ul>
                        <li class="current"><a class="dashboard smronju" href="${pageContext.request.contextPath}/success-login" title="Dashboard"><span>Tableau de bord</span></a></li>
                        <li><a class="users" href="${pageContext.request.contextPath}/clients" title="Clients"><span>Clients</span></a>
                        <li><a class="tables" href="${pageContext.request.contextPath}/observations" title="Observations"><span>Constats</span></a>
                        <li><a class="tables" href="${pageContext.request.contextPath}/medias" title="Pictures"><span>Médias</span></a>
                    </ul>
                    <security:authorize access="hasRole('ROLE_ADMIN')">
                    <ul style="margin-top:10px">
                        <li><a class="users" href="${pageContext.request.contextPath}/users" title="Baillifs"><span>Utilisateurs</span></a>      
                    </ul>
                    <ul style="margin-top:10px">
                        <li><a class="tables" href="${pageContext.request.contextPath}/pages/help" title="How is working d"><span>Help</span></a>
                    </ul>
                    </security:authorize>

                </div>

            </div>
        </div>