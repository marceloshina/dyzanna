{% if section_select == 'slider' %}
	{#  **** Home slider ****  #}

		{% set has_mobile_slider = settings.toggle_slider_mobile and settings.slider_mobile and settings.slider_mobile is not empty %}
		{% set head_transparent_section = (has_main_slider or has_mobile_slider) and settings.head_transparent %}

		<section class="pb-4" data-store="home-slider" {% if head_transparent_section %}data-header-type="transparent-on-section"{% endif %}>
			{% if show_help or (show_component_help and not (has_main_slider or has_mobile_slider)) %}
				{% snipplet 'defaults/home/slider_help.tpl' %}
			{% else %}
				{% include 'snipplets/home/home-slider.tpl' %}
				{% if has_mobile_slider %}
					{% include 'snipplets/home/home-slider.tpl' with {mobile: true} %}
				{% endif %}
			{% endif %}
		</section>

{% elseif section_select == 'main_categories' %}

	{#  **** Main categories ****  #}
	{% if show_help or (show_component_help and not has_main_categories) %}
		{% snipplet 'defaults/home/main_categories_help.tpl' %}
	{% else %}
		{% include 'snipplets/home/home-categories.tpl' %}
	{% endif %}

{% elseif section_select == 'welcome' %}

	{#  **** Welcome message ****  #}

	{% if show_help or (show_component_help and not has_welcome_message) %}
		{% include 'snipplets/defaults/home/institutional_message_help.tpl' with { section_name: 'welcome-message', title: 'Mensaje de bienvenida'| translate, welcome_message: true}  %}
	{% else %}
		{% include 'snipplets/home/home-welcome-message.tpl' %}
	{% endif %}

{% elseif section_select == 'institutional' %}

	{#  **** Institutional message ****  #}

	{% if show_help or (show_component_help and not has_institutional_message) %}
		{% include 'snipplets/defaults/home/institutional_message_help.tpl' with { section_name: 'institutional-message', title: 'Mensaje institucional'| translate, institutional_message: true}  %}
	{% else %}
		{% include 'snipplets/home/home-institutional-message.tpl' %}
	{% endif %}

{% elseif section_select == 'products' %}

	{#  **** Featured products ****  #}

	{% if show_help or (show_component_help and not has_products) %}
		{% include 'snipplets/defaults/home/featured_products_help.tpl' with { products_title: 'Destacados' | translate, section_id: 'featured' }  %}
	{% else %}
		{% include 'snipplets/home/home-featured-products.tpl' with {'has_featured': true} %}
	{% endif %}

{% elseif section_select == 'informatives' %}

	{#  **** Informative banners ****  #}
	{% if show_help or (show_component_help and not has_informative_banners) %}
		{% snipplet 'defaults/home/informative_banners_help.tpl' %}
	{% else %}
		{% include 'snipplets/banner-services/banner-services.tpl' %}
	{% endif %}

{% elseif section_select == 'categories' %}

	{#  **** Categories banners ****  #}
	{% if show_help or (show_component_help and not has_banners) %}
		{% include 'snipplets/defaults/home/banners_help.tpl' with {banner_title: 'Categoría' | translate, help_text: 'Podés destacar categorías de tu tienda desde' | translate, section_name: 'Banners de categoría' | translate, section_id: 'categories' }  %}
	{% else %}
		{% include 'snipplets/home/home-banners.tpl' with {'has_banner': true} %}
	{% endif %}

{% elseif section_select == 'new' %}

	{#  **** New products ****  #}
	{% if show_help or (show_component_help and not has_products) %}
		{% include 'snipplets/defaults/home/featured_products_help.tpl' with { products_title: 'Novedades' | translate, section_id: 'new' }  %}
	{% else %}
		{% include 'snipplets/home/home-featured-products.tpl' with {'has_new': true} %}
	{% endif %}

{% elseif section_select == 'main_product' %}

	{#  **** Main product ****  #}
	{% if show_help or (show_component_help and not has_products) %}
		{% snipplet 'defaults/home/main_product_help.tpl' %}
	{% else %}
		{% include 'snipplets/home/home-main-product.tpl' %}
	{% endif %}

{% elseif section_select == 'video' %}

	{#  **** Video embed ****  #}
	{% if show_help or (show_component_help and not has_video) %}
		{% snipplet 'defaults/home/video_help.tpl' %}
	{% else %}
		{% include 'snipplets/home/home-video.tpl' %}
	{% endif %}

{% elseif section_select == 'newsletter' %}

	{#  **** Newsletter ****  #}
	{% include 'snipplets/home/home-newsletter.tpl' %}

{% elseif section_select == 'sale' %}

	{#  **** Sale products ****  #}
	{% if show_help or (show_component_help and not has_products) %}
		{% include 'snipplets/defaults/home/featured_products_help.tpl' with { products_title: 'Ofertas' | translate, section_id: 'sale' }  %}
	{% else %}
		{% include 'snipplets/home/home-featured-products.tpl' with {'has_sale': true} %}
	{% endif %}

{% elseif section_select == 'instafeed' %}

	{#  **** Instafeed ****  #}
	{% if show_help or (show_component_help and not has_instafeed) %}
		{% snipplet 'defaults/home/instafeed_help.tpl' %}
	{% else %}
		{% include 'snipplets/home/home-instafeed.tpl' %}
	{% endif %}

{% elseif section_select == 'promotional' %}

	{#  **** Promotional banners ****  #}
	{% if show_help or (show_component_help and not has_promotional_banners) %}
		{% include 'snipplets/defaults/home/banners_help.tpl' with {banner_title: 'Promoción' | translate, help_text: 'Podés mostrar tus promociones desde' | translate, section_name: 'Banners promocionales' | translate, section_id: 'promotional'}  %}
	{% else %}
		{% include 'snipplets/home/home-banners.tpl' with {'has_banner_promotional': true} %}
	{% endif %}

{% elseif section_select == 'news_banners' %}

	{#  **** News banners ****  #}
	{% if show_help or (show_component_help and not has_news_banners) %}
		{% include 'snipplets/defaults/home/banners_help.tpl' with { banner_title: 'Nuevo' | translate, help_text: 'Podés mostrar tus últimas novedades desde' | translate, section_name: 'Banners de novedades' | translate, section_id: 'news'}  %}
	{% else %}
		{% include 'snipplets/home/home-banners.tpl' with {'has_banner_news': true} %}
	{% endif %}

{% elseif section_select == 'modules' %}

	{#  **** Image and text modules ****  #}
	{% if show_help or (show_component_help and not has_image_and_text_modules) %}
		{% snipplet 'defaults/home/image_text_modules_help.tpl' %}
	{% else %}
		{% include 'snipplets/home/home-modules.tpl' %}
	{% endif %}

{% elseif section_select == 'brands' %}

	{#  **** Brands slider ****  #}
	{% if show_help or (show_component_help and not has_brands) %}
		{% snipplet 'defaults/home/brands_help.tpl' %}
	{% else %}
		{% include 'snipplets/home/home-brands.tpl' %}
	{% endif %}

{% elseif section_select == 'testimonials' %}

	{#  **** Testimonials slider ****  #}
	{% if show_help or (show_component_help and not has_testimonials) %}
		{% snipplet 'defaults/home/testimonials_help.tpl' %}
	{% else %}
		{% include 'snipplets/home/home-testimonials.tpl' %}
	{% endif %}

{% endif %}