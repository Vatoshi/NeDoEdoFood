<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ВкусЕда - Вход в аккаунт</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            background-color: #f8f8f8;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-image: url('https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
            background-size: cover;
            background-position: center;
        }

        .login-container {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        .logo {
            text-align: center;
            margin-bottom: 30px;
        }

        .logo h1 {
            color: #ff6b6b;
            font-size: 28px;
            font-weight: 700;
        }

        .logo p {
            color: #666;
            font-size: 14px;
            margin-top: 5px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-size: 14px;
        }

        .form-group input {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            transition: border 0.3s;
        }

        .form-group input:focus {
            border-color: #ff6b6b;
            outline: none;
        }

        .remember-forgot {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            font-size: 14px;
        }

        .remember-me {
            display: flex;
            align-items: center;
        }

        .remember-me input {
            margin-right: 5px;
        }

        .forgot-password a {
            color: #ff6b6b;
            text-decoration: none;
        }

        .login-button {
            width: 100%;
            padding: 12px;
            background-color: #ff6b6b;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .login-button:hover {
            background-color: #ff5252;
        }

        .register-link {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
        }

        .register-link a {
            color: #ff6b6b;
            text-decoration: none;
            font-weight: 600;
        }

        .social-login {
            margin-top: 30px;
            text-align: center;
        }

        .social-login p {
            color: #666;
            font-size: 14px;
            margin-bottom: 15px;
            position: relative;
        }

        .social-login p::before,
        .social-login p::after {
            content: "";
            position: absolute;
            top: 50%;
            width: 30%;
            height: 1px;
            background-color: #ddd;
        }

        .social-login p::before {
            left: 0;
        }

        .social-login p::after {
            right: 0;
        }

        .social-icons {
            display: flex;
            justify-content: center;
            gap: 15px;
        }

        .social-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: transform 0.3s;
        }

        .social-icon:hover {
            transform: translateY(-3px);
        }

        .google {
            background-color: #db4437;
            color: white;
        }

        .facebook {
            background-color: #4267B2;
            color: white;
        }

        .apple {
            background-color: #000;
            color: white;
        }
    </style>
</head>
<body>
<div class="login-container">
    <div class="logo">
        <h1>ВкусЕда</h1>
        <p>Войдите, чтобы продолжить</p>
    </div>

    <form>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" placeholder="Ваш email" required>
        </div>

        <div class="form-group">
            <label for="password">Пароль</label>
            <input type="password" id="password" placeholder="Ваш пароль" required>
        </div>

        <div class="remember-forgot">
            <div class="remember-me">
                <input type="checkbox" id="remember">
                <label for="remember">Запомнить меня</label>
            </div>
            <div class="forgot-password">
                <a href="#">Забыли пароль?</a>
            </div>
        </div>

        <button type="submit" class="login-button">Войти</button>
    </form>

    <div class="register-link">
        Ещё нет аккаунта? <a href="#">Зарегистрироваться</a>
    </div>

    <div class="social-login">
        <p>Или войдите через</p>
        <div class="social-icons">
            <div class="social-icon google">
                <i class="fab fa-google"></i>
            </div>
            <div class="social-icon facebook">
                <i class="fab fa-facebook-f"></i>
            </div>
            <div class="social-icon apple">
                <i class="fab fa-apple"></i>
            </div>
        </div>
    </div>
</div>

<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</body>
</html>