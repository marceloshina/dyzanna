<ul class="contact-info">
	{% if store.whatsapp %}
		<li class="footer-menu-item">
			<a href="{{ store.whatsapp }}" class="{% if btn_link %}btn{% else %}contact{% endif %}-link">
				{% if with_icons %}
					{% include "snipplets/svg/whatsapp.tpl" with {svg_custom_class: "icon-inline mr-1 font-body"} %}
				{% endif %}
				{{ store.whatsapp |trim('https://wa.me/') }}
			</a>
		</li>
	{% endif %}
	{% if store.phone %}
		<li class="footer-menu-item">
			<a href="tel:{{ store.phone }}" class="{% if btn_link %}btn{% else %}contact{% endif %}-link">
				{% if with_icons %}
					{% include "snipplets/svg/phone.tpl" with {svg_custom_class: "icon-inline mr-1 font-body"} %}
				{% endif %}
				{{ store.phone }}
			</a>
		</li>
	{% endif %}
	{% if store.email %}
		<li class="footer-menu-item">
			<a href="mailto:{{ store.email }}" class="{% if btn_link %}btn{% else %}contact{% endif %}-link">
				{% if with_icons %}
					{% include "snipplets/svg/email.tpl" with {svg_custom_class: "icon-inline mr-1 font-body"} %}
				{% endif %}
				{{ store.email }}
			</a>
		</li>
	{% endif %}
	{% if not phone_and_mail_only %}
		{% if store.address and not is_order_cancellation %}
			<li class="footer-menu-item">
				{% if with_icons %}
					{% include "snipplets/svg/map-marker-alt.tpl" with {svg_custom_class: "icon-inline mr-1 font-body"} %}
				{% endif %}
				{{ store.address }}
			</li>
		{% endif %}
		{% if store.blog %}
			<li class="footer-menu-item">
				<a target="_blank" href="{{ store.blog }}" class="{% if btn_link %}btn{% else %}contact{% endif %}-link">
					{% if with_icons %}
						{% include "snipplets/svg/comments.tpl" with {svg_custom_class: "icon-inline mr-1 font-body"} %}
					{% endif %}
					{{ "¡Visitá nuestro Blog!" | translate }}
				</a>
			</li>
		{% endif %}
	{% endif %}
</ul>