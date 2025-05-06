<#import "../layout.ftlh" as main>
<@main.layout>
    <div class="profile-container">
        <h1 class="profile-title">Мой профиль</h1>

        <div class="profile-details">
            <div class="profile-item">
                <span class="profile-label">Имя:</span>
                <span class="profile-value">${us.name}</span>
            </div>
            <div class="profile-item">
                <span class="profile-label">Email:</span>
                <span class="profile-value">${us.email}</span>
            </div>
            <div class="profile-item">
                <span class="profile-label">Телефон:</span>
                <span class="profile-value">${us.phoneNumber}</span>
            </div>
        </div>

        <div class="profile-actions">
            <a href="/" class="profile-edit-btn">На главную</a>
        </div>
    </div>

    <style>
        .profile-container {
            width: 100%;
            max-width: 500px;
            margin: 80px auto;
            padding: 20px;
            font-family: 'Arial', sans-serif;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        .profile-title {
            font-size: 24px;
            font-weight: 600;
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .profile-details {
            margin-bottom: 20px;
        }

        .profile-item {
            margin-bottom: 12px;
            display: flex;
            justify-content: space-between;
            font-size: 16px;
        }

        .profile-label {
            color: #888;
        }

        .profile-value {
            color: #333;
        }

        .profile-actions {
            text-align: center;
        }

        .profile-edit-btn {
            padding: 8px 16px;
            background: #FF7043;
            color: white;
            border-radius: 4px;
            text-decoration: none;
            font-size: 14px;
            transition: background 0.2s ease;
        }

        .profile-edit-btn:hover {
            background: #e64a19;
        }
    </style>
</@main.layout>
