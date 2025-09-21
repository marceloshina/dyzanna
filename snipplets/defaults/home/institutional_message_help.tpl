{# Welcome and institutional messages that work as examples #}

{% set section_align = welcome_message ? settings.welcome_align : settings.institutional_align %}

<section class="section-welcome-home" data-store="home-{{ section_name }}">
	<div class="container">
		<div class="row {% if section_align == 'center' %} text-center{% endif %}">
			<div class="col-{% if section_align == 'asymmetric' %}9 col-md-4 offset-md-2 text-right{% else %}12 col-md-6 offset-md-3{% endif %}">
				<h2 class="h1-huge">{{ title }}</h2>
		{% if section_align == 'asymmetric' %}
			</div>
		</div>
		<div class="row">
			<div class="col-7 col-md-3 offset-5">
		{% endif %}
				{% if not welcome_message %}
					<p class="mb-4">{{ "Usá este texto para compartir información de tu negocio, dar la bienvenida a tus clientes o para contar lo increíble que son tus productos." | translate }}</p>
				{% endif %}
			</div>
		</div>
	</div>
</section>

