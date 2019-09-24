SELECT {{year}}, month, date, open, close, high, low, volume
FROM tutorial.aapl_historical_stock_price
WHERE {{year}} = Year
{% form %}

year:
    type: select
    default: 2014
    options: [2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014]

{% endform %}