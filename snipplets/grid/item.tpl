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
    {% set section_asymmetric = section_asymmetric %}
    {% set section_asymmetric_slider = section_asymmetric_slider %}
{% else %}
    {% set columns_desktop = settings.grid_columns_desktop %}
    {% set columns_mobile = settings.grid_columns_mobile %}
    {% set asymmetric_item_even = settings.product_grid_asymmetric and loop.index is even and not reduced_item %}
    {% set asymmetric_item_odd = settings.product_grid_asymmetric and loop.index is odd and columns_mobile == 1 and not reduced_item %}
    {% set asymmetric_item_even_md = settings.product_grid_asymmetric and loop.index is even and columns_desktop != 3 and not reduced_item %}
{% endif %}

{% set appear_transition = appear_transition ?? true %}

{# Item image slider #}

{% set show_image_slider = 
    (template == 'category' or template == 'search')
    and settings.product_item_slider 
    and not reduced_item 
    and not has_filters
    and product.other_images
%}

{% if show_image_slider %}
    {% set slider_controls_container_class = 'item-slider-controls-container svg-icon-text d-none d-md-block' %}
    {% set slider_control_class = 'icon-inline' %}
    {% set control_prev = include ('snipplets/svg/chevron-left.tpl', {svg_custom_class: slider_control_class}) %}
    {% set control_next = include ('snipplets/svg/chevron-right.tpl', {svg_custom_class: slider_control_class}) %}
{% endif %}

{# Secondary images #}

{% set show_secondary_image = settings.product_hover %}

{% if slide_item %}
    <div class="swiper-slide">
{% endif %}
    <div class="js-item-product{% if slide_item %} js-item-slide p-0{% endif %}{% if not slide_item %} col-{% if columns_mobile == 1 %}12{% else %}6{% if template == 'home' and loop.first and section_asymmetric %} offset-6 offset-md-0{% endif %}{% endif %} col-md-{% if columns_desktop == 2 %}6{% elseif columns_desktop == 3 %}4{% else %}3{% endif %}{% endif %} item-product {% if reduced_item %}item-product-reduced{% endif %} {% if template != 'home' %}{% if settings.product_grid_asymmetric %}item-offset{% endif %} {% if settings.grid_columns_desktop == '3' %}col-grid-wide-md{% endif %}{% endif %} col-grid" data-product-type="list" data-product-id="{{ product.id }}" data-store="product-item-{{ product.id }}" data-component="product-list-item" data-component-value="{{ product.id }}" {% if appear_transition %}data-transition="scale-in"{% endif %}>
        <div class="item{% if slide_item %} mb-0{% endif %}{% if template == 'home'%}{% if section_asymmetric %} item-asymmetric{% if (columns_desktop == 2 or columns_desktop == 4 or columns_mobile == 1) and loop.index is even %} item-even{% if columns_mobile == 1 and section_asymmetric_slider %} float-none{% endif %}{% endif %}{% if columns_mobile == 2 and loop.index is even %} {% if section_asymmetric or section_asymmetric_slider %}float-none{% else %}mt-5 mt-md-0{% endif %}{% elseif columns_mobile == 2 and loop.index is odd and section_asymmetric_slider %} item-asymmetric-slide pt-md-0{% endif %}{% if columns_desktop == 2 %}{% if loop.index % 4 == 3 %} m-md-auto{% endif %}{% endif %}{% if columns_desktop == 3 %} {% if loop.index % 3 == 0 %}mt-md-4{% elseif loop.index % 3 == 1 %}mt-md-5 pt-md-3{% else %}mt-md-0{% endif %}{% if (loop.index % 6 == 1) or (loop.index % 6 == 2) or (loop.index % 6 == 3) %} mx-md-auto{% endif %}{% endif %}{% if columns_desktop == 4 %}{% if loop.index is even %} mt-md-5 pt-md-3{% endif %} {% if (loop.index % 8 == 1) or (loop.index % 8 == 2) or (loop.index % 8 == 3) or (loop.index % 8 == 4) %} mx-md-auto{% endif %}{% endif %}{% endif %}{% else %} {% if columns_desktop == 2 %}item-big {% if settings.product_grid_asymmetric %}mb-md-0{% endif %}{% endif %} {% if asymmetric_item_even_md %}mt-md-5 {% if columns_desktop == 2 %}pt-md-3{% endif %}{% endif %} {% if asymmetric_item_even %}{% if columns_mobile == 2 %}{% if template == 'product' %}mt-4{% else %}mt-5{% endif %} mb-0 mb-md-3 {% if columns_desktop == 3 %}mt-md-0{% endif %}{% else %}pl-5 pl-md-0{% endif %}{% endif %} {% if asymmetric_item_odd %}pr-5 pr-md-0{% endif %}{% endif %}">
            {% if settings.quick_shop and not reduced_item %}
                <div class="js-product-container js-quickshop-container{% if product.variations %} js-quickshop-has-variants{% endif %} position-relative" data-variants="{{ product.variants_object | json_encode }}" data-quickshop-id="quick{{ product.id }}">
            {% endif %}
            {% set product_url_with_selected_variant = has_filters ?  ( product.url | add_param('variant', product.selected_or_first_available_variant.id)) : product.url  %}

            {# Set how much viewport space the images will take to load correct image #}

            {% if columns_mobile == 2 %}
                {% set mobile_image_viewport_space = '50' %}
            {% else %}
                {% set mobile_image_viewport_space = '100' %}
            {% endif %}

            {% if columns_desktop == 4 %}
                {% set desktop_image_viewport_space = '25' %}
            {% elseif columns_desktop == 3 %}
                {% set desktop_image_viewport_space = '33' %}
            {% else %}
                {% set desktop_image_viewport_space = '50' %}
            {% endif %}

            {% set image_classes = 'js-item-image lazyautosizes lazyload img-absolute img-absolute-centered fade-in' %}
            {% set data_expand = show_image_slider ? '50' : '-10' %}

            {% set floating_elements %}
                {% if not reduced_item %}
                    {% include 'snipplets/labels.tpl' %}
                {% endif %}
                {% if settings.quick_shop and not reduced_item %}
                    <div class="item-actions mt-3">
                        {% if product.available and product.display_price %}
                            {% if product.variations %}

                                {# Open quickshop popup if has variants #}

                                <a data-toggle="#quickshop-modal" data-modal-url="modal-fullscreen-quickshop" href="#" class="js-quickshop-modal-open js-fullscreen-modal-open {% if slide_item %}js-quickshop-slide{% endif %} js-modal-open btn btn-primary btn-medium d-block item-btn-quickshop" title="{{ 'Compra rápida de' | translate }} {{ product.name }}" aria-label="{{ 'Compra rápida de' | translate }} {{ product.name }}" data-component="product-list-item.add-to-cart" data-component-value="{{product.id}}">{% include "snipplets/svg/bag.tpl" with {svg_custom_class:'icon-inline item-quickshop-icon'} %}</a>
                            {% else %}
                                {# If not variants add directly to cart #}
                                <form class="js-product-form d-block" method="post" action="{{ store.cart_url }}">
                                    <input type="hidden" name="add_to_cart" value="{{product.id}}" />
                                    {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                                    {% set texts = {'cart': "Comprar", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}

                                    <div class="js-item-submit-container item-submit-container btn btn-primary btn-small p-0">
                                        <input type="submit" class="js-addtocart js-prod-submit-form js-quickshop-icon-add btn btn-primary btn-small item-btn-quickshop {{ state }}" value="" alt="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %} data-component="product-list-item.add-to-cart" data-component-value="{{ product.id }}"/>
                                        {% include "snipplets/svg/bag.tpl" with {svg_custom_class: 'js-quickshop-bag icon-inline item-quickshop-icon'} %}
                                    </div>

                                    {# Fake add to cart CTA visible during add to cart event #}

                                    {% include 'snipplets/placeholders/button-placeholder.tpl' with {direct_add: true} %}
                                </form>
                            {% endif %}
                        {% endif %}
                    </div>
                {% endif %}
            {% endset %}

            
            
            {{ component(
                'product-item-image', {
                    image_lazy: true,
                    image_lazy_js: true,
                    image_thumbs: ['small', 'medium', 'large', 'huge', 'original'],
                    image_data_expand: data_expand,
                    image_secondary_data_sizes: 'auto',
                    image_sizes: '(max-width: 768px)' ~ mobile_image_viewport_space ~ 'vw, (min-width: 769px)' ~ desktop_image_viewport_space ~ 'vw',
                    secondary_image: show_secondary_image,
                    slider: show_image_slider,
                    placeholder: true,
                    custom_content: floating_elements,
                    slider_pagination_container: true,
                    svg_sprites: false,
                    product_item_image_classes: {
                        image_container: 'item-image' ~ (columns == 1 ? ' item-image-big') ~ (show_image_slider ? ' item-image-slider'),
                        image_padding_container: 'js-item-image-padding position-relative d-block',
                        image: image_classes,
                        image_featured: 'item-image-featured',
                        image_secondary: 'item-image-secondary',
                        slider_container: 'swiper-container position-absolute h-100 w-100',
                        slider_wrapper: 'swiper-wrapper',
                        slider_slide: 'swiper-slide item-image-slide',
                        slider_control_pagination_container: 'item-slider-pagination-container d-md-none',
                        slider_control_pagination: 'swiper-pagination item-slider-pagination',
                        slider_control: 'icon-inline icon-lg',
                        slider_control_prev_container: 'swiper-button-prev ' ~ slider_controls_container_class,
                        slider_control_next_container: 'swiper-button-next ' ~ slider_controls_container_class,
                        more_images_message: 'item-more-images-message',
                        placeholder: 'placeholder-fade',
                    },
                    custom_control_prev: control_prev,
                    custom_control_next: control_next,
                })
            }}
            
            {% if settings.quick_shop and product.available and product.display_price and product.variations and not reduced_item %}

                {# Hidden product form to update item image and variants: Also this is used for quickshop popup #}

                <div class="js-item-variants hidden">
                    <form class="js-product-form" method="post" action="{{ store.cart_url }}">
                        <input type="hidden" name="add_to_cart" value="{{product.id}}" />
                        {% if product.variations %}
                            {% include "snipplets/product/product-variants.tpl" with {quickshop: true} %}
                        {% endif %}
                        {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                        {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}

                        {# Add to cart CTA #}

                        {% set show_product_quantity = product.available and product.display_price %}

                        <div class="form-row">

                            {% if show_product_quantity %}
                                {% include "snipplets/product/product-quantity.tpl" %}
                            {% endif %}

                            <div class="{% if show_product_quantity %}col-8{% else %}col-12{% endif %}">

                                <input type="submit" class="js-addtocart js-prod-submit-form btn-add-to-cart btn btn-primary btn-big w-100 mb-2 {{ state }}" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %} />

                                {# Fake add to cart CTA visible during add to cart event #}

                                {% include 'snipplets/placeholders/button-placeholder.tpl' with {custom_class: "mb-1 btn-big"} %}
                            </div>
                        </div>
                    </form>
                </div>

            {% endif %}
            {% set show_labels = not product.has_stock or product.compare_at_price or product.hasVisiblePromotionLabel %}
            <div class="item-description {% if columns_mobile == 2 and settings.product_grid_asymmetric %}pb-0 pb-md-3{% endif %}" data-store="product-item-info-{{ product.id }}">
                <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" aria-label="{{ product.name }}" class="item-link">
                    <div class="js-item-name item-name mb-2" data-store="product-item-name-{{ product.id }}">{{ product.name }}</div>
                    {% if product.display_price %}
                        <div class="item-price-container mb-1" data-store="product-item-price-{{ product.id }}">
                            <span class="js-price-display item-price {% if reduced_item %}mr-1{% endif %}" data-product-price="{{ product.price }}">
                                {{ product.price | money }}
                            </span>
                            {% if not reduced_item %}
                                <span class="js-compare-price-display price-compare" {% if not product.compare_at_price or not product.display_price %}style="display:none;"{% else %}style="display:inline-block;"{% endif %}>
                                    {{ product.compare_at_price | money }}
                                </span>
                            {% endif %}
                            {{ component('payment-discount-price', {
                                    visibility_condition: settings.payment_discount_price and not reduced_item,
                                    location: 'product',
                                    container_classes: "font-smallest mt-1 mb-2",
                                }) 
                            }}
                        </div>
                    {% endif %}

                    {% if settings.product_installments and not reduced_item %}
                        {{ component('installments', {'location' : 'product_item' , 'short_wording' : true, container_classes: { installment: "item-installments"}}) }}
                    {% endif %}
                </a>
                
                <a href="{{ product_url_with_selected_variant }}" 
                    class="btn btn-primary btn-small d-block mt-2 bt-comprar-dna">
                    COMPRAR
                </a>

            </div>
            {% if settings.quick_shop and not reduced_item %}
                </div>{# This closes the quickshop tag #}
            {% endif %}

            {# Structured data to provide information for Google about the product content #}
            {{ component('structured-data', {'item': true}) }}
        </div>
    </div>
{% if slide_item %}
    </div>
{% endif %}