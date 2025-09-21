{% set has_multiple_slides = product.images_count > 1 or product.video_url %}
{% set narrow_wrapper = settings.product_image_format == 'slider' or (settings.product_image_format != 'slider' and (settings.product_image_grid == '1' or (settings.product_image_grid == '2' and not has_multiple_slides ))) %}
{% set narrow_empty_description = narrow_wrapper and product.description is empty %}

<div id="single-product" class="js-has-new-shipping js-product-detail js-product-container js-shipping-calculator-container py-3 pt-md-4" data-variants="{{product.variants_object | json_encode }}" data-store="product-detail">
    <div class="container-fluid">
        {% if narrow_wrapper %}
        <div class="col-md-10 offset-md-1 px-0">
        {% endif %}
            <div class="row section-single-product {% if settings.full_width_description %}{% if narrow_empty_description %}mb-md-0{% else %}mb-md-5{% endif %}{% endif %}">
                <div class="{% if narrow_wrapper %}col-md-7{% else %}col-md-8{% endif %} {% if has_multiple_slides %}pr-0 pr-md-3 overflow-none{% endif %}">
                	{% include 'snipplets/product/product-image.tpl' %}
                </div>
                <div class="col pt-1 pt-md-0" data-store="product-info-{{ product.id }}">
                    {% if settings.product_image_format != 'slider' %}
                        <div class="js-sticky-product sticky-product">
                    {% endif %}
                        	{% include 'snipplets/product/product-form.tpl' %}
                            {% if not settings.full_width_description %}
                                {% include 'snipplets/product/product-description.tpl' %}
                            {% endif %}
                    {% if settings.product_image_format != 'slider' %}
                        </div>
                    {% endif %}
                </div>
            </div>
        {% if narrow_wrapper %}
        </div>
        {% endif %}
    </div>
    
    {# Product description full width #}

    {% if settings.full_width_description %}
        {% if narrow_empty_description %}
        <div class="col-md-10 offset-md-1 px-0">
        {% endif %}
            {% include 'snipplets/product/product-description.tpl' %}
        {% if narrow_empty_description %}
        </div>
        {% endif %}
    {% endif %}
</div>

{# Related products #}
{% include 'snipplets/product/product-related.tpl' %}
