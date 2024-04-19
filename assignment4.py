import turtle 
import time
import threading

wn = turtle.Screen()
wn.title("Cookier Clicker")
wn.bgcolor("white") 
wn.register_shape(r"c:\Users\iCan Student\Downloads\cookie.gif")
wn.register_shape(r"c:\Users\iCan Student\Downloads\cursor.gif")
wn.register_shape(r"c:\Users\iCan Student\Downloads\grandma.gif")

clicks = 0
increase_number_clicks = 1
increase_number_time = 0
grannyCostAmount = 25
cursorCostAmount = 10

cookie = turtle.Turtle()
cookie.shape(r"c:\Users\iCan Student\Downloads\cookie.gif")
cookie.speed(0)

cursor = turtle.Turtle()
cursor.shape(r"c:\Users\iCan Student\Downloads\cursor.gif")
cursor.shapesize(3,3,3)
cursor.speed(1000)
cursor.penup()
cursor.goto(400, 0)

granny = turtle.Turtle()
granny.shape(r"c:\Users\iCan Student\Downloads\grandma.gif")
granny.shapesize(3,3,3)
granny.speed(1000)
granny.penup()
granny.goto(-400, 0)

cursorCountText = turtle.Turtle()
cursorCountText.hideturtle()
cursorCountText.color("black")
cursorCountText.penup()
cursorCountText.goto(450, 275)
cursorCountText.write(f"Cursors: {increase_number_clicks - 1}", align ="center", font=("Courier New", 32, "normal"))

cursorCost = turtle.Turtle()
cursorCost.hideturtle()
cursorCost.color("black")
cursorCost.penup()
cursorCost.goto(450, 260)
cursorCost.write(f"Cursor Cost: {cursorCostAmount}", align ="center", font=("Courier New", 16, "normal"))

grannyCountText = turtle.Turtle()
grannyCountText.hideturtle()
grannyCountText.color("black")
grannyCountText.penup()
grannyCountText.goto(-450, 275)
grannyCountText.write(f"Grannies: {increase_number_time}", align ="center", font=("Courier New", 32, "normal"))

grannyCost = turtle.Turtle()
grannyCost.hideturtle()
grannyCost.color("black")
grannyCost.penup()
grannyCost.goto(-450, 260)
grannyCost.write(f"Granny Cost: {grannyCostAmount}", align ="center", font=("Courier New", 16, "normal"))

ya = turtle.Turtle()
ya.hideturtle()
ya.color("black")
ya.penup()
ya.goto(0, 275)
ya.write(f"Cookies: {clicks}", align ="center", font=("Courier New", 32, "normal"))

def clicked(x, y):
    global clicks
    clicks += increase_number_clicks
    ya.clear()
    ya.write(f"Cookies: {clicks}", align ="center", font=("Courier New", 32, "normal"))

def time_bla_bla():
    global increase_number_time
    global clicks
    while True:
        time.sleep(1)
        clicks += increase_number_time
        ya.clear()
        ya.write(f"Cookies: {clicks}", align ="center", font=("Courier New", 32, "normal"))

def cursor_upgrade(x, y):
    global clicks
    global increase_number_clicks
    global cursorCostAmount
    if clicks >= cursorCostAmount:
        clicks -= cursorCostAmount
        cursorCostAmount *= 2
        increase_number_clicks += 1
        cursorCountText.clear()
        cursorCountText.write(f"Cursors: {increase_number_clicks - 1}", align ="center", font=("Courier New", 32, "normal"))
        ya.clear()
        ya.write(f"Cookies: {clicks}", align ="center", font=("Courier New", 32, "normal"))
        cursorCost.clear()
        cursorCost.write(f"Cursor Cost: {cursorCostAmount}", align ="center", font=("Courier New", 16, "normal"))
    else:
        ya.clear()
        ya.write(f"Not enough cookies!", align ="center", font=("Courier New", 32, "normal"))
        time.sleep(1)
        ya.clear()
        ya.write(f"Cookies: {clicks}", align ="center", font=("Courier New", 32, "normal"))
def granny_upgrade(x, y):
    global clicks
    global increase_number_time
    global grannyCostAmount
    if clicks >= grannyCostAmount:
        clicks -= grannyCostAmount
        grannyCostAmount *= 2
        increase_number_time += 1
        grannyCountText.clear()
        grannyCountText.write(f"Grannies: {increase_number_time}", align ="center", font=("Courier New", 32, "normal"))
        ya.clear()
        ya.write(f"Cookies: {clicks}", align ="center", font=("Courier New", 32, "normal"))
        grannyCost.clear()
        grannyCost.write(f"Granny Cost: {grannyCostAmount}", align ="center", font=("Courier New", 16, "normal"))
    else:
        ya.clear()
        ya.write(f"Not enough cookies!", align ="center", font=("Courier New", 32, "normal"))
        time.sleep(1)
        ya.clear()
        ya.write(f"Cookies: {clicks}", align ="center", font=("Courier New", 32, "normal"))

t1 = threading.Thread(target=time_bla_bla, name='t1')
t1.start()
cookie.onclick(clicked)
cursor.onclick(cursor_upgrade)
granny.onclick(granny_upgrade)

wn.mainloop()