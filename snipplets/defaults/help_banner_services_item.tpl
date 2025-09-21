<div class="service-item-container col-md swiper-slide p-0 px-md-3">
	<div class="service-item mx-4 mx-md-0">
		{% set help_icon_name = help_item_1 ? 'truck' : help_item_2 ? 'credit-card' : help_item_3 ? 'promotions' : 'returns' %}
		{% include "snipplets/svg/" ~ help_icon_name ~ ".tpl" with {svg_custom_class: "icon-inline icon-2x svg-icon-text mb-3"} %}
		<h3 class="h4 mb-2">
			{% if help_item_1 %}
				{{ 'Medios de envío' | translate }}
			{% elseif help_item_2 %}
				{{ 'Medios de pago' | translate }}
			{% elseif help_item_3 %}
				{{ 'Promociones' | translate }}
			{% elseif help_item_4 %}
				{{ 'Cambios y devoluciones' | translate }}
			{% endif %}
		</h3>
	</div>
</div>
