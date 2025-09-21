{# Brands that work as examples #}

<section class="position-relative py-5 mr-3" data-store="home-brands">
	<div class="container-fluid">
		<div class="row align-items-center mb-3">
			<div class="col-md-4 mb-4 text-right text-md-left">
				<h2 class="h1 mb-4">{{ 'Marcas' | translate }}</h2>
				<div class="js-swiper-brands-prev-demo swiper-button-prev d-inline-block svg-icon-text">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-xs"} %}</div>
				<div class="js-swiper-brands-pagination-demo swiper-pagination-fraction font-small d-inline-block"></div>
				<div class="js-swiper-brands-next-demo swiper-button-next d-inline-block svg-icon-text">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-xs"} %}</div>
			</div>
			<div class="col-md-8">
				<div class="js-swiper-brands-demo swiper-brands swiper-container text-center">
					<div class="js-swiper-brands-wrapper swiper-wrapper">
						{% for i in 1..6 %}
							<div class="swiper-slide slide-container mt-0 my-2">
								<div class="brand-image-placeholder">
								{{ component('placeholders/brand-placeholder' , {
									placeholder_classes: {
										svg_class: 'brand-image',
									}})
								}}
								</div>
							</div>
						{% endfor %}
					</div>
				</div>
			</div>
		</div>
		{% if not params.preview %}
			<div class="placeholder-overlay transition-soft">
				<div class="placeholder-info p-2">
					{% include "snipplets/svg/edit.tpl" with {svg_custom_class: "icon-inline icon-3x"} %}
					<div class="placeholder-description font-small-xs my-2">
						{{ "Podés subir logos de tus marcas desde" | translate }} <strong>"{{ "Carrusel de marcas" | translate }}"</strong>
					</div>
					<a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small placeholder-button">{{ "Editar" | translate }}</a>
				</div>
			</div>
		{% endif %}
	</div>
</section>