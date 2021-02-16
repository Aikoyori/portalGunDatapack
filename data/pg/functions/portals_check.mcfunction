execute as @a[nbt={SelectedItem:{id:"minecraft:bow",tag:{display:{Name:'{"color":"gold","text":"Orange Portal Gun"}'}}}}] at @s run execute as @e[type=arrow,distance=..6,scores={portalArrow=0}] run scoreboard players set @s portalArrow 2
execute as @a[nbt={SelectedItem:{id:"minecraft:bow",tag:{display:{Name:'{"color":"blue","text":"Blue Portal Gun"}'}}}}] at @s run execute as @e[type=arrow,distance=..6,scores={portalArrow=0}] run scoreboard players set @s portalArrow 1
execute as @a[nbt={SelectedItem:{id:"minecraft:bow",tag:{display:{Name:'{"color":"gold","text":"Orange Portal Gun"}'}}}}] at @s run execute as @e[type=arrow,distance=..6,scores={portalArrow=1..}] run data merge entity @s {NoGravity:1b}
execute as @a[nbt={SelectedItem:{id:"minecraft:bow",tag:{display:{Name:'{"color":"blue","text":"Blue Portal Gun"}'}}}}] at @s run execute as @e[type=arrow,distance=..6,scores={portalArrow=1..}] run data merge entity @s {NoGravity:1b}
execute as @e[type=arrow,scores={portalArrow=2},nbt={inGround:1b,inBlockState:{Name:"minecraft:smooth_quartz"}}] at @s run kill @e[type=minecraft:armor_stand,name="Orange Portal"]
execute as @e[type=arrow,scores={portalArrow=1},nbt={inGround:1b,inBlockState:{Name:"minecraft:smooth_quartz"}}] at @s run kill @e[type=minecraft:armor_stand,name="Blue Portal"]
execute as @e[type=arrow,scores={portalArrow=2},nbt={inGround:1b,inBlockState:{Name:"minecraft:smooth_quartz"}}] at @s run summon minecraft:armor_stand ~ ~ ~ {Color:1,NoAI:1,CustomName:'{"text":"Orange Portal","color":"gold"}',Health:.1,DeathLootTable:"",Invulnerable:1,CustomNameVisible:1,Silent:1,Invisible:1b,NoGravity:1,Marker:1,Tags:["portals"]}
execute as @e[type=arrow,scores={portalArrow=1},nbt={inGround:1b,inBlockState:{Name:"minecraft:smooth_quartz"}}] at @s run summon minecraft:armor_stand ~ ~ ~ {Color:11,NoAI:1,CustomName:'{"text":"Blue Portal","color":"blue"}',Health:.1,DeathLootTable:"",Invulnerable:1,CustomNameVisible:1,Silent:1,Invisible:1b,NoGravity:1,Marker:1,Tags:["portals"]}
execute as @e[type=arrow,scores={portalArrow=1},nbt={inGround:1b}] at @s run kill @s
execute as @e[type=arrow,scores={portalArrow=2},nbt={inGround:1b}] at @s run execute as @e[type=arrow,scores={portalArrow=2},nbt={inGround:1b}] at @s run kill @s

execute as @e[type=minecraft:armor_stand,name="Orange Portal",limit=1] at @s store result entity @e[type=minecraft:armor_stand,name="Blue Portal",limit=1] Rotation[1] float 1 run data get entity @p Rotation[1]
execute as @e[type=minecraft:armor_stand,name="Blue Portal",limit=1] at @s store result entity @e[type=minecraft:armor_stand,name="Orange Portal",limit=1] Rotation[1] float 1 run data get entity @p Rotation[1]
execute as @e[type=minecraft:armor_stand,name="Orange Portal",limit=1] at @s store result entity @e[type=minecraft:armor_stand,name="Blue Portal",limit=1] Rotation[0] float 1 run data get entity @p Rotation[0]
execute as @e[type=minecraft:armor_stand,name="Blue Portal",limit=1] at @s store result entity @e[type=minecraft:armor_stand,name="Orange Portal",limit=1] Rotation[0] float 1 run data get entity @p Rotation[0]

execute as @e[scores={portalCooldown=0},tag=!portals,tag=!fizzler] at @s anchored eyes positioned ~ ~ ~ if entity @e[type=armor_stand,name="Orange Portal",distance=..1.25,limit=1] run function pg:tptpblue
execute as @e[scores={portalCooldown=0},tag=!portals,tag=!fizzler] at @s anchored eyes positioned ~ ~ ~ if entity @e[type=armor_stand,name="Blue Portal",distance=..1.25,limit=1] run function pg:tptporange

execute as @e[type=armor_stand,tag=portals] at @s if entity @e[scores={portalCooldown=0},name=!"Orange Portal",name=!"Blue Portal",name=!"Da Fizzler",tag=!portals,tag=!fizzler] run scoreboard players set @e[distance=..1.25,scores={portalCooldown=1..}] portalCooldown 15

execute as @e[scores={portalCooldown=1..}] unless entity @e[type=armor_stand,tag=portals,distance=..1.5] run scoreboard players remove @s portalCooldown 1

execute positioned as @e[type=armor_stand,name="Blue Portal"] run particle dust 0.0 0.2 1.0 2 ~ ~ ~ .25 .5 .25 0.2 1
execute positioned as @e[type=armor_stand,name="Orange Portal"] run particle dust 1.0 0.5 0.0 2 ~ ~ ~ .25 .5 .25 0.2 1
