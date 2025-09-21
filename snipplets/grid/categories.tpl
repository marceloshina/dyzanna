{% if not modal %}
    <div class="visible-when-content-ready">
        {% if parent_category and parent_category.id!=0 %}
            <a href="{{ parent_category.url }}" title="{{ parent_category.name }}" class="category-back d-block{% if filter_categories %} mb-4{% endif %}">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline mr-2 svg-icon-text"} %}{{ parent_category.name }}</a>
        {% endif %}
{% endif %}

        {% if filter_categories %}
            {% if not modal %}
                <div class="d-none d-md-block">
            {% endif %}
                {% if modal %}
                    <div class="h6 font-body my-3">{{ "Categorías" | translate }}</div>
                {% endif %}
                <ul class="js-accordion-container list-unstyled mb-3 pb-2"> 
                    {% for category in filter_categories %}
                        <li data-item="{{ loop.index }}" class="mb-2 pb-md-1"><a href="{{ category.url }}" title="{{ category.name }}" class="btn-link font-small no-underline">{{ category.name }}</a></li>

                        {% if loop.index == 8 and filter_categories | length > 8 %}
                            <div class="js-accordion-content" style="display: none;">
                        {% endif %}
                        {% if loop.last and filter_categories | length > 8 %}
                            </div>
                            <a href="#" class="js-accordion-toggle d-inline-block btn btn-link my-1">
                                <span class="js-accordion-toggle-inactive">{{ 'Ver más' | translate }}</span>
                                <span class="js-accordion-toggle-active" style="display: none;">{{ 'Ver menos' | translate }}</span>
                            </a>
                        {% endif %}
                    {% endfor %}
                </ul>
           {% if not modal %}
                </div>
            {% endif %}
        {% endif %}
{% if not modal %}
    </div>
{% endif %}