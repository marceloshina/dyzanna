{% if settings.brands and settings.brands is not empty %}
	<section class="section-brands-home mr-3" data-store="home-brands">
		<div class="container-fluid">
			<div class="row align-items-center mb-3">
				<div class="col-md-4 mb-4 text-right text-md-left">
					{% if settings.brands_subtitle %}
						<h3 class="subtitle font-weight-normal mb-3">{{ settings.brands_subtitle }}</h3>
					{% endif %}
					{% if settings.brands_title %}
						<h2 class="h1 mb-4">{{ settings.brands_title }}</h2>
					{% endif %}
					<div class="js-swiper-brands-prev swiper-button-prev d-inline-block svg-icon-text">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-xs"} %}</div>
					<div class="js-swiper-brands-pagination swiper-pagination-fraction font-small d-inline-block"></div>
					<div class="js-swiper-brands-next swiper-button-next d-inline-block svg-icon-text">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-xs"} %}</div>
				</div>
				<div class="col-md-8">
					<div class="js-swiper-brands swiper-brands swiper-container text-center">
						<div class="js-swiper-brands-wrapper swiper-wrapper">
							{% for slide in settings.brands %}
								<div class="swiper-slide slide-container mt-0 my-2">
									{% if slide.link %}
										<a href="{{ slide.link | setting_url }}" title="{{ 'Marca {1} de' | translate(loop.index) }} {{ store.name }}" aria-label="{{ 'Marca {1} de' | translate(loop.index) }} {{ store.name }}">
									{% endif %}
										<img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ slide.image | static_url | settings_image_url('large') }}" class="lazyload brand-image" alt="{{ 'Marca {1} de' | translate(loop.index) }} {{ store.name }}">
									{% if slide.link %}
										</a>
									{% endif %}
								</div>
							{% endfor %}
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
{% endif %}
