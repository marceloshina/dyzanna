{% if settings.show_instafeed and store.instagram and store.hasInstagramToken() %}
    <section class="section-instafeed-home" data-store="home-instagram-feed">
        <div class="container">
            <div class="row align-items-center">
                {% set instuser = store.instagram|split('/')|last %}
                <div class="col-md-4 mb-md-4">
                    <a target="_blank" href="{{ store.instagram }}" class="mb-0" aria-label="{{ 'Instagram de' | translate }} {{ store.name }}">
                        <div class="instafeed-title">
                            <h3 class="subtitle font-weight-normal mb-4">{{ 'Seguinos en Instagram' | translate }}</h3>
                            <h2 class="h1 mb-0">{{ instuser }}</h2>
                            {# Instagram fallback info in case feed fails to load #}
                            <div class="js-ig-fallback">
                                <p class="btn-link mt-4">{{ 'Ver perfil' | translate }}</p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-8">
                    {% if store.hasInstagramToken() %}
                        <div class="js-ig-success row instafeed-grid pb-3"
                            data-ig-feed
                            data-ig-items-count="8"
                            data-ig-item-class="instafeed-post"
                            data-ig-link-class="instafeed-link"
                            data-ig-image-class="instafeed-img w-100 fade-in"
                            data-ig-aria-label="{{ 'Publicación de Instagram de' | translate }} {{ store.name }}"
                            style="display: none;">
                        </div>
                    {% endif %}
                </div>
            </div>
        </div>
    </section>
{% endif %}