USE [OlistDB]
GO

/****** Object:  View [dbo].[vw_OlistMasterAnalysis]    Script Date: 14.11.2026 02:29:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vw_OlistMasterAnalysis] AS
SELECT 
    o.order_id,
    o.customer_id,
    c.customer_unique_id,
    c.customer_city,
    c.customer_state,
    o.order_status,
    o.order_purchase_timestamp,
    o.order_approved_at,
    o.order_delivered_customer_date,
    o.order_estimated_delivery_date,
    i.order_item_id,
    i.product_id,
    p.product_category_name,
    i.price,
    i.freight_value,
    -- Toplam kalem tutarı (ürün fiyatı + kargo)
    (i.price + i.freight_value) AS total_item_value
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items i ON o.order_id = i.order_id
JOIN products p ON i.product_id = p.product_id;
GO

