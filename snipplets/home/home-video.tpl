{% if settings.video_embed %}

<section class="banners-dna">

	{% include 'snipplets/home/banners-dna.tpl' %}

</section>

    <section class="js-section-video section-video-home mb-4 ml-3" data-store="home-video" data-transition="fade-in" {% if settings.head_transparent %}data-header-type="transparent-on-section"{% endif %}>
        {% set has_video_text = settings.video_title or settings.video_subtitle or settings.video_text or (settings.video_button and settings.video_button_url)  %}
        <div class="js-home-video-container lazyload home-video embed-responsive embed-responsive-16by9{% if settings.video_vertical_mobile %} embed-responsive-1by1{% endif %} position-relative{% if has_video_text and settings.video_type == 'autoplay' %} home-video-overlay{% endif %}">
            {% if settings.video_type == 'sound' %}
                <a href="#" class="js-play-button video-player">
                    <div class="video-player-icon">{% include "snipplets/svg/play.tpl" with {svg_custom_class: "icon-inline icon-xs svg-icon-text icon-xs"} %}</div>
                </a>
            {% endif %}
            {% if settings.home_order_position_1 == 'video' or settings.video_type == 'sound' %}
                <div class="js-home-video-image{% if settings.home_order_position_1 == 'video' and settings.video_type == 'autoplay' %} d-block d-md-none{% endif %}">
                    {% if "video_image.jpg" | has_custom_image %}
                        {% set video_image_src = 'video_image.jpg' | static_url | settings_image_url("large") %}
                    {% else %}
                        {% set video_url = settings.video_embed %}
                        {% if '/watch?v=' in settings.video_embed %}
                            {% set video_format = '/watch?v=' %}
                        {% elseif '/youtu.be/' in settings.video_embed %}
                            {% set video_format = '/youtu.be/' %}
                        {% elseif '/shorts/' in settings.video_embed %}
                            {% set video_format = '/shorts/' %}
                        {% endif %}
                        {% set video_id = video_url|split(video_format)|last %}
                        {% set video_image_src = 'https://img.youtube.com/vi_webp/' ~ video_id ~ '/maxresdefault.webp' %}
                    {% endif %}
                    <img class="home-video-image" src='{{ video_image_src }}'{% if "video_image.jpg" | has_custom_image %} srcset='{{ "video_image.jpg" | static_url | settings_image_url("original") }} 1024w, {{ "video_image.jpg" | static_url | settings_image_url("1080p") }} 1920w'{% endif %} alt="{{ 'Video de' | translate }} {{ store.name }}" />
                    {% if settings.video_type == 'autoplay' %}
                        <div class="placeholder-shine placeholder-shine-invert"></div>
                    {% endif %}
                </div>
            {% endif %}
            <div class="js-home-video" id="player"></div>
            {% if settings.video_type == 'autoplay' %}
                <div class="home-video-hide-controls"></div>
            {% else %}
                </div>
            {% endif %}
            {% if has_video_text %}
                <div class="container{% if settings.video_type == 'sound' %}-fluid{% endif %}">
                    <div class="{% if settings.video_type == 'autoplay' %}home-video-text text-center{% else %}row{% endif %}">
                        {% if settings.video_type == 'sound' %}
                            <div class="home-video-text-outside mb-4 col-9 col-md-5 offset-3 offset-md-7{% if not settings.video_subtitle %} pt-4{% endif %}">
                        {% endif %}
                            {% if settings.video_subtitle %}
                                <div class="subtitle mb-3">{{ settings.video_subtitle }}</div>
                            {% endif %}
                            {% if settings.video_title %}
                                <h2 class="h1-huge mb-3">{{ settings.video_title }}</h2>
                            {% endif %}
                            {% if settings.video_text %}
                                <p class="mb-4 pl-1">{{ settings.video_text }}</p>
                            {% endif %}
                            {% if settings.video_button and settings.video_button_url %}
                                <a href="{{ settings.video_button_url }}" class="btn btn-{% if settings.video_type == 'autoplay' %}primary{% else %}secondary btn-small{% endif %} d-inline-block">{{ settings.video_button }}</a>
                            {% endif %}
                        {% if settings.video_type == 'sound' %}
                            </div>
                        {% endif %}
                    </div>
                </div>
            {% endif %}
        </div>
    </section>
{% endif %}
