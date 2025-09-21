{# Product quantity #}
        
<div class="col-4">
    {% embed "snipplets/forms/form-input.tpl" with{
    type_number: true, input_value: '1',
    input_name: 'quantity' ~ item.id, 
    input_custom_class: 'js-quantity-input', 
    input_label: false, 
    input_append_content: true, 
    input_group_custom_class: 'js-quantity form-quantity form-quantity-product mb-2', 
    form_control_container_custom_class: 'col',
    form_data_component: 'product.adding-amount',
    form_control_quantity: true,
    input_min: '1',
    data_component: 'adding-amount.value',
    input_aria_label: 'Cambiar cantidad' | translate } %}
        {% block input_prepend_content %}
        <div class="form-row m-0 align-items-center" data-component="product.quantity">
            <span class="js-quantity-down form-quantity-icon btn" data-component="product.quantity.minus">
                {% include "snipplets/svg/minus.tpl" with {svg_custom_class: "icon-inline icon-w-12 icon-xs"} %}
            </span>
        {% endblock input_prepend_content %}
        {% block input_append_content %}
            <span class="js-quantity-up form-quantity-icon btn" data-component="product.quantity.plus">
                {% include "snipplets/svg/plus.tpl" with {svg_custom_class: "icon-inline icon-w-12 icon-xs"} %}
            </span>
        </div>
        {% endblock input_append_content %}
    {% endembed %}
    {% if settings.product_stock %}
        <div class="font-small text-center">
            <span class="js-product-stock">{{ product.selected_or_first_available_variant.stock }}</span> {{ "en stock" | translate }}
        </div>
    {% endif %}
</div>