// Slomo - Cinema Mode
draw_set_color(c_black);
draw_rectangle(0, 0, view_width(), 100 * transition_percent, false)
draw_rectangle(0, view_height(), view_width(), view_height() - (100 * transition_percent),false);
