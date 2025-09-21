{# Informative banners that work as examples #}

<section class="section-informative-banners" data-store="banner-services">
	<div class="container">
		<div class="row">
			<div class="js-informative-banners-demo swiper-container">
				<div class="swiper-wrapper">
					{% include 'snipplets/defaults/help_banner_services_item.tpl' with {'help_item_1': true} %}
					{% include 'snipplets/defaults/help_banner_services_item.tpl' with {'help_item_2': true} %}
					{% include 'snipplets/defaults/help_banner_services_item.tpl' with {'help_item_3': true} %}
					{% include 'snipplets/defaults/help_banner_services_item.tpl' with {'help_item_4': true} %}
				</div>
			</div>
			<div class="d-block d-md-none col-12 mt-4">
				<div class="js-informative-banners-prev-demo swiper-button-prev d-inline-block svg-icon-text">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-xs"} %}</div>
				<div class="js-informative-banners-pagination-demo swiper-pagination-fraction font-small d-inline-block"></div>
				<div class="js-informative-banners-next-demo swiper-button-next d-inline-block svg-icon-text">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-xs"} %}</div>
			</div>
		</div>
	</div>
	{% if not params.preview %}
		<div class="placeholder-overlay transition-soft">
			<div class="placeholder-info p-2">
				{% include "snipplets/svg/edit.tpl" with {svg_custom_class: "icon-inline icon-3x"} %}
				<div class="placeholder-description font-small-xs my-2">
					{{ "Podés mostrar tu información para la compra desde" | translate }} <strong>"{{ "Información de envíos, pagos y compra" | translate }}"</strong>
				</div>
				<a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small placeholder-button">{{ "Editar" | translate }}</a>
			</div>
		</div>
	{% endif %}
</section>