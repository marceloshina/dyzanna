<div class="js-cart-item {% if item.product.is_non_shippable %}js-cart-item-non-shippable{% else %}js-cart-item-shippable{% endif %} item cart-item row {% if cart_page %}align-items-md-center{% endif %}" data-item-id="{{ item.id }}" data-store="cart-item-{{ item.product.id }}" data-component="cart.line-item">

  {# Cart item image #}
  <div class="{% if cart_page %}col-3 col-md-1{% else %}cart-item-image-col col-auto pr-0{% endif %}">
    <a href="{{ item.url }}">
      <img src="{{ item.featured_image | product_image_url('medium') }}" class="img-fluid {% if not cart_page %}cart-item-image{% endif %}" />
    </a>
  </div>
  <div class="col {% if cart_page %}col-md-10 pl-md-3{% else %}col align-items-center{% endif %}">
    <div class="{% if cart_page %}row align-items-md-center{% else %}w-100{% endif %}">
      
      <div class="{% if cart_page %}col-10 col-md-5 pl-0{% else %}cart-item-name{% endif %}">

        {# Cart item name #}

        <div class="mb-3 {% if cart_page %}mb-md-0 col-md-8 font-md-body{% endif %}" data-component="line-item.name">
          <a href="{{ item.url }}" data-component="name.short-name">
            {{ item.short_name }}
          </a>
          <small data-component="name.short-variant-name">{{ item.short_variant_name }}</small>
          {{ component(
              'cart-labels', {
              group: true,
              labels_classes: {
                group: 'mt-2',
                label: 'text-accent font-small mb-1',
              },
            })
          }}
        </div>
      </div>

      {# Cart item quantity controls #}

      {% set cart_quantity_class = '' %}
      {% if cart_page %}
        {% set cart_quantity_class = 'float-md-none m-auto ' %}
      {% endif %}

      <div class="cart-item-quantity {% if cart_page %}col-7 col-md-3 text-center{% endif %}" data-component="line-item.subtotal">
        {% set cart_qty_margin = '' %}
        {% if cart_page %}
          {% set cart_qty_margin = 'm-md-auto' %}
        {% endif %}
        {% embed "snipplets/forms/form-input.tpl" with{
          type_number: true, 
          input_value: item.quantity, 
          input_name: 'quantity[' ~ item.id ~ ']', 
          input_data_attr: 'item-id',
          input_data_val: item.id,
          input_group_custom_class: cart_quantity_class ~ ' float-left form-quantity cart-item-quantity small mb-0 ' ~ cart_qty_margin, 
          input_custom_class: 'js-cart-quantity-input text-center', 
          input_label: false, input_append_content: true, 
          data_component: 'quantity.value',
          form_control_container_custom_class: 'js-cart-quantity-container col px-1'} %}
            {% block input_prepend_content %}
            <div class="row m-0 align-items-center ">
              <span class="js-cart-quantity-btn form-quantity-icon btn" onclick="LS.minusQuantity({{ item.id }}{% if not cart_page %}, true{% endif %})" data-component="quantity.minus">
                {% include "snipplets/svg/minus.tpl" with {svg_custom_class: "icon-inline icon-w-12 icon-xs"} %}
              </span>
            {% endblock input_prepend_content %}
            {% block input_append_content %}
              
              {# Always place this spinner before the quantity input #}
        
              <span class="js-cart-input-spinner cart-item-spinner" style="display: none;">
                {% include "snipplets/svg/spinner-third.tpl" with {svg_custom_class: "icon-inline icon-spin svg-icon-text"} %}
              </span>

              <span class="js-cart-quantity-btn form-quantity-icon btn" onclick="LS.plusQuantity({{ item.id }}{% if not cart_page %}, true{% endif %})" data-component="quantity.plus">
                {% include "snipplets/svg/plus.tpl" with {svg_custom_class: "icon-inline icon-w-12 icon-xs"} %}
              </span>
            </div>
            {% endblock input_append_content %}
        {% endembed %}
      </div>

      {% if cart_page %}
        {# Cart item unit price #}
        <span class="js-cart-item-unit-price cart-item-subtotal-short col-2 text-center d-none d-md-block" data-line-item-id="{{ item.id }}">{{ item.unit_price | money }}</span>
      {% endif %}

      {# Cart item subtotal #}
      <span class="js-cart-item-subtotal {% if cart_page %}col-5 col-md-2 text-right text-md-center mt-2 mt-md-0{% else %}cart-item-subtotal{% endif %}" data-line-item-id="{{ item.id }}" data-component="subtotal.value" data-component-value={{ item.subtotal | money }}'>{{ item.subtotal | money }}</span>
    </div>
  </div>

  {# Cart item delete #}
  <div class="cart-item-delete col-auto {% if cart_page %}position-relative-md col-md-1 text-md-center{% endif %} text-right" >
    <button type="button" class="btn btn-link" onclick="LS.removeItem({{ item.id }}{% if not cart_page %}, true{% endif %})" data-component="line-item.remove">
      {% include "snipplets/svg/times.tpl" with {svg_custom_class: "icon-inline icon-w-12"} %}
    </button>
  </div>
</div>