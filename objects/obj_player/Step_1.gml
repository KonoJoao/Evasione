interaction_max_range = 32

nearest_interactable = instance_nearest(x, y, obj_interagivel)

if nearest_interactable != noone && keyboard_check_pressed(inputs.enter) {
    if distance_to_object(nearest_interactable) < interaction_max_range{
        nearest_interactable.activate()
    }
}