fx_version 'bodacious'
games { 'gta5' }

this_is_a_map "yes"

files {
    "data/interiorproxies.meta",
    "data/interiorproxies2.meta",
    "data/interiorproxies3.meta",
    "data/interiorproxies4.meta",
    "data/interiorproxies5.meta",
    "fivem_mlos_frv_manifest.ymt",
    'stream/dt1_23_build2.ydr',
    'stream/bt1_02_mall_ov.ydr',
    'stream/hei_hw1_24_build2.ydr',
    'stream/v_10_genbank_leaflets.ydr',
    'stream/pure_fleecalogo.ydr',
    'stream/pure_fleecalogo2.ydr', 
    'stream/v_10_fleecalogo.ydr', 
    'stream/dt1_23_sign_em.ydr', 
    'gusepe_timecycle_mods_saloon.xml',
}

data_file 'INTERIOR_PROXY_ORDER_FILE' 'data/interiorproxies.meta'
data_file 'INTERIOR_PROXY_ORDER_FILE' 'data/interiorproxies2.meta'
data_file 'INTERIOR_PROXY_ORDER_FILE' 'data/interiorproxies3.meta'
data_file 'INTERIOR_PROXY_ORDER_FILE' 'data/interiorproxies4.meta'
data_file 'INTERIOR_PROXY_ORDER_FILE' 'data/interiorproxies5.meta'
data_file 'SCENARIO_POINTS_OVERRIDE_FILE' 'fivem_mlos_frv_manifest.ymt'
data_file 'TIMECYCLEMOD_FILE' 'timecycles/ocean_h_timecycle.xml'
data_file 'DLC_ITYP_REQUEST' 'stream/gendarmerie.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/hei_dlc_heist_police.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/int_corporate.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/int_industrial.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/int_medical.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/v_office.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/int_services.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/v_traffic_lights.ytyp'
data_file 'TIMECYCLEMOD_FILE' 'gusepe_timecycle_mods_saloon.xml'
data_file 'DLC_ITYP_REQUEST' 'stream/int_retail.ytyp' 
data_file 'DLC_ITYP_REQUEST' 'stream/vw_prop_vw_tables.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/ch_prop_ch_casino_accs_02.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/v_int_10.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/ch_dlc_int_02_ch.ytyp'


dependency '/assetpacks'

client_script 'data/client.lua'
client_script 'data/clientkart.lua'
client_script 'data/clientpompiers.lua'