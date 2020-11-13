

with cost as ( 
    select 
      max(case when {{platform}} = 1 then 18000
               when {{platform}} = 2 then 30000
               when {{platform}} = 3 then 45000
          end) as platform_price,
      max(case
               when {{line_item}} = 1 then 0
               when {{line_item}} = 2 then 28000
               when {{line_item}} = 3 then 22000
          end) as line_item,
      case 
               when {{seats}} < 25 then {{seats}} * 300 
               when {{seats}} > 24 and {{seats}} < 100 then {{seats}} * 240
               when {{seats}} > 99 then {{seats}} * 216
        end as seat_cost
    from mode.line_items li
    cross join mode.platform p
    cross join mode.seats s
    )
    
    select platform_price,
           line_item,
           seat_cost,
           platform_price + line_item + seat_cost as total_cost
    from cost
    
{% form %}

seats:
    type: text
    default: 10
    
platform:
    type: select
    default: 3
    options: [[small, 1],
              [medium, 2],
              [large, 3]
             ]
line_item:
    type: multiselect
    default: 3
    options: [[none, 1],
              [White-Label Embeds, 2],
              [External Sharing, 3]
             ]

{% endform %}


        


