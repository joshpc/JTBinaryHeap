//
//  JTBinaryHeap.h
//  JTBinaryHeap
//
//  Created by Joshua Tessier on 2015-06-02.
//  Copyright (c) 2015 Joshua Tessier. All rights reserved.
//

@import Foundation;

/**
 * A basic Objective-C Wrapper for CFBinaryHeap. This is a min-heap.
 *
 * For binary_heap_compare to properly function, this expects that the objects added to the heap implement
 *
 * `- (CFComparisonResult)compare:(id)object`
 *
 * It is undefined behaviour to add objects that can't compare against each other (they'll likely just end up all being equal so
 * won't provide much value any way...)
 *
 * To use this with swift, add '#import JTBinaryHeap.h' to your bridging header.
 *
 */
@interface JTBinaryHeap : NSObject

@property (readonly) NSUInteger count;

/**
 * Convenience method. YES if the heap has no objects.
 */
- (BOOL)isEmpty;

/**
 * Adds a value to the heap.
 */
- (void)addValue:(id)object;

/**
 * Verifies if a given object is within the heap.
 */
- (BOOL)contains:(id)object;

/**
 * Returns the smallest object in the heap (or one of them, if they have the same values), or nil if there are none.
 * This does not remove anything from the heap.
 */
- (id)minimumValue;

/**
 * Removes the smallest object in the heap.
 */
- (void)removeMinimumValue;

/**
 * Convenience Method. Returns the smallest object in the heap, exactly like `minimumValue` but also removes it from the heap.
 */
- (id)extractMinimumValue;

/**
 * Removes all values from the heap.
 */
- (void)removeAllValues;

@end
