{# Banners that work as examples #}

{% if section_id == 'categories' %}
	{% set section_asymmetric = settings.banner_asymmetric %}
{% elseif section_id == 'promotional' %}
	{% set section_asymmetric = settings.banner_promotional_asymmetric %}
{% elseif section_id == 'news' %}
	{% set section_asymmetric = settings.banner_news_asymmetric %}
{% endif %}

<section class="section-banners-home" data-store="home-banner-{{ section_id }}">
	<div class="container position-relative">
		<div class="row row-grid">
			<div class="col-md-6 col-grid">
				<div class="textbanner">
					<div class="position-relative {% if not section_asymmetric %}textbanner-image textbanner-image-empty overlay overflow-none{% endif %} {% if settings.theme_rounded %} banner-round{% endif %}">
						{% if section_asymmetric %}
							<div class="col-8 textbanner-image textbanner-image-empty overlay overflow-none"></div>
							<div class="col-8 col-md-6 textbanner-title">
								<div class="h1-huge mb-0">{{ banner_title }}</div>
							</div>
						{% endif %}
					</div>
					{% if not section_asymmetric %}
						<div class="textbanner-text">
							<div class="h1">{{ banner_title }}</div>
						</div>
					{% endif %}
				</div>
			</div>
			<div class="col-md-6 col-grid">
				<div class="textbanner {% if section_asymmetric %}textbanner-even text-right{% endif %}">
					<div class="position-relative {% if not section_asymmetric %}textbanner-image textbanner-image-empty overlay overflow-none{% endif %} {% if settings.theme_rounded %} banner-round{% endif %}">
						{% if section_asymmetric %}
							<div class="col-8 offset-4 textbanner-image textbanner-image-empty overlay overflow-none"></div>
							<div class="col-8 col-md-6 textbanner-title textbanner-title-even">
								<div class="h1-huge mb-0">{{ banner_title }}</div>
							</div>
						{% endif %}
					</div>
					{% if not section_asymmetric %}
						<div class="textbanner-text">
							<div class="h1">{{ banner_title }}</div>
						</div>
					{% endif %}
				</div>
			</div>
		</div>
		{% if not params.preview %}
			<div class="placeholder-overlay transition-soft">
				<div class="placeholder-info">
					{% include "snipplets/svg/edit.tpl" with {svg_custom_class: "icon-inline icon-3x"} %}
					<div class="placeholder-description font-small-xs">
						{{ help_text }} <strong>"{{ section_name }}"</strong>
					</div>
					<a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small placeholder-button">{{ "Editar" | translate }}</a>
				</div>
			</div>
		{% endif %}
	</div>
</section>