Select 
aps.vendor_name, 
aps.segment1 as ap_suppliers_segment1, 
apss.vendor_site_code_alt as legacy_supplier_site_code, 
apss.vendor_site_code, 
apss.purchasing_site_flag,
apss.pay_site_flag,
apss.address_line1,
apss.address_line2,
apss.city,
apss.state,
apss.zip,
apss.freight_terms_lookup_code
from
apps.ap_suppliers aps,--aps.terms_id, aps.vendor_id, aps.enabled_flag
apps.ap_supplier_sites_all apss--apss.purchasing_site_flag
--apps.ap_terms apt; -- apt.terms_id,apt.name
where 1=1
and aps.enabled_flag = 'Y'
--and aps.vendor_id in 12128
--and aps.vendor_name = 'SAUDER WOODWORKING CO'
and aps.vendor_id = apss.vendor_id
and apss.purchasing_site_flag = 'Y'
and ltrim(apss.vendor_site_code_alt,'0') in
('0000');
