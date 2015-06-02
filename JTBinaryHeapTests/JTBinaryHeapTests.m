//
//  JTBinaryHeapTests.m
//  JTBinaryHeap
//
//  Created by Joshua Tessier on 2015-06-02.
//  Copyright (c) 2015 Joshua Tessier. All rights reserved.
//

@import XCTest;

#import "JTBinaryHeap.h"

@interface JTTestObject : NSObject

@property (nonatomic, assign) NSInteger value;

- (NSComparisonResult)compare:(id)object;
@end

@implementation JTTestObject

- (NSComparisonResult)compare:(id)object
{
	NSComparisonResult result = NSOrderedSame;
	if ([object isKindOfClass:[JTTestObject class]]) {
		result = self.value < [(JTTestObject *)object value];
	}
	return result;
}

@end

@interface JTBinaryHeapTests : XCTestCase
@end

@implementation JTBinaryHeapTests {
	JTBinaryHeap *_heap;
}

- (void)setUp
{
	[super setUp];
	
	_heap = [[JTBinaryHeap alloc] init];
}

- (void)testAddingObjects
{
	XCTAssert([_heap isEmpty]);
	XCTAssertEqual(0, [_heap count], @"Heap should be empty upon initialization");
	
	[_heap addValue:@"Banana"];
	
	XCTAssertFalse([_heap isEmpty]);
	XCTAssertEqual(1, [_heap count], @"Heap should now contain one object");
	
	[_heap addValue:@"Dinosaur"];
	
	XCTAssertFalse([_heap isEmpty]);
	XCTAssertEqual(2, [_heap count], @"Heap should now contain one object");
	
	XCTAssert([_heap contains:@"Banana"], @"Should contain 'Banana'");
	XCTAssertFalse([_heap contains:@"banana"], @"Should not contain 'banana'");
}

- (void)testComparison
{
	[_heap addValue:@"Banana"];
	[_heap addValue:@"Dinosaur"];
	
	XCTAssertEqualObjects(@"Banana", [_heap minimumValue], @"Banana should be the minimum value");
	XCTAssertEqualObjects(@"Banana", [_heap extractMinimumValue], @"Banana should still be the minimum value as it shouldn't be removed");
}

- (void)testRemoval
{
	[_heap addValue:@"Banana"];
	XCTAssertFalse([_heap isEmpty]);
	XCTAssertEqualObjects(@"Banana", [_heap extractMinimumValue]);
	XCTAssert([_heap isEmpty]);
	
	[_heap addValue:@"Banana1"];
	[_heap addValue:@"Banana2"];
	[_heap addValue:@"Banana3"];
	[_heap addValue:@"Banana4"];
	[_heap addValue:@"Banana5"];
	[_heap addValue:@"Banana6"];
	
	[_heap removeMinimumValue];
	XCTAssertEqualObjects(@"Banana2", [_heap minimumValue], @"Should now be Banana2");
	
	[_heap removeAllValues];
	XCTAssertTrue([_heap isEmpty]);
}

@end
