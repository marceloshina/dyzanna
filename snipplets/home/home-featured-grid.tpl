{# /*============================================================================
  #Home featured grid
==============================================================================*/

#Properties

#Featured Slider

#}

{% set featured_products = featured_products | default(false) %}
{% set new_products = new_products | default(false) %}
{% set sale_products = sale_products | default(false) %}

{# Check if slider is used #}

{% set has_featured_products_and_slider = featured_products and (settings.featured_products_format == 'slider' or settings.featured_products_format == 'asymmetric_slider') %}
{% set has_new_products_and_slider = new_products and (settings.new_products_format == 'slider' or settings.new_products_format == 'asymmetric_slider') %}
{% set has_sale_products_and_slider = sale_products and (settings.sale_products_format == 'slider' or settings.sale_products_format == 'asymmetric_slider') %}
{% set use_slider = has_featured_products_and_slider or has_new_products_and_slider or has_sale_products_and_slider %}

{% if featured_products %}
    {% set sections_products = sections.primary.products %}
    {% set section_name = 'primary' %}
    {% set section_columns_desktop = settings.featured_products_desktop %}
    {% set section_columns_mobile = settings.featured_products_mobile %}
    {% set section_asymmetric = settings.featured_products_format == 'asymmetric' or settings.featured_products_format == 'asymmetric_slider' %}
    {% set section_asymmetric_slider = settings.featured_products_format == 'asymmetric_slider' %}
    {% set section_title = settings.featured_products_title %}
    {% set section_column_title = settings.featured_products_title_position == 'left' %}
    {% set section_title_centered = not section_asymmetric and settings.featured_products_title_align == 'center' %}
{% endif %}
{% if new_products %}
    {% set sections_products = sections.new.products %}
    {% set section_name = 'new' %}
    {% set section_columns_desktop = settings.new_products_desktop %}
    {% set section_columns_mobile = settings.new_products_mobile %}
    {% set section_asymmetric = settings.new_products_format == 'asymmetric' or settings.new_products_format == 'asymmetric_slider' %}
    {% set section_asymmetric_slider = settings.new_products_format == 'asymmetric_slider' %}
    {% set section_title = settings.new_products_title %}
    {% set section_column_title = settings.new_products_title_position == 'left' %}
    {% set section_title_centered = not section_asymmetric and settings.new_products_title_align == 'center' %}
{% endif %}
{% if sale_products %}
    {% set sections_products = sections.sale.products %}
    {% set section_name = 'sale' %}
    {% set section_columns_desktop = settings.sale_products_desktop %}
    {% set section_columns_mobile = settings.sale_products_mobile %}
    {% set section_asymmetric = settings.sale_products_format == 'asymmetric' or settings.sale_products_format == 'asymmetric_slider' %}
    {% set section_asymmetric_slider = settings.sale_products_format == 'asymmetric_slider' %}
    {% set section_title = settings.sale_products_title %}
    {% set section_column_title = settings.sale_products_title_position == 'left' %}
    {% set section_title_centered = not section_asymmetric and settings.sale_products_title_align == 'center' %}
{% endif %}


{% set section_title_class = section_column_title ? 'h1-huge mb-4' : 'h1 mb-3' %}
{% set section_column_align_class = section_title_centered ? 'text-center' : section_column_title ? 'pt-md-5' %}
{% set section_row_class = not section_column_title and not section_asymmetric ? 'pb-md-5' %}
{% set section_row_align_class = section_title_centered ? 'align-items-center' %}
{% set section_first_column_class = section_column_title ? 'col-md-3' : 'col-md-12 position-initial' %}
{% set section_second_column_class = section_column_title ? 'col-md-9' : 'col-md-12' %}
{% set section_pagination_bottom_class = not section_column_title ? 'swiper-pagination-bottom' %}
{% set section_pagination_left_class = not section_column_title and not section_title_centered ? 'swiper-pagination-left' %}

<div class="container-fluid">
    <div class="row mb-3 pb-2 {{ section_row_class }} {{ section_row_align_class }}">
        <div class="{{ section_first_column_class }} {{ section_column_align_class }} mb-4">
            {% if section_asymmetric and section_column_title %}
                <div class="absolute-section-title{% if section_columns_mobile == 2 %} absolute-section-title-right{% endif %}">
            {% endif %}
                {% if section_title %}
                    <h2 class="{{ section_title_class }}">{{ section_title }}</h2>
                {% endif %}
                {% if use_slider %}
                    <div class="{% if section_asymmetric %}text-right text-md-left{% if section_columns_mobile == 2 and section_asymmetric_slider %} text-center{% endif %}{% else %}d-none d-md-block{% endif %} {{ section_pagination_bottom_class }} {{ section_pagination_left_class }}">
                        <div class="js-swiper-{% if featured_products %}featured{% elseif new_products %}new{% else %}sale{% endif %}-prev swiper-button-prev d-inline-block svg-icon-text">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-xs"} %}</div>
                        <div class="js-swiper-{% if featured_products %}featured{% elseif new_products %}new{% else %}sale{% endif %}-pagination swiper-pagination-fraction font-small d-inline-block"></div>
                        <div class="js-swiper-{% if featured_products %}featured{% elseif new_products %}new{% else %}sale{% endif %}-next swiper-button-next d-inline-block svg-icon-text">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-xs"} %}</div>
                    </div>
                {% endif %}
            {% if section_asymmetric and section_column_title %}
                </div>
            {% endif %}
        </div>
        <div class="{{ section_second_column_class }}{% if use_slider %} pr-0 pr-md-3{% endif %}">
            {% if use_slider %}
                <div class="js-swiper-{% if featured_products %}featured{% elseif new_products %}new{% else %}sale{% endif %} swiper-container">
                    <div class="swiper-wrapper">
            {% else %}
                <div class="row row-grid">
            {% endif %}

            {% for product in sections_products %}
                {% if use_slider %}
                    {% include 'snipplets/grid/item.tpl' with {'slide_item': true, 'section_name': section_name, 'section_columns_desktop': section_columns_desktop, 'section_columns_mobile': section_columns_mobile, 'section_asymmetric': section_asymmetric, 'section_asymmetric_slider': section_asymmetric_slider } %}
                {% else %}
                    {% include 'snipplets/grid/item.tpl' %}
                {% endif %}
            {% endfor %}

            {% if use_slider %}
                    </div>
                </div>
            {% else %}
                </div>
            {% endif %}
            {% if section_asymmetric %}
                <div class="asymmetric-products-background{% if not section_column_title %} asymmetric-products-background-top{% endif %} {% if featured_products %}featured{% elseif new_products %}new{% else %}sale{% endif %}-products-background"></div>
            {% endif %}
        </div>

        {% if show_help %}
            {% for i in 1..4 %}
                {% if loop.index % 4 == 1 %}
                    <div class="grid-row">
                {% endif %}

                <div class="span3">
                    <div class="item">
                        <div class="item-image-container">
                            <a href="/admin/products/new" target="_top">{{'placeholder-product.png' | static_url | img_tag}}</a>
                        </div>
                        <div class="item-info-container">
                            <div class="title"><a href="/admin/products/new" target="_top">{{"Producto" | translate}}</a></div>
                            <div class="price">{{"$0.00" | translate}}</div>
                        </div>
                    </div>
                </div>

                {% if loop.index % 4 == 0 or loop.last %}
                    </div>
                {% endif %}
            {% endfor %}
        {% endif %}
    </div>
</div>
