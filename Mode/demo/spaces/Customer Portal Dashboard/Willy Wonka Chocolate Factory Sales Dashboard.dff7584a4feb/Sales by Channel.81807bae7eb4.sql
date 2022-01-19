    SELECT *
      FROM wonka.candysales s
      JOIN wonka.candystores cs
        ON cs.order_id = s.id
     ORDER BY 3
     LIMIT 300
     
     