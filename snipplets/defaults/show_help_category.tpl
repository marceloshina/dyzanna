<section class="category-header section-margin">
	<div class="container-fluid">
		<div class="row align-items-center mb-md-5 mb-3">
			<div class="col">
				{% embed "snipplets/page-header.tpl" %}
					{% block page_header_text %}{{ category.name }}{% endblock page_header_text %}
				{% endembed %}
			</div>
		</div>
	</div>
</section>
<section class="category-body mt-2 mt-md-4 pt-md-1">
	<div class="container-fluid">
		<div class="row">
			<div class="col">
				{% set section_asymmetric = settings.product_grid_asymmetric %}
				{% set item_even_asymetric_class = section_asymmetric ? 'item-even mt-md-5 pt-md-3 ' %}
				<div class="js-product-table row row-grid products-grid">
					{% include 'snipplets/defaults/help_item.tpl' with {'help_item_1': true, 'section_columns_desktop': section_columns_desktop, 'section_columns_mobile': section_columns_mobile, item_class: 'mx-md-auto ' ~ item_asymetric_class} %}

					{% include 'snipplets/defaults/help_item.tpl' with {'help_item_2': true, 'section_columns_desktop': section_columns_desktop, 'section_columns_mobile': section_columns_mobile, item_class: 'mx-md-auto ' ~ item_asymetric_class ~ item_even_asymetric_class} %}

					{% include 'snipplets/defaults/help_item.tpl' with {'help_item_3': true, 'section_columns_desktop': section_columns_desktop, 'section_columns_mobile': section_columns_mobile, item_class: 'mx-md-auto ' ~ item_asymetric_class} %}

					{% include 'snipplets/defaults/help_item.tpl' with {'help_item_4': true, 'section_columns_desktop': section_columns_desktop, 'section_columns_mobile': section_columns_mobile, item_class: 'mx-md-auto ' ~ item_asymetric_class ~ item_even_asymetric_class} %}

					{% include 'snipplets/defaults/help_item.tpl' with {'help_item_5': true, 'section_columns_desktop': section_columns_desktop, 'section_columns_mobile': section_columns_mobile, item_class: 'mx-md-auto ' ~ item_asymetric_class} %}

					{% include 'snipplets/defaults/help_item.tpl' with {'help_item_6': true, 'section_columns_desktop': section_columns_desktop, 'section_columns_mobile': section_columns_mobile, item_class: 'mx-md-auto ' ~ item_asymetric_class ~ item_even_asymetric_class} %}

					{% include 'snipplets/defaults/help_item.tpl' with {'help_item_7': true, 'section_columns_desktop': section_columns_desktop, 'section_columns_mobile': section_columns_mobile, item_class: 'mx-md-auto ' ~ item_asymetric_class} %}
					
					{% include 'snipplets/defaults/help_item.tpl' with {'help_item_8': true, 'section_columns_desktop': section_columns_desktop, 'section_columns_mobile': section_columns_mobile, item_class: 'mx-md-auto ' ~ item_asymetric_class ~ item_even_asymetric_class} %}
				</div>
			</div>
		</div>
	</div>
</section>