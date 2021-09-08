# Python program to convert decimal to binary and vice versa

#To run this code, type into command line: python3 timetablemaths.py

import string
import sys
import os
import math

# Function to convert Decimal number
# to Binary number
def decimalToBinary(n):
    return bin(n).replace("0b", "")


# Function to convert
# binary to decimal
def binaryToDecimal(n):
    num = n;
    dec_value = 0;
    base1 = 1;
    len1 = len(num);
    for i in range(len1 - 1, -1, -1):
        if (num[i] == '1'):    
            dec_value += base1;
        base1 = base1 * 2;
    return dec_value;

#Function to calculate the time in hours in binary
def hourCalc():
    t_start = int(input("When does the class start (in 24 hour time but for 30mins make it 50 for easy maths please): "))
    t_end = int(input("When does the class end (in 24 hour time but for 30mins make it 50 for easy maths please): "))
    original_start = 2350
    original_end = 0
    hour_array = []
    counting = False
    while original_start > original_end:
        if original_start > t_end and counting == False:
            hour_array.append('0')
            print("A:0")
        elif original_start == t_end and counting == False:
            hour_array.append('1')
            counting = True
            print("B:0")
        elif original_start > t_start and counting == True:
            hour_array.append('1')
            print("C:1")
        elif original_start == t_start and counting == True:
            counting = False
            hour_array.append('0')
            print("D:1")
        elif original_start < t_start and counting == False :
            hour_array.append('0')
            print("E:0")
        original_start -= 50
        print("original_start: " + str(original_start))

    hour_result = "".join(hour_array)
    print("HOURS = " + str(hour_result))
    final_hour = binaryToDecimal(hour_result)
    return final_hour


# Driver code
if __name__ == '__main__':
    name = input("class_name: ")
    subject = input("subject: ")
    code = input("class_code: ")
    class_nbr = input("class_nbr: ")
    class_type = input("class_type: ")
    size = input("size: ")
    available = input("available: ")
    colour = input("colour (in hex): ")
    term = input("term: ")
    location = input("location: ")

    print("\nWhich weeks does this class run? Answer in lowercase y/n.")
    weeks = []
    if term == "S1":
        week1 = input("Week 1? ")
        weeks.append(week1)
        week2 = input("Week 2? ")
        weeks.append(week2)
        week3 = input("Week 3? ")
        weeks.append(week3)
        week4 = input("Week 4? ")
        weeks.append(week4)
        week5 = input("Week 5? ")
        weeks.append(week5)
        week6 = input("Week 6? ")
        weeks.append(week6)
        weeks.append('n')
        weeks.append('n')
        week7 = input("Week 7? ")
        weeks.append(week7)
        week8 = input("Week 8? ")
        weeks.append(week8)
        week9 = input("Week 9? ")
        weeks.append(week9)
        week10 = input("Week 10? ")
        weeks.append(week10)
        week11 = input("Week 11? ")
        weeks.append(week11)
        week12 = input("Week 12? ")
        weeks.append(week12)
        week13 = input("Week 13? ")
        weeks.append(week13)
    elif term == "S2":
        week1 = input("Week 1? ")
        weeks.append(week1)
        week2 = input("Week 2? ")
        weeks.append(week2)
        week3 = input("Week 3? ")
        weeks.append(week3)
        week4 = input("Week 4? ")
        weeks.append(week4)
        week5 = input("Week 5? ")
        weeks.append(week5)
        week6 = input("Week 6? ")
        weeks.append(week6)
        week7 = input("Week 7? ")
        weeks.append(week7)
        week8 = input("Week 8? ")
        weeks.append(week8)
        weeks.append('n')
        weeks.append('n')
        week9 = input("Week 9? ")
        weeks.append(week9)
        week10 = input("Week 10? ")
        weeks.append(week10)
        week11 = input("Week 11? ")
        weeks.append(week11)
        week12 = input("Week 12? ")
        weeks.append(week12)
        week13 = input("Week 13? ")
        weeks.append(week13)

    weeks_array = []
    hamming_weight = 0
    for i in weeks:
        if i == 'y':
            weeks_array.append('1')
            hamming_weight += 1
        elif i == 'n':
            weeks_array.append('0')

    weeks_result = "".join(weeks_array)
    print("WEEKS = " + str(weeks_result[::-1]) + " hamming_weight: " + str(hamming_weight))
    final_weeks = binaryToDecimal(weeks_result[::-1])

    print("\nWhich days does this class run? Answer in lowercase y/n.")
    days = []
    mon = input("Monday? ")
    days.append(mon)
    tue = input("Tuesday? ")
    days.append(tue)
    wed = input("Wednesday? ")
    days.append(wed)
    thu = input("Thursday? ")
    days.append(thu)
    fri = input("Friday? ")
    days.append(fri)
    sat = input("Saturday? ")
    days.append(sat)
    sun = input("Sunday? ")
    days.append(sun)


    days_array = []
    for i in days:
        if i == 'y':
            days_array.append('1')
        elif i == 'n':
            days_array.append('0')

    days_result = "".join(days_array)
    print("DAYS = " + str(days_result[::-1]))
    final_days = binaryToDecimal(days_result[::-1])

    print("Calculating hours here.\n")
    hours = hourCalc()

    print('["'+str(name)+'", "'+str(subject)+'", "'+str(code)+'", "'
        +str(class_nbr)+'", "'+str(class_type)+'", "'+str(size)+'", "'
        +str(available)+'", "'+str(colour)+'", "'+str(term)+'", "'
        +str(final_weeks)+'", "'+str(final_days)+'", "'+str(hours)+
        '", "'+str(location)+'", "'+str(hamming_weight)+'"]')
    

