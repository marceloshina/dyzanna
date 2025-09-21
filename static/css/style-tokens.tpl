{# /* Style tokens */ #}

:root {

  {#/*============================================================================
    #Fonts
  ==============================================================================*/#}

  {# Font families #}

  --heading-font: {{ settings.font_headings | raw }};
  --body-font: {{ settings.font_rest | raw }};

  {# Font sizes #}

  {% set heading_size = settings.headings_size %}

  --h1: {{ heading_size }}px;
  --h1-huge: {{ heading_size + 4 }}px;
  --h1-huge-md: {{ heading_size + 16 }}px;
  --h1-md: {{ heading_size + 4 }}px;
  --h1-medium: {{ heading_size }}px;
  --h2: {{ heading_size - 4 }}px;
  --h2-md: {{ heading_size - 4 }}px;
  --h3: {{ heading_size - 8 }}px;
  --h4: {{ heading_size - 10 }}px;
  --h5: {{ heading_size - 12 }}px;
  --h6: {{ heading_size - 14 }}px;
  --h6-small: {{ heading_size - 16 }}px;
 
  {% set font_rest_size = settings.font_rest_size %}

  --font-huge: {{ font_rest_size + 10 }}px;
  --font-largest: {{ font_rest_size + 6 }}px;
  --font-large: {{ font_rest_size + 4 }}px;
  --font-big: {{ font_rest_size + 2 }}px;
  --font-base: {{ font_rest_size }}px;
  --font-medium: {{ font_rest_size - 3 }}px;
  --font-small: {{ font_rest_size - 2 }}px;
  --font-smallest: {{ font_rest_size - 4 }}px;

  {# Titles weights #}

  {% set title_weight = settings.headings_bold ? 'bold' : 'normal' %}

  --title-font-weight: {{ title_weight }};

  {#/*============================================================================
    #Spacing
  ==============================================================================*/#}

  {# Gutters #}

  --gutter: 20px;
  --guter-container: 20px;
  --guter-container-md: 40px;
  --gutter-negative: calc(var(--gutter) * -1);
  --gutter-half: calc(var(--gutter) / 2);
  --gutter-half-negative: calc(var(--gutter) * -1 / 2);
  --gutter-double: calc(var(--gutter) * 2);

  {#/*============================================================================
    #Misc
  ==============================================================================*/#}

  {# Borders #}

  --border-radius: {% if settings.theme_rounded %}24px{% else %}6px{% endif %};
  --border-radius-top: var(--border-radius) var(--border-radius) 0 0;
  --border-radius-top-right: 0 var(--border-radius) 0 0;
  --border-radius-top-left: var(--border-radius) 0 0 0;
  --border-radius-bottom: 0 0 var(--border-radius) var(--border-radius);
  --border-radius-bottom-right: 0 0 var(--border-radius) 0;
  --border-radius-bottom-left: 0 0 0 var(--border-radius);
  --border-radius-bottom-left-half: 0 0 0 calc(var(--border-radius) / 2);
  --border-radius-right: 0 var(--border-radius) var(--border-radius) 0;
  --border-radius-left: var(--border-radius) 0 0 var(--border-radius);
  --border-radius-right-big: 0 var(--border-radius) var(--border-radius) 0;
  --border-radius-left-big: var(--border-radius) 0 0 var(--border-radius);
  --border-radius-half: calc(var(--border-radius) / 2);
  --border-radius-small: 3px;

}