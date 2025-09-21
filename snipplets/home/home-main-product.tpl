{% if sections.featured.products %}
	{% if settings.main_product_type == 'random' %}
		{% set product_type = sections.featured.products | shuffle | take(1) %}
	{% else %}
		{% set product_type = sections.featured.products | take(1) %}
	{% endif %}

	{% for product in product_type %}
		<section id="single-product" class="js-product-container section-featured-home" data-variants="{{product.variants_object | json_encode }}" data-store="home-product-main">
			<div class="container">
				<div class="row">
					<div class="col-md-10 offset-md-1">
						<div class="row">
							<div class="col-md-6{% if product.images_count > 1 %} pr-0 pr-md-3{% endif %}">
								{% include 'snipplets/product/product-image.tpl' with { home_main_product: true } %}
							</div>
							<div class="col pt-4 pt-md-5" data-store="product-info-{{ product.id }}">
								{% include 'snipplets/product/product-form.tpl' with { home_main_product: true } %}
								{% if product.description is not empty %}
									{# Product description #}
									<div class="js-product-description product-description user-content">
										{{ product.description }}
									</div>
									<div class="js-view-description" style="display: none;">
										<div class="btn-link mt-2">
											{% if settings.positive_color_background %}
												{% set view_description_icon_class = 'icon-inline icon-lg svg-icon-invert ml-1' %}
											 {% else %}
												{% set view_description_icon_class = 'icon-inline icon-lg svg-icon-text ml-1' %}
											{% endif %}
											<span class="js-view-more">
												{{ "Ver más" | translate }}
											</span>
											<span class="js-view-less" style="display: none;">
												{{ "Ver menos" | translate }}
											</span>
										</div>
									</div>
								{% endif %}
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	{% endfor %}
{% endif %}
