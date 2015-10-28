# DataSequence

`DataSequence` is a [Processing](http://processing.org) class for pulling a series of values from a CSV file. It can be used within your sketch the same way `random()` can, but instead of random values, your code will be driven by the data you specify.

To use `DataSequence`, [download the DataSequence.pde](https://raw.githubusercontent.com/kadamwhite/processing-data-sequence/master/DataSequence.pde) file to your computer, and add it to your project with the  
*Sketch* &rarr; *Add File* menu option in the Processing editor.

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
  
  // What is the lowest value in the sequence?
  println( seq.minVal() ); // prints ""
  println( seq.maxVal() ); // prints ""
  
