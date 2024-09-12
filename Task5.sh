#!/bin/bash

# Set the file name for the to-do list
todo_file="todo.txt"

# Function to add a task
add_task() {
  echo "Enter a new task:"
  read -r task
  echo "$task" >> "$todo_file"
  echo "Task added: $task"
}

# Function to view tasks
view_tasks() {
  echo "To-Do List:"
  cat "$todo_file"
}

# Function to remove a task
remove_task() {
  echo "Enter the task number to remove:"
  read -r task_number
  sed -i "${task_number}d" "$todo_file"
  echo "Task removed"
}

# Main menu
while true; do
  echo "To-Do List Menu:"
  echo "1. Add task"
  echo "2. View tasks"
  echo "3. Remove task"
  echo "4. Quit"
  read -r choice

  case $choice in
    1) add_task ;;
    2) view_tasks ;;
    3) remove_task ;;
    4) exit 0 ;;
    *) echo "Invalid choice" ;;
  esac
done