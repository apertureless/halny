function update_z() {
	z += zspeed * SLOMO_SECONDS;
	zspeed += GRAVITY_THIS_FRAME;

	z = min(z, 0);
}
