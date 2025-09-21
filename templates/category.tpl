{% if category.name == "Produtos" %}

{% include 'snipplets/produto-personalizado.tpl' %}

{% else %}

{% set has_filters_available = products and has_filters_enabled and (filter_categories is not empty or product_filters is not empty) %}

{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}

{% if settings.pagination == 'infinite' %}
	{% paginate by 12 %}
{% else %}
	{% paginate by 24 %}
{% endif %}

{% if not show_help %}

{% set category_banner = (category.images is not empty) or ("banner-products.jpg" | has_custom_image) %}
{% set has_category_description_without_banner = not category_banner and category.description %}

{% if category_banner %}
    {% include 'snipplets/category-banner.tpl' %}
{% else %}
	<section class="container-fluid mt-3 d-md-none">
		{% embed "snipplets/page-header.tpl" %}
		    {% block page_header_text %}{{ category.name }}{% endblock page_header_text %}
		{% endembed %}
		{% if has_category_description_without_banner %} 
			<p class="mt-2 mb-3 d-block d-md-none">{{ category.description }}</p> 
		{% endif %}
	</section>
{% endif %}

{% set desktop_category_controls_transparent = settings.filters_desktop_modal and settings.head_fix_desktop and settings.head_transparent and settings.head_transparent_type == 'all' %}

<section class="js-category-controls-prev category-controls-sticky-detector"></section>
<section class="js-category-controls {% if desktop_category_controls_transparent %}js-category-controls-transparent-md category-controls-transparent-md{% endif %} category-controls {% if not settings.filters_desktop_modal %}position-relative-md{% endif %} visible-when-content-ready {% if category_banner %}mt-3{% endif %} {% if has_applied_filters %}mb-2{% else %}mb-3{% endif %} {% if has_category_description_without_banner %}mb-md-0{% endif %}">
	<div class="container-fluid category-controls-container">
		<div class="category-controls-row row">
			<div class="col d-none d-md-block">
				<div class="row align-items-center">
					{% if not category_banner %}
						<div class="col-auto">
							<div class="category-breadcrumbs-container d-none d-md-block">
								{% include "snipplets/breadcrumbs.tpl" %}
							</div>
							{% embed "snipplets/page-header.tpl" with {'breadcrumbs': false} %}
							    {% block page_header_text %}{{ category.name }}{% endblock page_header_text %}
							{% endembed %}
						</div>
					{% endif %}
				</div>
			</div>
			<div class="filter-chips-container visible-when-content-ready col-auto text-right d-none d-md-flex">
				{% include "snipplets/grid/filters.tpl" with {applied_filters: true} %}
			</div>
			{% if products and (not settings.filters_desktop_modal or not has_filters_available) %}
				<div class="col-auto {% if has_filters_available and not settings.filters_desktop_modal %}d-none d-md-block{% endif %} {% if settings.product_grid_asymmetric and settings.grid_columns_desktop != '3' %}filters-asymmetric{% endif %}">
					<a href="#" class="js-modal-open btn btn-link" data-toggle="#sort-by">
						{{ 'Ordenar' | t }}
					</a>
					{% embed "snipplets/modal.tpl" with{modal_id: 'sort-by', modal_class: 'bottom modal-centered modal-bottom-sheet modal-right-md', modal_position: 'bottom', modal_position_desktop: right, modal_width: 'docked-md', modal_transition: 'slide', modal_header_title: true} %}
						{% block modal_head %}
							{{'Ordenar' | translate }}
						{% endblock %}
						{% block modal_body %}
							{% include 'snipplets/grid/sort-by.tpl' with { list: "true"} %}
							<div class="js-sorting-overlay filters-overlay" style="display: none;">
								<div class="filters-updating-message">
									<span class="h5 mr-2">{{ 'Ordenando productos' | translate }}</span>
									<span>
										{% include "snipplets/svg/circle-notch.tpl" with {svg_custom_class: "icon-inline h5 icon-spin svg-icon-text"} %}
									</span>
								</div>
							</div>
						{% endblock %}
					{% endembed %}
				</div>
			{% endif %}
			{% if products and has_filters_available %}
				<div class="visible-when-content-ready col-auto {% if not settings.filters_desktop_modal %}d-md-none{% endif %} {% if settings.product_grid_asymmetric and settings.grid_columns_desktop != '3' %}filters-asymmetric{% endif %}">
					<a href="#" class="js-modal-open js-fullscreen-modal-open btn btn-link" data-toggle="#nav-filters" data-modal-url="modal-fullscreen-filters" data-component="filter-button">
						{{ 'Filtrar y ordenar' | t }}
					</a>
					{% embed "snipplets/modal.tpl" with{modal_id: 'nav-filters', modal_class: 'filters', modal_position: 'left', modal_position_desktop: 'right', modal_transition: 'slide', modal_header_title: true, modal_width: 'docked-md', modal_mobile_full_screen: 'true' } %}
						{% block modal_head %}
							{{'Filtrar y ordenar' | translate }}
						{% endblock %}
						{% block modal_body %}
							<div class="{% if not settings.filters_desktop_modal %}d-md-none{% endif %} mb-3 pb-3">
								<div class="h6 font-body mb-3">{{ 'Ordenar' | translate }}</div>
								{% include 'snipplets/grid/sort-by.tpl' %}
							</div>
							{% if has_filters_available %}
								{% if filter_categories is not empty %}
									{% include "snipplets/grid/categories.tpl" with {modal: true} %}
								{% endif %}
								{% if product_filters is not empty %}
							   		{% include "snipplets/grid/filters.tpl" with {modal: true} %}
							   	{% endif %}
								<div class="js-filters-overlay filters-overlay" style="display: none;">
									<div class="filters-updating-message">
										<span class="js-applying-filter h5 mr-2" style="display: none;">{{ 'Aplicando filtro' | translate }}</span>
										<span class="js-removing-filter h5 mr-2" style="display: none;">{{ 'Borrando filtro' | translate }}</span>
										<span class="js-filtering-spinner" style="display: none;">
											{% include "snipplets/svg/circle-notch.tpl" with {svg_custom_class: "icon-inline h5 icon-spin svg-icon-text"} %}
										</span>
									</div>
								</div>
							{% endif %}
							<div class="js-sorting-overlay filters-overlay" style="display: none;">
								<div class="filters-updating-message">
									<span class="h5 mr-2">{{ 'Ordenando productos' | translate }}</span>
									<span>
										{% include "snipplets/svg/circle-notch.tpl" with {svg_custom_class: "icon-inline h5 icon-spin svg-icon-text"} %}
									</span>
								</div>
							</div>
						{% endblock %}
					{% endembed %}
				</div>
			{% endif %}
			{% if products | length > 1 %}
				<div class="visible-when-content-ready col d-md-none text-right {% if settings.product_grid_asymmetric and settings.grid_columns_mobile == '2' %}products-amount-asymmetric{% endif %}">
					{{ products_count }} {{ 'productos' | translate }}
				</div>
			{% endif %}
		</div>
	</div>
</section>
{% if has_category_description_without_banner %} 
	<p class="mb-4 container-fluid d-none d-md-block">{{ category.description }}</p> 
{% endif %}
<div class="container-fluid visible-when-content-ready d-md-none {% if has_applied_filters %}pb-2{% endif %}">
	{% include "snipplets/grid/filters.tpl" with {mobile: true, applied_filters: true} %}
</div>



<section class="category-body mt-2 mt-md-{% if settings.filters_desktop_modal or (not settings.filters_desktop_modal and not has_filters_available) %}0{% else %}4 pt-md-1{% endif %} 
{% if category.id == 30864497 %}bg1{% endif %} 
{% if category.id == 32347514 %}bg2{% endif %} 
{% if category.id == 31847990 %}bg3{% endif %}
">

	<div class="container-fluid">
		<div class="row {% if settings.grid_columns_desktop == '3' %}row-md{% endif %}">
			{% if has_filters_available and not settings.filters_desktop_modal %} 
				<div class="col col-md-2 d-none d-md-block visible-when-content-ready">
					{% if products %}
						{% if filter_categories is not empty %}
							{% include "snipplets/grid/categories.tpl" %}
						{% endif %}
						{% if product_filters is not empty %}	   
							{% include "snipplets/grid/filters.tpl" %}
						{% endif %}
					{% endif %}
				</div>
			{% endif %}
			<div class="col {% if settings.filters_desktop_modal and settings.grid_columns_desktop == '2'%}col-md-10 offset-md-1 mt-md-4{% endif %} {% if not settings.filters_desktop_modal %}pr-md-0{% endif %}" data-store="category-grid-{{ category.id }}">
				{% if products %}
					<div class="js-product-table row row-grid products-grid">
						{% include 'snipplets/product_grid.tpl' %}
					</div>
					{% if settings.pagination == 'infinite' %}
						{% set pagination_type_val = true %}
					{% else %}
						{% set pagination_type_val = false %}
					{% endif %}

					{% include "snipplets/grid/pagination.tpl" with {infinite_scroll: pagination_type_val} %}
				{% else %}
					<div class="h6 text-center" data-component="filter.message">
						{{(has_filters_enabled ? "No tenemos resultados para tu búsqueda. Por favor, intentá con otros filtros." : "Próximamente") | translate}}
					</div>
				{% endif %}
			</div>
		</div>
	</div>
</section>
{% elseif show_help %}
	{# Category Placeholder #}
	{% include 'snipplets/defaults/show_help_category.tpl' %}
{% endif %}

{% endif %}