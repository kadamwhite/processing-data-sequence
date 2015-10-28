class DataSequence {
  float[] values;
  int current;

  DataSequence( Table dataTable, String columnName ) {
    values = new float[ dataTable.getRowCount() ];
    for ( int i = 0; i < dataTable.getRowCount(); i++ ) {
      values[ i ] = dataTable.getFloat( i, columnName );
    }
    current = 0;
  }

  float next() {
    if ( current + 1 >= values.length ) {
      current = 0;
    } else {
      current++;
    }
    return values[ current ];
  }

  float mapNext( float min, float max ) {
    return map( this.next(), this.minVal(), this.maxVal(), min, max );
  }

  float minVal() {
    return min( values );
  }

  float maxVal() {
    return max( values );
  }
}
