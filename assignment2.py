#1
print("Question #1:")
a = int(input("Enter a number: "))
b = int(input("Enter an exponent: "))

c = 1

for o in range(b):
    c = c * a

print(c)
print("")
    
#2
print("Question #2:")
y = [1, 2, 3, 4, 5]
x = 1

for c in y:
    print(c * x)
    x = x * 10 + 1

print("")

#3
print("Question #3:")
def h():
    u = int(input("Enter a number: "))
    l = int(input("Enter another number: "))
    m = l - u + 1
    z = u - l + 1

    if l > u:
        for i in range(m):
            print(u)
            u += 1
    elif u > l:
        for i in range(z):
            print(u)
            u -= 1

h()
print("")

#4
print("Question #4:")
def it_is_a_prime_number(a):
    #all of these cases would mean that it isn't a prime number so it returns False
    if a <= 1:
        return False
    for i in range(2, int(a ** 0.5)+1):
        if a % i == 0:
            return False
    #if the number is not less than or equal to 1 AND it can't have a remainder of 0 by dividing by another number,
    #it is a prime number and will return True
    return True

def s():
    a = int(input("Enter a numer: "))
    b = int(input("Enter another number: "))
    
    if a > b:
        r = range(b, a)
    elif b > a:
        r = range(a, b)

    for w in r:
        if it_is_a_prime_number(w):
            print(w)

s()
print("")

#5
print("Question #5:")

def factorial(number):
    a = 1
    b = range(1, (number+1))

    for i in b:
        a = a * i
    
    print(a)
#now we run it:
number = int(input("Enter a number: "))
factorial(number)
