{# Set related products classes #}

{% set title_container_class = 'mb-3' %}
{% set title_class = 'h5 mb-0' %}
{% set slider_container_class = 'swiper-container' %}
{% set swiper_wrapper_class = 'swiper-wrapper' %}
{% set slider_control_pagination_class = 'swiper-pagination-fraction font-small d-inline-block' %}
{% set slider_controls_container_class = 'd-none d-md-block mt-2 row-grid' %}
{% set slider_control_class = 'icon-inline icon-xs' %}
{% set slider_control_container_class = 'd-inline-block svg-icon-text' %}
{% set slider_control_prev_class = 'swiper-button-prev ' ~ slider_control_container_class %}
{% set slider_control_next_class = 'swiper-button-next ' ~ slider_control_container_class %}
{% set control_prev = include ('snipplets/svg/chevron-left.tpl', {svg_custom_class: slider_control_class}) %}
{% set control_next = include ('snipplets/svg/chevron-right.tpl', {svg_custom_class: slider_control_class}) %}

{# Related cart products #}

{% set related_section_id = 'related-products-notification' %}

{% set related_products = related_products_list | length > 0 %}

{% if related_products %}
    {{ component(
        'products-section',{
            title: 'Sumá a tu compra' | translate,
            id: related_section_id,
            data_component: related_section_id,
            products_amount: related_products_list | length,
            products_array: related_products_list,
            product_template_path: 'snipplets/grid/item.tpl',
            product_template_params: {'slide_item': true, 'reduced_item': true, 'appear_transition': false},
            slider_controls_position: 'with-section-title',
            slider_controls_container: true,
            slider_pagination: true,
            svg_sprites: false,
            section_classes: {
                section: 'js-related-products-notification mt-4 position-relative',
                title_container: title_container_class,
                title: title_class,
                products_container: 'related-products-notification-container mx-md-0',
                slider_container: 'js-swiper-related-products-notification ' ~ slider_container_class,
                slider_wrapper: swiper_wrapper_class,
                slider_control_pagination: 'js-swiper-related-notification-pagination ' ~ slider_control_pagination_class,
                slider_controls_container: slider_controls_container_class,
                slider_control_prev_container: 'js-swiper-related-products-notification-prev ' ~ slider_control_prev_class,
                slider_control_next_container: 'js-swiper-related-products-notification-next ' ~ slider_control_next_class,
            },
            custom_control_prev: control_prev,
            custom_control_next: control_next,
        })
    }}
{% endif %}
