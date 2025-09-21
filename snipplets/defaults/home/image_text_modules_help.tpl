{# Image and text module work as examples #}

<section class="section-banners-home{% if settings.module_colors and not settings.module_asymmetric %} section-module-background{% endif %} position-relative overflow-none" data-store="home-image-text-module" data-transition="scale-out-image">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-{% if settings.module_asymmetric %}5{% else %}3{% endif %} mb-4 pt-md-5 mt-md-5">
            </div>
            <div class="col-md-{% if settings.module_asymmetric %}7 pt-5{% else %}9{% endif %}">
                <div class="row row-grid">
                    {% for i in 1..2 %}
                        <div class="col-grid col-md-{% if settings.module_asymmetric %}8{% else %}6{% endif %}">
                            <div class="textbanner{% if settings.module_asymmetric and loop.index is even %} text-right{% endif %}{% if not settings.module_asymmetric %} row{% endif %}">
                                <div class="textbanner-image pt-0 pr-0 {% if not settings.module_asymmetric %} overflow-none col-6{% endif %} {% if settings.theme_rounded %}banner-round{% endif %}">
                                    {% if settings.module_asymmetric %}
                                        <div class="col-7 col-md-8{% if loop.index is even %} offset-5{% endif %} p-0">
                                    {% endif %}
                                        <div class="overflow-none {% if settings.theme_rounded %}banner-round{% endif %}">
                                            {{ component('placeholders/banner-placeholder')}}
                                        </div>
                                    {% if settings.module_asymmetric %}
                                        </div>
                                    {% endif %}
                                    {% if settings.module_asymmetric %}
                                        <div class="col-8 col-md-7 textbanner-title{% if loop.index is even %} textbanner-title-even{% endif %}">
                                            <div class="h1-huge h1-md">{{ 'Módulo de imagen y texto' | translate }}</div>
                                        </div>
                                    {% endif %}
                                </div>
                                <div class="textbanner-text col-6 {% if settings.module_asymmetric %} offset-2{% endif %} {% if settings.theme_rounded %}banner-round{% endif %}">
                                    {% if not settings.module_asymmetric %}
                                        <div class="h1">{{ 'Módulo de imagen y texto' | translate }}</div>
                                    {% endif %}
                                    <div class="textbanner-paragraph">{{ 'Usá este texto para compartir información de tu negocio, dar la bienvenida a tus clientes o para contar lo increíble que son tus productos.' | translate }}</div>
                                </div>
                            </div>
                        </div>
                    {% endfor %}
                </div>
                {% if settings.module_asymmetric and settings.module_colors %}
                    <div class="module-background"></div>
                {% endif %}
            </div>
        </div>
        {% if not params.preview %}
            <div class="placeholder-overlay transition-soft">
                <div class="placeholder-info">
                        {% include "snipplets/svg/edit.tpl" with {svg_custom_class: "icon-inline icon-3x"} %}
                        <div class="placeholder-description font-small-xs">
                            {{ "Podés contar más sobre tu tienda desde" | translate }} <strong>"{{ "Módulos de imagen y texto" | translate }}"</strong>
                        </div>
                        <a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small placeholder-button">{{ "Editar" | translate }}</a>
                    </div>
                </div>
            </div>
        {% endif %}
    </div>
</section>