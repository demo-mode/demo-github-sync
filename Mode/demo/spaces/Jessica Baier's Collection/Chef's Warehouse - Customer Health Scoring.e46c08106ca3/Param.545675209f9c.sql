select csm FROM johnny_kelley.health_in_the_time_of_corona_demo_raw_data;




{% form %}

CSM:
    type: multiselect
    default: all
    options:
        labels: csm
        values: csm

{% endform %}