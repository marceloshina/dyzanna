{% embed "snipplets/page-header.tpl" with {container: true} %}
    {% block page_header_text %}{{ "Mis direcciones" | translate }}{% endblock page_header_text %}
{% endembed %}

<section class="account-page mb-0">
    <div class="container-fluid">
        <div class="row">      
            {% for address in customer.addresses %}

                {# User addresses listed - Main Address #}

                {% if loop.first %}
                    <div class="col-md-4 col-12 mb-4">
                        <h5 class="mt-1">{{ 'Principal' | translate }}</h5>

                {# User addresses listed - Other Addresses #}

                {% elseif loop.index == 2 %}
                    <div class="col-md-4 col-12">
                        <h5 class="mt-1">{{ 'Otras direcciones' | translate }}</h5>

                {% endif %}

                        <h6 class="mb-3">{{ address.name }} {{ 'Editar' | translate | a_tag(store.customer_address_url(address), '', 'btn-link font-weight-normal float-right') }}</h6>
                        <p class="font-small">{{ address | format_address }}</p>

                {% if loop.first %} 
                        <a class="btn-link font-small" href="{{ store.customer_new_address_url }}"> {{ 'Agregar una nueva dirección' | translate }}</a>
                    </div>
                {% elseif loop.last %}
                    </div>
                {% endif %}
            {% endfor %}
        </div>
    </div>
</section>