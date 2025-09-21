{# Products featured that work as examples #}

{% if section_id == 'featured' %}
	{% set section_asymmetric = settings.featured_products_format == 'asymmetric' or settings.featured_products_format == 'asymmetric_slider' %}
	{% set section_columns_desktop = settings.featured_products_desktop %}
	{% set section_columns_mobile = settings.featured_products_mobile %}
{% elseif section_id == 'sale' %}
	{% set section_asymmetric = settings.sale_products_format == 'asymmetric' or settings.sale_products_format == 'asymmetric_slider' %}
	{% set section_columns_desktop = settings.sale_products_desktop %}
	{% set section_columns_mobile = settings.sale_products_mobile %}
{% elseif section_id == 'new' %}
	{% set section_asymmetric = settings.new_products_format == 'asymmetric' or settings.new_products_format == 'asymmetric_slider' %}
	{% set section_columns_desktop = settings.new_products_desktop %}
	{% set section_columns_mobile = settings.new_products_mobile %}
{% endif %}

{% set item_asymetric_class = section_asymmetric ? 'item-asymmetric ' %}
{% set item_even_asymetric_class = section_asymmetric ? 'item-even mt-md-5 pt-md-3 ' %}

<section class="section-featured-home" data-store="home-products-{{ section_id }}">
	<div class="container-fluid">
		<div class="row mb-3 pb-2">
			<div class="col-md-3 mb-4 pt-md-5">
				{% if section_asymmetric %}
					<div class="absolute-section-title{% if section_columns_mobile == 2 %} absolute-section-title-right{% endif %}">
				{% endif %}
						<h3 class="h1-huge mb-4">{{ products_title }}</h3>
				{% if section_asymmetric %}
					</div>
				{% endif %}
			</div>
			<div class="col-md-9">
				<div class="row row-grid">
					{% include 'snipplets/defaults/help_item.tpl' with {'help_item_1': true, 'section_columns_desktop': section_columns_desktop, 'section_columns_mobile': section_columns_mobile, item_class: 'mx-md-auto ' ~ item_asymetric_class} %}

					{% include 'snipplets/defaults/help_item.tpl' with {'help_item_2': true, 'section_columns_desktop': section_columns_desktop, 'section_columns_mobile': section_columns_mobile, item_class: 'mx-md-auto ' ~ item_asymetric_class ~ item_even_asymetric_class} %}

					{% include 'snipplets/defaults/help_item.tpl' with {'help_item_3': true, 'section_columns_desktop': section_columns_desktop, 'section_columns_mobile': section_columns_mobile, item_class: 'mx-md-auto ' ~ item_asymetric_class} %}
					
					{% include 'snipplets/defaults/help_item.tpl' with {'help_item_4': true, 'section_columns_desktop': section_columns_desktop, 'section_columns_mobile': section_columns_mobile, item_class: 'mx-md-auto ' ~ item_asymetric_class ~ item_even_asymetric_class} %}
				</div>
			</div>
		</div>
	</div>
</section>