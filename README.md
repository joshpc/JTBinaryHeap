# JTBinaryHeap

A simple Objective-C wrapper for CFBinaryHeap for use in both Objective-C/Swift projects. This is effectively a min-heap.

## Usage

1. Import the data structure `#import "JTBinaryHeap"`
2. Add items to it using `addValue:`
3. Use `minimumValue` or `extractMinimumValue` to get the smallest value in the min-heap.

```
JTBinaryHeap *heap = [[JTBinaryHeap alloc] init];
[heap addValue:@"Banana"];
[heap addValue:@"Dinosaur"];
NSString *minimumValue = [heap minimumValue]; //will be @"Banana"
```

## Swift Notes

1. Import the data structure `import JTBinaryHeap` into your swift files
2. Add items using `addValue(...)`
3. Use `minimumValue` or `extractMinimumValue` to get the smallest value in the min-heap.

```
var heap = JTBinaryHeap()
heap.addValue("Banana")
heap.addValue("Dinosaur")
let minimumValue = head.minimumValue()
```
