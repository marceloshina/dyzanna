{% set has_multiple_slides = product.images_count > 1 or product.video_url %}
{% set label_top_right_md = template == 'product' and product_detail and settings.product_image_format != 'slider' %}
{% set offset_right = has_multiple_slides and settings.product_image_format != 'slider' and settings.product_image_grid == '1' %}

{% set label_position_classes = (label_top_right_md ? 'label-top-right-md') ~ (offset_right ? ' mr-md-5') %}
{% set label_accent_classes = 'label label-accent ' ~ label_position_classes %}
{% set label_default_classes = 'label label-default' %}

{{ component(
  'labels', {
    prioritize_promotion_over_offer: true,
    promotion_nxm_long_wording: false,
    promotion_quantity_long_wording: true,
    offer_percentage_wording: false,
    offer_negative_discount_percentage: true,
    labels_classes: {
      group: 'js-labels-floating-group labels ' ~ (product_detail ? 'labels-product-slider'),
      promotion: label_accent_classes,
      promotion_primary_text: 'd-block',
      promotion_secondary_text: 'font-smallest',
      offer: 'js-offer-label ' ~ label_accent_classes,
      shipping: 'label label-top ',
      no_stock: 'js-stock-label ' ~ label_default_classes ~ label_position_classes,
    },
  })
}}