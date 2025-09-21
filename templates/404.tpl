{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}

{% if not show_help %}
	{% embed "snipplets/page-header.tpl" with {container: true} %}
		{% block page_header_text %}{{ "Error" | translate }} - {{ "404" | translate }}{% endblock page_header_text %}
	{% endembed %}
{% endif %}

<section id="page-error">
	<div class="container-fluid">
		<p class="mb-1">{{ "La página que estás buscando no existe." | translate }}</p></br>

		{% set related_products = sections.primary.products | take(4) | shuffle %}
		{% if related_products | length > 1 %}
			<div class="section-products-related">
				<h3 class="h5 mb-5">{{ "Quizás te interesen los siguientes productos." | translate }}</h3>
				<div class="{% if settings.grid_columns_desktop == '2'%}row{% endif %} row-grid products-grid">
					{% if settings.grid_columns_desktop == '2'%}
						<div class="col-md-10 offset-md-1">
					{% endif %}
							<div class="row row-grid">
								{% for related in related_products %}
									{% include 'snipplets/grid/item.tpl' with {product : related} %}
								{% endfor %}
							</div>
					{% if settings.grid_columns_desktop == '2'%}
						</div>
					{% endif %}
				</div>
			</div>
		{% endif %}
	</div>
</section>

{# Here we will add an example as a help, you can delete this after you upload your products #}
{% if show_help %}
	<div id="product-example">
		{% snipplet 'defaults/show_help_product.tpl' %}
	</div>
{% endif %}