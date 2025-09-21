{% set has_social_network = store.facebook or store.twitter or store.pinterest or store.instagram or store.tiktok or store.youtube %}
{% set has_footer_contact_info = (store.whatsapp or store.phone or store.email or store.address or store.blog) and settings.footer_contact_show %}          

{% set has_desktop_navigation = not settings.hamburger_desktop %}
{% set has_footer_menu = settings.footer_menu and settings.footer_menu_show %}
{% set has_footer_menu_secondary = settings.footer_menu_secondary and settings.footer_menu_secondary_show %}
{% set has_footer_about = settings.footer_about_show and (settings.footer_about_title or settings.footer_about_description) %}
{% set has_payment_logos = settings.payments %}
{% set has_shipping_logos = settings.shipping %}
{% set has_shipping_payment_logos = has_payment_logos or has_shipping_logos %}
{% set has_languages = languages | length > 1 and settings.languages_footer %}

{% set has_seal_logos = store.afip or ebit or settings.custom_seal_code or ("seal_img.jpg" | has_custom_image) %}
{% set show_help = not has_products and not has_social_network %}
<footer class="js-footer js-hide-footer-while-scrolling display-when-content-ready{% if template == 'home' %} mt-4{% endif %}" data-store="footer">
	<div class="container-fluid">

		<div class="logo-rodape">
			{% set logo_size_class = settings.logo_size == 'small' ? 'logo-img-small' : settings.logo_size == 'big' ? 'logo-img-big' %}
			{{ component('logos/logo', {
					logo_img_classes: 'transition-soft ' ~ logo_size_class,
					logo_text_classes: 'h3 mb-0',
					logo_size: 'large'
				})
			}}
		</div>

		<div class="titulo-rodape">
			<h2>O SHOPPING DOS SEUS YOUTUBERS FAVORITOS</h2>
		</div>

		<div class="instagram-rodape mt-4 mb-4">
			<a href="https://www.instagram.com/dyzannamerchaneventos/" target="_blank">
			<p>Siga-nos no Instagram</p>
			<img src="{{ 'images/rodape_instagram.svg' | static_url }}" width="20" height="20">
			<p>@dyzannamerchaneventos</p>
			</a>
		</div>

		<div class="menu-rodape">

			<div class="row">
				{# Foot Nav #}
				{% if has_footer_menu %}
				<div class="{% if settings.footer_menus_toggle %}js-accordion-container{% endif %} col-12 col-md">
				{% if settings.footer_menus_toggle %}
				<a href="#" class="js-accordion-toggle-mobile d-block">
				{% endif %}
				{% if settings.footer_menu_title %}
				<div class="font-small opacity{% if settings.footer_menus_toggle %}-md{% endif %}-50 d-inline-block py-3 p-md-0 mb-md-4">{{ settings.footer_menu_title }}</div>
				{% endif %}
				{% if settings.footer_menus_toggle %}
				<span class="d-md-none">
				<span class="js-accordion-toggle-inactive">
				{% include "snipplets/svg/chevron-down.tpl" with {svg_custom_class: "icon-inline icon-w-14 icon-md ml-2"} %}
				</span>
				<span class="js-accordion-toggle-inactive" style="display: none;">
				{% include "snipplets/svg/chevron-up.tpl" with {svg_custom_class: "icon-inline icon-w-14 icon-md ml-2"} %}
				</span>
				</span>
				</a>
				<div class="js-accordion-content js-accordion-content-mobile">
				{% endif %}
				{% include "snipplets/navigation/navigation-foot.tpl" %}
				{% if settings.footer_menus_toggle %}
				</div>
				{% endif %}
				</div>
				{% endif %}
			</div>	
		
		</div>

		<hr>

		<div class="infos-rodape mt-4 mb-4">

			<div class="email-rodape">
				<img src="{{ 'images/rodape_email.svg' | static_url }}" width="23" height="23" alt="Email">
				<a href="mailto:sac@dyzanna.com.br" target="_blank">sac@dyzanna.com.br</a>
			</div>

			<div class="pagamentos-rodape">
				<img src="{{ 'images/pagamento-visa.svg' | static_url }}" width="53" height="34" alt="Visa">
				<img src="{{ 'images/pagamento-master.svg' | static_url }}" width="53" height="34" alt="Mastercard">
				<img src="{{ 'images/pagamento-amex.svg' | static_url }}" width="53" height="34" alt="American Express">
				<img src="{{ 'images/pagamento-dinners.svg' | static_url }}" width="53" height="34" alt="Dinners Club">
				<img src="{{ 'images/pagamento-elo.svg' | static_url }}" width="53" height="34" alt="Elo">
				<img src="{{ 'images/pagamento_pix.svg' | static_url }}" width="53" height="34" alt="Pix">
			</div>
			
			<div class="seguranca-rodape">
				<img src="{{ 'images/selo-reclame-aqui.png' | static_url }}" width="141" height="43" alt="Reclame Aqui">
				<img src="{{ 'images/selo-loja.png' | static_url }}" width="129" height="31" alt="Loja Protegida">
			</div>

		</div>

	</div>

	<div class="js-footer-legal footer-legal">
		<div class="container-fluid">
			
			<div class="row align-items-center">
			
				<div class="col-12 col-md font-small mb-3 mb-2 dna-align-center">
					<div class="mr-md-2">
					   {{ "Copyright {1} - {2}. Todos los derechos reservados." | translate( (store.business_name ? store.business_name : store.name) ~ (store.business_id ? ' - ' ~ store.business_id : ''), "now" | date('Y') ) }}
					</div>
					{{ component('claim-info', {
							container_classes: "d-md-inline-block mt-md-0 mt-3",
							divider_classes: "mx-1 d-none d-md-inline-block",
							text_classes: {text_consumer_defense: 'd-inline-block'},
							link_classes: {
								link_consumer_defense: "btn-link font-small",
								link_order_cancellation: "btn-link d-md-inline-block d-block mt-3 mt-md-0 mb-2 mb-md-0 w-100 w-md-auto",
							},
						}) 
					}}
				</div>

			</div>
			
			<div class="row align-items-center dna-align-center">
				<div class="col-md-auto logo-dna"><a href="https://dna360.ag/" target="_blank">desenvolvido por: <img src="{{ 'images/logo-dna.svg' | static_url }}" width="87" height="18" style="margin-left: 5px; margin-bottom: -5px;" alt="DNA 360"></a></div>

				<div class="col-12 col-md-auto text-md-right">
					{#
					La leyenda que aparece debajo de esta linea de código debe mantenerse
					con las mismas palabras y con su apropiado link a Tienda Nube;
					como especifican nuestros términos de uso: http://www.tiendanube.com/terminos-de-uso .
					Si quieres puedes modificar el estilo y posición de la leyenda para que se adapte a
					tu sitio. Pero debe mantenerse visible para los visitantes y con el link funcional.
					Os créditos que aparece debaixo da linha de código deverá ser mantida com as mesmas
					palavras e com seu link para Nuvem Shop; como especificam nossos Termos de Uso:
					http://www.nuvemshop.com.br/termos-de-uso. Se você quiser poderá alterar o estilo
					e a posição dos créditos para que ele se adque ao seu site. Porém você precisa
					manter visivél e com um link funcionando.
					#}
					{{ new_powered_by_link }}
				</div>
			</div>
		</div>
	</div>
</footer>