# sales_analysis.awk
BEGIN {
    # Initialize variables
    max_sales_category = "";
    max_sales_amount = 0;
}

{
    # Process each sale record
    category = $2;
    sale_amount = $3;

    # Calculate the total sales for each category
    sales_by_category[category] += sale_amount;
}

END {
    # Print total sales by category
    print "Sales by Category:";
    for (category in sales_by_category) {
        print "Category: " category ", Total Sales: " sales_by_category[category];

        # Find the category with the highest sales
        if (sales_by_category[category] > max_sales_amount) {
            max_sales_amount = sales_by_category[category];
            max_sales_category = category;
        }
    }

    # Print the category with the highest sales
    print "\nCategory with the Highest Sales:", max_sales_category;
}
