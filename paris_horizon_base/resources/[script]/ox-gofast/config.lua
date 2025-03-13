Config = {
    TypeMoney = 'black_money', -- 'cash' or 'black_money'
    PoliceJob = 'police',
    MinimumPolice = 2, -- Minimum police required to start a go fast
    CooldownTime = 15, -- minutes
    
    -- Improved difficulty system with fixed rewards
    Difficulty = {
        easy = {
            reward = 8000,
            police_alert_delay = 30, -- seconds
            vehicle_health = 1000,
            vehicle_list = {'sultan', 'buffalo'}, -- slower/common cars
        },
        medium = {
            reward = 14000,
            police_alert_delay = 15,
            vehicle_health = 800,
            vehicle_list = {'drafter', 'jugular'}, -- sports cars
        },
        hard = {
            reward = 20000,
            police_alert_delay = 5,
            vehicle_health = 600,
            vehicle_list = {'italirsx', 'nero'}, -- super cars
        }
    },
    
    -- Vehicle damage affects reward
    DamageMultiplier = {
        min = 0.5, -- 50% reward if vehicle heavily damaged
        max = 1.0  -- 100% reward if vehicle pristine
    }
}

Config.StartGoFast = {
    PedHash = 'a_m_m_afriamer_01',
    VehicleHash = 'sultan',
    PedCoords = vector4(1530.35, 3576.35, 34.43, 185.84),
    VehicleCoords = vector4(1549.55, 3561.46, 35.30, 230.0),
    TargetCoords = vector3(1530.35, 3576.35, 34.43)
}

Config.DeliveryCoords = {
    vec4(-1173.82, -1377.08, 3.95, 130),
    vec4(-1234.55, -1224.30, 5.90, 100.0),
	vec4(-192.43, 6391.31,30.85, 60.0),
}

Config.DeliveryModel = {
    'a_m_m_afriamer_01',
    'u_m_m_aldinapoli',
    's_m_y_ammucity_01',
}