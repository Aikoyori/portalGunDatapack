execute as @e[type=armor_stand,name="Da Fizzler"] at @s positioned ~ ~1 ~ run scoreboard players set @a[distance=..2,scores={fizzleCooldown=0}] fizzleCooldown 20
execute as @e[type=armor_stand,name="Da Fizzler"] at @s positioned ~ ~1 ~ if entity @a[distance=..2] run function pg:reset_portals
execute as @e[type=armor_stand,name="Da Fizzler"] at @s positioned ~ ~1 ~ run scoreboard players remove @a[distance=2..,scores={fizzleCooldown=1..}] fizzleCooldown 1
execute as @e[type=armor_stand,name="Da Fizzler"] at @s positioned ~ ~1 ~ if entity @e[type=arrow,distance=..2,scores={portalArrow=1..}] run kill @e[type=arrow,scores={portalArrow=1..}]
execute as @e[type=armor_stand,name="Da Fizzler"] at @s positioned ~ ~1 ~ run kill @e[type=item,distance=..2]
execute as @e[type=armor_stand,name="Da Fizzler"] at @s run particle dust .2 .7 .8 2 ~ ~1 ~ .5 .5 .5 0 10

execute as @e[type=armor_stand,name="Da Smol Fizzler"] at @s positioned ~ ~ ~ run scoreboard players set @a[dx=1,dy=2,dz=1,scores={fizzleCooldown=0}] fizzleCooldown 20

execute as @a at @s positioned ~ ~ ~ if entity @e[type=armor_stand,name="Da Smol Fizzler",distance=...5] run function pg:reset_portals
execute as @a at @s positioned ~ ~-1 ~ if entity @e[type=armor_stand,name="Da Smol Fizzler",distance=...5] run function pg:reset_portals

execute as @e[type=arrow,scores={portalArrow=1..}] at @s positioned ~ ~ ~ if entity @e[type=armor_stand,name="Da Smol Fizzler",distance=...65] run kill @s
execute as @e[type=arrow,scores={portalArrow=1..}] at @s positioned ~ ~-1 ~ if entity @e[type=armor_stand,name="Da Smol Fizzler",distance=...65] run kill @s
execute as @e[type=arrow,scores={portalArrow=1..}] at @s positioned ~ ~-2 ~ if entity @e[type=armor_stand,name="Da Smol Fizzler",distance=...65] run kill @s


execute as @a at @s positioned ~ ~ ~ if entity @e[type=armor_stand,name="Da Smol Fizzler",distance=..0.5] run scoreboard players add @s fizzlerUse 1	
execute as @a at @s positioned ~ ~-1 ~ if entity @e[type=armor_stand,name="Da Smol Fizzler",distance=..0.5] run scoreboard players add @s fizzlerUse 1	
execute as @a at @s positioned ~ ~-2 ~ if entity @e[type=armor_stand,name="Da Smol Fizzler",distance=..0.5] run scoreboard players add @s fizzlerUse 1	

execute as @a at @s positioned ~ ~ ~ if entity @e[type=armor_stand,name="Da Smol Fizzler",distance=..0.5] run clear @a[distance=..2] paper{display:{Name:'{"text":"Authority Card"}'}}

execute as @e[type=armor_stand,name="Da Smol Fizzler"] at @s positioned ~ ~ ~ run function pg:delete_the_card
execute as @e[type=armor_stand,name="Da Smol Fizzler"] at @s positioned ~ ~1 ~ run function pg:delete_the_card
execute as @e[type=armor_stand,name="Da Smol Fizzler"] at @s positioned ~ ~2 ~ run function pg:delete_the_card


execute as @a at @s unless entity @e[type=armor_stand,tag=fizzler,distance=..0.5] at @s positioned ~ ~1 ~ run scoreboard players set @s fizzlerUse 0

execute as @a[scores={fizzleCooldown=1..}] if entity @e[type=armor_stand,name="Da Smol Fizzler",distance=0.5..] run scoreboard players remove @s fizzleCooldown 1

execute as @a[scores={fizzlerUse=1}] at @s run playsound minecraft:entity.zombie.infect ambient @a ~ ~ ~ 1 2


execute as @e[type=armor_stand,name="Da Smol Fizzler"] at @s run particle dust .2 .7 .8 2 ~ ~1 ~ 0 .5 0 0 1

execute as @e[type=armor_stand,name="Fizzler Yeeter"] at @s run kill @e[type=armor_stand,distance=...5,name="Da Fizzler"]
execute as @e[type=armor_stand,name="Fizzler Yeeter"] at @s run kill @e[type=armor_stand,distance=...5,name="Da Smol Fizzler"]
execute as @e[type=armor_stand,name="Fizzler Yeeter"] at @s run kill @e[type=armor_stand,distance=...5,name="Fizzler Yeeter"]