extends MarginContainer

export (bool) var is_earth = false
export (bool) var is_mars = false
export (bool) var is_iss = false
export (bool) var is_package = false

export (NodePath) var player
export (NodePath) var earth
export (NodePath) var mars
export (NodePath) var iss
export (NodePath) var package
export var zoom = 5

onready var grid = $MarginContainer/Grid
onready var player_minimap = $MarginContainer/Grid/Player_minimap
onready var earth_minimap = $MarginContainer/Grid/earth_minimap
onready var mars_minimap = $MarginContainer/Grid/mars_minimap
onready var iss_minimap = $MarginContainer/Grid/iss_minimap
onready var package_minimap = $MarginContainer/Grid/package_minimap
var grid_scale
var minimap_obj_zoom = Vector2(0.01,0.01)


func _ready():
	if is_earth:
		$MarginContainer/Grid/earth_minimap.show()
	if is_mars:
		$MarginContainer/Grid/mars_minimap.show()
	if is_iss:
		$MarginContainer/Grid/iss_minimap.show()
	if is_package:
		$MarginContainer/Grid/package_minimap.show()
	player_minimap.position = grid.rect_size / 2
	grid_scale = grid.rect_size / (get_viewport_rect().size * zoom)
	

func _process(delta):
	
	player_minimap.rotation = get_node(player).rotation + PI
	
	
	
	if is_earth:
		earth_minimap.position = (get_node(earth).position - get_node(player).position) * grid_scale + grid.rect_size / 2
		earth_minimap.position.x = clamp(earth_minimap.position.x, 0 ,grid.rect_size.x)
		earth_minimap.position.y = clamp(earth_minimap.position.y, 0 ,grid.rect_size.y)
		var t_e_d = get_node(earth).position - get_node(player).position
		
		if (t_e_d.x)*(t_e_d.x) + (t_e_d.y)*(t_e_d.y) < 4000000:
			if earth_minimap.scale < Vector2(0.7,0.7): 
				earth_minimap.scale += minimap_obj_zoom
				return
		if (t_e_d.x)*(t_e_d.x) + (t_e_d.y)*(t_e_d.y) > 4000000:
			if earth_minimap.scale > Vector2(0.16, 0.16) :
				earth_minimap.scale -= minimap_obj_zoom
				return
	
	if is_mars:
		mars_minimap.position = (get_node(mars).position - get_node(player).position) * grid_scale + grid.rect_size / 2
		mars_minimap.position.x = clamp(mars_minimap.position.x, 0 ,grid.rect_size.x)
		mars_minimap.position.y = clamp(mars_minimap.position.y, 0 ,grid.rect_size.y)
		var t_m_d = get_node(mars).position - get_node(player).position
		
		if (t_m_d.x)*(t_m_d.x) + (t_m_d.y)*(t_m_d.y) < 4000000:
			if mars_minimap.scale < Vector2(0.3,0.3): 
				mars_minimap.scale += minimap_obj_zoom
				return
		if (t_m_d.x)*(t_m_d.x) + (t_m_d.y)*(t_m_d.y) > 4000000:
			if mars_minimap.scale > Vector2(0.16, 0.16) :
				mars_minimap.scale -= minimap_obj_zoom
				return
	
	if is_iss:
		iss_minimap.position = (get_node(iss).position - get_node(player).position) * grid_scale + grid.rect_size / 2
		iss_minimap.position.x = clamp(iss_minimap.position.x, 0 ,grid.rect_size.x)
		iss_minimap.position.y = clamp(iss_minimap.position.y, 0 ,grid.rect_size.y)
		var t_s_d = get_node(iss).position - get_node(player).position
		
		if (t_s_d.x)*(t_s_d.x) + (t_s_d.y)*(t_s_d.y) < 3000000:
			if iss_minimap.scale < Vector2(0.5,0.5): 
				iss_minimap.scale += minimap_obj_zoom
				return
		if (t_s_d.x)*(t_s_d.x) + (t_s_d.y)*(t_s_d.y) > 3000000:
			if iss_minimap.scale > Vector2(0.16, 0.16) :
				iss_minimap.scale -= minimap_obj_zoom
				return
	
	if is_package:
		package_minimap.position = (get_node(package).position - get_node(player).position) * grid_scale + grid.rect_size / 2
		package_minimap.position.x = clamp(package_minimap.position.x, 0 ,grid.rect_size.x)
		package_minimap.position.y = clamp(package_minimap.position.y, 0 ,grid.rect_size.y)
		
		
		package_minimap.rotation = get_node(package).rotation
		
		
