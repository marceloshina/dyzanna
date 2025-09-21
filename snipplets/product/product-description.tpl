{% set has_color_description = settings.product_description_colors and product.description is not empty %}
{% set show_product_fulfillment = settings.shipping_calculator_product_page and (store.has_shipping or store.branches) and not product.free_shipping and not product.is_non_shippable %}
{% set narrow_wrapper = settings.product_image_format == 'slider' or (settings.product_image_format != 'slider' and (settings.product_image_grid == '1' or (settings.product_image_grid == '2' and not has_multiple_slides ))) %}
{% set narrow_empty_description = narrow_wrapper and product.description is empty %}

<div id="product-description" style="display: none;" class="{% if settings.full_width_description %}container-fluid product-description-container {% if narrow_empty_description %}px-md-0{% endif %}{% endif %} {% if has_color_description %}product-page-description {% if settings.full_width_description %}py-md-5{% endif %} py-4{% else %}{% endif %} mt-4 pt-3 {% if narrow_empty_description %}{% if settings.full_width_description %}mt-md-2{% else %}mt-md-4{% endif %}{% endif %}" data-store="product-description-{{ product.id }}">

    {# Product description #}

    {% if product.description is not empty %}
        <div class="user-content mb-4">
            <h5 class="font-big mb-4 {% if settings.full_width_description %}h2-md{% endif %}">{{ "Descripción" | translate }}</h5>
            {{ product.description }}
        </div>
    {% endif %}

    {% if settings.show_product_fb_comment_box %}
        <div class="fb-comments section-fb-comments mb-3 {% if not settings.full_width_description %}px-md-3{% endif %}" data-href="{{ product.social_url }}" data-num-posts="5" data-width="100%"></div>
    {% endif %}
    <div id="reviewsapp"></div>

    {# SKU #}

    {% if settings.product_sku and product.sku %}
        <div class="font-small opacity-60 mt-1 mb-4">
            {{ "SKU" | translate }}: <span class="js-product-sku">{{ product.sku }}</span>
        </div>
    {% endif %}

    {# Product share #}

    {% include 'snipplets/social/social-share.tpl' %}
</div>