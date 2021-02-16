function pg:portals_check
function pg:fizzler_clear
scoreboard players add @a join 0
scoreboard players add @e portalCooldown 0
scoreboard players add @e portalArrow 0
scoreboard players add @e fizzleCooldown 0
scoreboard players add @e fizzlerUse 0

execute as @e[type=phantom,name="Fizzler"]
tag @a[scores={join=0},tag=!returning] add returning
scoreboard players set @a[scores={join=1..}] join 0
team join noCollision @e[name="Blue Portal"]
team join noCollision @e[name="Orange Portal"]