{% if settings.influencers and settings.influencers is not empty %}
<div class="container influencers">
  <div class="row align-items-center mb-3">
    <div class="col-md-12 mb-4">
      {% if settings.influencers_title %}
        <h2 class="h1 mb-4">{{ settings.influencers_title | raw }}</h2>
      {% endif %}
      {% if settings.influencers_subtitle %}
        <h3 class="subtitle font-weight-normal mb-3">{{ settings.influencers_subtitle | raw }}</h3>
      {% endif %}
    </div>

    <div class="col-md-12">
      <div class="influencers-grid">
        {% for slide in settings.influencers %}
          <div class="influencer-item">
            {% if slide.link %}
              <a href="{{ slide.link | setting_url }}" title="{{ 'Marca {1} de' | translate(loop.index) }} {{ store.name }}" aria-label="{{ 'Marca {1} de' | translate(loop.index) }} {{ store.name }}">
            {% endif %}
              <img 
                src="{{ 'images/empty-placeholder.png' | static_url }}" 
                data-src="{{ slide.image | static_url | settings_image_url('large') }}" 
                class="lazyload influencers-image img-fluid" 
                alt="{{ 'Marca {1} de' | translate(loop.index) }} {{ store.name }}">
            {% if slide.link %}
              </a>
            {% endif %}
          </div>
        {% endfor %}
      </div>
    </div>
  </div>
</div>
{% endif %}
