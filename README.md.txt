# Task Manager Script

This project is a simple Bash script for managing tasks(a simple todo app). You can add, list, clear, find, and mark tasks as done using this script.

## Features

- Add   : Add a new task to the list.
- List  : List all the tasks you've added.
- Clear : Clear the list of tasks.
- Find  : Find a task by its title.
- Done  : Mark a task as done.

## Usage

### Adding a Task

To add a task, use the following command:

./script.sh add -t "First Task" -p H

by running this command following line is added to the "tasks.csv" file:
0,H,"First Task"

---> 1 | 0     means the task in Done/Undone
---> L | M | H means the priority of the task is Low/Medium/High

-t|--title    is necessary 
-p|--priority is optional (Default value is L)

### Listing Tasks

to List all of the tasks use the following command:

./script.sh List

### Clearing Tasks

to Clear all of the tasks use the following command:

./script.sh Clear

### Find a Task 

to find a task by its Title use the following command:

./script.sh find First   --->   1 | 0 | H | "First Task"

### Do a Task 

to mark a task as Done by its id(line number) use the following command:

./script.sh Done 2

Before:
0,H,"First Task"
0,M,"Second Task"
0,L,"Third Task"

After:
0,H,"First Task"
1,M,"Second Task"
0,L,"Third Task"


### Note

this project is foe personal purposes only and i did it with help of some recourses in order to learn 
i know there is a lot of space to improve and develop the code
i try my best to work on it in the future 
