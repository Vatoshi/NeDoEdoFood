<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NeDoEdoFood - Регистрация</title>
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
            background-image: url('https://images.unsplash.com/photo-1564890369478-c89ca6d9cde9');
            background-size: cover;
            background-position: center;
        }

        .register-container {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 450px;
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
            margin-bottom: 15px;
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

        .name-fields {
            display: flex;
            gap: 15px;
        }

        .name-fields .form-group {
            flex: 1;
        }

        .terms {
            display: flex;
            align-items: flex-start;
            margin-bottom: 20px;
            font-size: 14px;
        }

        .terms input {
            margin-right: 10px;
            margin-top: 3px;
        }

        .terms label {
            color: #666;
        }

        .terms a {
            color: #ff6b6b;
            text-decoration: none;
        }

        .register-button {
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
            margin-bottom: 20px;
        }

        .register-button:hover {
            background-color: #ff5252;
        }

        .login-link {
            text-align: center;
            font-size: 14px;
        }

        .login-link a {
            color: #ff6b6b;
            text-decoration: none;
            font-weight: 600;
        }

        .social-register {
            margin-top: 30px;
            text-align: center;
        }

        .social-register p {
            color: #666;
            font-size: 14px;
            margin-bottom: 15px;
            position: relative;
        }

        .social-register p::before,
        .social-register p::after {
            content: "";
            position: absolute;
            top: 50%;
            width: 30%;
            height: 1px;
            background-color: #ddd;
        }

        .social-register p::before {
            left: 0;
        }

        .social-register p::after {
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
<div class="register-container">
    <div class="logo">
        <h1>NeDoEdoFood</h1>
        <p>Создайте аккаунт</p>
    </div>

    <form>
        <div class="name-fields">
            <div class="form-group">
                <label for="first-name">Имя</label>
                <input type="text" id="first-name" placeholder="Ваше имя" required>
            </div>
            <div class="form-group">
                <label for="last-name">Номер телефона</label>
                <input type="text" id="last-name" placeholder="хххх-ххх-ххх" required>
            </div>
        </div>

        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" placeholder="Ваш email" required>
        </div>

        <div class="form-group">
            <label for="phone">Телефон</label>
            <input type="tel" id="phone" placeholder="Ваш телефон" required>
        </div>

        <div class="form-group">
            <label for="password">Пароль</label>
            <input type="password" id="password" placeholder="Придумайте пароль" required>
        </div>

        <div class="terms">
            <input type="checkbox" id="agree-terms" required>
            <label for="agree-terms">Я согласен с <a href="#">условиями использования</a> и <a href="#">политикой
                    конфиденциальности</a></label>
        </div>

        <button type="submit" class="register-button">Зарегистрироваться</button>
    </form>

    <div class="login-link">
        Уже есть аккаунт? <a href="#">Войти</a>
    </div>


</div>

<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</body>

</html>