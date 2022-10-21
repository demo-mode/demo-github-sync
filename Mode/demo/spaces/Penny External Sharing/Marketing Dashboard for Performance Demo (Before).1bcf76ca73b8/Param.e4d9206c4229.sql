    SELECT 'Social/SEO' AS funnelstage,
            1907 AS value
            
UNION ALL

    SELECT 'Webpage Landing',
            932
            
UNION ALL

    SELECT 'Free Signup',
            731
            
UNION ALL

    SELECT 'Email Delivered',
            689
            
UNION ALL

    SELECT 'Email Opened',
            551
            
UNION ALL

    SELECT 'Call Scheduled',
            479
            
UNION ALL

    SELECT 'Call Closed',
            423
            
UNION ALL

    SELECT 'Trial Started',
            392
            
UNION ALL

    SELECT 'Price Quoted',
            356
            
UNION ALL

    SELECT 'Contract Negotiation',
            335
            
UNION ALL

    SELECT 'Closed Won',
            185


{% form %}

funnel:
    type: multiselect
    default: all
    options:
        labels: funnelstage
        values: funnelstage

{% endform %}