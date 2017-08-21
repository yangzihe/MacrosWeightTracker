//
//  MWTFoodStoreTests.m
//  MacrosWeightTracker
//
//  Created by Yangzi He on 8/20/17.
//  Copyright © 2017 Yangzi He. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "MWTFoodStore.h"
#import "MWTFood.h"

@interface MWTFoodStoreTests : XCTestCase
@property (nonatomic, strong) MWTFoodStore *testFoodStore;
@end

@implementation MWTFoodStoreTests

- (void)setUp {
    [super setUp];

    self.testFoodStore = [[MWTFoodStore alloc] init];
}

- (void)testAllFoodsWithEmptyArray {
    // Given a store that doesn't contain any food

    // When we get the number of elements in the store
    int numFoods = (int)[[self.testFoodStore allFoods] count];

    // Then expect elements in the array to be 0
    XCTAssertEqual(numFoods, 0);

}

- (void)testAllFoodsWithNonEmptyArray {
    // Given a store that contains two foods
    MWTFood *firstFood = [[MWTFood alloc] init];
    MWTFood *secondFood = [[MWTFood alloc] init];
    [self.testFoodStore addFood:firstFood];
    [self.testFoodStore addFood:secondFood];

    // When we get the number of elements in the store
    int numFoods = (int)[[self.testFoodStore allFoods] count];

    // Then expect elements in the array to be 2
    XCTAssertEqual(numFoods, 2);
}

- (void)testAddFoodWithNil {
    // Given any state

    // When addFood: is called with a nil argument
    [self.testFoodStore addFood:nil];

    // Then expect the food store to have the same state
    XCTAssertEqual([[self.testFoodStore allFoods] count], 0);
}

- (void)testAddFoodWithFood {
    // Given any state

    // When addFood: is called with a MWTFood object
    MWTFood *food = [[MWTFood alloc] initWithName:@"test"
                                         calories:1
                                    servingNumber:2.22
                                        carbGrams:1
                                     proteinGrams:1
                                         fatGrams:1
                                   totalCarbGrams:1
                                totalProteinGrams:1
                                    totalFatGrams:1];

    [self.testFoodStore addFood:food];

    // Then expect the food store to contain the food that was just added
    XCTAssertTrue([[self.testFoodStore allFoods] containsObject:food]);
}

- (void)testDeleteFoodWithNil {
    // Given any state

    // When we call deleteFood: with nil argument
    [self.testFoodStore deleteFood:nil];

    // Then expect food store state to remain the same
    XCTAssertEqual([[self.testFoodStore allFoods] count], 0);
}

- (void)testDeleteFoodWithFoodNotInArray {
    // Given any state

    // When we call deleteFood: with food not in the store
    MWTFood *containedFood = [[MWTFood alloc] initWithName:@"containedFood"
                                         calories:0
                                    servingNumber:1.11
                                        carbGrams:2
                                     proteinGrams:2
                                         fatGrams:2
                                   totalCarbGrams:3
                                totalProteinGrams:1
                                    totalFatGrams:1];

    MWTFood *uncontainedFood = [[MWTFood alloc] initWithName:@"uncontainedFood"
                                         calories:0
                                    servingNumber:1.11
                                        carbGrams:2
                                     proteinGrams:2
                                         fatGrams:2
                                   totalCarbGrams:3
                                totalProteinGrams:1
                                    totalFatGrams:1];

    [self.testFoodStore addFood:containedFood];
    [self.testFoodStore deleteFood:uncontainedFood];

    // Then expect food store state to remain the same
    XCTAssertEqual([[self.testFoodStore allFoods] count], 1);
}

- (void)testDeleteFoodWithFoodInArray {
    // Given a food store that contains food

    // When we call deleteFood: with food in the store
    MWTFood *food = [[MWTFood alloc] initWithName:@"test"
                                         calories:1
                                    servingNumber:2.22
                                        carbGrams:1
                                     proteinGrams:1
                                         fatGrams:1
                                   totalCarbGrams:1
                                totalProteinGrams:1
                                    totalFatGrams:1];

    [self.testFoodStore addFood:food];
    [self.testFoodStore deleteFood:food];

    // Then expect food store to remove it from array
    XCTAssertEqual([[self.testFoodStore allFoods] count], 0);
}

@end
