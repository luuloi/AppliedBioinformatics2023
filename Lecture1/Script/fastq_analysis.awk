# fastq_analysis.awk
BEGIN {
    # Initialize variables
    sequence_name = "";
    sequence_data = "";
    quality_data = "";
    total_quality_score = 0;
    sequence_length = 0;
    num_sequences = 0;
    low_quality_threshold = 20;
}

/^@/ {
    # Process sequence header lines
    if (sequence_name != "") {
        # If sequence_name is not empty, it means we've processed a sequence, so calculate its average quality score
        average_quality_score = total_quality_score / sequence_length;

        # Identify sequences with low-quality regions
        low_quality_regions = (average_quality_score < low_quality_threshold) ? "Yes" : "No";

        # Print the analysis for the previous sequence
        print "Sequence:", sequence_name, "Average Quality Score:", average_quality_score, "Low-Quality Regions:", low_quality_regions;

        # Reset variables for the next sequence
        total_quality_score = 0;
        sequence_length = 0;
    }

    # Extract the sequence name from the header
    sequence_name = substr($0, 2);
    next;
}

/^+/ {
    # Skip the quality header line
    next;
}

{
    # Process sequence and quality data lines
    sequence_data = $0;
    quality_data = getline;
    num_sequences++;

    # Calculate the total quality score for the sequence
    for (i = 1; i <= length(quality_data); i++) {
        quality_score = ord(substr(quality_data, i, 1)) - 33;
        total_quality_score += quality_score;
    }

    # Update sequence length
    sequence_length = length(sequence_data);
}

END {
    # Process the last sequence in the file
    if (sequence_name != "") {
        average_quality_score = total_quality_score / sequence_length;
        low_quality_regions = (average_quality_score < low_quality_threshold) ? "Yes" : "No";
        print "Sequence:", sequence_name, "Average Quality Score:", average_quality_score, "Low-Quality Regions:", low_quality_regions;
    }
}
