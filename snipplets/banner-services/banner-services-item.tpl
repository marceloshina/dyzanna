<div class="service-item-container col-md swiper-slide p-0 px-md-3" data-transition="scale-in">
    <div class="service-item mx-4 mx-md-0">
        {% if banner_services_url %}
            <a href="{{ banner_services_url | setting_url }}">
        {% endif %}
                <div class="img-service">
            {% if banner_services_icon == 'image' and banner_services_image %}
                <img class="service-item-image lazyload" src="{{ 'images/empty-placeholder.png' | static_url }}" data-src='{{ "#{banner}.jpg" | static_url | settings_image_url("large") }}' {% if banner_services_title %}alt="{{ banner_services_title }}"{% else %}alt="{{ 'Banner de' | translate }} {{ store.name }}"{% endif %} />
            {% elseif banner_services_icon == 'shipping' %}
                {% include "snipplets/svg/truck.tpl" with {svg_custom_class: "icon-inline icon-2x svg-icon-text mb-3 pt-1"} %}
            {% elseif banner_services_icon == 'card' %}
                {% include "snipplets/svg/credit-card.tpl" with {svg_custom_class: "icon-inline icon-2x svg-icon-text mb-3 pt-1"} %}
            {% elseif banner_services_icon == 'security' %}
                {% include "snipplets/svg/security.tpl" with {svg_custom_class: "icon-inline icon-2x svg-icon-text mb-3"} %}
            {% elseif banner_services_icon == 'returns' %}
                {% include "snipplets/svg/returns.tpl" with {svg_custom_class: "icon-inline icon-2x svg-icon-text mb-3"} %}
            {% elseif banner_services_icon == 'whatsapp' %}
                {% include "snipplets/svg/whatsapp.tpl" with {svg_custom_class: "icon-inline icon-2x svg-icon-text mb-3"} %}
            {% elseif banner_services_icon == 'promotions' %}
                {% include "snipplets/svg/promotions.tpl" with {svg_custom_class: "icon-inline icon-2x svg-icon-text mb-3"} %}
            {% elseif banner_services_icon == 'cash' %}
                {% include "snipplets/svg/cash.tpl" with {svg_custom_class: "icon-inline icon-2x svg-icon-text mb-3"} %}
            {% endif %}
                </div>

                <div class="texto-service">
            {% if banner_services_title %}
                <h3 class="h4">{{ banner_services_title }}</h3>
            {% endif %}
            {% if banner_services_description %}
                <p class="m-0 font-small">{{ banner_services_description }}</p>
            {% endif %}
                </div>
        {% if banner_services_url %}
            </a>
        {% endif %}
    </div>
</div>
