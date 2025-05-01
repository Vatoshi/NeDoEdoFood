<link rel="preconnect" href="https://fonts.bunny.net" crossorigin>
<link rel="dns-prefetch" href="https://fonts.bunny.net">
<link href="https://fonts.bunny.net/css?family=Nunito+Sans" rel="stylesheet">
<style>
    :root {
        --color-bg-primary: #fff;
        --color-text-primary: #5a3e1f;

        --color-ui-bg-primary: #ff8c00;
        --color-ui-bg-inverted: #fff4e0;
    }

    @media (prefers-color-scheme: dark) {
        :root {
            --color-bg-primary: #2a210b;
            --color-text-primary: #fff4e0;

            --color-ui-bg-primary: #ffa726;
            --color-ui-bg-inverted: #5a3e1f;
        }
    }

    html,
    body {
        background: linear-gradient(135deg, #ffd54f 0%, #ffb347 100%);
        color: var(--color-text-primary);
        font-family: 'Nunito Sans', sans-serif;
    }

    .error_block {
        align-items: center;
        display: flex;
        justify-content: center;
        height: 100vh;
    }

    .main_block {
        width: 100%;
        max-width: 1140px;
        display: flex;
        justify-content: space-between;
    }

    .picture, .content {
        box-sizing: border-box;
        width: 50%;
    }

    .content {
        padding: 0 40px;
    }

    svg .dark {
        stroke: var(--color-ui-bg-primary);
    }

    svg .fill-dark {
        fill: var(--color-ui-bg-primary);
    }

    svg .fill-light {
        fill: var(--color-ui-bg-inverted);
    }

    h1 {
        font-size: 150px;
        margin: 15px 0;
        font-weight: bold;
    }

    h2 {
        font-size: 32px;
        font-weight: bold;
    }

    p {
        font-size: 16px;
    }

    .details {
        list-style: none;
        padding-left: 0;
        opacity: .7;
    }

    .details li span {
        font-size: 14px;
        font-weight: bold;
    }

    .details li code {
        font-size: 14px;
        font-weight: normal;
        padding-left: 7px;
    }

    @media screen and (max-width: 768px) {
        .main_block {
            display: block;
        }

        .picture, .content {
            width: 100%;
            text-align: center;
        }

        .content {
            padding: 0 20px;
        }

        .picture svg {
            max-width: 60%;
        }
    }
</style>

<div class="error_block">
    <div class="main_block">
        <div class="picture">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 800 600">
                <g>
                    <!-- Бургер -->
                    <g id="burger">
                        <!-- Нижняя булочка -->
                        <path class="fill-light" stroke="var(--color-ui-bg-primary)" stroke-width="3"
                              d="M300,400 C250,400 200,380 150,360 C100,340 50,320 50,300 C50,280 100,260 150,250 C200,240 250,230 300,230 C350,230 400,240 450,250 C500,260 550,280 550,300 C550,320 500,340 450,360 C400,380 350,400 300,400 Z"/>

                        <!-- Котлета -->
                        <ellipse class="fill-dark" cx="300" cy="320" rx="250" ry="20"/>

                        <!-- Сыр -->
                        <path class="fill-light" stroke="var(--color-ui-bg-primary)" stroke-width="2"
                              d="M100,310 C150,305 200,300 250,305 C300,310 350,315 400,310 C450,305 500,300 500,300 C500,300 450,295 400,290 C350,285 300,285 250,290 C200,295 150,300 100,310 Z"/>

                        <!-- Верхняя булочка -->
                        <path class="fill-light" stroke="var(--color-ui-bg-primary)" stroke-width="3"
                              d="M300,250 C350,250 400,240 450,230 C500,220 550,210 550,200 C550,190 500,180 450,170 C400,160 350,150 300,150 C250,150 200,160 150,170 C100,180 50,190 50,200 C50,210 100,220 150,230 C200,240 250,250 300,250 Z"/>

                        <!-- Кунжутные семечки -->
                        <g id="sesame">
                            <ellipse class="fill-dark" cx="200" cy="180" rx="10" ry="5" transform="rotate(30 200 180)"/>
                            <ellipse class="fill-dark" cx="300" cy="170" rx="8" ry="4" transform="rotate(-20 300 170)"/>
                            <ellipse class="fill-dark" cx="400" cy="180" rx="12" ry="6" transform="rotate(15 400 180)"/>
                            <ellipse class="fill-dark" cx="250" cy="190" rx="7" ry="3" transform="rotate(-10 250 190)"/>
                            <ellipse class="fill-dark" cx="350" cy="185" rx="9" ry="4" transform="rotate(25 350 185)"/>
                        </g>

                        <!-- Листик салата -->
                        <path class="fill-light" stroke="var(--color-ui-bg-primary)" stroke-width="2"
                              d="M150,330 C180,320 220,315 250,320 C280,325 320,335 350,330 C380,325 400,315 420,310 C440,305 460,300 480,305 C500,310 520,320 500,330 C480,340 450,345 420,340 C390,335 360,330 330,335 C300,340 270,350 240,345 C210,340 180,330 150,330 Z"/>
                    </g>

                    <!-- Планета (как помидор) -->
                    <g id="planet">
                        <circle class="fill-dark" cx="600" cy="150" r="80"/>
                        <path class="fill-light" d="M600,70 Q620,100 600,130 Q580,100 600,70 Z"/>
                    </g>

                    <!-- Звезды (как частицы сыра) -->
                    <g id="stars">
                        <circle class="fill-light" cx="100" cy="100" r="5"/>
                        <circle class="fill-light" cx="700" cy="80" r="4"/>
                        <circle class="fill-light" cx="200" cy="500" r="6"/>
                        <circle class="fill-light" cx="650" cy="450" r="3"/>
                        <circle class="fill-light" cx="300" cy="300" r="5"/>
                    </g>
                </g>
            </svg>
        </div>
        <div class="content">
            <h1>${status}</h1>
            <h2><span data-l10n>УПС</span>! <span data-l10n>${reason}</span></h2>

            <#if details??>
                <ul class="details">
                    <#if details.serverName??>
                        <li><span><span data-l10n>Хост</span>:</span> <code>${details.serverName}</code></li>
                    </#if>
                    <#if details.requestURL??>
                        <li><span><span data-l10n>Запрошенный URI</span>:</span> <code>${details.requestURL}</code></li>
                    </#if>
                    <#if details.serverPort??>
                        <li><span><span data-l10n>Порт сервиса</span>:</span> <code>${details.serverPort}</code></li>
                    </#if>
                    <#if details.requestId??>
                        <li><span><span data-l10n>ID запроса</span>:</span> <code>${details.requestId}</code></li>
                    </#if>
                    <li><span><span data-l10n>Время</span>:</span> <code>${.now}</code></li>
                </ul>
            </#if>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.9.1/gsap.min.js"
        integrity="sha512-H6cPm97FAsgIKmlBA4s774vqoN24V5gSQL4yBTDOY2su2DeXZVhQPxFK4P6GPdnZqM9fg1G3cMv5wD7e6cFLZQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>
    if (typeof gsap === 'object') {
        gsap.set("svg", {visibility: "visible"});

        // Анимация бургера
        gsap.to("#burger", {
            y: 10,
            yoyo: true,
            repeat: -1,
            ease: "sine.inOut",
            duration: 2
        });

        // Анимация кунжутных семечек
        gsap.to("#sesame ellipse", {
            y: -3,
            yoyo: true,
            repeat: -1,
            stagger: 0.2,
            ease: "sine.inOut",
            duration: 1
        });

        // Анимация планеты-помидора
        gsap.to("#planet", {
            rotation: 360,
            duration: 20,
            repeat: -1,
            ease: "none",
            transformOrigin: "center"
        });

        // Мерцание звезд (частиц сыра)
        gsap.to("#stars circle", {
            scale: 0.5,
            opacity: 0.5,
            yoyo: true,
            repeat: -1,
            stagger: 0.2,
            duration: 1,
            ease: "sine.inOut"
        });
    } else {
        console.warn('GSAP library is not loaded');
    }

    // Локализация
    if (navigator.language.substring(0, 2).toLowerCase() !== 'en') {
        ((s, p) => {
            s.src = 'https://cdn.jsdelivr.net/gh/tarampampam/error-pages@2/l10n/l10n.min.js';
            s.async = s.defer = true;
            s.addEventListener('load', () => p.removeChild(s));
            p.appendChild(s);
        })(document.createElement('script'), document.body);
    }
</script>