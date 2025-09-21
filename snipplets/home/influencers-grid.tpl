{% set banner_influencers = banner_influencers | default(false) %}

{% if banner_influencers %}
    {% set has_banners = settings.banner_influencers and settings.banner_influencers is not empty %}
    {% set has_mobile_banners = settings.toggle_banner_influencers_mobile and settings.banner_influencers_mobile and settings.banner_influencers_mobile is not empty %}
    {% set section_banner = mobile ? settings.banner_influencers_mobile : settings.banner_influencers %}
    {% set section_title = settings.banner_influencers_title %}
    {% set section_slider = settings.banner_influencers_slider %}
    {% set section_id = mobile ? 'banners-promotional-mobile' : 'banners-promotional' %}
    {% set section_columns_desktop_4 = settings.banner_influencers_columns_desktop == 4 %}
    {% set section_columns_desktop_3 = settings.banner_influencers_columns_desktop == 3 %}
    {% set section_columns_desktop_2 = settings.banner_influencers_columns_desktop == 2 %}
    {% set section_columns_desktop_1 = settings.banner_influencers_columns_desktop == 1 %}
    {% set section_same_size = settings.banner_influencers_same_size %}
    {% set section_text_outside = settings.banner_influencers_text_outside %}
    {% set section_without_margins = settings.banner_influencers_without_margins %}
    {% set section_asymmetric = settings.banner_influencers_asymmetric %}
{% endif %}

{% set banner_group_round = settings.theme_rounded and section_without_margins and not section_asymmetric %}
{% set banner_round_right_mobile = settings.theme_rounded and section_without_margins and not section_asymmetric %}
{% set banner_specific_round_corners_conditions = settings.theme_rounded and section_without_margins and not section_asymmetric and not section_slider %}
{% set any_banner_has_text = false %}

{% set visibility_classes = 
    has_banners and has_mobile_banners ? (mobile ? 'd-md-none' : 'd-none d-md-block') 
    : not has_banners and has_mobile_banners and not mobile ? 'd-none' 
%}

<div class="container {{ visibility_classes }}">
    {% if section_title %}
        <div class="row mb-4 pb-2 {% if banner_influencers %}banner-influencers{% endif %}">
            <div class="col">
                <h2 class="h3 mb-0 {% if banner_influencers %}titulo-linha{% endif %}">{{ section_title | raw }}</h2>
            </div>
        </div>
    {% endif %}
{% if section_without_margins %}
</div>
<div class="container-fluid {{ visibility_classes }}">
{% endif %}
    <div class="row">
        <div class="col-12{% if section_slider and section_columns_desktop_1 %} col-md-8 offset-md-2{% elseif section_without_margins %} p-0{% endif %} {% if banner_group_round %}banner-group-round{% endif %}">
            {% if section_slider %}
                <div class="js-swiper-{{ section_id }} swiper-container">
                    <div class="swiper-wrapper">
            {% else %}
                <div class="row {% if section_without_margins %}no-gutters{% else %}row-grid{% endif %}">
            {% endif %}
            {% for slide in section_banner %}

                {% set has_banner_text = slide.title or slide.description or slide.button %}

                {% if has_banner_text %}
                    {% set any_banner_has_text = true %}
                {% endif %}

                {% set has_one_banner = false %}

                {% if loop.length == 1 %}
                    {% set has_one_banner = true %}
                {% endif %}

                {% set banner_round = settings.theme_rounded and (not section_without_margins or (section_without_margins and section_asymmetric) or (not section_without_margins and section_columns_desktop_1 and has_one_banner)) %}

                {% set banner_round_right_desktop = banner_specific_round_corners_conditions and section_text_outside and any_banner_has_text and (section_columns_desktop_1 or (section_columns_desktop_2 and loop.index is even) or (section_columns_desktop_3 and loop.index % 3 == 0) or (section_columns_desktop_4 and loop.index % 4 == 0) or loop.last) %}

                {% set banner_round_top_right_desktop = banner_specific_round_corners_conditions and not section_text_outside and ((section_columns_desktop_2 and loop.index == 2) or (section_columns_desktop_3 and loop.index == 3) or (section_columns_desktop_4 and loop.index == 4) or (section_columns_desktop_1 and loop.index == 1) or (not section_columns_desktop_1 and loop.last)) %}

                {% set banner_round_bottom_right_desktop = banner_specific_round_corners_conditions and (not section_text_outside or (section_text_outside and not any_banner_has_text)) and loop.last %}

                {% set banner_round_desktop = settings.theme_rounded and section_without_margins and not section_asymmetric and section_slider and section_columns_desktop_1 %}

                {% set banner_mobile_specific_round_corners_conditions = banner_specific_round_corners_conditions and (not section_text_outside or (section_text_outside and not any_banner_has_text)) %}

                {% set banner_round_top_right_mobile = banner_mobile_specific_round_corners_conditions and loop.first and not loop.last %}

                {% set banner_round_bottom_right_mobile = banner_mobile_specific_round_corners_conditions and loop.last and not loop.first %}

                {% set banner_square_mobile = banner_mobile_specific_round_corners_conditions and not (loop.first or loop.last) %}

                <div class="{% if section_slider %}swiper-slide {% else %}col-grid {% if section_columns_desktop_4 %}col-md-3{% elseif section_columns_desktop_3 %}col-md-4{% elseif section_columns_desktop_2 %}col-md-6{% elseif section_columns_desktop_1 %}col-md-{% if section_asymmetric %}8 offset-md-2{% else %}12{% endif %}{% endif %}{% endif %}">
                    <div class="textbanner{% if section_asymmetric and loop.index is even %} {% if not section_columns_desktop_1 %}textbanner-even{% endif %} text-right{% endif %}{% if section_without_margins and not section_asymmetric %} m-0{% endif %}">
                        {% if slide.link %}
                            <a href="{{ slide.link | setting_url }}" class="textbanner-link" aria-label="{{ 'Carrusel' | translate }} {{ loop.index }}">
                        {% endif %}
                        <div class="textbanner-image{% if not section_same_size %} p-0{% endif %}{% if has_banner_text and not section_text_outside %} overlay{% endif %}{% if not section_asymmetric %} overflow-none{% endif %} {% block banner_round_conditionals %}{% if banner_round %}banner-round{% elseif not has_one_banner %}{% if banner_round_desktop %}banner-round-md{% endif %} {% if banner_round_right_mobile and not banner_square_mobile %}banner-round-right-xs{% endif %} {% if banner_round_top_right_mobile %}banner-round-top-right{% endif %} {% if banner_round_bottom_right_mobile %}banner-round-bottom-right{% endif %} {% if banner_round_right_desktop %}banner-round-right-md{% endif %} {% if banner_round_top_right_desktop %}banner-round-top-right-md{% endif %} {% if banner_round_bottom_right_desktop %}banner-round-bottom-right-md{% endif %}{% else %}banner-round-right{% endif %}{% endblock %}">
                            {% if section_asymmetric %}
                                <div class="col-7{% if loop.index is even %} offset-5{% endif %}{% if section_same_size %} textbanner-image-height{% endif %} p-0 {% if banner_round %}banner-round{% endif %} overflow-none">
                            {% endif %}
                                <img {% if slide.width and slide.height %} width="{{ slide.width }}" height="{{ slide.height }}" {% endif %} src="{% if not section_slider %}{{ 'images/empty-placeholder.png' | static_url }}{% endif %}" data-sizes="auto" data-expand="-10" data-srcset="{{ slide.image | static_url | settings_image_url('large') }} 480w, {{ slide.image | static_url | settings_image_url('huge') }} 640w, {{ slide.image | static_url | settings_image_url('original') }} 1024w, {{ slide.image | static_url | settings_image_url('1080p') }} 1920w" class="textbanner-image-effect {% if section_same_size %}textbanner-image-background{% else %}img-fluid d-block w-100{% endif %} {{ block ('banner_round_conditionals') }} lazyautosizes lazyload fade-in" {% if slide.title %}alt="{{ banner_title }}"{% else %}alt="{{ 'Banner de' | translate }} {{ store.name }}"{% endif %} />
                                <div class="placeholder-fade placeholder-banner {{ block ('banner_round_conditionals') }}"></div>
                            {% if section_asymmetric %}
                                </div>
                            {% endif %}
                            {% if section_asymmetric and slide.title %}
                                <div class="col-8 col-md-7 textbanner-title{% if loop.index is even %} textbanner-title-even{% endif %}">
                                    <h3 class="h1-huge mb-0{% if section_columns_desktop_4 %} h1-md{% endif %}">{{ slide.title }}</h3>
                                </div>
                            {% endif %}
                        {% if section_text_outside or section_asymmetric %}
                            </div>
                        {% endif %}
                        {% if has_banner_text %}
                            <div class="textbanner-text{% if not (section_text_outside or section_asymmetric) %} over-image{% endif %} {% if not (section_text_outside and section_asymmetric) and slide.color == 'light' %}over-image-invert{% endif %} {% if section_asymmetric %}{% if loop.index is even %} col-8 col-md-7{% else %} offset-4 offset-md-5{% endif %}{% endif %} {% if section_text_outside and not section_asymmetric %}mb-3{% endif %}">
                                {% if slide.title and not section_asymmetric %}
                                    <h3 class="h1 mb-0">{{ slide.title }}</h3>
                                {% endif %}
                                {% if slide.description %}
                                    <div class="textbanner-paragraph">{{ slide.description }}</div>
                                {% endif %}
                                {% if slide.button and slide.link %}
                                    <div class="btn btn-secondary btn-small d-inline-block mt-2">{{ slide.button }}</div>
                                {% endif %}
                            </div>
                        {% endif %}
                        {% if not (section_text_outside or section_asymmetric) %}
                            </div>
                        {% endif %}
                        {% if slide.link %}
                            </a>
                        {% endif %}
                    </div>
                </div>
            {% endfor %}
            {% if section_slider %}
                    </div>
                </div>
            {% else %}
                </div>
            {% endif %}
        </div>
        {% if section_slider and (section_banner and section_banner is not empty) %}
            <div class="col {% if section_without_margins %}mt-3{% endif %}">
                <div class="js-swiper-{{ section_id }}-prev swiper-button-prev d-inline-block svg-icon-text">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-xs"} %}</div>
                <div class="js-swiper-{{ section_id }}-pagination swiper-pagination-fraction font-small d-inline-block"></div>
                <div class="js-swiper-{{ section_id }}-next swiper-button-next d-inline-block svg-icon-text">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-xs"} %}</div>
            </div>
        {% endif %}
    </div>
</div>