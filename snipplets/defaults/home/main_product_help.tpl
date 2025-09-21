<section class="section-featured-home" data-store="home-product-main">
	<div class="container">
		<div class="row">
			<div class="col-md-10 offset-md-1">
				<div class="row">
					<div class="col-md-6 pr-0 pr-md-3">
						<div class="product-image-container">
							<div class="js-swiper-product-demo swiper-container">
								<div class="labels labels-product-slider">
									<div class="label label-accent">{{ "35% OFF" | translate }}</div>
								</div>
								<div class="swiper-wrapper">
									 <div class="swiper-slide slider-slide product-slider-image" data-image="0" data-image-position="0">
										{{ component('placeholders/product-placeholder',{
												type: 'dress',
											})
										}}
									 </div>
									 <div class="swiper-slide slider-slide product-slider-image" data-image="1" data-image-position="1">
										{{ component('placeholders/product-placeholder',{
												type: 'dress',
												color: 'red',
											})
										}}
									 </div>
									 <div class="swiper-slide slider-slide product-slider-image" data-image="2" data-image-position="2">
										{{ component('placeholders/product-placeholder',{
												type: 'dress',
												color: 'green',
											})
										}}
									 </div>
								</div>
							</div>
							<div class="product-paginator ml-md-0 text-left text-md-center mt-3">
								<div class="js-swiper-product-prev-demo swiper-button-prev d-inline-block svg-icon-text">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-xs"} %}</div>
								<div class="js-swiper-product-pagination-demo swiper-pagination-fraction font-small d-inline-block"></div>
								<div class="js-swiper-product-next-demo swiper-button-next d-inline-block svg-icon-text">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-xs"} %}</div>
							</div>
						</div>
					</div>
					<div class="col pt-4 pt-md-5">
						
						<h2 class="mb-3">{{ "Producto de ejemplo" | translate }}</h2>

						{# Product price #}

						{% set product_can_show_installments = product.show_installments and product.display_price %}

						{% if store.country == 'BR' %}
							<div class="price-container mb-3">
								<span class="d-inline-block mr-1">
									<div class="js-price-display h4 font-weight-normal" id="price_display">{{"18200" | money }}</div>
								</span>
								<span class="d-inline-block">
								   <span id="compare_price_display" class="js-compare-price-display price-compare h4 font-weight-normal" style="display:block;">{{"28000" | money }}</span>
								</span>
							</div>
						{% else %}
							<div class="price-container mb-3">
								<span class="d-inline-block mr-1">
									<div class="js-price-display h4 font-weight-normal" id="price_display">{{"182000" | money }}</div>
								</span>
								<span class="d-inline-block">
								   <span id="compare_price_display" class="js-compare-price-display price-compare h4 font-weight-normal" style="display:block;">{{"280000" | money }}</span>
								</span>
							</div>
						{% endif %}

						{# Product installments #}

						<div href="#installments-modal" class="js-product-payments-container row mb-4">
							<span class="js-max-installments-container js-max-installments col">
								<span class="float-left mr-2">
									{% include "snipplets/svg/credit-card.tpl" with {svg_icon_underline: true, svg_custom_class : "icon-inline svg-icon-text icon-lg"} %}
								</span>
								<span class="d-table text-inline">
									<span>{{ "Hasta 12 cuotas" | translate }}</span>
								</span>
							</span>
						</div>

						{# Product form, includes: Variants, CTA and Shipping calculator #}

						<form id="product_form" class="js-product-form" method="post" action="">
							<input type="hidden" name="add_to_cart" value="2243561" />

							<div class="js-product-variants row">
								<div class="col col-md-6">
									<div class="form-group ">
										<label class="form-label " for="variation_1">{{ "Color" | translate }}</label>
										<select id="variation_1" class="form-select js-variation-option js-refresh-installment-data  " name="variation[0]">
											<option value="{{ "Verde" | translate }}">{{ "Verde" | translate }}</option>
											<option value="{{ "Rojo" | translate }}">{{ "Rojo" | translate }}</option>
										</select>
										<div class="form-select-icon">
											{% include "snipplets/svg/chevron-down.tpl" with {svg_custom_class: "icon-inline icon-w-14 icon-lg"} %}
										</div>
									</div>
								</div>
							</div>
							<div class="form-row mb-2">
								<div class="col-4">
									{% embed "snipplets/forms/form-input.tpl" with{
									type_number: true, input_value: '1', 
									input_name: 'quantity' ~ item.id, 
									input_custom_class: 'js-quantity-input', 
									input_label: false, 
									input_append_content: true, 
									input_group_custom_class: 'js-quantity form-quantity form-quantity-product', 
									form_control_container_custom_class: 'col', 
									form_control_quantity: true,
									input_min: '1'} %}
										{% block input_prepend_content %}
										<div class="row m-0 align-items-center">
											<span class="js-quantity-down form-quantity-icon btn">
												{% include "snipplets/svg/minus.tpl" with {svg_custom_class: "icon-inline icon-w-12 icon-lg"} %}
											</span>
										{% endblock input_prepend_content %}
										{% block input_append_content %}
											<span class="js-quantity-up form-quantity-icon btn">
												{% include "snipplets/svg/plus.tpl" with {svg_custom_class: "icon-inline icon-w-12 icon-lg"} %}
											</span>
										</div>
										{% endblock input_append_content %}
									{% endembed %}
								</div>
								<div class="col-8">
									<input type="submit" class="js-addtocart js-prod-submit-form btn btn-primary btn-big btn-block cart" value="{{ 'Agregar al carrito' | translate }}" />
								</div>
							</div>

						 </form>

						{# Product description #}

						<div class="product-description user-content mb-4">
							<p>{{ "¡Este es un producto de ejemplo! Para poder probar el proceso de compra, debes" | translate }}
								<a href="/admin/products" target="_top">{{ "agregar tus propios productos." | translate }}</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>