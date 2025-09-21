<div class="js-accordion-container js-toggle-branches">
    <a href="#" class="js-accordion-toggle">
        <div class="form-label mb-1">
            {% if store.branches|length > 1 %}
                {{ 'Nuestros locales' | translate }}
            {% else %}
                {{ 'Nuestro local' | translate }}
            {% endif %}
        </div>
        <div class="btn-link">
            <span class="js-accordion-toggle-inactive">
                {{ 'Ver opciones' | translate }}
            </span>
            <span class="js-accordion-toggle-active" style="display: none;">
                {{ 'Ocultar opciones' | translate }}
            </span>
        </div>
    </a>
    <div class="js-accordion-content" style="display: none;">
    {% if not product_detail %}
        <div class="radio-buttons-group">
    {% else %}
        <div class="list">
    {% endif %}
            <ul class="radio-button-container list-unstyled {% if product_detail %}mt-4{% else %}mt-3{% endif %}">

                {% for branch in store.branches %}
                    <li class="{% if product_detail %}list-item list-item-shipping radio-button{% else %}radio-button-item{% endif %}" data-store="branch-item-{{ branch.code }}">

                        {# If cart use radiobutton #}

                        {% if not product_detail %}
                            <label class="js-shipping-radio js-branch-radio radio-button" data-loop="branch-radio-{{loop.index}}">
                        
                                <input 
                                class="js-branch-method {% if cart.shipping_data.code == branch.code %} js-selected-shipping-method {% endif %} shipping-method" 
                                data-price="0" 
                                {% if cart.shipping_data.code == branch.code %}checked{% endif %} type="radio" 
                                value="{{branch.code}}" 
                                data-name="{{ branch.name }} - {{ branch.extra }}"
                                data-code="{{branch.code}}" 
                                data-cost="{{ 'Gratis' | translate }}"
                                name="option" 
                                style="display:none">
                                <div class="shipping-option row-fluid radio-button-content">
                                   <div class="radio-button-icons-container">
                                        <span class="radio-button-icons">
                                            <span class="radio-button-icon unchecked"></span>
                                            <span class="radio-button-icon checked"></span>
                                        </span>
                                    </div>
                        {% endif %}
                                    <div class="list-item-icon-container">
                                        <span class="list-item-icon"></span>
                                    </div>
                                    <div class="{% if product_detail %}list-item-content{% else %}radio-button-label{% endif %}">
                                        <div class="row no-gutters">
                                            <div class="col font-small {% if not product_detail %}px-0{% endif %}">
                                                <div>{{ branch.name }} - {{ branch.extra }}</div>
                                            </div>
                                            <div class="col-auto text-right">
                                                <p class="text-accent mb-0 d-inline-block">{{ 'Gratis' | translate }}</p>
                                            </div>
                                        </div>
                                    </div>
                        {% if not product_detail %}
                                </div>
                            </label>
                        {% endif %}
                    </li>
                {% endfor %}
            </ul>
        </div>
    </div>
</div>