extends Node

var path = []	

func push(var value):
	path.append(value)
	
func pop():
	return path.pop_front()
