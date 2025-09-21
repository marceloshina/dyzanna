{% set newsletter_contact_error = contact.type == 'newsletter' and not contact.success %}

{% if settings.news_show %}
    <div class="js-newsletter newsletter">
        {% if settings.footer_menus_toggle %}
            <div class="js-accordion-container">
                <a href="#" class="js-accordion-toggle-mobile d-block">
        {% endif %}
            {% if settings.news_title %}
                <div class="font-small opacity{% if settings.footer_menus_toggle %}-md{% endif %}-50 d-inline-block mb-md-4">{{ settings.news_title }}</div>
            {% endif %}
        {% if settings.footer_menus_toggle %}
                <span class="d-md-none">
                    <span class="js-accordion-toggle-inactive">
                        {% include "snipplets/svg/chevron-down.tpl" with {svg_custom_class: "icon-inline icon-w-14 icon-md ml-2"} %}
                    </span>
                    <span class="js-accordion-toggle-inactive" style="display: none;">
                        {% include "snipplets/svg/chevron-up.tpl" with {svg_custom_class: "icon-inline icon-w-14 icon-md ml-2"} %}
                    </span>
                </span>
            </a>
            <div class="js-accordion-content js-accordion-content-mobile">
        {% endif %}
            <form class="pt-4 pt-md-0" method="post" action="/winnie-pooh" onsubmit="this.setAttribute('action', '');" data-store="newsletter-form">
                <div class="newsletter-form input-append position-relative">
                    {% embed "snipplets/forms/form-input.tpl" with{input_for: 'email', type_email: true, input_name: 'email', input_id: 'email', input_placeholder: 'Email' | translate, input_custom_class: '', input_aria_label: 'Email' | translate } %}
                    {% endembed %}
                    <div class="winnie-pooh" style="display: none;">
                        <label for="winnie-pooh-newsletter">{{ "No completar este campo" | translate }}</label>
                        <input id="winnie-pooh-newsletter" type="text" name="winnie-pooh"/>
                    </div>
                    <input type="hidden" name="name" value="{{ "Sin nombre" | translate }}" />
                    <input type="hidden" name="message" value="{{ "Pedido de inscripción a newsletter" | translate }}" />
                    <input type="hidden" name="type" value="newsletter" />
                    <input type="submit" name="contact" class="btn btn-medium btn-append" value="{{ "Enviar" | translate }}" />
                    {% include "snipplets/svg/plus.tpl" with {svg_custom_class: "icon-inline newsletter-btn"} %}
                </div>
            </form>
            {% if contact and contact.type == 'newsletter' %}
                {% if contact.success %}
                    <div class="alert alert-success">{{ "¡Gracias por suscribirte! A partir de ahora vas a recibir nuestras novedades en tu email" | translate }}</div>
                {% else %}
                    <div class="alert alert-danger">{{ "Necesitamos tu email para enviarte nuestras novedades." | translate }}</div>
                {% endif %}
            {% endif %}
        {% if settings.footer_menus_toggle %}
                </div>
            </div>
        {% endif %}
    </div>
{% endif %}