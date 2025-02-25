-- Determine the distribution of orders by hour of the day.
SELECT 
    HOUR(order_time) AS hour, COUNT(order_id)
FROM
    orders
GROUP BY HOUR(order_time); 

-- Group the orders by date and calculate the average number of pizzas ordered per day.
SELECT 
    ROUND(AVG(Total_orders), 0) AS Average
FROM
    (SELECT 
        orders.order_date,
            SUM(orders_details.quantity) AS Total_orders
    FROM
        orders
    JOIN orders_details ON orders.order_id = orders_details.order_id
    GROUP BY orders.order_date) AS Total;

-- Determine the top 3 most ordered pizza types based on revenue.

SELECT 
    SUM(orders_details.quantity * pizzas.price) AS Revenue,
    pizza_types.name
FROM
    orders_details
        JOIN
    pizzas ON orders_details.pizza_id = pizzas.pizza_id
        JOIN
    pizza_types ON pizza_types.pizza_type_id = pizzas.pizza_type_id
GROUP BY pizza_types.name
ORDER BY revenue DESC
LIMIT 3;
