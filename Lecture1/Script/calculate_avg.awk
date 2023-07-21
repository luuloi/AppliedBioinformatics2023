# calculate_avg.awk
BEGIN {
    # Initialize variables
    total_grades = 0;
    num_students = 0;
}

{
    # Process each record
    name = $1;
    grade = $2;

    # Calculate the total grades and number of students
    total_grades += grade;
    num_students++;

    # Print individual student's grade
    printf "%s: %d\n", name, grade;
}

END {
    # Calculate and print the average grade
    average = total_grades / num_students;
    printf "\nAverage Grade: %.1f\n", average;
}
