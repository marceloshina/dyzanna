{% set has_main_slider = settings.slider and settings.slider is not empty %}
{% set has_mobile_slider = settings.toggle_slider_mobile and settings.slider_mobile and settings.slider_mobile is not empty %}

{% if not mobile %}
<div class="js-home-main-slider-container {% if not has_main_slider %}hidden{% endif %}" data-transition="fade-in">
{% endif %}
	<div class="{% if mobile %}js-home-mobile-slider{% else %}js-home-main-slider{% endif %}-visibility {% if has_main_slider and has_mobile_slider %}{% if mobile %}d-md-none{% else %}d-none d-md-block{% endif %}{% elseif not settings.toggle_slider_mobile and mobile %}hidden{% endif %}">
		<div class="section-slider">
			<div class="js-home-slider{% if mobile %}-mobile{% endif %} nube-slider-home swiper-container swiper-container-horizontal">
				<div class="swiper-wrapper">
					{% if mobile %}
						{% set slider = settings.slider_mobile %}
					{% else %}
						{% set slider = settings.slider %}
					{% endif %}
					{% set has_text_any_slide = 0 %}
					{% for slide in slider %}
						{% set has_text = slide.title or slide.description or slide.button %}
						{% if has_text %}
							{% set has_text_any_slide = has_text_any_slide + 1 %}
						{% endif %}
						<div class="swiper-slide slide-container">
							{% if slide.link %}
								<a href="{{ slide.link | setting_url }}" aria-label="{{ 'Carrusel' | translate }} {{ loop.index }}">
							{% endif %}
							<div class="slider-slide">

								{% set apply_lazy_load = 
									settings.home_order_position_1 != 'slider' 
									or not (
										loop.first and (
											(has_main_slider and not has_mobile_slider) or 
											(has_mobile_slider and mobile)
										)
									) 
								%}
		
								{% if apply_lazy_load %}
									{% set slide_src = 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==' %}
								{% else %}
									{% set slide_src = slide.image | static_url | settings_image_url('large') %}
								{% endif %}

								{% if settings.slider_text_outside %}
									<div class="row no-gutters justify-content-end justify-content-md-start{% if has_text_any_slide == 0 %} pr-4{% endif %}">
										<div class="col-12{% if has_text_any_slide != 0 %} col-md-9 mr-4 mr-md-0{% endif %} overflow-none {% if settings.theme_rounded %}{% if slide.color == 'light' %}banner-round-top-right banner-round-right-md{% else %}banner-round-right{% endif %}{% endif %}">
								{% endif %}
										<img 
											{% if not apply_lazy_load %}fetchpriority="high"{% endif %}
											{% if slide.width and slide.height %} width="{{ slide.width }}" height="{{ slide.height }}" {% endif %}
											{% if apply_lazy_load %}data-{% endif %}src="{{ slide_src }}"
											{% if apply_lazy_load %}data-{% endif %}srcset="{{ slide.image | static_url | settings_image_url('large') }} 480w, {{ slide.image | static_url | settings_image_url('huge') }} 640w, {{ slide.image | static_url | settings_image_url('original') }} 1024w, {{ slide.image | static_url | settings_image_url('1080p') }} 1920w"  
											class="slider-image {% if settings.slider_animation %}slider-image-animation{% endif %} {% if apply_lazy_load %}swiper-lazy fade-in{% endif %}" alt="{{ 'Carrusel' | translate }} {{ loop.index }}"
										/>
										<div class="placeholder-fade"></div>
									{% if settings.slider_text_outside %}
										</div>
									{% endif %}
									{% if has_text %}
										{% if settings.slider_text_outside %}
											<div class="col-9 col-md-3 swiper-{{ slide.color }} mr-4 mr-md-0{% if settings.theme_rounded %} banner-round-bottom banner-round-left-md{% endif %}">
										{% endif %}
											<div class="swiper-text{% if not settings.slider_text_outside %}-center swiper-text-{{ slide.color }}{% endif %}">
												{% if slide.title %}
													<div class="h1-huge mb-3">{{ slide.title }}</div>
												{% endif %}
												{% if slide.description %}
													<p class="mb-3 pl-1">{{ slide.description }}</p>
												{% endif %}
												{% if slide.button and slide.link %}
													<div class="btn btn-primary d-inline-block">{{ slide.button }}</div>
												{% endif %}
											</div>
										{% if settings.slider_text_outside %}
											</div>
										{% else %}
											<div class="swiper-overlay swiper-overlay-{{ slide.color }}"></div>
										{% endif %}
									{% endif %}
								{% if settings.slider_text_outside %}
									</div>
								{% endif %}
							</div>
							{% if slide.link %}
								</a>
							{% endif %}
						</div>
					{% endfor %}
				</div>
			</div>
		</div>
		<div class="row no-gutters justify-content-end my-3 d-none">
			<div class="{% if settings.slider_text_outside %}col-10 col-md-3 pl-4 pl-md-3{% else %}col-12 text-center{% endif %}">
				<div class="js-swiper-home-control js-swiper-home-prev{% if mobile %}-mobile{% endif %} swiper-button-prev d-inline-block svg-icon-text">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-xs"} %}</div>
				<div class="js-swiper-home-control js-swiper-home-pagination{% if mobile %}-mobile{% endif %} swiper-pagination-fraction font-small d-inline-block"></div>
				<div class="js-swiper-home-control js-swiper-home-next{% if mobile %}-mobile{% endif %} swiper-button-next d-inline-block svg-icon-text">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-xs"} %}</div>
			</div>
		</div>
	</div>
{% if not mobile %}
</div>
{% endif %}