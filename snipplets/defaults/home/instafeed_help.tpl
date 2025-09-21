{# Instagram feed that work as examples #}

<section class="section-instafeed-home position-relative" data-store="home-instagram-feed">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-md-4 mb-md-4">
				<div class="instafeed-title">
					<div class="subtitle mb-4">{{ 'Seguinos en Instagram' | translate }}</div>
					<h3 class="h1 mb-0">{{ 'Instagram' | translate }}</h3>
				</div>
			</div>
			<div class="col-md-8">
				<div id="instafeed" class="row instafeed-grid pb-3">
					{% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_1': true} %}
					{% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_2': true} %}
					{% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_1': true} %}
					{% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_2': true} %}
					{% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_1': true} %}
					{% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_2': true} %}
				</div>
			</div>
		</div>
		{% if not params.preview %}
			<div class="placeholder-overlay transition-soft">
				<div class="placeholder-info">
					{% include "snipplets/svg/edit.tpl" with {svg_custom_class: "icon-inline icon-3x"} %}
					<div class="placeholder-description font-small-xs">
						{{ "Podés mostrar tus últimas novedades desde" | translate }} <strong>"{{ "Publicaciones de Instagram" | translate }}"</strong>
					</div>
					<a href="{{ admin_link }}#instatheme=redes-sociales" class="btn-primary btn btn-small placeholder-button">{{ "Editar" | translate }}</a>
				</div>
			</div>
		{% endif %}
	</div>
</section>