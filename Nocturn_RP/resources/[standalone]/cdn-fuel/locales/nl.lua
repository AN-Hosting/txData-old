local Translations = {
    -- Brandstof
    set_fuel_debug = "Stel brandstof in op:",
    cancelled = "Geannuleerd.",
    not_enough_money = "Je hebt niet genoeg geld!",
    not_enough_money_in_bank = "Je hebt niet genoeg geld op je bankrekening!",
    not_enough_money_in_cash = "Je hebt niet genoeg contant geld!",
    more_than_zero = "Je moet meer dan 0L tanken!",
    emergency_shutoff_active = "De pompen zijn momenteel uitgeschakeld via het noodafsluitsysteem.",
    nozzle_cannot_reach = "Het mondstuk kan niet zo ver reiken!",
    station_no_fuel = "Dit station heeft geen brandstof meer!",
    station_not_enough_fuel = "Het station heeft niet zoveel brandstof!",
    show_input_key_special = "Druk op [G] in de buurt van het voertuig om het bij te tanken!",
    tank_cannot_fit = "Je tank kan dit niet bevatten!",
    tank_already_full = "Je voertuig is al vol!",
    need_electric_charger = "Ik moet naar een elektrische oplader!",
    cannot_refuel_inside = "Je kunt niet tanken vanuit het voertuig!",

    -- 2.1.2 -- Reserves Ophaalpunt ---
    fuel_order_ready = "Je brandstofbestelling is beschikbaar om op te halen! Bekijk je GPS om het ophaalpunt te vinden!",
    draw_text_fuel_dropoff = "[E] Lever Truck Af",
    fuel_pickup_success = "Je reserves zijn gevuld tot: %sL",
    fuel_pickup_failed = "Ron Oil heeft net de brandstof bij je station afgeleverd!",
    trailer_too_far = "De trailer is niet aan de truck gekoppeld of is te ver weg!",

    -- 2.1.0
    no_nozzle = "Je hebt het mondstuk niet!",
    vehicle_is_damaged = "Voertuig is te beschadigd om te tanken!",
    vehicle_too_far = "Je bent te ver weg om dit voertuig te tanken!",
    inside_vehicle = "Je kunt niet tanken vanuit het voertuig!",
    you_are_discount_eligible = "Als je in dienst gaat, kun je een korting van "..Config.EmergencyServicesDiscount['discount'].."% krijgen!",
    no_fuel = "Geen brandstof..",

    -- Elektrisch
    electric_more_than_zero = "Je moet meer dan 0KW opladen!",
    electric_vehicle_not_electric = "Je voertuig is niet elektrisch!",
    electric_no_nozzle = "Je voertuig is niet elektrisch!",

    -- Telefoon --
    electric_phone_header = "Elektrische Lader",
    electric_phone_notification = "Totale Kosten Elektriciteit: $",
    fuel_phone_header = "Tankstation",
    phone_notification = "Totale Kosten: $",
    phone_refund_payment_label = "Terugbetaling @ Tankstation!",

    -- Stations
    station_per_liter = " / Liter!",
    station_already_owned = "Deze locatie is al in bezit!",
    station_cannot_sell = "Je kunt deze locatie niet verkopen!",
    station_sold_success = "Je hebt deze locatie succesvol verkocht!",
    station_not_owner = "Je bent niet de eigenaar van deze locatie!",
    station_amount_invalid = "Bedrag is ongeldig!",
    station_more_than_one = "Je moet meer dan 1L kopen!",
    station_price_too_high = "Deze prijs is te hoog!",
    station_price_too_low = "Deze prijs is te laag!",
    station_name_invalid = "Deze naam is ongeldig!",
    station_name_too_long = "Naam mag niet langer zijn dan "..Config.NameChangeMaxChar.." tekens.",
    station_name_too_short = "Naam moet langer zijn dan "..Config.NameChangeMinChar.." tekens.",
    station_withdraw_too_much = "Je kunt niet meer opnemen dan het station heeft!", 
    station_withdraw_too_little = "Je kunt niet minder dan $1 opnemen!",
    station_success_withdrew_1 = "Succesvol $",
    station_success_withdrew_2 = " opgenomen van de balans van dit station!", -- Laat de spatie aan het begin staan!
    station_deposit_too_much = "Je kunt niet meer storten dan je hebt!", 
    station_deposit_too_little = "Je kunt niet minder dan $1 storten!",
    station_success_deposit_1 = "Succesvol $",
    station_success_deposit_2 = " gestort op de balans van dit station!", -- Laat de spatie aan het begin staan!
    station_cannot_afford_deposit = "Je kunt het niet veroorloven om $ te storten",
    station_shutoff_success = "Succesvol de afsluitklepstatus voor deze locatie gewijzigd!",
    station_fuel_price_success = "Succesvol brandstofprijs gewijzigd naar $",
    station_reserve_cannot_fit = "De reserves kunnen dit niet bevatten!",
    station_reserves_over_max =  "Je kunt dit bedrag niet kopen omdat het groter zal zijn dan het maximum van "..Config.MaxFuelReserves.." Liters",
    station_name_change_success = "Naam succesvol gewijzigd naar: ", -- Laat de spatie aan het einde staan!
    station_purchased_location_payment_label = "Tankstationlocatie gekocht: ",
    station_sold_location_payment_label = "Tankstationlocatie verkocht: ",
    station_withdraw_payment_label = "Geld opgenomen van Tankstation. Locatie: ",
    station_deposit_payment_label = "Geld gestort op Tankstation. Locatie: ",

    -- Alle Voortgangsbalken
    prog_refueling_vehicle = "Voertuig aan het tanken..",
    prog_electric_charging = "Opladen..",
    prog_jerry_can_refuel = "Jerrycan aan het vullen..",
    prog_syphoning = "Brandstof aan het stelen..",

    -- Menu's
    menu_header_cash = "Contant",
    menu_header_bank = "Bank",
    menu_header_close = "Annuleren",
    menu_pay_with_cash = "Betalen met contant geld.  \nJe hebt: $",
    menu_pay_with_bank = "Betalen met bank.", 
    menu_refuel_header = "Tankstation",
    menu_refuel_accept = "Ik wil de brandstof kopen.",
    menu_refuel_cancel = "Ik wil eigenlijk geen brandstof meer.",
    menu_pay_label_1 = "Benzine @ ",
    menu_pay_label_2 = " / L",
    menu_header_jerry_can = "Jerrycan",
    menu_header_refuel_jerry_can = "Jerrycan Vullen",
    menu_header_refuel_vehicle = "Voertuig Tanken",

    menu_electric_cancel = "Ik wil mijn auto eigenlijk niet meer opladen.",
    menu_electric_header = "Elektrische Lader",
    menu_electric_accept = "Ik wil betalen voor elektriciteit.",
    menu_electric_payment_label_1 = "Elektriciteit @ ",
    menu_electric_payment_label_2 = " / KW",

    -- Station Menu's
    menu_ped_manage_location_header = "Beheer Deze Locatie",
    menu_ped_manage_location_footer = "Als je de eigenaar bent, kun je deze locatie beheren.",

    menu_ped_purchase_location_header = "Koop Deze Locatie",
    menu_ped_purchase_location_footer = "Als niemand deze locatie bezit, kun je deze kopen.",

    menu_ped_emergency_shutoff_header = "Noodafsluiting In-/Uitschakelen",
    menu_ped_emergency_shutoff_footer = "Schakel de brandstof uit in geval van nood.   \n De pompen zijn momenteel ",

    menu_ped_close_header = "Gesprek Annuleren",
    menu_ped_close_footer = "Ik wil eigenlijk niets meer bespreken.",

    menu_station_reserves_header = "Koop Reserves voor ",
    menu_station_reserves_purchase_header = "Koop reserves voor: $",
    menu_station_reserves_purchase_footer = "Ja, ik wil brandstofreserves kopen voor $",
    menu_station_reserves_cancel_footer = "Ik wil eigenlijk geen reserves meer kopen!",

    menu_purchase_station_header_1 = "De totale kosten zullen zijn: $",
    menu_purchase_station_header_2 = " inclusief belastingen.",
    menu_purchase_station_confirm_header = "Bevestigen",
    menu_purchase_station_confirm_footer = "Ik wil deze locatie kopen voor $",
    menu_purchase_station_cancel_footer = "Ik wil deze locatie eigenlijk niet meer kopen. Die prijs is belachelijk!",

    menu_sell_station_header = "Verkoop ",
    menu_sell_station_header_accept = "Verkoop Tankstation",
    menu_sell_station_footer_accept = "Ja, ik wil deze locatie verkopen voor $",
    menu_sell_station_footer_close = "Ik wil eigenlijk niets meer bespreken.",

    menu_manage_header = "Beheer van ",
    menu_manage_reserves_header = "Brandstofreserves  \n",
    menu_manage_reserves_footer_1 =  " Liters van ",
    menu_manage_reserves_footer_2 =  " Liters  \nJe kunt hieronder meer reserves kopen!",

    menu_manage_purchase_reserves_header = "Koop Meer Brandstof voor Reserves",
    menu_manage_purchase_reserves_footer = "Ik wil meer brandstofreserves kopen voor $",
    menu_manage_purchase_reserves_footer_2 = " / L!",

    menu_alter_fuel_price_header = "Wijzig Brandstofprijs",
    menu_alter_fuel_price_footer_1 = "Ik wil de prijs van brandstof bij mijn Tankstation wijzigen!  \nMomenteel is het $",

    menu_manage_company_funds_header = "Beheer Bedrijfsfondsen",
    menu_manage_company_funds_footer = "Ik wil de fondsen van deze locatie beheren.",
    menu_manage_company_funds_header_2 = "Fondsenbeheer van ",
    menu_manage_company_funds_withdraw_header = "Fondsen Opnemen",
    menu_manage_company_funds_withdraw_footer = "Fondsen opnemen van de rekening van het Station.",
    menu_manage_company_funds_deposit_header = "Fondsen Storten",
    menu_manage_company_funds_deposit_footer = "Fondsen storten op de rekening van het Station.",
    menu_manage_company_funds_return_header = "Terug",
    menu_manage_company_funds_return_footer = "Ik wil iets anders bespreken!",

    menu_manage_change_name_header = "Wijzig Locatienaam",
    menu_manage_change_name_footer = "Ik wil de naam van de locatie wijzigen.",

    menu_manage_sell_station_footer = "Verkoop je tankstation voor $",

    menu_manage_close = "Ik wil eigenlijk niets meer bespreken!", 

    -- Jerrycan Menu's 
    menu_jerry_can_purchase_header = "Koop Jerrycan voor $",
    menu_jerry_can_footer_full_gas = "Je Jerrycan is vol!",
    menu_jerry_can_footer_refuel_gas = "Vul je Jerrycan bij!",
    menu_jerry_can_footer_use_gas = "Gebruik je benzine om het voertuig bij te tanken!",
    menu_jerry_can_footer_no_gas = "Je hebt geen benzine in je Jerrycan!",
    menu_jerry_can_footer_close = "Ik wil eigenlijk geen Jerrycan meer.",
    menu_jerry_can_close = "Ik wil dit eigenlijk niet meer gebruiken.",

    -- Syphon Kit Menu's
    menu_syphon_kit_full = "Je Syphon Kit is vol! Het past slechts " .. Config.SyphonKitCap .. "L!",
    menu_syphon_vehicle_empty = "De brandstoftank van dit voertuig is leeg.",
    menu_syphon_allowed = "Steel brandstof van een nietsvermoedend slachtoffer!",
    menu_syphon_refuel = "Gebruik je gestolen benzine om het voertuig bij te tanken!",
    menu_syphon_empty = "Gebruik je gestolen benzine om het voertuig bij te tanken!",
    menu_syphon_cancel = "Ik wil dit eigenlijk niet meer gebruiken. Ik heb een nieuw blad omgeslagen!",
    menu_syphon_header = "Syphon",
    menu_syphon_refuel_header = "Bijtanken",

    -- Input --
    input_select_refuel_header = "Selecteer hoeveel gas je wilt tanken.",
    input_refuel_submit = "Voertuig Tanken",
    input_refuel_jerrycan_submit = "Jerrycan Vullen",
    input_max_fuel_footer_1 = "Tot ",
    input_max_fuel_footer_2 = "L gas.",
    input_insert_nozzle = "Mondstuk Invoegen", -- Ook gebruikt voor Target!

    input_purchase_reserves_header_1 = "Koop Reserves  \nHuidige Prijs: $",
    input_purchase_reserves_header_2 = Config.FuelReservesPrice .. " / Liter  \nHuidige Reserves: ",
    input_purchase_reserves_header_3 = " Liters  \nVolledige Reservekosten: $",
    input_purchase_reserves_submit_text = "Koop Reserves",
    input_purchase_reserves_text = 'Koop Brandstofreserves.',

    input_alter_fuel_price_header_1 = "Wijzig Brandstofprijs   \nHuidige Prijs: $",
    input_alter_fuel_price_header_2 = " / Liter",
    input_alter_fuel_price_submit_text = "Wijzig Brandstofprijs",

    input_change_name_header_1 = "Wijzig ",
    input_change_name_header_2 = "'s Naam.",
    input_change_name_submit_text = "Naamwijziging Indienen",
    input_change_name_text = "Nieuwe Naam..",

    input_withdraw_funds_header = "Fondsen Opnemen  \nHuidige Balans: $",
    input_withdraw_submit_text = "Opnemen",
    input_withdraw_text = "Fondsen Opnemen",

    input_deposit_funds_header = "Fondsen Storten  \nHuidige Balans: $",
    input_deposit_submit_text = "Storten",
    input_deposit_text = "Fondsen Storten",

    -- Target
    grab_electric_nozzle = "Pak Elektrisch Mondstuk",
    insert_electric_nozzle = "Plaats Elektrisch Mondstuk",
    grab_nozzle = "Pak Mondstuk",
    return_nozzle = "Plaats Mondstuk Terug",
    grab_special_nozzle = "Pak Speciaal Mondstuk",
    return_special_nozzle = "Plaats Speciaal Mondstuk Terug",
    buy_jerrycan = "Koop Jerrycan",
    station_talk_to_ped = "Bespreek Tankstation",

    -- Jerrycan
    jerry_can_full = "Je Jerrycan is vol!",
    jerry_can_refuel = "Vul je Jerrycan bij!",
    jerry_can_not_enough_fuel = "De Jerrycan heeft niet zoveel brandstof!",
    jerry_can_not_fit_fuel = "De Jerrycan kan niet zoveel brandstof bevatten!",
    jerry_can_success = "Jerrycan succesvol gevuld!",
    jerry_can_success_vehicle = "Voertuig succesvol bijgetankt met de Jerrycan!",
    jerry_can_payment_label = "Jerrycan Gekocht.",

    -- Syphoning
    syphon_success = "Succesvol brandstof uit voertuig gestolen!",
    syphon_success_vehicle = "Voertuig succesvol bijgetankt met de Syphon Kit!",
    syphon_electric_vehicle = "Dit voertuig is elektrisch!",
    syphon_no_syphon_kit = "Je hebt iets nodig om brandstof mee te stelen.",
    syphon_inside_vehicle = "Je kunt niet stelen vanuit het voertuig!",
    syphon_more_than_zero = "Je moet meer dan 0L stelen!",
    syphon_kit_cannot_fit_1 = "Je kunt niet zoveel stelen, je kan past het niet! Je kunt slechts: ",
    syphon_kit_cannot_fit_2 = " Liters meenemen.",
    syphon_not_enough_gas = "Je hebt niet genoeg benzine om zoveel bij te tanken!",
    syphon_dispatch_string = "(10-90) - Benzinediefstal",
}
Lang = Locale:new({phrases = Translations, warnOnMissing = true})