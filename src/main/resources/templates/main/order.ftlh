<#import "../layout.ftlh" as main>
<@main.layout>
    <div class="ndf-cart-container">
        <h1 class="ndf-cart-title">Ваши заказы</h1>

        <#if orders?has_content>
            <#list orders as order>
                <div class="ndf-cart-item">
                    <div class="ndf-item-details" style="width: 100%;">
                        <h3 class="ndf-item-title">Заказ от ${order.orderDate}</h3>
                        <div class="ndf-item-description">
                            <ul>
                                <#list order.dishes as dish>
                                    <li>
                                        <b>${dish.name}</b> — ${dish.quantity} шт. × ${dish.price} ₽
                                    </li>
                                </#list>
                            </ul>
                        </div>
                        <div class="ndf-item-footer">
                            <span class="ndf-item-price">Итого: ${order.price} ₽</span>
                        </div>
                    </div>
                </div>
            </#list>
        <#else>
            <div class="ndf-empty-cart">
                <h2>У вас пока нет заказов 🧾</h2>
                <p>Сделайте заказ из меню и он появится здесь.</p>
                <a href="/" class="ndf-back-btn">Перейти к меню</a>
            </div>
        </#if>
    </div>
</@main.layout>

<style>
    .ndf-cart-container {
        width: 100%;
        max-width: 800px;
        margin: 60px auto 40px;
        padding: 20px;
        font-family: 'Roboto', sans-serif;
        border-radius: 15px;
    }

    .ndf-cart-title {
        font-size: 32px;
        font-weight: 600;
        text-align: center;
        margin-bottom: 40px;
        color: #34495e;
    }

    .ndf-cart-item {
        background: #ffffff;
        border-radius: 15px;
        padding: 20px;
        margin-bottom: 25px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
        display: flex;
        gap: 20px;
        align-items: center;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .ndf-cart-item:hover {
        transform: translateY(-3px);
        box-shadow: 0 3px 9px rgba(0, 0, 0, 0.12);
    }

    .ndf-item-details {
        flex-grow: 1;
    }

    .ndf-item-title {
        font-size: 20px;
        font-weight: 500;
        margin: 0 0 12px;
        color: #2c3e50;
    }

    .ndf-item-description {
        font-size: 15px;
        color: #7f8c8d;
        margin: 0 0 15px;
    }

    .ndf-item-footer {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .ndf-item-price {
        font-weight: 600;
        font-size: 18px;
        color: #27ae60;
    }

    .ndf-empty-cart {
        text-align: center;
        padding: 100px 30px;
        background: #f0f8ff;
        border-radius: 15px;
        margin-top: 40px;
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
    }

    .ndf-empty-cart h2 {
        font-size: 26px;
        color: #555;
        margin-bottom: 10px;
    }

    .ndf-empty-cart p {
        font-size: 18px;
        color: #888;
        margin-bottom: 20px;
    }

    .ndf-back-btn {
        display: inline-block;
        padding: 12px 25px;
        background: #ff7043;
        color: white;
        border-radius: 8px;
        text-decoration: none;
        transition: background 0.3s ease;
        font-weight: 500;
    }

    .ndf-back-btn:hover {
        background: #ff5733;
    }

    @media (max-width: 600px) {
        .ndf-cart-item {
            flex-direction: column;
            align-items: flex-start;
        }

        .ndf-item-footer {
            flex-direction: column;
            align-items: flex-start;
            gap: 15px;
        }

        .ndf-quantity-controls {
            align-self: flex-start;
        }
    }
</style>
