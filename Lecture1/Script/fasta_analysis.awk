# fasta_analysis.awk
BEGIN {
    # Initialize variables
    total_length = 0;
    max_length = 0;
    max_length_sequence = "";
    num_sequences = 0;
}

/^>/ {
    # Process sequence header lines
    sequence_name = substr($0, 2);  # Remove the ">" symbol from the header
}

!/^>/ {
    # Process sequence lines
    sequence_length = length($0);

    # Calculate the total length and find the sequence with the highest length
    total_length += sequence_length;
    if (sequence_length > max_length) {
        max_length = sequence_length;
        max_length_sequence = sequence_name;
    }

    # Increment the number of sequences
    num_sequences++;
}

END {
    # Print sequence lengths
    print "Sequence Lengths:";
    for (sequence in sequence_lengths) {
        print sequence ": " sequence_lengths[sequence];
    }

    # Print the sequence with the highest length
    print "\nSequence with the Highest Length:", max_length_sequence;

    # Calculate and print the average sequence length
    average_length = total_length / num_sequences;
    printf "\nAverage Sequence Length: %.4f\n", average_length;
}
