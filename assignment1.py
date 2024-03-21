a = float(input("enter a number: "))
c = input("enter an operator (*, /, +, -): ")
b = float(input("enter a nuber: "))
d = 0

if c == "*":
    d = a * b
elif c == "/":
    if b == 0:
        print("error! are you fucking dumb? you can't divide by zero")
    else:
        d = a / b
elif c == "+":
    d = a + b
elif c == "-":
    d = a - b
else:
    print("error! follow the fucking instructions")

print(d)

a = float(input("enter a number: "))
b = float(input("enter a nuber: "))

c = a % b

if c == 0:
    print("these numbers can be evenly divided")
else:
    print("these numbers cannot be evenly divided")
