<div class="{% if template == 'password' %}text-center{% endif %}">
    {% for sn in ['instagram', 'facebook', 'youtube', 'tiktok', 'twitter', 'pinterest'] %}
        {% set sn_url = attribute(store,sn) %}
        {% if sn_url %}
            <a class="social-icon {% if template == 'password' %}mx-md-1{% endif %}" href="{{ sn_url }}" target="_blank" aria-label="{{ sn }} {{ store.name }}">
                {% if sn == "facebook" %}
                    {% set social_network = sn ~ '-f' %}
                {% else %}
                    {% set social_network = sn %}
                {% endif %}
                {% include "snipplets/svg/" ~ social_network ~ ".tpl" with {svg_custom_class: 'icon-inline icon-lg'} %}
            </a>
        {% endif %}
    {% endfor %}
</div>