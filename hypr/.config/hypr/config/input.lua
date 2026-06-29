-- Input configuration

-- Input variables https://wiki.hypr.land/Configuring/Basics/Variables/#input
hl.config({
    input = {
        accel_profile = "flat",
        repeat_delay  = 200,
        repeat_rate   = 80,
    },
})

-- Gestures https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures/
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "down",       action = "float" })
hl.gesture({ fingers = 3, direction = "up",         action = "fullscreen" })
-- hl.gesture({ fingers = 3, direction = "left",       action = "float" })
