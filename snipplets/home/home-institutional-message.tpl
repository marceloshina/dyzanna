{% if settings.institutional_message or settings.institutional_text or settings.institutional_subtitle %}
	<section class="section-welcome-home" data-store="home-institutional-message">
		<div class="container">
			<div class="row {% if settings.institutional_align == 'center' %} text-center{% endif %}">
				<div class="col-{% if settings.institutional_align == 'asymmetric' %}{% if settings.institutional_subtitle and not settings.institutional_message %}7 col-md-3 offset-5{% else %}9 col-md-4 offset-md-2 text-right{% endif %}{% else %}12 col-md-6 offset-md-3{% endif %}">
					{% if settings.institutional_subtitle %}
						<div class="subtitle mb-3">{{ settings.institutional_subtitle }}</div>
					{% endif %}
					{% if settings.institutional_message %}
						<h2 class="h1-huge">{{ settings.institutional_message }}</h2>
					{% endif %}
			{% if settings.institutional_align == 'asymmetric' %}
				</div>
			</div>
			<div class="row">
				<div class="col-7 col-md-3 offset-5">
			{% endif %}
					{% if settings.institutional_text %}
						<p class="mb-4">{{ settings.institutional_text }}</p>
					{% endif %}
					{% if settings.institutional_button and settings.institutional_link %}
                        <a href="{{ settings.institutional_link }}" class="btn btn-secondary d-inline-block">{{ settings.institutional_button }}</a>
                    {% endif %}
				</div>
			</div>
		</div>
	</section>
{% endif %}
