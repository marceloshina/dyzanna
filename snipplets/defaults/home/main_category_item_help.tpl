{# Main categories item demo #}

<div class="swiper-slide home-category-slide">
	<div class="home-category {{ home_category_class }}">
		<div class="home-category-image home-category-image-placeholder">
			{% set type_value = 
				help_item_1 ? 'shirt' : 
				help_item_2 ? 'dress' :
				help_item_3 ? 'sneakers'
			%}
			{{ component('placeholders/product-placeholder',{
					type: type_value,
				})
			}}
		</div>
		<div class="home-category-name">{{ 'Categoría' | translate }}</div>
	</div>
</div>