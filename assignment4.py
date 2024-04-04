import turtle 
wn = turtle.Screen()
wn.title("Cookier Clicker")
wn.bgcolor("yellow") 
wn.register_shape(r"c:\Users\iCan Student\Downloads\cookie.gif")

cookie = turtle.Turtle()
cookie.shape(r"c:\Users\iCan Student\Downloads\cookie.gif")
cookie.speed(0)

clicks = 0
ya = turtle.Turtle()
ya.hideturtle()
ya.color("white")
ya.penup()
ya.goto(0, -235)
ya.write(f"Clicks: {clicks}", align ="center", font=("Courier New", 32, "normal"))

def clicked(x, y):
    global clicks
    clicks += 1
    ya.clear()
    ya.write(f"Clicks: {clicks}", align ="center", font=("Courier New", 32, "normal"))

cookie.onclick(clicked)

wn.mainloop()