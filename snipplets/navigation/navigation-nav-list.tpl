{% set megamenu = megamenu | default(false) %}
{% set hamburger = hamburger | default(false) %}
{% set subitem = subitem | default(false) %}

{% set hamburger_desktop_subpanels_position = '' %}

{% if settings.hamburger_desktop %}
	{% if settings.logo_position_desktop == 'center' %}
		{% set hamburger_desktop_subpanels_position = 'nav-list-panel-left-md' %}
	{% else %}
		{% set hamburger_desktop_subpanels_position = 'nav-list-panel-right-md' %}
	{% endif %}
{% endif %}

{% for item in navigation %}
	{% if item.subitems %}
		<li class="{% if megamenu %}js-desktop-nav-item js-item-subitems-desktop nav-item-desktop {% if not subitem %}js-nav-main-item nav-dropdown nav-main-item {% endif %}{% endif %}nav-item item-with-subitems" data-component="menu.item">
			{% if megamenu %}
			<div class="nav-item-container">
			{% endif %}
				<a class="{% if hamburger %}js-toggle-menu-panel align-items-center{% endif %} nav-list-link position-relative {{ item.current ? 'selected' : '' }}" href="{% if megamenu and item.url %}{{ item.url }}{% else %}#{% endif %}">{{ item.name }}
					{% if hamburger %}
						<span class="nav-list-arrow ml-1">
							{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-lg svg-icon-text"} %}
						</span>
					{% endif %}
				</a>
			{% if megamenu %}
			</div>
			{% endif %}
			{% if megamenu and not subitem %}
				<div class="js-desktop-dropdown nav-dropdown-content desktop-dropdown">
			{% endif %}
					<ul class="{% if megamenu %}{% if not subitem %}desktop-list-subitems{% endif %}{% else %}js-menu-panel nav-list-panel nav-list-panel-right {{ hamburger_desktop_subpanels_position }} {% endif %} list-subitems" {% if hamburger %}style="display:none;"{% endif %}>
						{% if hamburger %}
							<div class="modal-header">
								<div class="row">
									<div class="col">
										<a class="js-toggle-menu-back" href="#">
											<div>
												{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline svg-icon-text"} %}
											</div>
											<div class="mt-3">{{ item.name }}</div>
										</a>
									</div>
									<div class="col-auto align-self-start">
										<a class="js-toggle-menu-close js-modal-close btn-link">
											{{ "Cerrar" | translate }}
										</a>
									</div>
								</div>
							</div>
							{% if item.isCategory %}
								<li class="nav-item">
									<a class="nav-list-link position-relative font-body font-weight-bold {{ item.current ? 'selected' : '' }}" href="{{ item.url }}">
										{% if item.isRootCategory %}
											{{ 'Ver todos los productos' | translate }}
										{% else %}
											{{ 'Ver todo en' | translate }} {{ item.name }}
										{% endif %}
									</a>
								</li>
							{% endif %}
						{% endif %}

						{% set hamburger_val = false %}
						{% if hamburger %}
							{% set hamburger_val = true %}
						{% endif %}
						{% include 'snipplets/navigation/navigation-nav-list.tpl' with { 'navigation' : item.subitems, 'subitem' : true, 'hamburger' : hamburger_val  } %}
					</ul>
			{% if megamenu and not subitem %}
				</div>
			{% endif %}
		</li>
	{% else %}
		<li class="js-desktop-nav-item {% if megamenu %}{% if not subitem %}js-nav-main-item nav-main-item{% endif %} nav-item-desktop{% endif %} nav-item" data-component="menu.item">
			<a class="nav-list-link {{ item.current ? 'selected' : '' }}" href="{% if item.url %}{{ item.url | setting_url }}{% else %}#{% endif %}">{{ item.name }}</a>
		</li>
	{% endif %}
{% endfor %}