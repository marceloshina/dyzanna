{% set newsletter_contact_error = contact.type == 'newsletter' and not contact.success %}

<section class="section-newsletter-home position-relative ml-3" data-store="home-newsletter">
	<div class="container">
		<div class="row{% if settings.home_news_align == 'center' %} justify-content-center{% endif %}">
			<div class="col-md-6{% if settings.home_news_align == 'center' %} text-center{% endif %}">
				<div class="js-newsletter newsletter">
					{% if settings.home_news_subtitle %}
						<h3 class="subtitle font-weight-normal mb-1">{{ settings.home_news_subtitle }}</h3>
					{% endif %}
					{% if settings.home_news_title %}
						<h2 class="h1 mb-1">{{ settings.home_news_title | raw }}</h2>
					{% endif %}
					{% if settings.home_news_text %}
						<p>{{ settings.home_news_text | raw }}</p>
					{% endif %}

					{% if contact and contact.type == 'newsletter' %}
						{% if contact.success %}
							<div class="alert alert-success mb-0">{{ "¡Gracias por suscribirte! A partir de ahora vas a recibir nuestras novedades en tu email" | translate }}</div>
						{% else %}
							<div class="alert alert-danger mb-0">{{ "Necesitamos tu email para enviarte nuestras novedades." | translate }}</div>
						{% endif %}
					{% endif %}
				</div>
			</div>

			<div class="col-md-6">

				<form class="mt-4" method="post" action="/winnie-pooh" onsubmit="this.setAttribute('action', '');" data-store="home-newsletter-form">
						<div class="input-append form-news-home">

							{% embed "snipplets/forms/form-input.tpl" with{input_for: 'email', type_email: true, input_name: 'email', input_id: 'email', input_placeholder: 'Email' | translate, input_group_custom_class: "mb-2", input_custom_class: "form-control-transparent",  input_aria_label: 'Email' | translate } %}
							{% endembed %}

							<div class="winnie-pooh" style="display: none;">
								<label for="winnie-pooh-newsletter">{{ "No completar este campo" | translate }}</label>
								<input id="winnie-pooh-newsletter" type="text" name="winnie-pooh"/>
							</div>
							<input type="hidden" name="name" value="{{ 'Sin nombre' | translate }}" />
							<input type="hidden" name="message" value="{{ 'Pedido de inscripción a newsletter' | translate }}" />
							<input type="hidden" name="type" value="newsletter" />
							<button type="submit" name="contact" class="btn btn-append btn-news" value="{{ 'Enviar' | translate }}" />CADASTRAR</button>
							<!--{% include "snipplets/svg/plus.tpl" with {svg_custom_class: "icon-inline newsletter-btn"} %}-->
						</div>
					</form>
			
			</div>

		</div>
	</div>
	{% if "home_news_image.jpg" | has_custom_image %}
        <img src="{{ 'images/empty-placeholder.png' | static_url }}" data-srcset='{{ "home_news_image.jpg" | static_url | settings_image_url('large') }} 480w, {{ "home_news_image.jpg" | static_url | settings_image_url('huge') }} 640w, {{ "home_news_image.jpg" | static_url | settings_image_url('original') }} 1024w, {{ "home_news_image.jpg" | static_url | settings_image_url('1080p') }} 1920w' class='lazyload newsletter-home-image {% if "home_news_image_mobile.jpg" | has_custom_image %}d-none d-md-block{% endif %}'/>
    {% endif %}
    {% if "home_news_image_mobile.jpg" | has_custom_image %}
        <img src="{{ 'images/empty-placeholder.png' | static_url }}" data-srcset='{{ "home_news_image_mobile.jpg" | static_url | settings_image_url('large') }} 480w, {{ "home_news_image_mobile.jpg" | static_url | settings_image_url('huge') }} 640w, {{ "home_news_image_mobile.jpg" | static_url | settings_image_url('original') }} 1024w' class="lazyload newsletter-home-image {% if "home_news_image.jpg" | has_custom_image %}d-block d-md-none{% endif %}"/>
    {% endif %}
</section>
