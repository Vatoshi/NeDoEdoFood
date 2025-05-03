<#import "../layout.ftlh" as main>
<@main.layout>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">


<div class="restaurant-card">
    <div class="restaurant-avatar">
        <img src="${store.logo}"
             alt="Фото ресторана">
    </div>
    <div class="restaurant-details">
        <h2>${store.name}</h2>
        <p class="restaurant-description">${store.description}</p>
        <div class="restaurant-meta">
            <div><i class="fas fa-store"></i><span>${store.category.name}</span></div>
            <div><i class="fas fa-phone"></i><span>${store.phoneNumber}</span></div>
            <div><i class="fas fa-envelope"></i><span>${store.email}</span></div>
            <div><i class="fas fa-clock"></i><span>${store.workTimeFrom?time?string("HH-mm")} – ${store.workTimeTo?time?string("HH-mm")}</span></div>
        </div>
    </div>
</div>




<div class="categories">
    <a style="all: unset" href="/restik?id=${id}&category=Холодное">
    <div class="category <#if category?? && category == "Холодное">icon-active</#if>"><i class="fas fa-snowflake"></i><span>Холодное</span></div>
    </a>
    <a style="all: unset" href="/restik?id=${id}&category=Горячее">
    <div class="category <#if category?? && category == "Горячее">icon-active</#if>"><i class="fas fa-fire"></i><span>Горячее</span></div>
    </a>
    <a style="all: unset" href="/restik?id=${id}&category=Напитки">
    <div class="category <#if category?? && category == "Напитки">icon-active</#if>"><i class="fas fa-coffee"></i><span>Напитки</span></div>
    </a>
    <a style="all: unset" href="/restik?id=${id}&category=Десерты">
    <div class="category <#if category?? && category == "Десерты">icon-active</#if>"><i class="fas fa-ice-cream"></i><span>Десерты</span></div>
    </a>
    <a style="all: unset" href="/restik?id=${id}&category=Супы">
    <div class="category <#if category?? && category == "Супы">icon-active</#if>"><i class="fas fa-utensil-spoon"></i><span>Супы</span></div>
    </a>
    <a style="all: unset" href="/restik?id=${id}&category=Завтраки">
    <div class="category <#if category?? && category == "Завтраки">icon-active</#if>"><i class="fas fa-egg"></i><span>Завтраки</span></div>
    </a>
    <a style="all: unset" href="/restik?id=${id}&category=Салаты">
    <div class="category <#if category?? && category == "Салаты">icon-active</#if>"><i class="fas fa-leaf"></i><span>Салаты</span></div>
    </a>
    <a style="all: unset" href="/restik?id=${id}&category=Выпечка">
    <div class="category <#if category?? && category == "Выпечка">icon-active</#if>"><i class="fas fa-bread-slice"></i><span>Выпечка</span></div>
    </a>
</div>

<section class="container">
    <h2 class="section-title">Меню</h2>
    <div class="dishes">

        <#if dishes??>
            <#list dishes.content as dish>
        <div class="dish-card">
            <div class="dish-img"
                 style="background-image: url('${dish.photo}');">
            </div>
            <div class="dish-info">
                <h3>${dish.name}</h3>
                <p>${dish.description}</p>
                <div class="dish-meta">
                    <span>${dish.price} ₽</span>
                    <#if dish.inStock>
                        <span class="in-stock">В наличии</span>
                    <#else>
                        <span class="in-stock" style="color: #f42727">Нет в наличии</span>
                    </#if>
                </div>
            </div>
            <a href="/busket/addProduct?productId=${dish.id}" class="add-to-cart">Добавить в корзину</a>
        </div>
            </#list>
        </#if>
    </div>

    <#if dishes?? && dishes.content?size == 0>
        <div class="no-results">
            <i class="fas fa-utensils"></i>
            <p>К сожалению, по данной категории ничего не найдено.</p>
        </div>
    </#if>

    <div class="pagination">
        <#if (page > 0)>
            <a href="?id=${id}&page=${page - 1}<#if category??>&category=${category}</#if>" class="page-link">&laquo;</a>
        </#if>

        <#if (page - 1 >= 0)>
            <a href="?id=${id}&page=${page - 1}<#if category??>&category=${category}</#if>" class="page-link">${page}</a>
        </#if>

        <a href="?id=${id}&page=${page}<#if category??>&category=${category}</#if>" class="page-link active">${page + 1}</a>

        <#if page + 1 < dishes.totalPages>
            <a href="?id=${id}&page=${page + 1}<#if category??>&category=${category}</#if>" class="page-link">${page + 2}</a>
        </#if>

        <#if page + 2 < dishes.totalPages>
            <a href="?id=${id}&page=${page + 2}<#if category??>&category=${category}</#if>" class="page-link">${page + 3}</a>
        </#if>

        <#if page + 1 < dishes.totalPages>
            <a href="?id=${id}&page=${page + 1}<#if category??>&category=${category}</#if>" class="page-link">&raquo;</a>
        </#if>
    </div>
</section>

<style>
    body {
        font-family: 'Segoe UI', sans-serif;
        margin: 0;
        margin-top: 100px;
        background-color: #f7f7f7;
        color: #333;
    }

    .icon-active {
        border: 1px solid #ff6b6b;
        transform: translateY(-6px);
    }

    .restaurant-card {
        display: flex;
        flex-wrap: wrap;
        max-width: 1000px;
        margin: 50px auto;
        background: white;
        border-radius: 16px;
        overflow: hidden;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
    }

    .restaurant-info {
        flex: 1 1 300px;
        background: #1f2e3d;
        color: white;
        padding: 40px;
    }

    .restaurant-info h2 {
        margin-top: 0;
        font-size: 36px;
    }

    .restaurant-info p {
        font-size: 18px;
        margin: 10px 0 30px;
    }

    .restaurant-info ul {
        list-style: none;
        padding: 0;
        font-size: 16px;
        line-height: 2;
    }

    .restaurant-photo {
        flex: 2 1 400px;
        background: #eee;
    }

    .restaurant-photo img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .categories {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 20px;
        margin: 40px auto 20px;
        max-width: 1000px;
    }

    .category {
        background-color: white;
        border-radius: 12px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        padding: 20px 25px;
        display: flex;
        flex-direction: column;
        align-items: center;
        width: 120px;
        text-align: center;
        transition: transform 0.2s ease;
    }

    .category:hover {
        transform: translateY(-5px);
    }

    .category i {
        font-size: 28px;
        margin-bottom: 10px;
        color: #ff7043;
    }

    .category span {
        font-size: 14px;
        font-weight: bold;
    }

    .container {
        padding: 20px;
        max-width: 1200px;
        margin: 0 auto;
    }

    .section-title {
        font-size: 28px;
        margin-bottom: 30px;
        text-align: center;
    }

    .dishes {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
        gap: 25px;
    }

    .dish-card {
        background: #fff;
        border-radius: 12px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
        overflow: hidden;
        display: flex;
        flex-direction: column;
        transition: transform 0.3s ease;
    }

    .dish-card:hover {
        transform: translateY(-5px);
    }

    .dish-img {
        height: 180px;
        background-size: cover;
        background-position: center;
    }

    .dish-info {
        padding: 20px;
    }

    .dish-info h3 {
        margin: 0 0 10px;
        font-size: 20px;
    }

    .dish-info p {
        font-size: 14px;
        color: #666;
        margin: 0 0 15px;
    }

    .dish-meta {
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-weight: bold;
        font-size: 15px;
        margin-bottom: 15px;
    }

    .in-stock {
        color: green;
    }

    .out-of-stock {
        color: red;
    }

    .add-to-cart {
        display: block;
        text-align: center;
        background-color: #ff7043;
        color: white;
        padding: 10px;
        border: none;
        border-radius: 0 0 12px 12px;
        font-weight: bold;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .add-to-cart:hover {
        background-color: #ff5722;
    }

    .pagination {
        display: flex;
        justify-content: center;
        margin: 40px auto;
        gap: 10px;
    }

    .pagination a {
        all: unset;
        background: white;
        border: 1px solid #ddd;
        border-radius: 6px;
        padding: 8px 14px;
        cursor: pointer;
        font-weight: bold;
        transition: background-color 0.2s;
        color: black;
    }

    .pagination a:hover {
        background-color: #ff7043;
        color: white;
    }

    .pagination .active {
        background-color: #ff7043;
        color: white;
        pointer-events: none;
    }

    .restaurant-card {
        display: flex;
        align-items: center;
        background: #fff;
        border-radius: 20px;
        padding: 50px 40px;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
        max-width: 1200px;
        margin: 50px auto;
        gap: 40px;
    }

    .restaurant-avatar img {
        width: 140px;
        height: 140px;
        object-fit: cover;
        border-radius: 16px;
        border: 4px solid #ff7043;
        box-shadow: 0 0 8px rgba(255, 112, 67, 0.3);
    }

    .restaurant-details {
        flex: 1;
    }

    .restaurant-details h2 {
        margin: 0;
        font-size: 30px;
        color: #333;
    }

    .restaurant-description {
        margin: 10px 0 18px;
        font-size: 16px;
        color: #666;
    }

    .restaurant-meta {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
        gap: 12px 20px;
        font-size: 15px;
        color: #444;
    }

    .restaurant-meta i {
        color: #ff7043;
        margin-right: 10px;
        width: 20px;
        text-align: center;
    }

    .restaurant-meta div {
        display: flex;
        align-items: center;
    }

    .no-results {
        text-align: center;
        margin: 60px 0;
        color: #999;
        font-size: 18px;
    }

    .no-results i {
        font-size: 48px;
        color: #ff7043;
        margin-bottom: 16px;
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