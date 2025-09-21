<section class="topo-dna">

<div class="container">

<div class="row d-flex justify-between">

<div class="instagram-topo">
    <a href="https://www.instagram.com/dyzannamerchaneventos/" target="_blank">
	<p>Siga-nos no Instagram</p>
    <img src="{{ 'images/topo_instagram.svg' | static_url }}" width="16" height="16">
    <p>@dyzannamerchaneventos</p>
	</a>
</div>

<div class="login-right">

<div class="entrar-dna">
    <img src="{{ 'images/topo_login.svg' | static_url }}" width="18" height="19">
    {% set account_first_link_class = header ? 'd-block mb-2' : 'mr-2 login-dna' %}
	{% set account_second_link_class = header ? 'd-block' : 'ml-2 login-dna' %}
	{% set account_separator = not header ? '|' %}
	{% if not customer %}
	{{ "Faça seu Login" | translate | a_tag(store.customer_login_url, '', account_first_link_class) }}
	{% if 'mandatory' not in store.customer_accounts %}
    ou
	{{ "Cadastre-se" | translate | a_tag(store.customer_register_url, '', account_second_link_class) }}
	{% endif %}
    {% else %}
	{% set customer_short_name = customer.name|split(' ')|slice(0, 1)|join %} 
	{{ "¡Hola, {1}!" | t(customer_short_name) | a_tag(store.customer_home_url, '', account_first_link_class) }} {{ account_separator }}
	{{ "Cerrar sesión" | translate | a_tag(store.customer_logout_url, '', account_second_link_class) }}
    {% endif %}

</div>

    <div style="color: #FFFFFF; padding: 0 20px;">
    {{ account_separator }}
    </div>


<div class="meu-carrinho">
        
        <img src="{{ 'images/topo_carrinho.svg' | static_url }}" width="21" height="20">
        
        <div id="ajax-cart" class="cart-summary" data-component='cart-button'>
			<a 
				{% if settings.ajax_cart and template != 'cart' %}
					href="#"
					data-toggle="#modal-cart" 
					data-modal-url="modal-fullscreen-cart"
				{% else %}
					href="{{ store.cart_url }}" 
				{% endif %}
				class="{% if settings.ajax_cart and template != 'cart' %}js-modal-open js-fullscreen-modal-open{% endif %} position-relative carrinho-dna"
				>
                Meu Carrinho
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
	
</div>

</div>

</div>

</div>

</section>