<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <title>{% if pageHeader is defined %}{{ pageHeader }} :: {% endif %}{{ config.game.title }}</title>

    <script type="text/javascript">
        var translate = {
            'notify-expiry_one': '{{ t['notify-expiry_one'] }}',
            'action_expiry': '{{ t['game-location_end_action'] }}'
        };
    </script>

    {{ stylesheet_link("scripts/bootstrap/css/bootstrap.min.css") }}
    {{ stylesheet_link("css/font-awesome.min.css") }}

    {{ stylesheet_link("templates/game/fenix/style.css") }}
    {{ stylesheet_link("scripts/jquery.alerts/jquery.alerts.css") }}
    {{ stylesheet_link("scripts/jquery.ui/jquery.ui.min.css") }}

    <style>
        .navbar-default .navbar-nav>li>a {
            color: #f0e6d9;
            padding: 15px 0;
        }
        .navbar-default .navbar-nav>li>a:hover {
            color: #f0e6d9;
        }
        {% if config.game.template_bg is defined and config.game.template_bg|length > 6 %}
        .navbar-default {
            margin-bottom: 0;
        }
        .mainpage-header {
            background-image: url({{ config.game.template_bg }});
            background-repeat: no-repeat;
            background-position: center center;
            height: 300px;
            width: 100%;
        }
        {% endif %}
    </style>

    {{ javascript_include("scripts/jquery-2.1.1.min.js") }}
    {{ javascript_include("scripts/jquery.ui/jquery-ui.min.js") }}
    {{ javascript_include("scripts/jquery.transit.min.js") }}
    {{ javascript_include("scripts/jquery.timer.js") }}
    {{ javascript_include("scripts/bootstrap/js/bootstrap.min.js") }}
    {{ javascript_include("scripts/datatables/media/js/jquery.dataTables.min.js") }}
    {{ javascript_include("templates/admin/plugins/datatables/dataTables.bootstrap.min.js") }}
    {{ javascript_include("scripts/jquery-migrate-1.2.1.js") }}
    {{ javascript_include("scripts/jquery.alerts/jquery.alerts.js") }}
    {{ javascript_include("scripts/jquery.ajaxq.js") }}
    {{ javascript_include("scripts/jsrender.min.js") }}
    {{ javascript_include("scripts/sceditor/jquery.sceditor.bbcode.min.js") }}

    {{ javascript_include("templates/game/fenix/mainpage.js") }}

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="wrapper" id="wrapper">
    <nav class="navbar navbar-default">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="/">
                    {{ config.game.title }}
                </a>
            </div>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="/session/signup">
                        {{ t['form-registerform'] }}
                    </a>
                </li>
            </ul>
        </div>
    </nav>
    <!-- Content Wrapper. Contains page content -->
    <div class="container">
        <div class="row">
            {% if config.game.template_bg is defined %}
                <div class="col-lg-12 mainpage-header">

                </div>
            {% endif %}
            <div class="col-lg-4 mainpage-content">
                {% if auth === false %}
                    {{ form('class': 'form-horizontal', 'id': 'login-form', 'action': 'session/login') }}
                    <fieldset>
                        <!-- Form Name -->
                        <legend>{{ t['form-loginform'] }}</legend>

                        <!-- Prepended text-->
                        <div class="form-group">
                            <div class="col-md-12">
                                <div class="input-group">
                                    <label><span
                                                class="glyphicon glyphicon-envelope"></span> {{ t['form-email'] }}</label>
                                    {{ forms.get('login').render('email', ['class': 'form-control', 'placeholder': t['form-write_email']]) }}
                                </div>

                            </div>
                        </div>

                        <!-- Prepended text-->
                        <div class="form-group">
                            <div class="col-md-12">
                                <div class="input-group">
                                    <label><span
                                                class="fa fa-minus-circle"></span> {{ t['form-password'] }}</label>
                                    {{ forms.get('login').render('password', ['class': 'form-control', 'placeholder': t['form-write_password']]) }}
                                </div>

                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <div class="checkbox">
                                    <label>
                                        {{ forms.get('login').render('remember') }} {{ t['form-remember'] }}
                                    </label>
                                </div>
                            </div>
                        </div>

                        <!-- Button -->
                        <div class="form-group">
                            <div class="col-md-12">
                                {{ forms.get('login').render(t['form-login']) }}
                            </div>
                        </div>
                        {{ forms.get('login').render('csrf', ['value': csrfToken]) }}

                    </fieldset>
                    </form>
                    <p style="text-align: center; cursor: pointer;" id="showResendPassForm">Nie pamiętasz hasła?</p>

                    <div id="resendPassForm" class="col-sm-12">
                        {{ form('class': 'form-horizontal', 'id': 'resendpass-form', 'action': 'session/forgot-password') }}
                        <!-- Prepended text-->
                        <div class="form-group">
                            <div class="col-md-12">
                                <div class="input-group">
                                    <label><span
                                                class="glyphicon glyphicon-envelope"></span> {{ t['form-email'] }}</label>
                                    {{ forms.get('forgotpassword').render('email', ['class': 'form-control', 'placeholder': t['form-write_email']]) }}
                                </div>

                            </div>
                        </div>
                        <!-- Button -->
                        <div class="form-group">
                            <label class="col-md-12 control-label" for="singlebutton"></label>

                            <div class="col-md-12">
                                {{ forms.get('forgotpassword').render(t['send']) }}
                            </div>
                        </div>
                        {{ forms.get('forgotpassword').render('csrf', ['value': csrfToken]) }}
                        </form>
                    </div>

                {% else %}
                    <a href="/play" class="btn" style="margin-top: 20px;">Wejdź do gry</a>

                    <a href="/session/logout" class="btn" style="margin-top: 20px;">{{ t['log-out'] }}</a>
                {% endif %}
            </div>
            <div class="col-lg-8 mainpage-content">
                {{ flash.output() }}
                {{ content() }}
            </div>
        </div>
    </div>
    <!-- /.content-wrapper -->

    <!-- Main Footer -->
    <footer class="main-footer">
        <!-- Default to the left -->
        <div style="color: #9acfea; text-align: center; margin-bottom: 20px;">
            <p>Copyright © <script type="text/javascript">document.write(new Date().getFullYear())</script> <a href="https://hexengine.pl/">Hexen Engine Team</a> All rights reserved.</p>
            <p>Engine ver.: {{ config.game.engineVer }}{% if auth['group'] == 'Admin' %} - <a href="/admin">Panel Administratora</a>{% endif %}</p>
            <p>Czas ładowania strony: {{ scriptTime }}</p>
        </div>

    </footer>
</div>
<!-- ./wrapper -->
</body>
</html>
