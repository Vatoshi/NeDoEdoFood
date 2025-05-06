<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="UTF-8">
    <title>Перенаправление...</title>
    <meta http-equiv="refresh" content="3;URL=/">
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: "Segoe UI", Roboto, "Helvetica Neue", sans-serif;
            background-color: #f9f9f9;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .redirect-box {
            background: #ffffff;
            padding: 40px 30px;
            border-radius: 16px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.08);
            text-align: center;
            max-width: 420px;
            width: 90%;
            animation: fadeIn 0.6s ease;
        }

        .redirect-box h1 {
            font-size: 24px;
            color: #2c3e50;
            margin-bottom: 15px;
        }

        .redirect-box p {
            font-size: 16px;
            color: #666;
            margin-bottom: 25px;
        }

        .redirect-btn {
            display: inline-block;
            padding: 12px 24px;
            background: #ff7043;
            color: #fff;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            font-weight: 500;
            cursor: pointer;
            text-decoration: none;
            transition: background 0.3s;
        }

        .redirect-btn:hover {
            background: #ff5a30;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .countdown {
            font-weight: bold;
            color: #ff7043;
        }
    </style>
</head>

<body>
    <div class="redirect-box">
        <h1>Заказ прошел, перенаправление...</h1>
        <p>Вы будете автоматически перенаправлены <span id="countdown" class="countdown"></span></p>
    </div>

</body>

</html>
