-- Calculate the percentage contribution of each pizza type to total revenue.
SELECT 
    ROUND(SUM(orders_details.quantity * pizzas.price) / (SELECT 
                    ROUND(SUM(orders_details.quantity * pizzas.price),
                                2) AS Total_revenue
                FROM
                    orders_details
                        JOIN
                    pizzas ON pizzas.pizza_id = orders_details.pizza_id) * 100,
            2) AS revenue,
    pizza_types.category
FROM
    orders_details
        JOIN
    pizzas ON orders_details.pizza_id = pizzas.pizza_id
        JOIN
    pizza_types ON pizza_types.pizza_type_id = pizzas.pizza_type_id
GROUP BY pizza_types.category
ORDER BY revenue DESC;

-- Analyze the cumulative revenue generated over time.

select order_date,sum(Revenue) over(order by order_date)as cum_revenue
from
(select orders.order_date, SUM(orders_details.quantity * pizzas.price) AS Revenue from 
orders_details join pizzas on orders_details.pizza_id=pizzas.pizza_id join orders on
orders.order_id = orders_details.order_id
group by order_date)as sales;