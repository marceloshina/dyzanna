.mobile-only {
    display: none;
}

.dna-align-center {
    display: flex;
    justify-content: center;
}

/* TOPO DNA */
.row-dna {
    flex-wrap: nowrap;
}

.topo-dna {
    width: 100%;
    background-color: #000000;
    display: flex;
    padding: 15px 0;
    align-items: center;
    justify-content: space-between;
}

.justify-between {
    justify-content: space-between;
}

.instagram-topo {
    display: flex;
    align-items: center;
    gap: 10px;
}

.instagram-topo a {
    display: flex;
    align-items: center;
    gap: 10px;
}

.instagram-topo p {
    color: #FFFFFF;
    margin: 0;
}

.login-right {
    display: flex;
}

.login-dna {
    color: #FFF !important;
}

a.login-dna:hover, a.login-dna:focus {
    color: #FFF !important;
}

.entrar-dna {
    color: #FFFFFF;
    display: flex;
    align-items: flex-end;
}

.entrar-dna img {
    margin-right: 10px;
}

.meu-carrinho {
    display: flex;
    align-items: flex-end;
    color: #FFFFFF;
}

.meu-carrinho img {
    margin-right: 10px;
}

.carrinho-dna {
    color: #FFFFFF !important;
}

a.carrinho-dna:hover, a.carrinho-dna:focus {
    color: #FFFFFF;
}

.menu-dna {
    display: flex !important;
    flex-direction: column;
    gap: 5px;
    font-weight: 600;
}

.info-top-dna {
    margin-right: 15px;
}

.info-top-dna h2 {
    font-family: "Plus Jakarta Sans", sans-serif;
    font-size: 1.8em;
    font-weight: 800;
    text-transform: uppercase;
    margin-bottom: 0;
}

.search-container {
    width: 310px;
}

input.js-search-input.form-control.search-input {
    background: #F2F2F2;
    border: none;
    color: #8F8F8F;
    fill: #8F8F8F;
    padding-left: 40px;
}

.search-input-submit {
    color: #8F8F8F;
    fill: #8F8F8F;
}

/* BANNERS DNA */

.banners-dna {
    padding: 0 0 50px 0;
}

.flex-direction-column {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}

.section-banners {
    display: flex;
}

.section-banners img {
    width: 100%;
    height: auto;
}

/* BANNER PROMOCIONAL */

.js-swiper-banners-promotional-prev, .js-swiper-banners-promotional-next {
    display: none !important;
}

.swiper-pagination-bullet-active {
    width: 8px;
    height: 8px;
    background-color: #8A8A8A;
}

.js-swiper-banners-promotional-pagination {
    display: flex !important;
    justify-content: center;
}

section.js-section-video {
    margin-bottom: 0 !important;
    margin-left: 0 !important;
}

/* NEWSLETTER */

.section-newsletter-home {
    border-top: 1px solid #707070;
    margin-left: 0 !important;
}

.section-newsletter-home input#email {
    border-radius: 100px !important;
    background-color: #FFFFFF;
}

.section-newsletter-home input[type="email"]::placeholder {
  color: #000;
}

.form-news-home {
    display: flex;
    gap: 20px;
}

.btn-news {
    z-index: 9;
    width: 149px;
    height: 45px;
    text-indent: 0;
    color: #FFF;
    background: red;
    border-radius: 30px;
    position: relative;
    font-size: 13px;
    font-weight: 500;
}

.logo-rodape {
    display: flex;
    justify-content: center;
}

.logo-rodape .logo-img-container {
    max-width: 100% !important;
    display: flex
;
    align-items: center;
    justify-content: center;
}

.logo-rodape .logo-img-container img {
    max-width: 100%;
    max-height: 100%;
}

.menu-rodape-dna {
    display: flex;
    justify-content: center;
    gap: 30px;
}

.instagram-rodape {
    display: flex;
    justify-content: center;
    gap: 10px;
}

.instagram-rodape a {
    display: flex;
    justify-content: center;
    gap: 10px;
}

.instagram-rodape p {
    color: #000000;
    margin: 0;
}

.infos-rodape {
    display: flex;
    flex-direction: row;
    justify-content: center;
    gap: 70px;
}

.order11 {
    order: 12;
}

.order12 {
    order: 12;
}

.js-informative-banners .swiper-wrapper {
    display: flex;
    justify-content: space-between;
}

.service-item-container {
    padding: 0 !important;
}

.service-item {
    display: flex;
    justify-content: center;
}

.service-item-image {
    max-height:40px !important;
}

.img-service {
    display: flex;
    align-items: center;
    margin-right: 10px;
}

.texto-service {
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.texto-service h3 {
    font-size: 14px;
    font-family: "Plus Jakarta Sans", sans-serif;
    padding-bottom: 0;
    margin-bottom: 0;
}

.js-newsletter h2.h1 {
    text-transform: uppercase;
    font-size: 24px;
}

.section-banners-home[data-store="home-banner-promotional"] {
    margin-bottom: 50px;
    background: #F2F2F2;
}

.banner-promotional {
    text-align: center;
}

.titulo-linha {
  font-size: 25px;
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
  font-weight: normal;
}

.titulo-linha::before,
.titulo-linha::after {
  content: "";
  flex: 1;
  border-top: 1px solid #ddd; /* cor da linha */
  margin: 0 10px;
}

.titulo-linha b {
    margin-left: 5px;
}

.titulo-rodape h2 {
    font-size: 38px;
    text-align: center;
}

.email-rodape {
    display: flex;
    gap: 10px;
    align-items: center;
}

/* CATEGORIA */
.category-body {
    padding: 100px 0;
}

.category-banner {
    height: auto;
    width: 100%;
}

.bg1 {
    background-image: 
    url("{{ 'bg1-1.jpg' | static_url | settings_image_url('1080p') }}"), 
    url("{{ 'bg1-2.jpg' | static_url | settings_image_url('1080p') }}");
    background-size: contain, contain;
    background-position: center top, center bottom;
    background-repeat: no-repeat, no-repeat;
    background-color: #000000;
}

.item {
    background: #FFF;
    border-radius: 10px;
    padding: 20px;
}

.item-image img, .item-image:not(.item-image-slider):hover img {
    border-radius: 5px;
}

.bt-comprar-dna {
    background-color: #3CAE34;
    border-radius: 23px;
}

.influencers {}

.influencers-grid {
  display: grid;
  grid-template-columns: repeat(1, 1fr); /* padrão: mobile */
  gap: 20px;
}

@media (min-width: 576px) {
  .influencers-grid {
    grid-template-columns: repeat(2, 1fr); /* tablet */
  }
}

@media (min-width: 992px) {
  .influencers-grid {
    grid-template-columns: repeat(3, 1fr); /* desktop */
  }
}

.influencer-item img {
  width: 100%;
  border-radius: 12px; /* opcional */
  transition: transform 0.3s ease;
}

.influencer-item img:hover {
  transform: scale(1.05);
}


/* PRODUTOS */

@media (min-width: 769px) and (max-width: 991px) {
    .container {
    max-width: 100%;
    }
    .logo-img-container {
    width: 140px;
    }
    .info-top-dna h2 {
    font-size: 1em;
    }
}

@media (min-width: 992px) and (max-width: 1199px) {
    .container {
    max-width: 100%;
    }
    .logo-img-container {
    width: 100%;
    }
    .info-top-dna h2 {
    font-size: 1.3em;
    }
}

@media (max-width: 768px) {
  .row-dna {
    flex-wrap: wrap;
}

  .order12 {
    order:13;
  }


  .mobile-only {
    display: block;
  }

 .login-right {
    display: none;
}

.topo-dna .justify-between {
    justify-content: center !important;
}

.info-top-dna {
    margin-right: 0;
    margin-bottom: 15px;
    margin-top: 10px;
}

.info-top-dna h2 {
    font-size: 16px;
}


}