{# Slider that work as example #}

<div class="section-slider">
	<div class="js-home-empty-slider nube-slider-home swiper-container">
		<div class="swiper-wrapper">
			<div class="swiper-slide slide-container">
				{{ component('placeholders/banner-placeholder')}}
			</div>
			<div class="swiper-slide slide-container">
				{{ component('placeholders/banner-placeholder')}}
			</div>
			<div class="swiper-slide slide-container">
				{{ component('placeholders/banner-placeholder')}}
			</div>
		</div>
		{% if not params.preview %}
			<div class="placeholder-overlay placeholder-slider transition-soft">
				<div class="placeholder-info">
					{% include "snipplets/svg/edit.tpl" with {svg_custom_class: "icon-inline icon-3x"} %}
					<div class="placeholder-description font-small-xs">
						{{ "Podés subir imágenes principales desde" | translate }} <strong>"{{ "Carrusel de imágenes" | translate }}"</strong>
					</div>
					<a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small placeholder-button">{{ "Editar" | translate }}</a>
				</div>
			</div>
		{% endif %}
	</div>
</div>
<div class="row no-gutters justify-content-end my-3">
	<div class="col-12 text-center">
		<div class="js-swiper-home-prev-demo swiper-button-prev d-inline-block svg-icon-text">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-xs"} %}</div>
		<div class="js-swiper-home-pagination-demo swiper-pagination-fraction font-small d-inline-block"></div>
		<div class="js-swiper-home-next-demo swiper-button-next d-inline-block svg-icon-text">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-xs"} %}</div>
	</div>
</div>