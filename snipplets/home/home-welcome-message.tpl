{% if settings.welcome_message or settings.welcome_text or settings.welcome_subtitle %}
	<section class="section-welcome-home" data-store="home-welcome-message">
		<div class="container">
			<div class="row {% if settings.welcome_align == 'center' %} text-center{% endif %}">
				<div class="col-{% if settings.welcome_align == 'asymmetric' %}{% if settings.welcome_subtitle and not settings.welcome_message %}7 col-md-3 offset-5{% else %}9 col-md-4 offset-md-2 text-right{% endif %}{% else %}12 col-md-6 offset-md-3{% endif %}">
					{% if settings.welcome_subtitle %}
						<div class="subtitle mb-3">{{ settings.welcome_subtitle }}</div>
					{% endif %}
					{% if settings.welcome_message %}
						<h2 class="h1-huge">{{ settings.welcome_message }}</h2>
					{% endif %}
			{% if settings.welcome_align == 'asymmetric' %}
				</div>
			</div>
			<div class="row">
				<div class="col-7 col-md-3 offset-5">
			{% endif %}
					{% if settings.welcome_text %}
						<p class="mb-4">{{ settings.welcome_text }}</p>
					{% endif %}
					{% if settings.welcome_button and settings.welcome_link %}
                        <a href="{{ settings.welcome_link }}" class="btn btn-secondary d-inline-block">{{ settings.welcome_button }}</a>
                    {% endif %}
				</div>
			</div>
		</div>
	</section>
{% endif %}
