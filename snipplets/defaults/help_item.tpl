{# /*============================================================================
  #Item grid
==============================================================================*/

#Properties

#Slide Item

#}

{% set slide_item = slide_item | default(false) %}

{% if template == 'home'%}
    {% set columns_desktop = section_columns_desktop %}
    {% set columns_mobile = section_columns_mobile %}
{% else %}
    {% set columns_desktop = settings.grid_columns_desktop %}
    {% set columns_mobile = settings.grid_columns_mobile %}
{% endif %}

{% if slide_item %}
    <div class="swiper-slide">
{% endif %}
<div class="{% if slide_item %} js-item-slide p-0{% endif %}{% if not slide_item %} col-{% if columns_mobile == 1 %}12{% else %}6{% endif %} col-md-{% if columns_desktop == 2 %}6{% elseif columns_desktop == 3 %}4{% else %}3{% endif %}{% endif %} item-product col-grid">
    <div class="item{% if slide_item %} mb-0{% endif %} {{ item_class }}">
        <div class="item-image">
            <div class="position-relative">
                <a href="{{ store.url }}/product/example" title="{{ "Producto de ejemplo" | translate }}">
                    {% set type_value = 
                        help_item_1 ? 'shirt' : 
                        help_item_2 ? 'camera' :
                        help_item_3 ? 'dress' :
                        help_item_4 ? 'sneakers' :
                        help_item_5 ? 'joystick' :
                        help_item_6 ? 'shoes' :
                        help_item_7 ? 'bag' :
                        help_item_8 ? 'glasses' 
                    %}
                    {{ component('placeholders/product-placeholder',{
                            type: type_value,
                        })
                    }}
                </a>
            </div>
            {% if help_item_1 %}
                <div class="labels">
                    <div class="label label-accent">{{ "-20%" | translate }}</div>
                </div>
            {% elseif help_item_2 %}
                <div class="labels">
                    <div class="label label-top">{{ "Envío gratis" | translate }}</div>
                </div>
            {% elseif help_item_3 %}
                <div class="labels">
                    <div class="label label-accent">{{ "-35%" | translate }}</div>
                </div>
            {% elseif help_item_7 %}
                <div class="labels">
                    <div class="label label-accent">{{ "-20%" | translate }}</div>
                </div>
            {% endif %}
        </div>
        <div class="item-description">
            <a href="{{ store.url }}/product/example" title="{{ "Producto de ejemplo" | translate }}" class="item-link">
                <div class="item-name mb-2">{{ "Producto de ejemplo" | translate }}</div>
                <div class="item-price-container mb-2">
                    {% if help_item_1 %}
                        {% if store.country == 'BR' %}
                            <span id="price_display" class="js-price-display item-price font-weight-bold">
                                {{"9600" | money }}
                            </span>
                            <span id="compare_price_display" class="js-compare-price-display price-compare">
                                {{"120000" | money }}
                            </span>
                        {% else %}
                            <span id="price_display" class="js-price-display item-price font-weight-bold">
                                {{"96000" | money }}
                            </span>
                            <span id="compare_price_display" class="js-compare-price-display price-compare">
                                {{"1200000" | money }}
                            </span>
                        {% endif %}
                    {% elseif help_item_2 %}
                        {% if store.country == 'BR' %}
                            <span id="price_display" class="js-price-display item-price font-weight-bold">
                                {{"68000" | money }}
                            </span>
                        {% else %}
                            <span id="price_display" class="js-price-display item-price font-weight-bold">
                                {{"680000" | money }}
                            </span>
                        {% endif %}
                    {% elseif help_item_3 %}
                        {% if store.country == 'BR' %}
                            <span id="price_display" class="js-price-display item-price font-weight-bold">
                                {{"18200" | money }}
                            </span>
                            <span id="compare_price_display" class="js-compare-price-display price-compare">
                                {{"28000" | money }}
                            </span>
                        {% else %}
                            <span id="price_display" class="js-price-display item-price font-weight-bold">
                                {{"182000" | money }}
                            </span>
                            <span id="compare_price_display" class="js-compare-price-display price-compare">
                                {{"280000" | money }}
                            </span>
                        {% endif %}
                    {% elseif help_item_4 %}
                        {% if store.country == 'BR' %}
                            <span id="price_display" class="js-price-display item-price font-weight-bold">
                                {{"32000" | money }}
                            </span>
                        {% else %}
                            <span id="price_display" class="js-price-display item-price font-weight-bold">
                                {{"320000" | money }}
                            </span>
                        {% endif %}
                    {% elseif help_item_5 %}
                        {% if store.country == 'BR' %}
                            <span id="price_display" class="js-price-display item-price font-weight-bold">
                                {{"24900" | money }}
                            </span>
                        {% else %}
                            <span id="price_display" class="js-price-display item-price font-weight-bold">
                                {{"249000" | money }}
                            </span>
                        {% endif %}
                    {% elseif help_item_6 %}
                        {% if store.country == 'BR' %}
                            <span id="price_display" class="js-price-display item-price font-weight-bold">
                                {{"42000" | money }}
                            </span>
                        {% else %}
                            <span id="price_display" class="js-price-display item-price font-weight-bold">
                                {{"420000" | money }}
                            </span>
                        {% endif %}
                    {% elseif help_item_7 %}
                        {% if store.country == 'BR' %}
                            <span id="price_display" class="js-price-display item-price font-weight-bold">
                                {{"36800" | money }}
                            </span>
                            <span id="compare_price_display" class="js-compare-price-display price-compare">
                                {{"46000" | money }}
                            </span>
                        {% else %}
                            <span id="price_display" class="js-price-display item-price font-weight-bold">
                                {{"368000" | money }}
                            </span>
                            <span id="compare_price_display" class="js-compare-price-display price-compare">
                                {{"460000" | money }}
                            </span>
                        {% endif %}
                    {% elseif help_item_8 %}
                        {% if store.country == 'BR' %}
                            <span id="price_display" class="js-price-display item-price font-weight-bold">
                                {{"12200" | money }}
                            </span>
                        {% else %}
                            <span id="price_display" class="js-price-display item-price font-weight-bold">
                                {{"122000" | money }}
                            </span>
                        {% endif %}
                    {% endif %}
                </div>
            </a>
        </div>
    </div>
</div>
{% if slide_item %}
    </div>
{% endif %}