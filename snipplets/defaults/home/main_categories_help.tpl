{# Main categories that work as examples #}

<section class="section-categories-home position-relative" data-store="home-categories-featured">
    <div class="container-fluid pr-0 pr-md-5">
        <div class="row no-gutters">
            <div class="col-3 col-md-2 pt-4">
                 <h2 class="h1 mb-3 home-category-title">{{ 'Categorías principales' | translate }}</h2>
                <div class="js-swiper-categories-prev-demo swiper-button-prev d-inline-block svg-icon-text">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-xs"} %}</div>
                <div class="js-swiper-categories-pagination-demo swiper-pagination-fraction font-small d-inline-block"></div>
                <div class="js-swiper-categories-next-demo swiper-button-next d-inline-block svg-icon-text">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-xs"} %}</div>
            </div>
            <div class="col-9 col-md-10 pr-0 pr-md-3">
                <div class="js-swiper-categories-demo swiper-container">
                    <div class="swiper-wrapper swiper-wrapper-columns">
                        {% include 'snipplets/defaults/home/main_category_item_help.tpl' with {'help_item_1': true, home_category_class: 'float-right'}  %}
                        {% include 'snipplets/defaults/home/main_category_item_help.tpl' with {'help_item_2': true}  %}
                        {% include 'snipplets/defaults/home/main_category_item_help.tpl' with {'help_item_3': true, home_category_class: 'float-right'}  %}
                        {% include 'snipplets/defaults/home/main_category_item_help.tpl' with {'help_item_1': true}  %}
                        {% include 'snipplets/defaults/home/main_category_item_help.tpl' with {'help_item_2': true, home_category_class: 'float-right'}  %}
                        {% include 'snipplets/defaults/home/main_category_item_help.tpl' with {'help_item_3': true}  %}
                    </div>
                </div>
            </div>
        </div>
        {% if not params.preview %}
            <div class="placeholder-overlay transition-soft">
                <div class="placeholder-info p-2">
                    {% include "snipplets/svg/edit.tpl" with {svg_custom_class: "icon-inline icon-3x"} %}
                    <div class="placeholder-description font-small-xs my-2">
                        {{ "Podés mostrar tus categorías principales desde" | translate }} <strong>"{{ "Categorías principales" | translate }}"</strong>
                    </div>
                    <a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small placeholder-button">{{ "Editar" | translate }}</a>
                </div>
            </div>
        {% endif %}
    </div>
</section>