# high_scores.awk
BEGIN {
    # Initialize variables
    total_high_scores = 0;
    num_high_scores = 0;
}

{
    # Process each record
    name = $1;
    score = $2;

    # Check if the score is above the threshold (e.g., 80)
    if (score > 80) {
        # Calculate the total scores and number of high-scoring students
        total_high_scores += score;
        num_high_scores++;

        # Print high-scoring student's name and score
        printf "%s: %d\n", name, score;
    }
}

END {
    if (num_high_scores > 0) {
        # Calculate and print the average score for high-scoring students
        average_high_score = total_high_scores / num_high_scores;
        printf "\nAverage Score for High-Scoring Students: %.1f\n", average_high_score;
    } else {
        print "\nNo high-scoring students found.";
    }
}
