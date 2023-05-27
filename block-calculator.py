# Minecraft hollow pyramid block calculator.
# Showing the Kids a basic python program.

width = 0
blocks = 0
height = 0

width = int(input("Set Initial Pyramid Width: "))
while width >= 1:
    blocks += width * 4
    print("Layer:", height, "-- Total Blocks:", blocks, "-- Width:", width)
    width -= 2
    height += 1
print()
print("----- Summary -----") 
print("Total Height:", height)
print("Total Blocks:", blocks)


print("Stacks of Blocks Required:", blocks / 64)