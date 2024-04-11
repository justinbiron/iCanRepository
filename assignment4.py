import turtle 
import time

wn = turtle.Screen()
wn.title("Cookier Clicker")
wn.bgcolor("yellow") 
wn.register_shape(r"c:\Users\iCan Student\Downloads\cookie.gif")
wn.register_shape(r"c:\Users\iCan Student\Downloads\cursor.gif")
wn.register_shape(r"c:\Users\iCan Student\Downloads\grandma.gif")

cookie = turtle.Turtle()
cookie.shape(r"c:\Users\iCan Student\Downloads\cookie.gif")
cookie.speed(0)

cursor = turtle.Turtle()
cursor.shape(r"c:\Users\iCan Student\Downloads\cursor.gif")
cursor.shapesize(3,3,3)
cursor.speed(1000)
cursor.penup()
cursor.goto(400, 170)

granny = turtle.Turtle()
granny.shape(r"c:\Users\iCan Student\Downloads\grandma.gif")
granny.shapesize(3,3,3)
granny.speed(1000)
granny.penup()
granny.goto(-400, -170)

clicks = 0

ya = turtle.Turtle()
ya.hideturtle()
ya.color("white")
ya.penup()
ya.goto(0, -235)
ya.write(f"Clicks: {clicks}", align ="center", font=("Courier New", 32, "normal"))

increase_number_clicks = 1
increase_number_time = 0

def clicked(x, y):
    global clicks
    clicks += increase_number_clicks
    ya.clear()
    ya.write(f"Clicks: {clicks}", align ="center", font=("Courier New", 32, "normal"))

def cursor_upgrade(x, y):
    global clicks
    global increase_number_clicks
    if clicks >= 50:
        clicks -= 50
        increase_number_clicks += 1
        ya.clear()
        ya.write(f"Clicks: {clicks}", align ="center", font=("Courier New", 32, "normal"))

def time_bla_bla():
    global increase_number_time
    global clicks
    while True:
        time.sleep(1)
        clicks += increase_number_time

def granny_upgrade():
    global clicks
    global increase_number_time
    if clicks >= 3:
        clicks -= 100
        increase_number_time = 1

time_bla_bla()
cookie.onclick(clicked)
cursor.onclick(cursor_upgrade)
granny.onclick(granny_upgrade)

wn.mainloop()


