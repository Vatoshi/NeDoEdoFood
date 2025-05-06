<#import "../layout.ftlh" as main>
<@main.layout>
    <div class="ndf-cart-container">
        <h1 class="ndf-cart-title">Ваша корзина</h1>

        <#if carts?has_content>
            <#list carts as cart>
                <div class="ndf-cart-item">
                    <div class="ndf-item-image" style="background-image: url('${cart.photo}')">
                    </div>
                    <div class="ndf-item-details">
                        <h3 class="ndf-item-title">${cart.name}</h3>
                        <p class="ndf-item-description">${cart.description}</p>
                        <div class="ndf-item-footer">
                            <div class="ndf-quantity-controls">
                                <form action="/user/move" method="post" style="display: inline">
                                    <#if _csrf??>
                                        <input type="hidden" name="${(_csrf.parameterName)!'csrf-param-name'}"
                                               value="${(_csrf.token)!'csrf-token'}"/>
                                    </#if>
                                    <input type="hidden" name="id" value="${cart.id}">
                                    <input type="hidden" name="move" value="minus">
                                    <button type="submit" class="ndf-quantity-btn ndf-decrease" <#if cart.quantity == 1>disabled</#if>>-</button>
                                </form>

                                <input disabled value="${cart.quantity}" min="1" class="ndf-quantity-input">

                                <form action="/user/move" method="post" style="display: inline">
                                    <#if _csrf??>
                                        <input type="hidden" name="${(_csrf.parameterName)!'csrf-param-name'}"
                                               value="${(_csrf.token)!'csrf-token'}"/>
                                    </#if>
                                    <input type="hidden" name="id" value="${cart.id}">
                                    <input type="hidden" name="move" value="plus">
                                    <button type="submit" class="ndf-quantity-btn ndf-increase">+</button>
                                </form>
                            </div>
                            <form action="/user/move" method="post" style="display: inline">
                                <#if _csrf??>
                                    <input type="hidden" name="${(_csrf.parameterName)!'csrf-param-name'}"
                                           value="${(_csrf.token)!'csrf-token'}"/>
                                </#if>
                                <span class="ndf-item-price">${cart.price} ₽</span>
                                <input type="hidden" name="id" value="${cart.id}">
                                <input type="hidden" name="move" value="delete">
                                <button type="submit" class="ndf-remove-btn">Удалить</button>
                            </form>
                        </div>
                    </div>
                </div>
            </#list>

        <div class="ndf-cart-total">
            Итого: <span id="ndf-total-price">${total} ₽</span>
        </div>
        <form action="/user/createOrder" method="post">
            <#if _csrf??>
                <input type="hidden" name="${(_csrf.parameterName)!'csrf-param-name'}"
                       value="${(_csrf.token)!'csrf-token'}"/>
            </#if>
        <button class="ndf-checkout-btn">Оформить заказ</button>
        </form>
    </div>

    <#else>

    <div class="ndf-empty-cart">
        <h2>Похоже, ваша корзина пуста 🛒</h2>
        <p>Добавьте блюда, чтобы оформить заказ.</p>
        <a href="/" class="ndf-back-btn">Вернуться к меню</a>
    </div>
    </#if>

    <style>
        .ndf-cart-container {
            width: 100%;
            max-width: 800px;
            margin: 80px auto 40px;
            padding: 0 20px;
            font-family:system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;"
        }

        .ndf-cart-title {
            font-size: 28px;
            font-weight: 600;
            text-align: center;
            margin-bottom: 30px;
            color: #2c3e50;
            font-family:system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;"
        }

        .ndf-cart-item {
            background: #fff;
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
            display: flex;
            gap: 20px;
            align-items: center;
        }

        .ndf-item-image {
            width: 100px;
            height: 100px;
            border-radius: 8px;
            background-size: cover;
            background-position: center;
            flex-shrink: 0;
        }

        .ndf-item-details {
            flex-grow: 1;
        }

        .ndf-item-title {
            font-size: 18px;
            font-weight: 500;
            margin: 0 0 8px;
            color: #2c3e50;
            font-family:system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;"
        }

        .ndf-item-description {
            font-size: 14px;
            color: #7f8c8d;
            margin: 0 0 15px;
            font-family:system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;"
        }

        .ndf-item-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .ndf-quantity-controls {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .ndf-quantity-btn {
            width: 30px;
            height: 30px;
            background: #f1f1f1;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: background 0.2s;
            font-family:system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;"
        }

        .ndf-quantity-btn:hover {
            background: #e0e0e0;
        }

        .ndf-quantity-input {
            width: 40px;
            text-align: center;
            padding: 5px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 15px;
        }

        .ndf-item-price {
            font-weight: 600;
            font-size: 17px;
            color: #2c3e50;
        }

        .ndf-remove-btn {
            background: none;
            border: none;
            color: #e74c3c;
            font-size: 14px;
            cursor: pointer;
            padding: 5px 10px;
            border-radius: 4px;
            transition: background 0.2s;
            text-decoration: none;
            font-family:system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;"
        }

        .ndf-remove-btn:hover {
            background: #fdedec;
        }

        .ndf-cart-total {
            text-align: right;
            font-size: 20px;
            font-weight: 600;
            margin: 30px 0;
            color: #2c3e50;
        }

        .ndf-checkout-btn {
            display: block;
            width: 100%;
            padding: 14px;
            background: #ff7043;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background 0.2s;
        }

        .ndf-checkout-btn:hover {
            background: #ff5745;
        }

        .ndf-empty-cart {
            text-align: center;
            padding: 100px 30px;
            background: #fffaf0;
            border-radius: 12px;
            margin-top: 40px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.05);
        }

        .ndf-empty-cart h2 {
            font-size: 24px;
            color: #555;
            margin-bottom: 10px;
        }

        .ndf-empty-cart p {
            font-size: 16px;
            color: #888;
            margin-bottom: 20px;
        }

        .ndf-back-btn {
            display: inline-block;
            padding: 10px 20px;
            background: #ff7043;
            color: white;
            border-radius: 6px;
            text-decoration: none;
            transition: background 0.2s;
        }

        .ndf-back-btn:hover {
            background: #ff5745;
        }


        @media (max-width: 600px) {
            .ndf-cart-item {
                flex-direction: column;
                align-items: flex-start;
            }

            .ndf-item-image {
                width: 100%;
                height: 150px;
            }

            .ndf-item-footer {
                width: 100%;
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }

            .ndf-quantity-controls {
                align-self: flex-start;
            }


        }
    </style>

    <script>
        window.addEventListener('load', function () {
            const scrollPosition = localStorage.getItem('scrollPosition');
            if (scrollPosition) {
                window.scrollTo(0, scrollPosition);
            }
        });

        window.addEventListener('scroll', function () {
            const scrollPosition = window.scrollY;
            localStorage.setItem('scrollPosition', scrollPosition);
        });
    </script>
</@main.layout>