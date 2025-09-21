{% set image_sizes = ['large', 'huge', 'original', '1080p'] %}
{% set category_images = [] %}
{% set has_category_images = category.images is not empty %}

{% for size in image_sizes %}
    {% if has_category_images %}
        {# Define images for admin categories #}
        {% set category_images = category_images|merge({(size):(category.images | first | category_image_url(size))}) %}
    {% else %}
        {# Define images for general banner #}
        {% set category_images = category_images|merge({(size):('banner-products.jpg' | static_url | settings_image_url(size))}) %}
    {% endif %}
{% endfor %}

{% set category_image_url = 'banner-products.jpg' | static_url %}

<section class="category-banner mr-4" data-store="category-banner">
    <img class="category-banner-image" fetchpriority="high" src="{{ category_images['large'] }}" srcset="{{ category_images['large'] }} 480w, {{ category_images['huge'] }} 640w, {{ category_images['original'] }} 1024w, {{ category_images['1080p'] }} 1920w" alt="{{ 'Banner de la categoría' | translate }} {{ category.name }}" />
    <div class="textbanner-text category-banner-info over-image px-0">
       {% embed "snipplets/page-header.tpl" %}
            {% block page_header_text %}{{ category.name }}{% endblock page_header_text %}
        {% endembed %}
        {% if category.description %}
            <div class="container-fluid">
                <p class="mt-2 mb-0">{{ category.description }}</p>
            </div>
        {% endif %}
    </div>
</section>