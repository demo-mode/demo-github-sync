SELECT {{ segment }} 


{% form %}

segment:
    type: multiselect
    default: "marketingEng"
    options: [["Marketing Engagement","marketingEng"], ["Churn","churn"], ["Velocity","velocity"]]

{% endform %}