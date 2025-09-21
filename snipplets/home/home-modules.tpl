{% if settings.module and settings.module is not empty %}
    <section class="section-banners-home{% if settings.module_colors and not settings.module_asymmetric %} section-module-background{% endif %} position-relative overflow-none" data-store="home-image-text-module" data-transition="scale-out-image">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-{% if settings.module_asymmetric %}5{% else %}3{% endif %} mb-4 pt-md-5 mt-md-5">
                    {% if settings.module_title %}
                        <div class="h1-huge">{{ settings.module_title }}</div>
                    {% endif %}
                </div>
                <div class="col-md-{% if settings.module_asymmetric %}7 pt-5{% else %}9{% endif %}">
                    <div class="row row-grid">
                        {% for slide in settings.module %}
                            <div class="col-grid col-md-{% if settings.module_asymmetric %}8{% elseif not settings.module_text_outside %}4{% else %}6{% endif %}">
                                {% set has_banner_text = slide.title or slide.description or slide.button %}
                                <div class="textbanner{% if settings.module_asymmetric and loop.index is even %} text-right{% endif %}{% if settings.module_text_outside and not settings.module_asymmetric and not slide.link %} row{% endif %}">
                                    {% if slide.link %}
                                        <a href="{{ slide.link | setting_url }}" class="{% if settings.module_text_outside and not settings.module_asymmetric %}row{% else %}textbanner-link{% endif %}" aria-label="{{ 'Carrusel' | translate }} {{ loop.index }}">
                                    {% endif %}
                                    <div class="textbanner-image{% if not settings.module_same_size %} pt-0 pr-0{% endif %}{% if has_banner_text and not settings.module_text_outside %} overlay{% endif %}{% if not settings.module_asymmetric %} overflow-none{% endif %}{% if settings.module_text_outside and not settings.module_asymmetric %} col-6{% endif %} {% if settings.theme_rounded %}banner-round{% endif %}">
                                        {% if settings.module_asymmetric %}
                                            <div class="col-7{% if loop.index is even %} offset-5{% endif %}{% if settings.module_same_size %} textbanner-image-height{% endif %} p-0 {% if settings.theme_rounded %}banner-round{% endif %} overflow-none">
                                        {% endif %}
                                            <img {% if slide.width and slide.height %} width="{{ slide.width }}" height="{{ slide.height }}" {% endif %} src="{{ 'images/empty-placeholder.png' | static_url }}" data-sizes="auto" data-expand="-10" data-srcset="{{ slide.image | static_url | settings_image_url('large') }} 480w, {{ slide.image | static_url | settings_image_url('huge') }} 640w, {{ slide.image | static_url | settings_image_url('original') }} 1024w, {{ slide.image | static_url | settings_image_url('1080p') }} 1920w" class="textbanner-image-effect {% if settings.module_same_size %}textbanner-image-background{% else %}img-fluid d-block w-100{% endif %} {% if settings.theme_rounded %}banner-round{% endif %} lazyautosizes lazyload fade-in" {% if slide.title %}alt="{{ banner_title }}"{% else %}alt="{{ 'Banner de' | translate }} {{ store.name }}"{% endif %} />
                                            <div class="placeholder-fade {% if settings.theme_rounded %}banner-round{% endif %}"></div>
                                        {% if settings.module_asymmetric %}
                                            </div>
                                        {% endif %}
                                        {% if settings.module_asymmetric and slide.title %}
                                            <div class="col-8 col-md-7 textbanner-title{% if loop.index is even %} textbanner-title-even{% endif %}">
                                                <div class="h1-huge h1-md">{{ slide.title }}</div>
                                            </div>
                                        {% endif %}
                                    {% if settings.module_text_outside or settings.module_asymmetric %}
                                        </div>
                                    {% endif %}
                                    {% if has_banner_text %}
                                        <div class="textbanner-text col-{% if settings.module_text_outside %}6{% else %}{% if settings.module_asymmetric %}8{% else %}12{% endif %}{% endif %}{% if not (settings.module_text_outside or settings.module_asymmetric) %} over-image{% endif %} {% if not (settings.module_text_outside and settings.module_asymmetric) and slide.color == 'light' %}over-image-invert{% endif %}{% if settings.module_asymmetric %} offset-2{% endif %} {% if settings.theme_rounded %}banner-round{% endif %}">
                                            {% if slide.title and not settings.module_asymmetric %}
                                                <div class="h1">{{ slide.title }}</div>
                                            {% endif %}
                                            {% if slide.description %}
                                                <div class="textbanner-paragraph">{{ slide.description }}</div>
                                            {% endif %}
                                            {% if slide.button and slide.link %}
                                                <div class="btn btn-secondary btn-small d-inline-block mt-2">{{ slide.button }}</div>
                                            {% endif %}
                                        </div>
                                    {% endif %}
                                    {% if not (settings.module_text_outside or settings.module_asymmetric) %}
                                        </div>
                                    {% endif %}
                                    {% if slide.link %}
                                        </a>
                                    {% endif %}
                                </div>
                            </div>
                        {% endfor %}
                    </div>
                    {% if settings.module_asymmetric and settings.module_colors %}
                        <div class="module-background"></div>
                    {% endif %}
                </div>
            </div>
        </div>
    </section>
{% endif %}
