(select funnelstage as title, median as value, 'median' as type from roberto_salcido899.funneltestv2_sheet1)
union all
(select funnelstage as title, mean as value, 'mean' as type from roberto_salcido899.funneltestv2_sheet1)

            