# string_manipulation.awk
BEGIN {
    # Initialize variables
    num_names = 0;
}

{
    # Process each name
    names[num_names++] = $0;
}

END {
    # 1. Print original names
    print "1. Original Names:";
    for (i = 0; i < num_names; i++) {
        print names[i];
    }
    print "";

    # 2. Print number of names
    print "2. Number of Names:", num_names;
    print "";

    # 3. Print reversed names
    print "3. Reversed Names:";
    for (i = 0; i < num_names; i++) {
        print reverseString(names[i]);
    }
    print "";

    # 4. Print uppercase names
    print "4. Uppercase Names:";
    for (i = 0; i < num_names; i++) {
        print toupper(names[i]);
    }
}

function reverseString(str) {
    # Function to reverse a string
    len = length(str);
    reversed_str = "";
    for (i = len; i >= 1; i--) {
        reversed_str = reversed_str substr(str, i, 1);
    }
    return reversed_str;
}
