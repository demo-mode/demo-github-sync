select funnelstage as title,
       median,
       mean 
       
from roberto_salcido899.funneltestv2_sheet1
WHERE funnelstage LIKE 'Social%' 
OR funnelstage LIKE 'Webpage%' 
OR funnelstage LIKE 'Email%' 
OR funnelstage LIKE 'Free Signup%' 
OR funnelstage LIKE 'Call Scheduled%' 
OR funnelstage LIKE 'Price%' 
OR funnelstage LIKE 'Contract Negotiation%' 