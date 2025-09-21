{% if settings.pagination == 'infinite' %}
	{% paginate by 12 %}
{% else %}
	{% paginate by 24 %}
{% endif %}

{% embed "snipplets/page-header.tpl" with { breadcrumbs: false, container: true } %}
	{% block page_header_text %}
		{% if products %}
			{{ 'Resultados de búsqueda' | translate }}
		{% else %}
			{{ "No encontramos nada para" | translate }}<span class="ml-2">"{{ query }}"</span>
		{% endif %}
	{% endblock page_header_text %}
{% endembed %}

<section class="category-body">
	<div class="container-fluid">
		{% if products %}
			<h2 class="h4 mt-2 mb-5">
				{{ "Mostrando los resultados para" | translate }}<span class="ml-2">"{{ query }}"</span>
			</h2>
			{% if settings.grid_columns_desktop == '2'%}
				<div class="row">
					<div class="col-md-10 offset-md-1">
			{% endif %}
						<div class="js-product-table row row-grid products-grid">
							{% include 'snipplets/product_grid.tpl' %}
						</div>
			{% if settings.grid_columns_desktop == '2'%}
					</div>
				</div>
			{% endif %}
			{% if settings.pagination == 'infinite' %}
				{% set pagination_type_val = true %}
			{% else %}
				{% set pagination_type_val = false %}
			{% endif %}
			{% include "snipplets/grid/pagination.tpl" with {infinite_scroll: pagination_type_val} %}
		{% else %}
			<h2 class="h4 my-4 py-4">
				{{ "Escribilo de otra forma y volvé a intentar." | translate }}
			</h2>
		{% endif %}
	</div>
</section>