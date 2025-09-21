{% set logo_size_class = settings.logo_size == 'small' ? 'logo-img-small' : settings.logo_size == 'big' ? 'logo-img-big' %}
{{ component('logos/logo', {
        logo_img_classes: 'transition-soft ' ~ logo_size_class,
        logo_text_classes: 'h3 mb-0',
        logo_size: 'large'
    })
}}

{% if template == 'home' and settings.head_transparent_contrast_options and "logo-transparent.jpg" | has_custom_image %}
    {{ component('logos/logo-transparent-header', {
            container_classes: { logo_img_container: "logo-header-transparent-container"},
            logo_img_name: 'logo-transparent.jpg',
            logo_img_classes: 'transition-soft ' ~ logo_size_class,
            logo_size: 'large'
        })
    }}
{% endif %}