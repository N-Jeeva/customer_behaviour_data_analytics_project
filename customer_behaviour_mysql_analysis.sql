

## 1. Which age group and gender combination has the highest average spending per purchase?

	select age_group, gender, avg(purchase_amount) from customer_behaviour.cleaned_customer_data
    group by age_group, gender
    order by avg(purchase_amount);
    
## 2. Which product categories have the highest average purchase amount during each season?
	
	select category, season, avg(purchase_amount) from customer_behaviour.cleaned_customer_data
    group by category,season
    order by category, avg(purchase_amount);
    
## 3. Do customers spend more when discound applied or less on average than those when discount is not applied?
		
        select 
			c.customer_id,
			c.item_purchased,
			c.purchase_amount,
			c.discount_applied,
			avg_table.avg_purchase_amount AS avg_item_purchase
		FROM customer_behaviour.cleaned_customer_data c
		JOIN (
			SELECT 
				item_purchased,
				AVG(purchase_amount) AS avg_purchase_amount
			FROM customer_behaviour.cleaned_customer_data
			WHERE discount_applied = 'Yes'
			GROUP BY item_purchased
		) AS avg_table
		ON c.item_purchased = avg_table.item_purchased
		WHERE c.discount_applied = 'Yes'
		  AND c.purchase_amount > avg_table.avg_purchase_amount;

## 4. Comparing the average purchase amount according to the shipping type

		select shipping_type, round(avg(purchase_amount), 2) as avg_purchase_amount from customer_behaviour.cleaned_customer_data
        where shipping_type in ('Standard', 'Express')
		group by shipping_type
		order by avg_purchase_amount;

## 5. Comparison of subscribed and non subscribed customers on average purchase amount and total revenue

		select subscription_status,
			count(customer_id) as total_customers,
			round(avg(purchase_amount), 2) as avg_purchase_amount, 
			round(sum(purchase_amount), 2) as total_revenue from customer_behaviour.cleaned_customer_data
		group by subscription_status
		order by total_revenue,avg_purchase_amount;
	
## 6. Which are the top 5 products that have the highest percentage of purchase with discounts applied?
	
		select item_purchased, 
			   round((sum(case when discount_applied = 'Yes' then 1 else 0 end) / count(*)) * 100, 2) as discount_rate
		from customer_behaviour.cleaned_customer_data
		group by item_purchased
		order by discount_rate desc limit 5;

## 7. Segmenting customers as new, returning and loyal based on their number of previous purchases?
	
		select case when previous_purchases = 1 then 'New'
					when previous_purchases between 2 and 10 then 'Returning'
					else 'Loyal'
			   end as customer_segment,
		count(customer_id) as customer_count
        from customer_behaviour.cleaned_customer_data
        group by customer_segment;
        
## 8. What are the top 3 purchased products in each category?
	
		with item_counts as (
		select category, item_purchased,
			   count(customer_id) as total_orders,
			   row_number() over (partition by category order by count(customer_id) desc) as item_rank
		from customer_behaviour.cleaned_customer_data
		group by category, item_purchased)

		select item_rank, category, item_purchased, total_orders
		from item_counts
		where item_rank <=3;

## 9. Are customers who are repeat buyers(more than 10 previous purchases) are most likely to subscribe?
        
        select subscription_status,
				count(customer_id) as repeat_buyers
		from customer_behaviour.cleaned_customer_data
		where previous_purchases >= 10
        group by subscription_status;

## 10. How does average purchase frequency vary across categories for different shipping types?

			select category, 
				   shipping_type,
                   avg(purchase_frequency_days) as avg_purchase_frequency
			from customer_behaviour.cleaned_customer_data
            group by category, shipping_type
            order by category, avg_purchase_frequency desc;                    
	
