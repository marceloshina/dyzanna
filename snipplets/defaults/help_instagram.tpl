<div class="instafeed-post">
	<div class="instafeed-link">
		<div class="instafeed-img overflow-none">
			{% set type_value = help_item_1 ? 'like_icon' : 'instagram_icon' %}
			{{ component('placeholders/instagram-post-placeholder',{type: type_value})}}
		</div>
	</div>
</div>