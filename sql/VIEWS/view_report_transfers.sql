DROP VIEW IF EXISTS view_report_transfers;

CREATE OR REPLACE VIEW view_report_transfers AS
 SELECT DISTINCT ON(a.id)
 	a.id AS transfer_id,
    (d.id)::integer AS inventory_id,
    d.location_id AS warehouse_id,
    e.name AS warehouse,
    ((p.value ->> 'id'::text))::integer AS product_id,
    b.sku,
    initcap(lower(b.product)) AS product,
    ((p.value ->> 'quantity'::text))::integer AS quantity,
    b.total_quantity AS inventory,
    sum(((p.value ->> 'quantity'::text))::integer) AS "Total Transferred",
    a.type_id,
    a.transfer_type,
    a.from_id AS shipping_id,
    COALESCE(a.from_warehouse, 'HWH'::character varying) AS shipping_warehouse,
    a.to_id AS receiving_id,
    a.to_warehouse AS receiving_warehouse,
    (b.litres_per_bottle)::numeric(10,4) AS litres_per_bottle,
    b.bottles_per_case,
    b.bottles_per_skid AS bottles_per_sku,
    a.status_id,
    a.status,
    d.manufacturer_id,
    a.manufacturer,
    a.user_id AS created_id,
    (a.created_by)::character varying AS created_by,
    a.created,
    a.delivery_date AS delivered,
    a.received_id,
    a.received_by,
    a.received_date AS received
   FROM matview_transfers a,
    (((LATERAL json_array_elements(a.products) p(value)
     LEFT JOIN matview_products b ON ((b.product_id = ((p.value ->> 'id'::text))::bigint)))
     LEFT JOIN pim_inventory d ON ((d.product_id = ((p.value ->> 'id'::text))::bigint)))
     LEFT JOIN matview_locations e ON ((e.id = d.location_id)))
  WHERE (a.status_id <> 4)
  GROUP BY a.id, ((d.id)::integer), d.location_id, e.name, ((p.value ->> 'id'::text))::integer, b.sku, (initcap(lower(b.product))), ((p.value ->> 'quantity'::text))::integer, b.total_quantity, a.type_id, a.transfer_type, a.from_id, COALESCE(a.from_warehouse, 'HWH'::character varying), a.to_id, a.to_warehouse, ((b.litres_per_bottle)::numeric(10,4)), b.bottles_per_case, b.bottles_per_skid, a.status_id, a.status, d.manufacturer_id, a.manufacturer, a.user_id, (a.created_by)::character varying, a.created, a.delivery_date, a.received_id, a.received_by, a.received_date
  ORDER BY a.id DESC, a.created, d.location_id, d.manufacturer_id, a.type_id, a.status_id;
  
  SELECT * 
  FROM matview_report_transfers 
  WHERE EXTRACT(MONTH FROM created) = EXTRACT(MONTH FROM NOW());