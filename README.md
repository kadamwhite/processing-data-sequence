# DataSequence

`DataSequence` is a [Processing](http://processing.org) class for pulling a series of values from a CSV file. It can be used within your sketch the same way `random()` can, but instead of random values, your code will be driven by the data you specify.

## Installation

To use `DataSequence`, [download the DataSequence.pde](https://raw.githubusercontent.com/kadamwhite/processing-data-sequence/master/DataSequence.pde) file to your computer, and add it to your project with the  
*Sketch* &rarr; *Add File* menu option in the Processing editor.

## Usage

Next, use the *Add File* menu again to add a CSV file to your project; we're going to assume you added a file called `people.csv` in the below example. Let's assume `people.csv` looks like this:

Person | Age | Birth Date
--- | --- | ---
Hopper | 85 | 1906
King | 36 | 1852
Lamarr | 85 | 1914
Perlman | 63 | 1951

To create a `DataSequence` object, first load your table, then create a `new DataSequence`, specifying which column of data you want. Looking at our data, let's use the Birth Date column.
```pde
Table people;

void setup() {
  // First, we need to load the data from that CSV file, so
  // that Processing can use the information inside it. Our
  // data has a header row so we specify the "header" option:
  people = loadTable( "people.csv", "header" );
  
  // Now, we create our data sequence "seq", passing it the Table
  // we created, and the name of the column we want to use:
  DataSequence seq = new DataSequence( people, "Birth Date" );
}
```

Now that `seq` has been created, let's look at what we can do with it.

```pde
  // ...
  DataSequence seq = new DataSequence( people, "Birth Date" );
  
  // What are the lowest and highest values in the sequence?
  println( seq.minVal() ); // prints "1852.0"
  println( seq.maxVal() ); // prints "1951.0"
  
  // Get a series of values from the sequence
  println( seq.next() ); // prints "1906.0"
  println( seq.next() ); // prints "1852.0"
  println( seq.next() ); // prints "1914.0"
  println( seq.next() ); // prints "1951.0"
  println( seq.next() ); // prints "1906.0"
  println( seq.next() ); // prints "1852.0"
  println( seq.next() ); // prints "1914.0"
  println( seq.next() ); // prints "1951.0"
}
```
There are only four rows in our table, so once you have called `.next()` four times, it begins to repeat the values. It will continue repeating as many times as you call `.next()`, so this can be used in code that runs very often, like the `draw` function, and the data sequence will never "run out" of values.

You'll notice all the values are converted to floats; that is intentional. If you need them as integers, convert them with `int()`.

It is nice to be able to get values directly from the table, but often you might want to [map](https://processing.org/reference/map_.html) those values to another output range—maybe we don't care that these values range from 1852 to 1951, for example, and instead want our values to be between 0 and 100. `.mapNext` lets us specify the minimum and maximum value of the output range:

```pde
  println( seq.mapNext( 0, 100 ) ); // prints "54.545456"
  println( seq.mapNext( 0, 100 ) ); // prints "0.0"
  println( seq.mapNext( 0, 100 ) ); // prints "62.62626"
  println( seq.mapNext( 0, 100 ) ); // prints "100.0"
  println( seq.mapNext( 0, 100 ) ); // prints "54.545456"
  println( seq.mapNext( 0, 100 ) ); // prints "0.0"
  println( seq.mapNext( 0, 100 ) ); // prints "62.62626"
  println( seq.mapNext( 0, 100 ) ); // prints "100.0"
```

Just as before, the sequence of values repeats—but this time, 1852 (the minimum value) is mapped to 0; 1951 (the maximum value) is mapped to 100; and 1906 and 1914 are mapped to approximately 54 and 62, respectively. Customizing the output range allows the numbers from the sequence to be used more flexibly. For example, if you wanted to set the line stroke to a greyscale color value (a range from 0 to 255), you can use `stroke( seq.mapNext(0, 255) );`.

## Questions? Issues?

If you use this in your sketch and it does not work as you would expect, please [let me know](https://github.com/kadamwhite/processing-data-sequence/issues) by opening an issue! I'd love to help make this a more useful tool.

## Dedication

*For Emily, so you can use it in all your projects. Thank you for everything, especially the wolfscarf :)*
