SELECT*
FROM tutorial.aapl_historical_stock_price
{% form %}

year:
    type: multiselect
    default: 2014
    options: [2000,2001,2002,2003,2004,2005, 2006, 2007, 2008, 2009,2010,2011,2012,2013, 2014 ]

{% endform %}