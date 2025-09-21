{% set text_utilities = settings.utilities_type_mobile == 'text' or settings.utilities_type_desktop == 'text' %}
{% set icon_utilities = settings.utilities_type_mobile == 'icon' or settings.utilities_type_desktop == 'icon' %}
{% set icon_utilities_desktop = settings.utilities_type_desktop == 'icon' %}
{% set text_utilities_only_mobile = settings.utilities_type_mobile == 'text' and settings.utilities_type_desktop == 'icon' %}
{% set text_utilities_only_desktop = settings.utilities_type_mobile == 'icon' and settings.utilities_type_desktop == 'text' %}
{% set text_utilities_desktop = settings.utilities_type_desktop == 'text' %}
{% set merged_search_menu_icon = settings.utilities_type_mobile == 'icon' and settings.search_type_mobile == 'menu_and_search_icon' %}
{% set search_icon_only_desktop = not settings.search_big_desktop and settings.utilities_type_desktop == 'icon' and settings.utilities_type_mobile != 'icon' %}
{% set search_icon_only_mobile = (settings.search_big_desktop or (not settings.search_big_desktop and settings.utilities_type_desktop != 'icon')) and settings.utilities_type_mobile == 'icon' and settings.search_type_mobile == 'search_icon' %}

{% set show_mobile_hide_desktop_class = 'd-inline-block d-md-none' %}
{% set show_desktop_hide_mobile_class = 'd-none d-md-inline' %}
{% set hide_desktop_class = text_utilities_only_mobile ? 'd-md-none' : text_utilities_only_desktop ? 'd-none d-md-inline-block' %}
{% set text_utilities_only_mobile_class = text_utilities_only_mobile ? show_mobile_hide_desktop_class %}
{% set text_utilities_only_desktop_class = text_utilities_only_desktop ? show_desktop_hide_mobile_class %}
{% set icon_utilities_only_mobile_class = not text_utilities_only_mobile ? show_mobile_hide_desktop_class %}
{% set icon_utilities_only_desktop_class = not text_utilities_only_desktop ? show_desktop_hide_mobile_class %}


{% if use_menu %}
	<span class="utilities-container {% if settings.logo_position_mobile == 'left' %}mr-0{% else %}ml-0{% endif %} {% if settings.logo_position_desktop == 'left' %}mr-md-0{% else %}ml-md-0{% endif %} {% if settings.logo_position_mobile == 'center' and settings.logo_position_desktop == 'left' %}ml-md-3 pl-md-1{% endif %}">
		<a href="#" class="js-modal-open utilities-item" data-toggle="#nav-hamburger" aria-label="{{ 'Menú' | translate }}" data-component="menu-button">
			{% if text_utilities %}
				<span class="utilities-text {% if text_utilities_only_mobile %}{{ show_mobile_hide_desktop_class }}{% endif %} {% if text_utilities_only_desktop %}{{ show_desktop_hide_mobile_class }}{% endif %}">{{ 'Menú' | translate }}</span>
			{% endif %}
			{% if icon_utilities %}
				{% if not (text_utilities_only_desktop and merged_search_menu_icon) %}
					<span class="menu-dna {% if text_utilities_only_mobile or merged_search_menu_icon %}{{ show_desktop_hide_mobile_class }}{% endif %} {% if text_utilities_only_desktop  %}{{ show_mobile_hide_desktop_class }}{% endif %}">
						{% include "snipplets/svg/bars.tpl" with {svg_custom_class: "icon-inline utilities-icon align-bottom" }%}
						MENU
					</span>
				{% endif %}
				{% if merged_search_menu_icon %}
					<span class="{{ show_mobile_hide_desktop_class }}">
						{% include "snipplets/svg/bars-search.tpl" with {svg_custom_class: "icon-inline utilities-icon align-bottom" }%}
					</span>
				{% endif %}
			{% endif %}
		</a>
	</span>
{% elseif use_account %}
	<!--<span class="utilities-container {% if header %}nav-dropdown position-relative{% else %}ml-0 mr-2{% endif %}">
		{% if header %}
			{% if text_utilities_desktop %}
				<span class="utilities-text align-items-center">
					{{ 'Mi cuenta' | translate }}
					{% include "snipplets/svg/chevron-down.tpl" with {svg_custom_class: "icon-inline ml-1"} %}
				</span>
			{% endif %}
			{% if icon_utilities_desktop %}
				{% include "snipplets/svg/user-bold.tpl" with {svg_custom_class: "icon-inline utilities-icon"} %}
			{% endif %}
			<div class="nav-dropdown-content desktop-dropdown-small position-absolute font-small">
		{% else %}
			<a href="{{ store.customer_login_url }}">
				{% include "snipplets/svg/user.tpl" with {svg_custom_class: "icon-inline icon-lg mr-1"} %}
			</a>
		{% endif %}
			{% set account_first_link_class = header ? 'd-block mb-2' : 'mr-2' %}
			{% set account_second_link_class = header ? 'd-block' : 'ml-2' %}
			{% set account_separator = not header ? '|' %}
			{% if not customer %}
				{{ "Iniciar sesión" | translate | a_tag(store.customer_login_url, '', account_first_link_class) }}
				{% if 'mandatory' not in store.customer_accounts %}
					{{ account_separator }} {{ "Crear cuenta" | translate | a_tag(store.customer_register_url, '', account_second_link_class) }}
				{% endif %}
			{% else %}
				{% set customer_short_name = customer.name|split(' ')|slice(0, 1)|join %} 
				{{ "¡Hola, {1}!" | t(customer_short_name) | a_tag(store.customer_home_url, '', account_first_link_class) }} {{ account_separator }}
				{{ "Cerrar sesión" | translate | a_tag(store.customer_logout_url, '', account_second_link_class) }}
			{% endif %}
		{% if header %}
			</div>
		{% endif %}
	</span>-->
{% elseif use_languages %}
	<span class="utilities-container nav-dropdown">
		{% if icon_utilities %}
			{% include "snipplets/svg/globe-bold.tpl" with {svg_custom_class: "icon-inline utilities-icon " ~ icon_utilities_only_mobile_class ~ ' ' ~ icon_utilities_only_desktop_class} %}
		{% endif %}
		{% if text_utilities %}
			<span class="utilities-text align-items-center {% if text_utilities_only_mobile or text_utilities_only_desktop %}{% if text_utilities_only_mobile %}{{ show_mobile_hide_desktop_class }}{% endif %} {% if text_utilities_only_desktop %}{{ show_desktop_hide_mobile_class }}{% endif %}{% else %}d-inline-flex{% endif %}">
				{% for language in languages if language.active %}
					{{ language.country }}
				{% endfor %}
				{% include "snipplets/svg/chevron-down.tpl" with {svg_custom_class: "icon-inline ml-1"} %}
			</span>
		{% endif %}
		<div class="nav-dropdown-content desktop-dropdown-small position-absolute">
			{% include "snipplets/navigation/navigation-lang.tpl" with { header: true } %}
		</div>
	</span>
{% elseif use_search %}
	{% if not settings.search_big_desktop or settings.search_type_mobile == 'search_icon' %}
		<span class="utilities-container {% if settings.search_type_mobile == 'search_icon' and settings.search_big_desktop %}{{ show_mobile_hide_desktop_class }}{% endif %} {% if settings.search_type_mobile != 'search_icon' and not settings.search_big_desktop %}{{ show_desktop_hide_mobile_class }}{% endif %}">
			<a href="#" class="js-search-button js-modal-open utilities-item" data-toggle="#nav-search" aria-label="{{ 'Buscador' | translate }}">
				{% if settings.utilities_type_desktop == 'text' %}
					<span class="utilities-text {{ show_desktop_hide_mobile_class }}">{{ 'Buscar' | translate }}</span>
				{% endif %}
				{% if (not settings.search_big_desktop and settings.utilities_type_desktop == 'icon') or (settings.utilities_type_mobile == 'icon' and settings.search_type_mobile == 'search_icon') %} 
					<span class="{% if search_icon_only_mobile %}{{ show_mobile_hide_desktop_class }}{% endif %} {% if search_icon_only_desktop %}{{ show_desktop_hide_mobile_class }}{% endif %}">
						{% include "snipplets/svg/search.tpl" with {svg_custom_class: "icon-inline align-bottom utilities-icon"} %}
					</span>
				{% endif %}
			</a>
		</span>
	{% endif %}
	{% if settings.search_big_desktop %}
		<span class="d-none d-md-block">
			{% include "snipplets/header/header-search.tpl" %}
		</span>
	{% endif %}
{% else %}
	<!--<span class="utilities-container {% if settings.logo_position_mobile == 'center' %}mr-0{% endif %} {% if not (settings.logo_position_desktop == 'left' and settings.hamburger_desktop) %}mr-md-0{% endif %}">
		<div id="ajax-cart" class="cart-summary" data-component='cart-button'>
			<a 
				{% if settings.ajax_cart and template != 'cart' %}
					href="#"
					data-toggle="#modal-cart" 
					data-modal-url="modal-fullscreen-cart"
				{% else %}
					href="{{ store.cart_url }}" 
				{% endif %}
				class="{% if settings.ajax_cart and template != 'cart' %}js-modal-open js-fullscreen-modal-open{% endif %} position-relative"
				>
				{% if text_utilities %}
					<span class="{% if text_utilities_only_mobile or text_utilities_only_desktop %}{% if text_utilities_only_mobile %}{{ show_mobile_hide_desktop_class }}{% endif %} {% if text_utilities_only_desktop %}{{ show_desktop_hide_mobile_class }}{% endif %}{% else %}d-inline-flex{% endif %}">
						<span class="utilities-text">{{ 'Carrito' | translate }}</span>
						<span>
						(<span class="js-cart-widget-amount utilities-text">{{ "{1}" | translate(cart.items_count ) }}</span>)
						</span>
					</span>
				{% endif %}
				{% if icon_utilities %}
					<span class="position-relative {% if text_utilities_only_mobile %}{{ show_desktop_hide_mobile_class }}{% endif %} {% if text_utilities_only_desktop %}{{ show_mobile_hide_desktop_class }}{% endif %}">
						{% include "snipplets/svg/bag.tpl" with {svg_custom_class: "icon-inline utilities-icon cart-icon"} %}
						<span class="js-cart-widget-amount badge {% if cart.items_count == '0' %}d-none{% endif %}">{{ "{1}" | translate(cart.items_count ) }}</span>
					</span>
				{% endif %}
			</a>	
		</div>
	</span>-->
{% endif %}