{% if home_main_product %}
  {% set has_multiple_slides = product.images_count > 1 %}
{% else %}
  {% set has_multiple_slides = product.images_count > 1 or product.video_url %}
{% endif %}

<div data-store="product-image-{{ product.id }}">
  {% if product.images_count > 0 %}
    <div class="product-image-gallery d-flex flex-row gap-3">

      {# Thumbnails à esquerda #}
      <div class="swiper-container js-swiper-thumbs-pdp" style="max-width: 100px;">
        <div class="swiper-wrapper flex-column">
          {% for image in product.images %}
            <div class="swiper-slide" data-thumb-index="{{ loop.index0 }}">
              <img src="{{ image | product_image_url('small') }}" alt="{{ image.alt }}" class="img-fluid" />
            </div>
          {% endfor %}
        </div>
      </div>

      {# Imagem principal à direita #}
      <div class="swiper-container js-swiper-product-pdp flex-grow-1" data-product-images-amount="{{ product.images_count }}">
        <div class="swiper-wrapper">
          {% for image in product.images %}
            <div class="swiper-slide" data-image="{{ image.id }}" data-image-position="{{ loop.index0 }}">
              <a href="{{ image | product_image_url('original') }}" data-fancybox="product-gallery" class="d-block position-relative" style="padding-bottom: {{ image.dimensions['height'] / image.dimensions['width'] * 100 }}%;">
                <img
                  src="{{ image | product_image_url('large') }}"
                  srcset="{{ image | product_image_url('large') }} 480w, {{ image | product_image_url('huge') }} 640w, {{ image | product_image_url('original') }} 1024w"
                  class="product-slider-image img-absolute img-absolute-centered"
                  alt="{{ image.alt }}" />
              </a>
            </div>
          {% endfor %}
        </div>
      </div>

    </div>
  {% endif %}
</div>
