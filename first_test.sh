#!/bin/bash

# Prompt for the number
echo "Enter a number to generate its multiplication table: "
read number

# Validate if input is a number
if ! [[ "$number" =~ ^[0-9]+$ ]]; then
    echo "Error: Please enter a valid number"
    exit 1
fi

# Ask for table preference
echo "Would you like to see:"
echo "1. Full multiplication table (1-10)"
echo "2. Partial table (custom range)"
read choice

case $choice in
    1)
        echo "Multiplication table for $number (1-10):"
        echo "--------------------------------"
        for i in {1..10}; do
            printf "%d x %d = %d\n" $number $i $((number * i))
        done
        ;;
    2)
        # Get custom range
        echo "Enter starting number: "
        read start
        echo "Enter ending number: "
        read end

        # Validate range inputs
        if ! [[ "$start" =~ ^[0-9]+$ ]] || ! [[ "$end" =~ ^[0-9]+$ ]]; then
            echo "Error: Please enter valid numbers for the range"
            exit 1
        fi

        if [ $start -gt $end ]; then
            echo "Error: Starting number should be less than ending number"
            exit 1
        fi

        echo "Multiplication table for $number ($start-$end):"
        echo "--------------------------------"
        for (( i=start; i<=end; i++ )); do
            printf "%d x %d = %d\n" $number $i $((number * i))
        done
        ;;
    *)
        echo "Invalid choice. Please run the script again and select 1 or 2."
        exit 1
        ;;
esac