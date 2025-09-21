{% set has_home_testimonials = false %}
{% for testimonial in ['testimonial_01', 'testimonial_02', 'testimonial_03'] %}
	{% set testimonial_image = "#{testimonial}.jpg" | has_custom_image %}
	{% set testimonial_name = attribute(settings,"#{testimonial}_name") %}
	{% set testimonial_description = attribute(settings,"#{testimonial}_description") %}
	{% set has_testimonial = testimonial_name or testimonial_description or testimonial_image %}
	{% if has_testimonial %}
		{% set has_home_testimonials = true %}
	{% endif %}
{% endfor %}

{% if has_home_testimonials %}
	<section class="section-testimonials-home mr-3" data-store="home-testimonials">
		<div class="container">
			<div class="row mb-3{% if settings.testimonials_align == 'center' %} text-center{% elseif settings.testimonials_align == 'asymmetric' %} text-right{% endif %}">
				{% if settings.testimonials_title %}
					<div class="{% if settings.testimonials_align == 'asymmetric' %}col-9 col-md-3{% else %}col-12{% endif %} mb-4">
						<h2 class="subtitle font-weight-normal mb-0">{{ settings.testimonials_title }}</h2>
					</div>
				{% endif %}
				<div class="col-12">
					<div class="js-swiper-testimonials swiper-testimonials swiper-container pt-3">
						<div class="swiper-wrapper">
							{% for testimonial in ['testimonial_01', 'testimonial_02', 'testimonial_03'] %}
								{% set testimonial_image = "#{testimonial}.jpg" | has_custom_image %}
								{% set testimonial_name = attribute(settings,"#{testimonial}_name") %}
								{% set testimonial_description = attribute(settings,"#{testimonial}_description") %}
								{% set has_testimonial = testimonial_name or testimonial_description or testimonial_image %}
								{% if has_testimonial %}
									<div class="swiper-slide slide-container{% if settings.testimonials_align == 'center' %} px-2{% elseif settings.testimonials_align == 'left' %} pr-4{% elseif settings.testimonials_align == 'asymmetric' and loop.index is even %} pt-md-5 mt-md-5{% endif %}">
										<div class="row">
											{% if testimonial_description %}
												<div class="{% if settings.testimonials_align == 'asymmetric' %}col-9{% else %}col-12{% endif %}">
													<div class="h1 mb-4">{{ testimonial_description }}</div>
												</div>
											{% endif %}
											{% if testimonial_image or testimonial_name %}
												<div class="col-12">
													<div class="row align-items-center{% if settings.testimonials_align == 'center' %} justify-content-center{% endif %}">
														{% if testimonial_image %}
															<div class="{% if settings.testimonials_align == 'asymmetric' %}col-9{% elseif settings.testimonials_align == 'center' %}col-12 mb-2{% else %}col-auto pr-0{% endif %}">
																<div class="testimonials-image">
																	<img class="testimonial-image-background lazyload" src="{{ 'images/empty-placeholder.png' | static_url }}" data-src='{{ "#{testimonial}.jpg" | static_url | settings_image_url("small") }}' {% if testimonial_name %}alt="{{ testimonial_name }}"{% else %}alt="{{ 'Testimonio de' | translate }} {{ store.name }}"{% endif %} />
																	<div class="placeholder-fade"></div>
																</div>
															</div>
														{% endif %}
														{% if testimonial_name %}
															<div class="{% if settings.testimonials_align == 'asymmetric' %}{% if testimonial_image %}col-3 pl-0 text-left{% else %}col-9{% endif %}{% elseif settings.testimonials_align == 'center' %}col-12{% else %}col-auto{% endif %}">
																<h3 class="subtitle font-weight-normal mb-0 px-1">{{ testimonial_name }}</h3>
															</div>
														{% endif %}
													</div>
												</div>
											{% endif %}
										</div>
									</div>
								{% endif %}
							{% endfor %}
						</div>
					</div>
				</div>
				<div class="{% if settings.testimonials_align == 'asymmetric' %}col-9{% else %}col-12{% endif %} d-block d-md-none mt-4">
					<div class="js-swiper-testimonials-prev swiper-button-prev d-inline-block svg-icon-text">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-xs"} %}</div>
					<div class="js-swiper-testimonials-pagination swiper-pagination-fraction font-small d-inline-block"></div>
					<div class="js-swiper-testimonials-next swiper-button-next d-inline-block svg-icon-text">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-xs"} %}</div>
				</div>
			</div>
		</div>
	</section>
{% endif %}
