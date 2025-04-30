<section class="hero">
    <div class="container">
        <div class="hero-content">
            <h1>Заказ еды для вас</h1>
            <p>Более 500 ресторанов на любой вкус и цвет</p>

            <div class="search-bar">
                <input type="text" placeholder="Введите адрес доставки...">
                <button>Найти</button>
            </div>
        </div>
    </div>
</section>

<section class="container">
    <h2 class="section-title">Категории</h2>

    <div class="categories">
        <div class="category-card">
            <i class="fas fa-hamburger"></i>
            <h3>Фастфуд</h3>
        </div>

        <div class="category-card">
            <i class="fas fa-pizza-slice"></i>
            <h3>Пицца</h3>
        </div>

        <div class="category-card">
            <i class="fas fa-fish"></i>
            <h3>Суши</h3>
        </div>

        <div class="category-card">
            <i class="fas fa-utensils"></i>
            <h3>Азиатская</h3>
        </div>

        <div class="category-card">
            <i class="fas fa-cheese"></i>
            <h3>Итальянская</h3>
        </div>

        <div class="category-card">
            <i class="fas fa-leaf"></i>
            <h3>Здоровая</h3>
        </div>

        <div class="category-card">
            <i class="fas fa-ice-cream"></i>
            <h3>Десерты</h3>
        </div>

        <div class="category-card">
            <i class="fas fa-coffee"></i>
            <h3>Напитки</h3>
        </div>
    </div>
</section>

<section class="container">
    <h2 class="section-title">Популярные заведения</h2>

    <div class="pagination">
        <a href="#" class="page-link">&laquo;</a>
        <a href="#" class="page-link active">1</a>
        <a href="#" class="page-link">2</a>
        <a href="#" class="page-link">3</a>
        <a href="#" class="page-link">&raquo;</a>
    </div>


    <div class="restaurants">


        <div class="restaurant-card">
            <div class="restaurant-img"
                 style="background-image: url('https://images.unsplash.com/photo-1615873968403-89e068629265?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');">
            </div>
            <div class="restaurant-info">
                <h3>McDonald's</h3>
                <div class="restaurant-meta">
                    <span class="rating">★★★★☆ 4.2</span>
                    <span>• Фастфуд • $$</span>
                </div>
                <p>Знаменитые бургеры, картофель фри и другие блюда быстрого питания</p>
                <a href="#" class="view-menu">Смотреть меню</a>
            </div>
        </div>

    </div>
</section>

<footer>
    <div class="container">
        <div class="footer-content">
            <div class="footer-column">
                <h3>FoodDelivery</h3>
                <p>Сервис доставки еды №1 в вашем городе. Более 500 (ага на деле от силы 10) ресторанов-партнеров.</p>
                <div class="social-links">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-youtube"></i></a>
                </div>
            </div>

            <div class="footer-column">
                <h3>Компания</h3>
                <ul>
                    <li><a href="#">О нас</a></li>
                    <li><a href="#">Карьера</a></li>
                    <li><a href="#">Блог</a></li>
                    <li><a href="#">Партнерам</a></li>
                </ul>
            </div>

            <div class="footer-column">
                <h3>Помощь</h3>
                <ul>
                    <li><a href="#">Центр поддержки</a></li>
                    <li><a href="#">Безопасность</a></li>
                    <li><a href="#">Контакты</a></li>
                    <li><a href="#">FAQ</a></li>
                </ul>
            </div>

            <div class="footer-column">
                <h3>Юридическая информация</h3>
                <ul>
                    <li><a href="#">Условия использования</a></li>
                    <li><a href="#">Политика конфиденциальности</a></li>
                    <li><a href="#">Пользовательское соглашение</a></li>
                    <li><a href="#">Возврат средств</a></li>
                </ul>
            </div>
        </div>

        <div class="copyright">
            &copy; 2025 NeDoEdoFood. Все права защищены.
        </div>
    </div>

      <style>
                       :root {
                           --primary: #ff6b6b;
                           --secondary: #ff8e8e;
                           --dark: #333;
                           --light: #f8f8f8;
                           --gray: #eee;
                           --text-gray: #777;
                       }

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
    background-color: var(--light);
    color: var(--dark);
}

header {
    background-color: white;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    position: sticky;
    top: 0;
    z-index: 100;
}

.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
}

.hero {
    background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
    background-size: cover;
    background-position: center;
    height: 400px;
    display: flex;
    align-items: center;
    color: white;
    text-align: center;
}

.hero-content {
    width: 100%;
}

.hero h1 {
    font-size: 48px;
    margin-bottom: 20px;
}

.hero p {
    font-size: 20px;
    margin-bottom: 30px;
}

.search-bar {
    max-width: 600px;
    margin: 0 auto;
    position: relative;
}

.search-bar input {
    width: 100%;
    padding: 15px 20px;
    border-radius: 50px;
    border: none;
    font-size: 16px;
}

.search-bar button {
    position: absolute;
    right: 5px;
    top: 5px;
    background-color: var(--primary);
    color: white;
    border: none;
    border-radius: 50px;
    padding: 10px 20px;
    cursor: pointer;
}

.section-title {
    text-align: center;
    margin: 50px 0 30px;
    font-size: 32px;
}

.categories {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
    gap: 20px;
    margin-bottom: 50px;
}

.category-card {
    background-color: white;
    border-radius: 10px;
    padding: 20px;
    text-align: center;
    box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s;
    cursor: pointer;
}

.category-card:hover {
    transform: translateY(-5px);
}

.category-card i {
    font-size: 30px;
    color: var(--primary);
    margin-bottom: 10px;
}

.restaurants {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 30px;
    margin-bottom: 50px;
}

.restaurant-card {
    background-color: white;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s;
}

.restaurant-card:hover {
    transform: translateY(-5px);
}

.restaurant-img {
    height: 200px;
    background-size: cover;
    background-position: center;
}

.restaurant-info {
    padding: 20px;
}

.restaurant-info h3 {
    margin-bottom: 10px;
    font-size: 20px;
}

.restaurant-meta {
    display: flex;
    justify-content: space-between;
    color: var(--text-gray);
    margin-bottom: 15px;
    font-size: 14px;
}

.rating {
    color: #ffc107;
}

.restaurant-info p {
    color: var(--text-gray);
    margin-bottom: 15px;
    line-height: 1.5;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
    overflow: hidden;
    max-width: 300px;
}

.view-menu {
    display: inline-block;
    padding: 8px 15px;
    background-color: var(--primary);
    color: white;
    text-decoration: none;
    border-radius: 5px;
    font-weight: 500;
}

footer {
    background-color: var(--dark);
    color: white;
    padding: 50px 0 20px;
}

.footer-content {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 30px;
    margin-bottom: 30px;
}

.footer-column h3 {
    margin-bottom: 20px;
    font-size: 18px;
}

.footer-column ul {
    list-style: none;
}

.footer-column ul li {
    margin-bottom: 10px;
}

.footer-column ul li a {
    color: #bbb;
    text-decoration: none;
    transition: color 0.3s;
}

.footer-column ul li a:hover {
    color: white;
}

.social-links {
    display: flex;
    gap: 15px;
}

.social-links a {
    color: white;
    font-size: 20px;
}

.copyright {
    text-align: center;
    padding-top: 20px;
    border-top: 1px solid #444;
    color: #bbb;
    font-size: 14px;
}

@media (max-width: 768px) {
    .header-content {
        flex-direction: column;
    }

    nav ul {
        margin: 15px 0;
    }

    .auth-buttons {
        margin-top: 10px;
    }

    .hero h1 {
        font-size: 36px;
    }

    .hero p {
        font-size: 16px;
    }
}

.pagination {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 50px;
    gap: 10px;
}

.page-link {
    padding: 10px 15px;
    border: 1px solid var(--gray);
    background-color: white;
    color: var(--dark);
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s;
}

.page-link:hover {
    background-color: var(--primary);
    color: white;
}

.page-link.active {
    background-color: var(--primary);
    color: white;
    font-weight: bold;
}

    </style>
</footer>

</html>