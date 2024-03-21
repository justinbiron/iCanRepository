#1
print("number one:")

name = str(input("Enter your name: "))
reverse_name = name[::-1]
print(reverse_name)


print("")
# 2
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


print("")
#3
print("number 3:")

true_list = [3, 0, 0, 0, 5, "y", "y", 7]
false_list1 = [1, 2, "g", "g", 3]
false_list2 = [1, 0, 1, 1]
print(even_cooler_list1)
print(even_cooler_list2)
print(even_cooler_list3)

def searching_for_triples(list):
    does_it_have_triples = False
    length = list.len()
    for i in list:
        index = list.index(i)
        if index > 2 and index :
            if (list.index(index) == list.index(index-1) and list.index(index-2)) or (list.index(index) == list.index(index+1) and list.index(index+2)):
                does_it_have_triples = True
        elif index
    print(does_it_have_triples)

searching_for_triples(even_cooler_list1)
searching_for_triples(even_cooler_list2)
searching_for_triples(even_cooler_list3)

print("")
#4
