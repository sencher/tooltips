// JavaScript program to sort an array
// of strings based on the given order

// For storing priority of each character
let mp = new Map();

// Custom comparator function for sort
function comp(a, b)
{

    // Loop through the minimum size
    // between two words
    for (let i = 0; i < Math.min(a.length, b.length);i++) {

        // Check if the characters
        // at position i are different,
        // then the word containing lower
        // valued character is smaller
        if (mp.get(a[i]) != mp.get(b[i]))
            return mp.get(b[i]) - mp.get(a[i]);
    }

    /* When loop breaks without returning, it
    means the prefix of both words were same
    till the execution of the loop.
    Now, the word with the smaller size will
    occur before in sorted order
        */
    return (b.length - a.length);
}

// Function to print the
// new sorted array of strings
function printSorted(words,order)
{

    // Mapping each character
    // to its occurrence position
    for (let i = 0; i < order.length; i++)
        mp.set(order[i],i);

    // Sorting with custom sort function
    words.sort(comp);

    // Printing the sorted order of words
    for (let x of words)
        console.log(x +" ");
}

// Driver code
let words = ["word", "world", "row" ];
let order = ["worldabcefghijkmnpqstuvxyz" ];

printSorted(words, order);