{% set has_advertising_bar = false %}
{% set num_messages = 0 %}
{% for adbar in ['ad_bar_01', 'ad_bar_02', 'ad_bar_03'] %}
    {% set advertising_text = attribute(settings,"#{adbar}_text") %}
    {% if advertising_text %}
        {% set has_advertising_bar = true %}
        {% set num_messages = num_messages + 1 %}
    {% endif %}
{% endfor %}

{% if settings.ad_bar and has_advertising_bar %}
    <section class="js-adbar section-adbar">
        <div class="js-swiper-adbar swiper-container text-center">
            <div class="swiper-wrapper align-items-center">
                {% for adbar in ['ad_bar_01', 'ad_bar_02', 'ad_bar_03'] %}
                    {% set advertising_text = attribute(settings,"#{adbar}_text") %}
                    {% set advertising_url = attribute(settings,"#{adbar}_url") %}
                    {% if advertising_text %}
                        <div class="swiper-slide slide-container px-4">
                            {% if advertising_url %}
                                <a href="{{ advertising_url }}">
                            {% endif %}
                            {{ advertising_text }}
                            {% if advertising_url %}
                                </a>
                            {% endif %}
                        </div>
                    {% endif %}
                {% endfor %}
            </div>
            {% if num_messages > 1 %}
                <div class="js-swiper-adbar-prev swiper-button-absolute swiper-button-prev svg-icon-text">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-sm"} %}</div>
                <div class="js-swiper-adbar-next swiper-button-absolute swiper-button-next svg-icon-text ml-2">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-sm"} %}</div>
            {% endif %}
        </div>
    </section>
{% endif %}
