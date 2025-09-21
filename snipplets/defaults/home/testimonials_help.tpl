{# Testimonials that work as examples #}

<section class="section-testimonials-home mr-3" data-store="home-testimonials">
	<div class="container">
		<div class="row mb-3{% if settings.testimonials_align == 'center' %} text-center{% elseif settings.testimonials_align == 'asymmetric' %} text-right{% endif %}">
			<div class="{% if settings.testimonials_align == 'asymmetric' %}col-9 col-md-3{% else %}col-12{% endif %} mb-4">
				<h2 class="subtitle font-weight-normal mb-0">{{ 'Testimonios' | translate }}</h2>
			</div>
			<div class="col-12">
				<div class="js-swiper-testimonials-demo swiper-testimonials swiper-container pt-3">
					<div class="swiper-wrapper">
						{% for i in 1..3 %}
							<div class="swiper-slide slide-container{% if settings.testimonials_align == 'center' %} px-2{% elseif settings.testimonials_align == 'left' %} pr-4{% elseif settings.testimonials_align == 'asymmetric' and loop.index is even %} pt-md-5 mt-md-5{% endif %}">
								<div class="row">
									<div class="{% if settings.testimonials_align == 'asymmetric' %}col-9{% else %}col-12{% endif %}">
										<div class="h1 mb-4">{{ 'Descripción del testimonio' | translate }}</div>
									</div>
									<div class="col-12">
										<div class="row align-items-center{% if settings.testimonials_align == 'center' %} justify-content-center{% endif %}">
											<div class="{% if settings.testimonials_align == 'asymmetric' %}col-9{% elseif settings.testimonials_align == 'center' %}col-12 mb-2{% else %}col-auto pr-0{% endif %}">
												<div class="testimonials-image">
													{% include "snipplets/svg/user.tpl" with {svg_custom_class: "icon-inline icon-2x svg-icon-text mt-2 opacity-80"} %}
												</div>
											</div>
											<div class="{% if settings.testimonials_align == 'asymmetric' %}col-3 pl-0 text-left{% elseif settings.testimonials_align == 'center' %}col-12{% else %}col-auto{% endif %}">
												<h3 class="subtitle font-weight-normal mb-0 px-1">{{ 'Testimonio' | translate }}</h3>
											</div>
										</div>
									</div>
								</div>
							</div>
						{% endfor %}
					</div>
				</div>
			</div>
			<div class="{% if settings.testimonials_align == 'asymmetric' %}col-9{% else %}col-12{% endif %} d-block d-md-none mt-4">
				<div class="js-swiper-testimonials-prev-demo swiper-button-prev d-inline-block svg-icon-text">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-xs"} %}</div>
				<div class="js-swiper-testimonials-pagination-demo swiper-pagination-fraction font-small d-inline-block"></div>
				<div class="js-swiper-testimonials-next-demo swiper-button-next d-inline-block svg-icon-text">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-xs"} %}</div>
			</div>
		</div>
	</div>
	{% if not params.preview %}
		<div class="placeholder-overlay transition-soft">
			<div class="placeholder-info">
				{% include "snipplets/svg/edit.tpl" with {svg_custom_class: "icon-inline icon-3x"} %}
				<div class="placeholder-description font-small-xs">
					{{ "Podés mostrar testimonios de tus clientes desde" | translate }} <strong>"{{ "Testimonios" | translate }}"</strong>
				</div>
				<a href="{{ admin_link }}#instatheme=redes-sociales" class="btn-primary btn btn-small placeholder-button">{{ "Editar" | translate }}</a>
			</div>
		</div>
	{% endif %}
</section>