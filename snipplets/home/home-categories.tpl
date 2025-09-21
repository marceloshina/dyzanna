{% if settings.main_categories and settings.slider_categories and settings.slider_categories is not empty %}
    <section class="section-categories-home position-relative" data-store="home-categories-featured">
        <div class="container-fluid pr-0 pr-md-5">
            <div class="row no-gutters">
                <div class="col-3 col-md-2 pt-4">
                    {% if settings.main_categories_title %}
                        <h2 class="h1 mb-3 home-category-title">{{ settings.main_categories_title }}</h2>
                    {% endif %}
                    <div class="js-swiper-categories-prev swiper-button-prev d-inline-block svg-icon-text">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-xs"} %}</div>
                    <div class="js-swiper-categories-pagination swiper-pagination-fraction font-small d-inline-block"></div>
                    <div class="js-swiper-categories-next swiper-button-next d-inline-block svg-icon-text">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-xs"} %}</div>
                </div>
                <div class="col-9 col-md-10 pr-0 pr-md-3">
                    <div class="js-swiper-categories swiper-container">
                        <div class="swiper-wrapper swiper-wrapper-columns">
                            {% for slide in settings.slider_categories %}
                                <div class="swiper-slide home-category-slide">
                                    {% if slide.link %}
                                        <a href="{{ slide.link | setting_url }}" class="js-home-category" aria-label="{{ 'Categoría' | translate }} {{ loop.index }}">
                                    {% endif %}
                                        <div class="home-category{% if loop.index is odd %} float-right{% endif %}">
                                            <div class="home-category-image">
                                                <img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ slide.image | static_url | settings_image_url('small') }}" class="swiper-lazy" alt="{{ 'Categoría' | translate }} {{ loop.index }}">
                                                <div class="placeholder-fade"></div>
                                            </div>
                                    {% if slide.link %}
                                                {% set category_handle = slide.link | trim('/') | split('/') | last %}
                                                {% include 'snipplets/home/home-categories-name.tpl' %}
                                            </div>
                                        </a>
                                    {% else %}
                                        </div>
                                    {% endif %}
                                </div>
                            {% endfor %}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
{% endif %}
