<div class="js-addtocart js-addtocart-placeholder btn btn-primary {% if direct_add %}btn-small item-btn-quickshop{% endif %} btn-block btn-transition {{ custom_class }} disabled" style="display: none;">
    <div class="d-inline-block">
        <span class="js-addtocart-text">
            {% if direct_add %}
                {% include "snipplets/svg/bag.tpl" with {svg_custom_class: 'js-quickshop-bag icon-inline item-quickshop-icon'} %}
            {% else %}
                {{ 'Agregar al carrito' | translate }}
            {% endif %}
        </span>
        <span class="js-addtocart-success transition-container">
            {% if direct_add %}
                {% include "snipplets/svg/check-thick.tpl" with {svg_custom_class: "icon-inline item-quickshop-icon"} %}
            {% else %}
                {{ '¡Listo!' | translate }}
            {% endif %}
        </span>
        <div class="js-addtocart-adding transition-container transition-icon">
            {% if direct_add %}
                {% include "snipplets/svg/spinner-third-thick.tpl" with {svg_custom_class: "icon-inline icon-spin item-quickshop-icon"} %}
            {% else %}
                {% include "snipplets/svg/spinner-third.tpl" with {svg_custom_class: "icon-inline icon-spin icon-loading mt-1"} %}
            {% endif %}
        </div>
    </div>
</div>