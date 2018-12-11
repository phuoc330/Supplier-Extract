select distinct (poh.vendor_id), aps.vendor_name, aps.segment1, SUPA.VENDOR_SITE_CODE_ALT
from apps.po_headers_all poh,
apps.AP_SUPPLIER_SITES_ALL supa,
apps.ap_suppliers aps
where 1=1
and poh.creation_date > to_date('01-APR-17','dd-mon-yy')
and poh.attribute_category in ('00,00')
and poh.vendor_id = supa.vendor_id
and aps.vendor_id = supa.vendor_id
and poh.vendor_id = aps.vendor_id
and supa.vendor_site_id = poh.vendor_site_id
UNION
select aps2.vendor_id, aps2.vendor_name, aps2.segment1, supa2.vendor_site_code_alt
from 
apps.AP_SUPPLIER_SITES_ALL supa2,
apps.ap_suppliers aps2
where 1=1
and aps2.vendor_id = supa2.vendor_id
and supa2.attribute8 like ('0000')
;
