//
//  JTBinaryHeap.m
//  JTBinaryHeap
//
//  Created by Joshua Tessier on 2015-06-02.
//  Copyright (c) 2015 Joshua Tessier. All rights reserved.
//

#import "JTBinaryHeap.h"

static const void *binary_heap_retain(CFAllocatorRef allocator, const void *ptr);
static void binary_heap_release(CFAllocatorRef allocator, const void *ptr);
static CFStringRef binary_heap_copy_description(const void *ptr);
static CFComparisonResult binary_heap_compare(const void *ptr1, const void *ptr2, void *context);

static CFBinaryHeapCallBacks callbacks = {
	0,
	&binary_heap_retain,
	&binary_heap_release,
	&binary_heap_copy_description,
	&binary_heap_compare
};

@implementation JTBinaryHeap {
	CFBinaryHeapRef _heap;
}

- (instancetype)init
{
	self = [super init];
	if (self) {
		_heap = CFBinaryHeapCreate(kCFAllocatorDefault, 0, &callbacks, NULL);
	}
	return self;
}

- (void)dealloc
{
	CFRelease(_heap);
}

- (NSUInteger)count
{
	return CFBinaryHeapGetCount(_heap);
}

- (BOOL)isEmpty
{
	return [self count] == 0;
}

- (void)addValue:(id)object
{
	CFBinaryHeapAddValue(_heap, (__bridge const void *)object);
}

- (BOOL)contains:(id)object
{
	return CFBinaryHeapContainsValue(_heap, (__bridge const void *)object);
}

- (id)minimumValue
{
	return CFBinaryHeapGetMinimum(_heap);
}

- (void)removeMinimumValue
{
	CFBinaryHeapRemoveMinimumValue(_heap);
}

- (id)extractMinimumValue
{
	id value = [self minimumValue];
	if (value) {
		[self removeMinimumValue];
	}
	return value;
}

- (void)removeAllValues
{
	CFBinaryHeapRemoveAllValues(_heap);
}

@end

#pragma mark - Binary Heap Methods

static const void *binary_heap_retain(CFAllocatorRef allocator, const void *ptr) {
	if (ptr) {
		CFRetain(ptr);
	}
	return ptr;
}

static void binary_heap_release(CFAllocatorRef allocator, const void *ptr) {
	if (ptr) {
		CFRelease(ptr);
	}
}

static CFStringRef binary_heap_copy_description(const void *ptr) {
	return ptr ? CFCopyDescription(ptr) : nil;
}

static CFComparisonResult binary_heap_compare(const void *ptr1, const void *ptr2, void *context) {
	id objectA = (__bridge id)ptr1;
	id objectB = (__bridge id)ptr2;
	if ([objectA respondsToSelector:@selector(compare:)]) {
		return (CFComparisonResult)[objectA compare:objectB];
	}
	return kCFCompareEqualTo;
}
