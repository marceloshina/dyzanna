{% embed "snipplets/page-header.tpl" with {container: true} %}
	{% block page_header_text %}{{ page.name }}{% endblock page_header_text %}
{% endembed %}

{# Institutional page  #}

<section class="user-content pb-5">
	<div class="container">
		<div class="row">
			<div class="col-md-8">
				{{ page.content }}
			</div>
		</div>
	</div>
</section>
