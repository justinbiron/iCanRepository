#1
print("")
print("number one:")

name = str(input("Enter your name: "))
reverse_name = name[::-1]
print(reverse_name)


#2
print("")
print("number 2:")

super_cool_list = [1, 1, 4, 5, 5, "j", 9, 9, "k", 3, 1]

def unique_values(original_list):
    new_list = []
    for i in original_list:
        occurences = original_list.count(i)
        if occurences == 1:
            new_list.append(i)
    print(new_list)

unique_values(super_cool_list)


#3
print("")
print("number 3:")

true_list = [3, 0, 0, 0, 5, "y", "y", 7]
false_list1 = [1, 2, "g", "g", 3]
false_list2 = [1, 0, 1, 1]
print(true_list)
print(false_list1)
print(false_list2)

def searching_for_triples(list):
    does_it_have_triples = False
    for i in list:
        index = list.index(i)
        if index <= len(list) - 2:
            if i == list[index + 1] == list[index +2]:
                does_it_have_triples = True
    print(does_it_have_triples)

searching_for_triples(true_list)
searching_for_triples(false_list1)
searching_for_triples(false_list2)


#4
print("")
print("number 4:")

import os
file = open(r"C:\Users\iCan Student\Desktop\coding projects\randomtext.txt")
lines = 0
for line in file:
    if line.strip():
        lines += 1
print(lines)