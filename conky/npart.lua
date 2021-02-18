conky.config = {
    -- Run settings
    total_run_times = 0,
    update_interval = 1,

    -- Positioning
    alignment = 'bottom_left',
	xinerama_head = 1,
    gap_x = 24,
    gap_y = 24,
    minimum_width = 125,
    maximum_width = 125,
    minimum_height = 125,

    -- Draw settings
    double_buffer = true,
    draw_shades = false,
    draw_blended = false,

    -- Compositor settings
    own_window = true,
    own_window_argb_visual = true,
    own_window_argb_value = 0,
    own_window_transparent = true,
    own_window_hints = 'undecorated,below,sticky,skip_taskbar,skip_pager',
    own_window_type = 'desktop'
};

conky.text = [[
${if_match "" != "${exec playerctl -p spotify status}"}${exec ./scripts/fetch-art spotify}
${if_match "Playing" == "${exec playerctl -p spotify status}"}${image ./data/spotify.png -p 0,0 -s 125x125 -n}
	${else}${image ./data/spotify-pause.png -p 0,0 -s 125x125 -n}
	${endif}
${else}${if_match "" != "${exec playerctl -p vlc status}"}${exec ./scripts/fetch-art vlc}
	${image ./data/vlc.png -p 0,0 -s 125x125 -n}
${else}${if_match "" != "${exec playerctl -p cmus status}"}${exec ./scripts/fetch-art cmus}
	${image ./data/cmus.png -p 0,0 -s 125x125 -n}
${endif}
${endif}
${endif}
]];
