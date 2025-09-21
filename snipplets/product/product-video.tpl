{% if product.video_url %}
	{% if product.images_count > 1 %}
		{% set video_index = product.images_count %}
	{% else %}
		{% set video_index = 1 %}
	{% endif %}

	{% set has_one_image_with_grid = product.images_count == 1 and settings.product_image_format != 'slider' %}
	{% set add_top_margin_md = has_one_image_with_grid or (settings.product_image_format != 'slider' and (settings.product_image_grid == '1' or (settings.product_image_grid == '2' and settings.product_image_format == 'asymmetric'))) %}

	<div class="js-product-slide js-product-video-slide swiper-slide slider-slide mb-0 {% if add_top_margin_md %}mt-md-4{% endif %} {% if has_one_image_with_grid and settings.product_image_grid == '1' %}pr-md-5{% endif %} pr-3 pr-md-0" data-image-position="{{ video_index }}">
		<div class="product-video-container">
			<div class="product-video">

				{# Visible video inside slider #}
				{% include 'snipplets/video-item.tpl' with {product_modal_trigger: true, product_video: true} %}

				{# Hidden video inside modal #}
				{% include 'snipplets/video-item.tpl' with {product_modal: true, product_video: true} %}
			</div>
		</div>
	</div>
{% endif %}
