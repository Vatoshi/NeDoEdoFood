<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Навигация</title>
    <style>
        * {
            margin: 0;
        }

        .ndf-reset * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        .ndf-body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
        }

        .ndf-header {
            background-color: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .ndf-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .ndf-header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            height: 60px
        }

        .ndf-logo {
            font-size: 24px;
            font-weight: 600;
            color: #ff6b6b;
        }

        .ndf-logo span {
            color: #333;
        }

        .ndf-nav ul {
            display: flex;
            list-style: none;
        }

        .ndf-nav ul li {
            margin-left: 25px;
        }

        .ndf-nav ul li a {
            text-decoration: none;
            color: #333;
            font-weight: 500;
            transition: color 0.3s;
            font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .ndf-nav ul li a:hover {
            color: #ff6b6b;
        }

        .ndf-auth-buttons a {
            margin-left: 15px;
            text-decoration: none;
            padding: 8px 15px;
            border-radius: 5px;
            font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            font-weight: 500;
        }

        .ndf-login-btn {
            color: #333;
        }

        .ndf-register-btn {
            background-color: #ff6b6b;
            color: white;
        }

        @media (max-width: 768px) {
            .ndf-header-content {
                flex-direction: column;
                align-items: flex-start;
            }

            .ndf-nav ul {
                flex-direction: column;
                margin-top: 10px;
            }

            .ndf-nav ul li {
                margin: 10px 0;
            }

            .ndf-auth-buttons {
                margin-top: 10px;
            }
        }

        .ndf-icon-btn {
            margin-left: 15px;
            color: #333;
            background-color: #fff;
            padding: 10px;
            border-radius: 50%;
            transition: transform 0.2s ease, background-color 0.3s ease, color 0.3s ease;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            font-size: 18px;
            text-decoration: none;
        }

        .ndf-icon-btn:hover {
            transform: scale(1.1);
            background-color: #ff6b6b;
            color: #fff;
        }

    </style>
</head>

<div class="ndf-body">
    <div class="ndf-reset">
        <header class="ndf-header">
            <div class="ndf-container">
                <div class="ndf-header-content">
                    <div class="ndf-logo">NeDo<span>EdoFood</span></div>

                    <nav class="ndf-nav">
                        <ul>
                            <li><a href="#">Главная</a></li>
                            <li><a href="#">Рестораны</a></li>
                            <li><a href="#">Акции</a></li>
                            <li><a href="#">Контакты</a></li>
                        </ul>
                    </nav>

                    <#if user??>

                        <div class="ndf-auth-buttons">
                            <a href="#" class="ndf-icon-btn" title="Корзина">
                                <i class="fa-solid fa-cart-shopping"></i>
                            </a>
                            <a href="#" class="ndf-icon-btn" title="Заказы">
                                <i class="fa-solid fa-box-archive"></i>
                            </a>
                            <a href="#" class="ndf-icon-btn" title="Профиль">
                                <i class="fa-solid fa-user"></i>
                            </a>
                        </div>

                    <#else>

                    <div class="ndf-auth-buttons">
                        <a href="#" class="ndf-login-btn">Войти</a>
                        <a href="#" class="ndf-register-btn">Регистрация</a>
                    </div>

                    </#if>

                </div>
            </div>
        </header>
    </div>
</div>


</html>
