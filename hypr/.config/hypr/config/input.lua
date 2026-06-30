-- Input configuration

-- Input variables https://wiki.hypr.land/Configuring/Basics/Variables/#input
hl.config({
    input = {
        kb_layout     = "us,se",
        kb_variant    = "altgr-intl,",
        repeat_delay  = 200,
        repeat_rate   = 80,
        accel_profile = "flat",
        kb_options = "grp:alt_shift_toggle",  -- or grp:win_space_toggle, etc.
    },
})

-- Gestures https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures/
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "down",       action = "float" })
hl.gesture({ fingers = 3, direction = "up",         action = "fullscreen" })
-- hl.gesture({ fingers = 3, direction = "left",       action = "float" })
