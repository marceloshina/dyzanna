{# Video that work as examples #}

<section class="section-video-home mb-4 ml-3" data-store="home-video">
	<div class="home-video embed-responsive embed-responsive-16by9">
		{{ component('placeholders/video-placeholder')}}
		{% if not params.preview %}
			<div class="placeholder-overlay transition-soft">
				<div class="placeholder-info">
					{% include "snipplets/svg/edit.tpl" with {svg_custom_class: "icon-inline icon-3x"} %}
					<div class="placeholder-description font-small-xs">
						{{ "Podés subir tu video de YouTube desde" | translate }} <strong>"{{ "Video" | translate }}"</strong>
					</div>
					<a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small placeholder-button">{{ "Editar" | translate }}</a>
				</div>
			</div>
		{% endif %}
	</div>
</section>