{% set has_banner = has_banner | default(false) %}
{% set has_mobile_banners = settings.toggle_banner_mobile and settings.banner_mobile and settings.banner_mobile is not empty %}

{% set has_banner_promotional = has_banner_promotional | default(false) %}
{% set has_mobile_banners_promotional = settings.toggle_banner_promotional_mobile and settings.banner_promotional_mobile and settings.banner_promotional_mobile is not empty %}

{% set has_banner_news = has_banner_news | default(false) %}
{% set has_mobile_banners_news = settings.toggle_banner_news_mobile and settings.banner_news_mobile and settings.banner_news_mobile is not empty %}

{% if has_banner %}
    {% set data_store_name = 'categories' %}
{% elseif has_banner_promotional %}
    {% set data_store_name = 'promotional' %}
{% else %}
    {% set data_store_name = 'news' %}
{% endif %}

{% if has_banner or has_banner_promotional or has_banner_news %}
    <section class="section-banners-home position-relative" data-store="home-banner-{{ data_store_name }}" data-transition="scale-out-image">
        {% if has_banner %}
            {% include 'snipplets/home/home-banners-grid.tpl' with {'banner': true} %}
            {% if has_mobile_banners %}
                {% include 'snipplets/home/home-banners-grid.tpl' with {'banner': true, mobile: true} %}
            {% endif %}
        {% endif %}
        {% if has_banner_promotional %}
            {% include 'snipplets/home/home-banners-grid.tpl' with {'banner_promotional': true} %}
            {% if has_mobile_banners_promotional %}
                {% include 'snipplets/home/home-banners-grid.tpl' with {'banner_promotional': true, mobile: true} %}
            {% endif %}
        {% endif %}
        {% if has_banner_news %}
            {% include 'snipplets/home/home-banners-grid.tpl' with {'banner_news': true} %}
            {% if has_mobile_banners_news %}
                {% include 'snipplets/home/home-banners-grid.tpl' with {'banner_news': true, mobile: true} %}
            {% endif %}
        {% endif %}
    </section>
{% endif %}
