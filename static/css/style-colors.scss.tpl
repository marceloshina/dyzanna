{#/*============================================================================
style.scss.tpl

    -This file contains all the theme styles related to settings defined by user from config/settings.txt
    -Rest of styling can be found in:
        --static/css/style-async.css.tpl --> For non critical styles witch will be loaded asynchronously
        --static/css/style-critical.tpl --> For critical CSS rendered inline before the rest of the site

==============================================================================*/#}

{# /*============================================================================
  Table of Contents
  #Colors and fonts
    // Colors
    // Font families
    // SVG Icons
    // Texts
    // Backgrounds 
  #Components
    // Margin and Padding
    // Mixins
    // Animations
    // Wrappers
    // Placeholders
    // Dividers    
    // Headings
    // Buttons
    // Links
    // Chips
    // Progress bar 
    // Modals
    // Forms
    // Alerts and Notifications
    // Tooltip
    // Images
    // Tables
    // Tabs
    // Cards
    // Sliders
  #Home page
    // Home banners
    // Brands
    // Video
    // Instafeed
    // Featured products
    // Newsletter
  #Product grid
    // Category controls
    // Grid item
    // Labels
  #Product detail
    // Image
    // Form and info
  #Account page
    // Order items
  #Header and nav
    // Header
    // Utilities
    // Search
    // Nav
  #Footer
    // Copyright
  #Media queries
    // Min width 768px
    //// Components
    //// Product grid

==============================================================================*/ #}

{#/*============================================================================
  #Colors and fonts
==============================================================================*/#}
	
{# /* // Colors */ #}

$accent-color: {{ settings.accent_color }};

$main-foreground: {{ settings.text_color }};
$main-background: {{ settings.background_color }};

{% if settings.adbar_colors %}
  $adbar-background: {{ settings.adbar_background_color }};
  $adbar-foreground: {{ settings.adbar_foreground_color }};
{% else %}
  $adbar-background: {{ settings.text_color }};
  $adbar-foreground: {{ settings.background_color }};
{% endif %}

{% if settings.header_colors %}
  $header-background: {{ settings.header_background_color }};
  $header-foreground: {{ settings.header_foreground_color }};
{% else %}
  $header-background: {{ settings.background_color }};
  $header-foreground: {{ settings.text_color }};
{% endif %}

{% if settings.head_transparent_contrast_options %}
  $header-transparent-foreground: {{ settings.header_transparent_foreground_color }};
{% endif %}

{% if settings.footer_colors %}
  $footer-background: {{ settings.footer_background_color }};
  $footer-foreground: {{ settings.footer_foreground_color }};
{% else %}
  $footer-background: {{ settings.background_color }};
  $footer-foreground: {{ settings.text_color }};
{% endif %}

$button-background: {{ settings.button_background_color }};
$button-foreground: {{ settings.button_foreground_color }};

$label-background: {{ settings.label_background_color }};
$label-foreground: {{ settings.label_foreground_color }};

{% if settings.module_colors %}
  $module-color: {{ settings.module_background_color }};
{% endif %}

{% if settings.brands_colors %}
  $brands-background: {{ settings.brands_background_color }};
  $brands-foreground: {{ settings.brands_foreground_color }};
{% endif %}

{% if settings.featured_product_colors %}
  $featured-background: {{ settings.featured_product_background_color }};
{% endif %}

{% if settings.new_product_colors %}
  $new-background: {{ settings.new_product_background_color }};
{% endif %}

{% if settings.sale_product_colors %}
  $sale-background: {{ settings.sale_product_background_color }};
{% endif %}

{% if settings.testimonials_colors %}
  $testimonials-background: {{ settings.testimonials_background_color }};
  $testimonials-foreground: {{ settings.testimonials_foreground_color }};
{% endif %}

{% if settings.home_news_colors %}
  $newsletter-background: {{ settings.home_news_background_color }};
  $newsletter-foreground: {{ settings.home_news_foreground_color }};
{% endif %}

{% if settings.product_description_colors %}
  $product-background: {{ settings.product_description_background_color }};
  $product-foreground: {{ settings.product_description_foreground_color }};
{% endif %}

{# /* // SVG Icons */ #}

.svg-icon-text{
  fill: $main-foreground;
}

.svg-icon-accent{
  fill: $accent-color;
}

.svg-icon-invert{
  fill: $main-background;
}

{# /* // Texts */ #}

.text-secondary {
  color: $main-background;
}

.text-accent,
.product-installments.installment-no-interest {
  color: $accent-color!important;
}

.bg-primary{
  background-color: $accent-color!important;
  color: $main-background!important;
  a{
    color: $main-background!important;
  }
}

{# /* // Backgrounds */ #}

.background-main{
  background-color: $main-background;
}

{#/*============================================================================
  #Components
==============================================================================*/#}

{# /* // Margin and Padding */ #}

%section-margin {
  margin-bottom: 70px;
}
%element-margin {
  margin-bottom: 20px;
}
%element-margin-half {
  margin-bottom: 10px;
}

{# /* // Mixins */ #}

@mixin text-decoration-none(){
  text-decoration: none;
  outline: 0;
  &:hover,
  &:focus{
    text-decoration: none;
    outline: 0;
  }
}

@mixin no-wrap(){
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	font-weight: normal;
}

@mixin drop-shadow(){
	-moz-box-shadow: 0 0 3px #ccc;
	-webkit-box-shadow: 0 0 3px #ccc;
	box-shadow: 0 0 3px #ccc;
}

{# This mixin adds browser prefixes to a CSS property #}

@mixin prefix($property, $value, $prefixes: ()) {
	@each $prefix in $prefixes {
    	#{'-' + $prefix + '-' + $property}: $value;
	}
   	#{$property}: $value;
}

%border-radius {
  border-radius: 3px;
}

%border-radius-medium {
  border-radius: 20px;
}

%border-radius-small {
  border-radius: 10px;
}

{# /* // Animations */ #}

%simplefade {
  transition: all 0.5s ease;
}

{# /* // Functions */ #}

@function set-foreground-color($bg-color, $foreground-color) {
  @if (lightness($bg-color) > 50) {
    @return $foreground-color; // Lighter backgorund, return dark color
  } @else {
    @return lighten($foreground-color, 15%); // Darker background, return light color
  }
}

@function set-subnav-color($nav-color) {
  @if (lightness($nav-color) > 25) {
    @return rgba(0,0,0,0.18); // Lighter backgorund, return dark color
  } @else {
    @return rgba(255,255,255,0.1); // Darker background, return light color
  }
}

@function set-background-color($bg-color) {
  @if (lightness($bg-color) > 30) {
    @return darken($bg-color, 5%); // Lighter primary, return dark color
  } @else {
    @return lighten($bg-color, 5%); // Darker primary, return light color
  }
}

{# /* // Wrappers */ #}

body{
  color: $main-foreground;
  font-family: var(--body-font);
  background-color:$main-background;
}

.box{
  float: left;
  width: 100%;
  margin-bottom: 20px;
  padding:8px;
  border: 1px solid rgba($main-foreground, .1);
  border-radius: 3px;
}

{# /* // Placeholders */ #}

.placeholder-color{
  background-color:rgba($main-foreground, 0.2);
}
.placeholder-shine,
.placeholder-fade{
  background-color:rgba($main-foreground, 0.2);
}

.placeholder-shine-invert {
  background-color:rgba($main-background, 0.5);
}

.placeholder-overlay {
    background-color:rgba($main-foreground, 0.3);
    opacity: 0;
    &:hover,
    &:active,
    &:focus {
        opacity: 1;
    }
}

.placeholder-info {
  color: $main-foreground;
  fill: $main-foreground;
  background-color: $main-background;
  .placeholder-button {
    color: $main-background;
    background-color: $main-foreground;
    opacity: 1;
    &:hover {
      opacity: .8;
    }
  }
}

.spinner::before {
  background-color: $main-foreground;
}


{# /* // Dividers */ #}

.divider{
  margin-top: 20px;
  margin-bottom: 20px;
  clear: both;
  border-bottom: 1px solid rgba($main-foreground, .1);
}

{# /* Headings */ #}

.page-header {
  @extend %element-margin;
  h1, .h1{
    margin-bottom: 0;
  }
}

.category-header {
  @extend %element-margin;
  h1, .h1{
    margin-bottom: 0;
  }
}

.h1-huge,
h1,.h1,
h2,.h2,
h3,.h3,
h4,.h4,
h5,.h5,
h6,.h6{
  margin-top: 0;
  font-family: var(--heading-font);
  font-weight: var(--title-font-weight);
}

{# /* // Buttons */ #}

.btn{
  text-decoration: none;
  text-align: center;
  border: 0;
  cursor: pointer;
  font-size: var(--font-base);
  line-height: 18px;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  white-space: normal;
  background: none;
  border-radius: 3px;
  @include prefix(transition, all 0.4s ease, webkit ms moz o);
  &:hover,
  &:focus{
    outline: 0;
    opacity: 0.8;
  }
  &[disabled],
  &.disabled,
  &[disabled]:hover,
  &.disabled:hover,{
    opacity: 0.8;
    cursor: not-allowed;
    outline: 0;
  }
  &-default{
    display: block;
    padding: 15px 25px;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    color: $main-foreground;
    fill: $main-foreground;
    background-color: $main-background;
    border: 1px solid rgba($main-foreground, .3);
    @include prefix(transition, all 0.4s ease, webkit ms moz o);
  }
  &-primary{
    padding: 10px 15px;
    background-color: $button-background;
    color: $button-foreground;
    fill: $button-foreground;
    &:hover,
    &:focus{
      color: $button-foreground;
    }
  }
  &-secondary{
    padding: 9px 15px;
    color: $button-background;
    fill: $button-background;
    border: 1px solid $button-background;
    &:hover{
      color: $button-background;
    }
    &.invert{
      color: $main-background;
      border: 1px solid $main-background;
      &:hover{
        color: $main-background;
        opacity: 0.8;
      }
    }
  }
  &.btn-icon.chevron:before {
    content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="{{ settings.button_background_color |replace("#","%23") }}"><path d="M17.525 36.465l-7.071 7.07c-4.686 4.686-4.686 12.284 0 16.971L205.947 256 10.454 451.494c-4.686 4.686-4.686 12.284 0 16.971l7.071 7.07c4.686 4.686 12.284 4.686 16.97 0l211.051-211.05c4.686-4.686 4.686-12.284 0-16.971L34.495 36.465c-4.686-4.687-12.284-4.687-16.97 0z"/></svg>');
  }
  &-block{
    width: 100%;
  }
  &-big {
    padding: 15px;
    font-size: var(--font-big);
  }
  &-medium{
    padding: 10px 15px;
    font-size: var(--font-base);
  }
  &-small{
    display: inline-block;
    padding: 8px 10px;
    font-size: var(--font-small);
    line-height: 14px;
  }
  &-append {
    position: absolute;
    top: 0;
    right: 0;
    z-index: 9;
    width: 42px;
    height: 100%;
    border-radius: 0;
    border-left: 1px solid rgba($main-foreground, .3);
    text-indent: -99999px;
    .btn-icon {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translateX(-50%) translateY(-50%);
      width: 10px;
      font-size: 18px;
      &.icon-spin {
        top: 2px;
        left: 15px;
      }
    }
  }
  &-variant{
    display: inline-block;
    font-size: var(--font-base);
    line-height: 10px;
    min-width: 28px;
    min-height: 28px;
    margin: 0 10px 10px 0;
    padding: 0 5px;
    border: 1px solid rgba($main-foreground, .8);
    color: rgba($main-foreground, .8);
    border-radius: 3px;
    vertical-align: top;
    &-content{
      display: block;
      min-height: var(--font-large);
      margin: 4px;
      line-height: var(--font-large);
      border-radius: 3px;
    }
    &-color .btn-variant-content{
      min-width: var(--font-large);
    }
    &.selected {
      color: $main-foreground;
      border: 1px solid $main-foreground;
      background: rgba($main-foreground, .1);
    }
    &-no-stock {
      position: relative;
      background: transparent;
      color: rgba($main-foreground, 0.5);
      border-color: rgba($main-foreground, 0.3);
      overflow: hidden;
      &:after {
        position: absolute;
        top: 0;
        left: 0;
        z-index: 9;
        width: 100%;
        height: 100%;
        background: linear-gradient(to top left,transparent 49%,rgba($main-foreground, 0.5) ,transparent 52%);
        content:'';
      }

      &.selected:after {
        background: linear-gradient(to top left,transparent 49%,$main-foreground ,transparent 52%);
      }

      &.btn-variant-color:after {
        background: linear-gradient(-45deg,rgba($main-background, 0.3) calc(50% - .7px),rgba($main-foreground, 0.5) calc(50% - .7px),rgba($main-foreground, 0.5) 50%,rgba($main-foreground, 0.5) calc(50% + .7px),rgba($main-background, 0.3) calc(50% + .7px));
      }

      &.btn-variant-color.selected:after {
        background: linear-gradient(-45deg,rgba($main-background, 0.3) calc(50% - .7px),$main-foreground calc(50% - .7px),$main-foreground 50%,$main-foreground calc(50% + .7px),rgba($main-background, 0.3) calc(50% + .7px));
      }
    }
  }
  &-facebook{
    color: #1977f2;
    border: 1px solid #1977f2;
    .svg-fb-icon {
      position: relative;
      bottom: 1px;
      height: 16px;
      margin-right: 5px;
      vertical-align: middle;
      fill: #1977f2;
    }
    &:hover {
      background: #1977f2;
      color: #fff;
      .svg-fb-icon {
        fill: #fff;
      }
    }
  }
}

.btn-icon {
  position: relative;
  width: 38px;
  height: 38px;
  font-size: 0;
  line-height: 20px;
  border-radius: 3px;
  &:before {
    position: absolute;
    top: 10px;
    left: 15px;
    width: 15px;
    height: 15px;
  }
}

button{
  cursor: pointer;
  &:focus{
    outline: 0;
    opacity: 0.8;
  }
}

{# /* // Links */ #}

a {
  color: $main-foreground;
  @include prefix(transition, all 0.4s ease, webkit ms moz o);
  &:hover,
  &:focus{
    color: rgba($main-foreground, .5);
  }
  &.disabled {
    opacity: 0.5;
    cursor: not-allowed;
  }
}

.link-contrast {
  color: $main-background;
  &:hover,
  &:focus{
    color: rgba($main-background, .8);
  }
}

.btn-link{
  color: $main-foreground;
  fill: $main-foreground;
  cursor: pointer;
  text-decoration: underline;
  font-size: var(--font-base);
  &.invert{
    color: $main-background;
    fill: $main-background;
    &:hover,
    &:focus{
      color: $main-background;
      fill: $main-background;
      opacity: 0.5;
    }
  }
  &-primary{
    color: $button-background;
    fill: $button-background;
    &:hover,
    &:focus{
      color: $button-background;
      fill: $button-background;
      opacity: 0.5;
    }
  }
  &.no-underline {
    text-decoration: none;
  }
}

{# /* // Accordions */ #}

.accordion{
  border-top: 1px solid rgba($main-foreground, .1);
  &:last-child {
    border-bottom: 1px solid rgba($main-foreground, .1);
  }
}

{# /* // Chips */ #}

.chip{
  color: $main-foreground;
  fill: $main-foreground;
  background-color: $main-background;
  border: 1px solid $main-foreground;
}

{# /* // Progress bar */ #}

.bar-progress {
  background: rgba($main-foreground, 0.1);
  &-active {
    background: $accent-color;
  }
}

{# /* // Modals */ #}

.modal{
  color: $main-foreground;
  fill: $main-foreground;
  background-color:$main-background;
  &-header{
    @include prefix(transition, all 0.4s ease, webkit ms moz o);
    &:hover,
    &:focus{
      opacity: .8;
    }
    &-no-title {
      background-color: $main-background;
    }
  }
  &-shadow{
    box-shadow: 0 0 8px 4px rgba($main-foreground, .1);
  }
  .search-suggest {
    background-color: $main-background;
    border: 1px solid rgba($main-foreground, .1);
    a {
      color: $main-foreground;
      fill: $main-foreground;
    }
  }
}

.modal-nav-search {
  background-color: rgba($main-foreground, .98);
  color: $main-background;
  fill: $main-background;
  a,
  .btn-link {
    color: $main-background;
    fill: $main-background;
  } 
  .search-input,
  .search-input:hover {
    color: $main-background;
    background-color: transparent;
    border-bottom-color: $main-background;
  }
  .form-control::-webkit-input-placeholder { 
    color: rgba($main-background, .7);
  }
  .form-control:-moz-placeholder {
    color: rgba($main-background, .7);
  }
  .form-control::-moz-placeholder {
    color: rgba($main-background, .7);
  }
  .form-control:-ms-input-placeholder {
    color: rgba($main-background, .7);
  }
  .search-suggest {
    background-color: transparent;
    border: none;
    a {
      color: $main-background;
      background-color: transparent;
    }
  }
}

{# /* // Forms */ #}

input,
textarea {
  font-family: var(--body-font);
}

.form-label-divider {
  border-bottom: 1px solid rgba($main-foreground, .1);
}

.form-control::-webkit-input-placeholder { 
  color: rgba($main-foreground, .3);
}
.form-control:-moz-placeholder {
  color: rgba($main-foreground, .3);
}
.form-control::-moz-placeholder {
  color: rgba($main-foreground, .3);
}
.form-control:-ms-input-placeholder {
  color: rgba($main-foreground, .3);
}

.form-control,
.form-select,
.form-quantity{
  display: block;
  width: 100%;
  padding: 12px;
  font-size: var(--font-base);
  font-family: var(--body-font);
  line-height: var(--font-big);
  border: 1px solid rgba($main-foreground, .3);
  @extend %border-radius;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  color: $main-foreground;
  fill: $main-foreground;
  background-color: $main-background;
  @include prefix(transition, all 0.4s ease, webkit ms moz o);
  &:hover{
    border: 1px solid rgba($main-foreground, .6);
    & + .form-select-icon{
      fill: $main-foreground;
    }
  }
  &:focus{
    outline:0px !important;
    -webkit-appearance:none;
  }
  &-inline{
    display: inline;
  }
  &-transparent{
    background: transparent;
  }
  &-small{
    padding: 8px 10px;
    font-size: var(--font-small);
  }
  &-big{
    padding: 15px;
  }
}

.form-control-rounded {
  border-radius: 38px;
  padding: 11px 20px;
}

.form-control-btn{
  position: absolute;
  top: 12px;
  right: 10px;
  &-icon{
    width: 18px;
    height: 18px;
  }
}

.form-quantity{
  padding: 10px;
  .form-control{
    width: 100%;
    padding: 0;
    background-color: transparent;
    -webkit-appearance: none;
    -moz-appearance:textfield;
    border: 0;
    text-align: center;
  }
  &-icon{
    width: 20px;
    height: 20px;
    fill: $main-foreground;
    font-size: 18px;
  }
  &.small{
    width: 80px;
    padding: 4px 6px;
  }
  &-product {
    line-height: 26px;
  }
}

input::-webkit-inner-spin-button,
input::-webkit-outer-spin-button{
  -webkit-appearance: none;
  margin: 0;
}

input[type=number] {
  -moz-appearance:textfield;
}

.search-input {
  padding-left: 5px;
  border: 0;
  border-bottom: 1px solid $main-foreground;
  border-radius: 0;
  &:hover {
    border: 0;
    border-bottom: 1px solid $main-foreground;
  }
}

{# IOS form CSS to avoid autozoom on focus #}

.form-control-ios,
.form-group-quantity-ios .form-control-ios {
  /* enlarge by 16/12 = 133.33% */
  font-size: 16px;
  line-height: 26.666666667px;
  width: 133.333333333%;

  /* scale down by 12/16 = 75% */
  transform: scale(0.75);
  transform-origin: left top;
  transition: none;
  border-radius: 6px;

  & + .form-toggle-eye {
    top: 25px;
  }
  &.form-control-rounded {
    padding-top: 12px;
    padding-bottom: 12px;
    border-radius: 38px;
  }  
  &.search-input {
    margin-bottom: -5px;
    font-size: 18px;
    border-radius: 0;
  }
}

.form-group-quantity-ios {
  padding: 6px 10px;
  .form-control-ios{
    padding-top: 8px;  
  }
}
.cart-quantity-container-ios {
  height: 22px;
  .form-control-ios {
    padding-left: 8px;
  }
}
.form-select{
  cursor: pointer;
  &.btn {
    font-size: 10px;
    &.btn-medium {
      padding: 6px 8px;
      .form-select-icon {
        bottom: 7px;
      }
    }
  }
}

.form-select-icon{
  background: $main-background;
  fill: $main-foreground;
}

.input-clear-content:before {
  content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="{{ settings.text_color |replace("#","%23") }}"><path d="M256,274.92,72.67,458.25l-18.1-18.1L237.9,256.82,54.57,73.49l18.1-18.11L256,238.72,439.33,55.38l18.1,18.11L274.1,256.82,457.43,440.15l-18.1,18.1Z"/></svg>');
}

.radio-button {
  &-content {
    border: 1px solid $main-background;
  }
  &-icon {
    &.unchecked{
      background-color: $main-background;
      border: 1px solid rgba($main-foreground, .5);
    }
    &.checked {
      background-color: $main-foreground;
    }
  }
}

.list-item-icon,
.list .radio-button .radio-button-content .radio-button-icon {
  background-color: $main-foreground;
}

.checkbox-container{
  .checkbox-icon {
    background: $main-background;
    border: 1px solid $main-foreground;
    &:after {
      border: solid $main-foreground;
      border-width: 0 1px 1px 0;
    }
  }
  .checkbox:hover,
  input:checked ~ .checkbox {
    color: $main-foreground;
    fill: $main-foreground;
    .checkbox-icon {
      border: 1px solid $main-foreground;
    }
  }
  .checkbox-color{
    border: 1px solid rgba($main-foreground, .06);
  }
}

{# /* // Alerts and notifications */ #}

.alert{
  @extend %border-radius;
  &:before{
    display: inline-block;
    width: 12px;
    height: 12px;
    margin-right: 5px;
  }
  &-danger,
  &-error{
    color: set-foreground-color($main-background, #cc4845);
    border-color: set-foreground-color($main-background, #cc4845);
    &:before{
      content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="%23cc4845"><path d="M256 40c118.621 0 216 96.075 216 216 0 119.291-96.61 216-216 216-119.244 0-216-96.562-216-216 0-119.203 96.602-216 216-216m0-32C119.043 8 8 119.083 8 256c0 136.997 111.043 248 248 248s248-111.003 248-248C504 119.083 392.957 8 256 8zm-11.49 120h22.979c6.823 0 12.274 5.682 11.99 12.5l-7 168c-.268 6.428-5.556 11.5-11.99 11.5h-8.979c-6.433 0-11.722-5.073-11.99-11.5l-7-168c-.283-6.818 5.167-12.5 11.99-12.5zM256 340c-15.464 0-28 12.536-28 28s12.536 28 28 28 28-12.536 28-28-12.536-28-28-28z"/></svg>');
    }
  }
  &-warning{
    color: set-foreground-color($main-background, #d27611);
    border-color: set-foreground-color($main-background, #d27611);
    &:before{
      content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" fill="%23d27611"><path d="M270.2 160h35.5c3.4 0 6.1 2.8 6 6.2l-7.5 196c-.1 3.2-2.8 5.8-6 5.8h-20.5c-3.2 0-5.9-2.5-6-5.8l-7.5-196c-.1-3.4 2.6-6.2 6-6.2zM288 388c-15.5 0-28 12.5-28 28s12.5 28 28 28 28-12.5 28-28-12.5-28-28-28zm281.5 52L329.6 24c-18.4-32-64.7-32-83.2 0L6.5 440c-18.4 31.9 4.6 72 41.6 72H528c36.8 0 60-40 41.5-72zM528 480H48c-12.3 0-20-13.3-13.9-24l240-416c6.1-10.6 21.6-10.7 27.7 0l240 416c6.2 10.6-1.5 24-13.8 24z"/></svg>');
    }
  }
  &-info{
    color: set-foreground-color($main-background, #3d9ccc);
    border-color: set-foreground-color($main-background, #3d9ccc);
    &:before{
      content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="%233d9ccc"><path d="M256 40c118.621 0 216 96.075 216 216 0 119.291-96.61 216-216 216-119.244 0-216-96.562-216-216 0-119.203 96.602-216 216-216m0-32C119.043 8 8 119.083 8 256c0 136.997 111.043 248 248 248s248-111.003 248-248C504 119.083 392.957 8 256 8zm-36 344h12V232h-12c-6.627 0-12-5.373-12-12v-8c0-6.627 5.373-12 12-12h48c6.627 0 12 5.373 12 12v140h12c6.627 0 12 5.373 12 12v8c0 6.627-5.373 12-12 12h-72c-6.627 0-12-5.373-12-12v-8c0-6.627 5.373-12 12-12zm36-240c-17.673 0-32 14.327-32 32s14.327 32 32 32 32-14.327 32-32-14.327-32-32-32z"/></svg>');
    }
  }
  &-success{
    color: set-foreground-color($main-background, #3caf65);
    border-color: set-foreground-color($main-background, #3caf65);
    &:before{
      content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="%233caf65"><path d="M256 8C119.033 8 8 119.033 8 256s111.033 248 248 248 248-111.033 248-248S392.967 8 256 8zm0 464c-118.664 0-216-96.055-216-216 0-118.663 96.055-216 216-216 118.664 0 216 96.055 216 216 0 118.663-96.055 216-216 216zm141.63-274.961L217.15 376.071c-4.705 4.667-12.303 4.637-16.97-.068l-85.878-86.572c-4.667-4.705-4.637-12.303.068-16.97l8.52-8.451c4.705-4.667 12.303-4.637 16.97.068l68.976 69.533 163.441-162.13c4.705-4.667 12.303-4.637 16.97.068l8.451 8.52c4.668 4.705 4.637 12.303-.068 16.97z"/></svg>');
    }
  }
  &-primary {
    border-color: $accent-color;
    color: $accent-color;
  }
}

.item-actions .alert {
  color: $main-foreground;
  background-color: $main-background;
  border-color: $main-foreground;
  &:before{
    content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" fill="%23{{ settings.text_color |trim('#') }}"><path d="M270.2 160h35.5c3.4 0 6.1 2.8 6 6.2l-7.5 196c-.1 3.2-2.8 5.8-6 5.8h-20.5c-3.2 0-5.9-2.5-6-5.8l-7.5-196c-.1-3.4 2.6-6.2 6-6.2zM288 388c-15.5 0-28 12.5-28 28s12.5 28 28 28 28-12.5 28-28-12.5-28-28-28zm281.5 52L329.6 24c-18.4-32-64.7-32-83.2 0L6.5 440c-18.4 31.9 4.6 72 41.6 72H528c36.8 0 60-40 41.5-72zM528 480H48c-12.3 0-20-13.3-13.9-24l240-416c6.1-10.6 21.6-10.7 27.7 0l240 416c6.2 10.6-1.5 24-13.8 24z"/></svg>');
  }
}

.bg-primary{
  .alert{
    &-danger,
    &-error{
      color: $main-background;
      border-color: $main-background;
      &:before{
        content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="%23{{ settings.background_color |trim('#') }}"><path d="M256 40c118.621 0 216 96.075 216 216 0 119.291-96.61 216-216 216-119.244 0-216-96.562-216-216 0-119.203 96.602-216 216-216m0-32C119.043 8 8 119.083 8 256c0 136.997 111.043 248 248 248s248-111.003 248-248C504 119.083 392.957 8 256 8zm-11.49 120h22.979c6.823 0 12.274 5.682 11.99 12.5l-7 168c-.268 6.428-5.556 11.5-11.99 11.5h-8.979c-6.433 0-11.722-5.073-11.99-11.5l-7-168c-.283-6.818 5.167-12.5 11.99-12.5zM256 340c-15.464 0-28 12.536-28 28s12.536 28 28 28 28-12.536 28-28-12.536-28-28-28z"/></svg>');
      }
    }
    &-warning{
      color: $main-background;
      border-color: $main-background;
      &:before{
        content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" fill="%23{{ settings.background_color |trim('#') }}"><path d="M270.2 160h35.5c3.4 0 6.1 2.8 6 6.2l-7.5 196c-.1 3.2-2.8 5.8-6 5.8h-20.5c-3.2 0-5.9-2.5-6-5.8l-7.5-196c-.1-3.4 2.6-6.2 6-6.2zM288 388c-15.5 0-28 12.5-28 28s12.5 28 28 28 28-12.5 28-28-12.5-28-28-28zm281.5 52L329.6 24c-18.4-32-64.7-32-83.2 0L6.5 440c-18.4 31.9 4.6 72 41.6 72H528c36.8 0 60-40 41.5-72zM528 480H48c-12.3 0-20-13.3-13.9-24l240-416c6.1-10.6 21.6-10.7 27.7 0l240 416c6.2 10.6-1.5 24-13.8 24z"/></svg>');
      }
    }
    &-info{
      color: $main-background;
      border-color: $main-background;
      &:before{
        content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="%23{{ settings.background_color |trim('#') }}"><path d="M256 40c118.621 0 216 96.075 216 216 0 119.291-96.61 216-216 216-119.244 0-216-96.562-216-216 0-119.203 96.602-216 216-216m0-32C119.043 8 8 119.083 8 256c0 136.997 111.043 248 248 248s248-111.003 248-248C504 119.083 392.957 8 256 8zm-36 344h12V232h-12c-6.627 0-12-5.373-12-12v-8c0-6.627 5.373-12 12-12h48c6.627 0 12 5.373 12 12v140h12c6.627 0 12 5.373 12 12v8c0 6.627-5.373 12-12 12h-72c-6.627 0-12-5.373-12-12v-8c0-6.627 5.373-12 12-12zm36-240c-17.673 0-32 14.327-32 32s14.327 32 32 32 32-14.327 32-32-14.327-32-32-32z"/></svg>');
      }
    }
    &-success{
      color: $main-background;
      border-color: $main-background;
      &:before{
        content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="%23{{ settings.background_color |trim('#') }}"><path d="M256 8C119.033 8 8 119.033 8 256s111.033 248 248 248 248-111.033 248-248S392.967 8 256 8zm0 464c-118.664 0-216-96.055-216-216 0-118.663 96.055-216 216-216 118.664 0 216 96.055 216 216 0 118.663-96.055 216-216 216zm141.63-274.961L217.15 376.071c-4.705 4.667-12.303 4.637-16.97-.068l-85.878-86.572c-4.667-4.705-4.637-12.303.068-16.97l8.52-8.451c4.705-4.667 12.303-4.637 16.97.068l68.976 69.533 163.441-162.13c4.705-4.667 12.303-4.637 16.97.068l8.451 8.52c4.668 4.705 4.637 12.303-.068 16.97z"/></svg>');
      }
    }
    &-primary {
      border-color: $main-background;
      color: $main-background;
    }
  }
}

.notification {
    &-primary {
      color: $main-foreground;
      fill: $main-foreground;
      background-color: $main-background;
      border-top: 1px solid rgba($main-foreground, .1);
      border-bottom: 1px solid rgba($main-foreground, .1);
    }
    &-arrow-up {
        border-right: 10px solid transparent;
        border-bottom: 10px solid $main-background;
        border-left: 10px solid transparent;
    }
    &-floating .notification-primary {
        color: $main-foreground;
        fill: $main-foreground;
        background-color: $main-background;
        border-top: 1px solid rgba($main-foreground, .2);
    }
    &-secondary {
        background: $accent-color;
        color: $main-background;
        fill: $main-background;
    }
    &-tertiary {
        color: $accent-color;
        background: lighten($main-foreground, 80%);
    }
    &-img svg {
        border-radius: 100%;
        background: $main-background;
    }
    &-danger {
        color: set-foreground-color($main-background, #cc4845);
    }
}

{# /* // Tooltip */ #}

.tooltip{
  background: $main-background;
  color: $main-foreground;
}
    
.tooltip-arrow{
  border-left: 10px solid transparent;
  border-right: 10px solid transparent;
  border-bottom: 10px solid $accent-color;
}

{# /* // Images */ #}

.card-img{
  @extend %border-radius-small;
  &-pill {
    background-color: $main-background;
    color: $main-foreground;
  }
  &-small {
    border-radius: 2px;
  }
}

{# /* // Tables */ #}

.table{
  background-color: $main-background;
  color: $main-foreground;
  tbody{
    tr:nth-child(odd){
      background-color: rgba($main-foreground, .05);
    }
    &.table-body-inverted{
      tr:nth-child(even){
        background-color: rgba($main-foreground, .05);
      }
      tr:nth-child(odd){
        background-color: $main-background;
      }
    }
  }
  th{
    padding: 8px;
    text-align: left;
  }
}

{# /* // Tabs */ #}

.tab-group{
  .tab{
    &-link{
      border: 1px solid rgba($main-foreground, .3);
      color: $main-foreground;
      border-radius: 3px;
    }
    &.active{
      .tab-link{
        border: 1px solid $button-background;
        color: $button-background;
        background: rgba($button-background, .1);
      }
    }
  }
}

{# /* Cards */ #}

.card {
  @extend .item;
}

{# /* // Sliders */ #}

.swiper-text {
  @extend %simplefade;
  opacity: 0;
  bottom: 40px;
  color: $main-foreground;
  &-light {
    color: $main-background;
  }
}

.swiper-slide-active .swiper-text {
  opacity: 1;
  bottom: 10px;
}

.swiper-light {
  background: $main-foreground;
  .swiper-text {
    color: $main-background;
  }
  .btn-primary {
    color: $main-foreground;
    background: $main-background;
  }
}

.swiper-pagination-bullet,
.swiper-pagination-bullet-active {
  background-color: $main-foreground;
}

.swiper-overlay {
  background-image: linear-gradient(transparent, rgba($main-background, .4));
}

.swiper-overlay-light {
  background-image: linear-gradient(transparent, rgba($main-foreground, .4));
}

{#/*============================================================================
  #Home Page
==============================================================================*/#}

{# /* // Home banners */ #}

.textbanner-text {
  &.over-image {
    background-image: linear-gradient(transparent, rgba($main-background, .4));
    color: $main-foreground;
    a {
      color: $main-foreground;
    }
    .btn-secondary {
      color: $main-foreground;
      border: 1px solid $main-foreground;
    }
    .svg-icon-text {
      fill: $main-foreground;
    }
    &.over-image-invert {
      background-image: linear-gradient(transparent, rgba($main-foreground, .4));
      color: $main-background;
      a {
        color: $main-background;
      }
      .btn-secondary {
        color: $main-background;
        border: 1px solid $main-background;
      }
      .svg-icon-text {
        fill: $main-background;
      }
    }
  }
}

.textbanner-link:hover {
  color: $main-foreground;
  .textbanner-text {
    &.over-image,
    &-primary {
      border: 0;
    }
  }
}

{# /* // Image and text module */ #}

{% if settings.module_colors %}
  .section-module-background,
  .module-background {
    background: $module-color;
  }
{% endif %}

{# /* // Brands */ #}

.section-brands-home {
  {% if settings.brands_colors %}
    background: $brands-background;
    color: $brands-foreground;
    .svg-icon-text {
      fill: $brands-foreground;
    }
  {% else %}
    background: rgba($main-foreground, .1);
  {% endif %}
}

{# /* // Testimonials */ #}

.section-testimonials-home {
  {% if settings.testimonials_colors %}
    background: $testimonials-background;
    color: $testimonials-foreground;
    .svg-icon-text {
      fill: $testimonials-foreground;
    }
  {% else %}
    background: rgba($main-foreground, .1);
  {% endif %}
  .testimonials-image {
    background-color: rgba($main-foreground, .1);
  }
}

{# /* // Video */ #}

.embed-responsive {
  background: $main-foreground;
}

.video-player-icon {
  background: $main-background;
}

.home-video-text {
  color: $main-background;
  .btn-secondary {
    color: $main-background;
    border: 1px solid $main-background;
  }
}

.home-video-overlay:after {
  background: linear-gradient(transparent, rgba($main-foreground, .4));
}

{# /* // Instafeed */ #}
.instafeed-title {
  color: $main-foreground;
}

.instafeed-info {
  color: $main-background;
  background: rgba($main-foreground, .6);
}

{# /* // Featured products */ #}

.section-featured-home {
  position: relative;
  padding: 40px 0;
  overflow: hidden;
}

{% if settings.featured_product_colors %}
  .section-featured-products-home,
  .featured-products-background {
    background: $featured-background;
  }
{% endif %}

{% if settings.new_product_colors %}
  .section-new-products-home,
  .new-products-background {
    background: $new-background;
  }
{% endif %}

{% if settings.sale_product_colors %}
  .section-sale-products-home,
  .sale-products-background {
    background: $sale-background;
  }
{% endif %}

{# /* // Newsletter */ #}

.section-newsletter-home {
  {% if settings.home_news_colors %}
    background: $newsletter-background;
    color: $newsletter-foreground;
    .form-control {
      color: $newsletter-foreground;
      background-color: transparent;
      border-color: rgba($newsletter-foreground, .3);
      &:hover,
      &:active {
        border: 1px solid rgba($newsletter-foreground, .6);
      }
    }
    .btn-append {
      border-color: rgba($newsletter-foreground, .3);
    }
    .newsletter-btn {
      fill: $newsletter-foreground;
    }
    .form-control::-webkit-input-placeholder { 
      color: rgba($newsletter-foreground, .5);
    }
    .form-control:-moz-placeholder {
      color: rgba($newsletter-foreground, .5);
    }
    .form-control::-moz-placeholder {
      color: rgba($newsletter-foreground, .5);
    }
    .form-control:-ms-input-placeholder {
      color: rgba($newsletter-foreground, .5);
    }
    .alert-success,
    .alert-danger {
      color: $newsletter-foreground;
      border-color: $newsletter-foreground;
    }
    .alert-success:before{
      content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="%23{{ settings.home_news_foreground_color |trim('#') }}"><path d="M256 8C119.033 8 8 119.033 8 256s111.033 248 248 248 248-111.033 248-248S392.967 8 256 8zm0 464c-118.664 0-216-96.055-216-216 0-118.663 96.055-216 216-216 118.664 0 216 96.055 216 216 0 118.663-96.055 216-216 216zm141.63-274.961L217.15 376.071c-4.705 4.667-12.303 4.637-16.97-.068l-85.878-86.572c-4.667-4.705-4.637-12.303.068-16.97l8.52-8.451c4.705-4.667 12.303-4.637 16.97.068l68.976 69.533 163.441-162.13c4.705-4.667 12.303-4.637 16.97.068l8.451 8.52c4.668 4.705 4.637 12.303-.068 16.97z"/></svg>');
    }
    .alert-danger:before{
      content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="%23{{ settings.home_news_foreground_color |trim('#') }}"><path d="M256 40c118.621 0 216 96.075 216 216 0 119.291-96.61 216-216 216-119.244 0-216-96.562-216-216 0-119.203 96.602-216 216-216m0-32C119.043 8 8 119.083 8 256c0 136.997 111.043 248 248 248s248-111.003 248-248C504 119.083 392.957 8 256 8zm-11.49 120h22.979c6.823 0 12.274 5.682 11.99 12.5l-7 168c-.268 6.428-5.556 11.5-11.99 11.5h-8.979c-6.433 0-11.722-5.073-11.99-11.5l-7-168c-.283-6.818 5.167-12.5 11.99-12.5zM256 340c-15.464 0-28 12.536-28 28s12.536 28 28 28 28-12.536 28-28-12.536-28-28-28z"/></svg>');
    }
  {% else %}
    background: rgba($main-foreground, .1);
  {% endif %}
}

{#/*============================================================================
  #Product grid
==============================================================================*/#}

{# /* // Category controls */ #}

.category-controls {
  background-color: $main-background;
  &.category-controls-transparent {
    background-color: transparent;
  }
  &.is-sticky .category-controls-transparent .btn-link {
    color: $header-foreground;
    fill: $header-foreground;
  }
}
.filters-overlay {
  background-color: rgba($main-background, .85);
}

{# /* // Grid item */ #}

.item {
  @include prefix(transition, all 0.4s ease, webkit ms moz o);
  &-link {
    color: $main-foreground;
  }
  &-price {
    color: $main-foreground;
  }
}

{# /* // Labels */ #}

.label {
  background: $main-background;
  color: $main-foreground;
  &.label-accent{
    background: $label-background;
    color: $label-foreground;
  }
  &.label-default{
    background: $main-foreground;
    color: $main-background;
  }
}

{#/*============================================================================
  #Product detail
==============================================================================*/#}

{# /* // Image */ #}

.product-video-container {
  background-color: rgba($main-foreground, .07);
}

.fancybox__container .fancybox__backdrop {
  background: rgba($main-foreground, .9);
}
.carousel__button .svg-icon-invert {
  fill: $main-background;
}

{# /* // Form and info */ #}
    
.social-share {
  @extend %element-margin;
  .social-share-button {
    color: $main-foreground;
  }
}

{% if settings.product_description_colors %}
  .product-page-description {
    background: $product-background;
    color: $product-foreground;
    fill: $product-foreground;
    * {
      background: $product-background;
      color: $product-foreground ;
      fill: $product-foreground;
    }
  }
{% endif %}

{#/*============================================================================
  #Contact page
==============================================================================*/#}

{# /* // Data contact */ #}

.contact-item {
  @extend %element-margin;
  &-icon {
    fill: $main-foreground;
  }
}

.contact-link {
  color: $main-foreground;
}


{#/*============================================================================
  #Account page
==============================================================================*/#}

.account-page {
  @extend %section-margin;
}

{# /* // Order item */ #}

.order-item {
  padding: 15px 0;
  border-bottom: 1px solid rgba($main-foreground, .08);
  &:first-child {
    border-top: 1px solid rgba($main-foreground, .08);
  }
}

{#/*============================================================================
  #Header and nav
==============================================================================*/#}

{# /* // Header */ #}

.head-main {
  color: $header-foreground;
  fill: $header-foreground;
  background-color: $header-background;
  .btn-link {
    color: $header-foreground;
    fill: $header-foreground;
  }
  .section-adbar {
    background-color: $adbar-background;
    color: $adbar-foreground;
    fill: $adbar-foreground;
    a,
    .svg-icon-text {
      color: $adbar-foreground;
      fill: $adbar-foreground;
    }
  }

  .form-control{
    background-color: transparent;
    color: $header-foreground;
    fill: $header-foreground;
    border-bottom: 1px solid $header-foreground;
    &::-webkit-input-placeholder { 
      color: $header-foreground;
    }
    &:-moz-placeholder {
      color: $header-foreground;
    }
    &::-moz-placeholder {
      color: $header-foreground;
    }
    &:-ms-input-placeholder {
      color: $header-foreground;
    }
  }
  a,
  .svg-icon-text {
    color: $header-foreground;
    fill: $header-foreground;
  }
  .search-suggest {
    background-color: $header-background;
    a,
    .btn-link {
      color: $header-foreground;
      fill: $header-foreground;
    }
  }

  .nav-primary {
    background-color: $header-background;
    .nav-list {
      .nav-item {
        border-color: rgba($header-foreground, .2);
      }
      .list-subitems {
        background-color: set-subnav-color($header-foreground);
      }
    } 
  }

  .notification-primary {
    a {
      color: $main-foreground;
      fill: $main-foreground;
    }
    .btn-primary {
      color: $button-foreground;
      fill: $button-foreground;
    }
  } 
}

.head-transparent,
.head-transparent-on-section{
  background: transparent;
  .desktop-list-subitems {
    background-color: $header-background;
  }
  .notification-primary {
    color: $header-foreground;
    fill: $header-foreground;
    background: transparent;
    border-top: 1px solid rgba($header-foreground, .3);
    border-bottom: 1px solid rgba($header-foreground, .3);
    a {
      color: $header-foreground;
      fill: $header-foreground;
    }
  }
  .notification-cart {
    color: $main-foreground;
    background-color: $main-background;
    border-color: rgba($main-foreground, .2);
  }
  &:hover,
  &.hover {
    background-color: $header-background;
  }
}

{% if settings.head_transparent_contrast_options %}
  .head-transparent-on-section.head-transparent-contrast:not(:hover) {
    color: $header-transparent-foreground;
    fill: $header-transparent-foreground;
    .form-control{
      color: $header-transparent-foreground;
      fill: $header-transparent-foreground;
      border-bottom: 1px solid $header-transparent-foreground;
      &::-webkit-input-placeholder { 
        color: $header-transparent-foreground;
      }
      &:-moz-placeholder {
        color: $header-transparent-foreground;
      }
      &::-moz-placeholder {
        color: $header-transparent-foreground;
      }
      &:-ms-input-placeholder {
        color: $header-transparent-foreground;
      }
    }
    a,
    .search-input-submit {
      color: $header-transparent-foreground;
      fill: $header-transparent-foreground;
    }
    .section-adbar a {
      color: $adbar-foreground;
    }
    .notification-primary {
      color: $header-transparent-foreground;
      border-top: 1px solid rgba($header-transparent-foreground, .3);
      border-bottom: 1px solid rgba($header-transparent-foreground, .3);
    }
    .search-suggest-link,
    .btn-link {
      color: $header-foreground;
    }
  }
{% endif %}

.nav-list-panel {
  color: $main-foreground;
  fill: $main-foreground;
  background-color: $main-background;
}

.nav-desktop-list>.nav-item-desktop>.nav-item-container>.nav-list-link:after {
  background: $header-foreground;
}

.modal-nav-hamburger .modal-footer {
  background-color: rgba($main-foreground, .03)
}

{# /* // Utilities */ #}

.subutility-list {
 background-color: $header-background;
 box-shadow: 0 1px 6px rgba(0,0,0,0.2);
}

{# /* // Search */ #}

.search-suggest {
  background-color: $header-background;
  border: 1px solid rgba($header-foreground, .1);
  a {
    color: $header-foreground;
    fill: $header-foreground;
  }
}

{# /* // Nav */ #}

.desktop-list-subitems {
  background-color: $header-background;
  border-bottom: 1px solid rgba($header-foreground, .1);
}

.desktop-dropdown-small {
  background-color: $header-background;
  border: 1px solid rgba($header-foreground, .1);
}

.desktop-dropdown::-webkit-scrollbar-track {
  background: rgba($header-background, .5);
}
.desktop-dropdown::-webkit-scrollbar-thumb {
  background: rgba($header-foreground, .8%);
}
.desktop-dropdown::-webkit-scrollbar-thumb:hover {
  background: $header-foreground;
}

.nav-categories-container:after,
.nav-categories-container:before {
  background-image: linear-gradient(-90deg, transparent, darken($header-background, 2%));
}

{#/*============================================================================
  #Footer
==============================================================================*/#}

$footer-background-color: $footer-background;
$footer-foreground-color: $footer-foreground;

footer {
  color: $footer-foreground-color;
  background: $footer-background-color;
  a,
  .contact-link,
  .footer-menu-item {
    color: $footer-foreground-color;
  }
  a:hover {
    color: rgba($footer-foreground-color, .8);
  }
  svg {
    fill: $footer-foreground-color;
  }
  .form-control,
  .form-select {
    color: $footer-foreground-color;
    background-color: transparent;
    border: 1px solid rgba($footer-foreground-color, .3);
    &:hover,
    &:active {
      border: 1px solid rgba($footer-foreground-color, .6);
    }
  }
  .form-select-icon {
    background-color: $footer-background-color;
  }
  .form-control::-webkit-input-placeholder { 
    color: rgba($footer-foreground-color, .5);
  }
  .form-control:-moz-placeholder {
    color: rgba($footer-foreground-color, .5);
  }
  .form-control::-moz-placeholder {
    color: rgba($footer-foreground-color, .5);
  }
  .form-control:-ms-input-placeholder {
    color: rgba($footer-foreground-color, .5);
  }
  .footer-payments-shipping-logos img {
    border: 1px solid rgba($footer-foreground-color, .2);
    @extend %border-radius;
  }
  {% if settings.footer_colors %}
    .btn-append {
      border-color: rgba($footer-foreground-color, .3);
    }
    .alert-success,
    .alert-danger {
      color: $footer-foreground-color;
      border-color: $footer-foreground-color;
    }
    .alert-success:before{
      content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="%23{{ settings.footer_foreground_color |trim('#') }}"><path d="M256 8C119.033 8 8 119.033 8 256s111.033 248 248 248 248-111.033 248-248S392.967 8 256 8zm0 464c-118.664 0-216-96.055-216-216 0-118.663 96.055-216 216-216 118.664 0 216 96.055 216 216 0 118.663-96.055 216-216 216zm141.63-274.961L217.15 376.071c-4.705 4.667-12.303 4.637-16.97-.068l-85.878-86.572c-4.667-4.705-4.637-12.303.068-16.97l8.52-8.451c4.705-4.667 12.303-4.637 16.97.068l68.976 69.533 163.441-162.13c4.705-4.667 12.303-4.637 16.97.068l8.451 8.52c4.668 4.705 4.637 12.303-.068 16.97z"/></svg>');
    }
    .alert-danger:before{
      content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="%23{{ settings.footer_foreground_color |trim('#') }}"><path d="M256 40c118.621 0 216 96.075 216 216 0 119.291-96.61 216-216 216-119.244 0-216-96.562-216-216 0-119.203 96.602-216 216-216m0-32C119.043 8 8 119.083 8 256c0 136.997 111.043 248 248 248s248-111.003 248-248C504 119.083 392.957 8 256 8zm-11.49 120h22.979c6.823 0 12.274 5.682 11.99 12.5l-7 168c-.268 6.428-5.556 11.5-11.99 11.5h-8.979c-6.433 0-11.722-5.073-11.99-11.5l-7-168c-.283-6.818 5.167-12.5 11.99-12.5zM256 340c-15.464 0-28 12.536-28 28s12.536 28 28 28 28-12.536 28-28-12.536-28-28-28z"/></svg>');
    }
  {% endif %}
}

.social-icon {
  fill: $footer-foreground-color;
  &:hover {
    opacity: .8;
  }
}

.section-footer {
  @extend %section-margin;
}
.element-footer {
  @extend %element-margin;
}

.powered-by-logo svg {
  fill: $footer-foreground-color;
}

.footer-legal {
  color: $footer-foreground-color;
  a {
    color: $footer-foreground-color;
    &:hover {
      opacity: .8;
    }
  }
}

{#/*============================================================================
  #Media queries
==============================================================================*/ #}

{# /* // Min width 768px */ #}

@media (min-width: 768px) { 

  {# /* //// Components */ #}

  .h1-md,
  .h2-md,
  .h1-medium {
    font-weight: var(--title-font-weight);
  }

  .btn-medium-md {
    padding: 10px 15px;
    font-size: var(--font-base);
    line-height: 18px;
    letter-spacing: 0;
  }

  .modal::-webkit-scrollbar-track,
  .modal-scrollable-area::-webkit-scrollbar-track {
    background: rgba($main-foreground, .4);
  }
  .modal::-webkit-scrollbar-thumb,
  .modal-scrollable-area::-webkit-scrollbar-thumb {
    background: rgba($main-foreground, .8%);
  }
  .modal::-webkit-scrollbar-thumb:hover,
  .modal-scrollable-area::-webkit-scrollbar-thumb:hover {
    background: $main-foreground;
  }

  {# /* Header */ #}

  .notification-floating .notification-primary {
    border: 1px solid rgba($main-foreground, .2);
  }

  {# /* //// Home Banners */ #}

  .textbanner-shadow {
    @include prefix(transition, all 0.4s ease, webkit ms moz o);
    &:hover {
      box-shadow: 0 1px 10px rgba($main-foreground, .2);
    }
  }

  {# /* //// Product grid */ #}

  .item {
    &-description {
      @include prefix(transition, all 0.4s ease, webkit ms moz o);
    }
  }

}