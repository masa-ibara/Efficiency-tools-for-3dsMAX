try(DestroyDialog EfficiencyTools)catch()

rollout EfficiencyTools  "EfficiencyTools"
(
	fn mirrorobjX = (
			
		for item in $selection do(
			
			pos = item.transform.pos
			rot = item.transform.rotation
			
			maxOps.cloneNodes item  cloneType:#reference newNodes:&newItem
			
			newItem.rotation = quat -rot.x rot.y -rot.z rot.w
			newItem.pos = [-pos.x,pos.y,pos.z]
			
			addmodifier newItem (mirror mirror_axis:0)
			
	    )
	)
	
	fn mirrorobjY = (
			
		for item in $selection do(
			
			pos = item.transform.pos
			rot = item.transform.rotation
			
			maxOps.cloneNodes item  cloneType:#reference newNodes:&newItem
			
			newItem.rotation = quat rot.x -rot.y -rot.z rot.w
			newItem.pos = [pos.x,-pos.y,pos.z]
			
			addmodifier newItem (mirror mirror_axis:1)
			
	    )
	)
	
	fn mirrorobjZ = (
			
		for item in $selection do(
			
			pos = item.transform.pos
			rot = item.transform.rotation
			
			maxOps.cloneNodes item  cloneType:#reference newNodes:&newItem
			
			newItem.rotation = quat rot.x rot.y -rot.z rot.w
			newItem.pos = [pos.x,pos.y,-pos.z]
			
			addmodifier newItem (mirror mirror_axis:2)
			
	    )
	)
	
	fn mirrorobjScalX = (
		for item in $selection do(
     	x = item.pivot.x
    	y = item.pivot.y
    	z = item.pivot.z 
	 
    	maxOps.cloneNodes item  cloneType:#instance newNodes:&newItem
  	 
	    newItem.pivot = [0,0,0]
    	scale newItem [-1,1,1]
    	newItem.pivot = [-x,y,z]
		)
	)

	fn mirrorobjScalY = (
		for item in $selection do(
     	x = item.pivot.x
    	y = item.pivot.y
    	z = item.pivot.z 
	 
    	maxOps.cloneNodes item  cloneType:#instance newNodes:&newItem
  	 
	    newItem.pivot = [0,0,0]
    	scale newItem [1,-1,1]
    	newItem.pivot = [x,-y,z]
		)
	)
	
	fn mirrorobjScalZ = (
		for item in $selection do(
     	x = item.pivot.x
    	y = item.pivot.y
    	z = item.pivot.z 
	 
    	maxOps.cloneNodes item  cloneType:#instance newNodes:&newItem
  	 
	    newItem.pivot = [0,0,0]
    	scale newItem [1,1,-1]
    	newItem.pivot = [x,y,-z]
		)
	)
	
	groupBox grp1 "modifier_mirror" pos:[5,5] width:90 height:105
	
    button mirror_objX "mirror_X" pos:[10,20] width:80 height:25
	button mirror_objY "mirror_Y" pos:[10,50] width:80 height:25	
    button mirror_objZ "mirror_Z" pos:[10,80] width:80 height:25
	
	groupBox grp2 "scale_mirror" pos:[5,115] width:90 height:105
	
	button mirror_objScalX "scale_mirror_X" pos:[10,130] width:80 height:25
	button mirror_objScalY "scale_mirror_Y" pos:[10,160] width:80 height:25
	button mirror_objScalZ "scale_mirror_Z" pos:[10,190] width:80 height:25
	
	on mirror_objX pressed do(
		mirrorobjX()
	)
    on mirror_objY pressed do(
		mirrorobjY()
	)
    on mirror_objZ pressed do(
		mirrorobjZ()
    )
	
	on mirror_objScalX pressed do(
		mirrorobjScalX()
	)
	on mirror_objScalY pressed do(
		mirrorobjScalY()
	)
	on mirror_objScalZ pressed do(
		mirrorobjScalZ()
	)
)
createDialog EfficiencyTools 100 230