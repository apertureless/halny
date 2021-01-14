function destroy_same(){
	with object_index {
		if (id != other.id) {
			instance_destroy();
		}
	}
}