//
//  MWTFoodTests.m
//  MacrosWeightTracker
//
//  Created by Yangzi He on 8/20/17.
//  Copyright © 2017 Yangzi He. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "MWTFood.h"

static NSString *const kMWTFoodName = @"testName";
static int const kMWTFoodCalories = 1;
static int const kMWTServingNumber = 2.2;
static int const kMWTCarbGrams = 2;
static int const kMWTProteinGrams = 2;
static int const kMWTFatGrams = 2;
static int const kMWTTotalCarbGrams = 4;
static int const kMWTTotalProteinGrams = 4;
static int const kMWTTotalFatGrams = 4;

@interface MWTFoodTests : XCTestCase

@end

@implementation MWTFoodTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)testInitializers {

    // Given any state

    // When an instance of MWTFood is initialized using init
    MWTFood *food = [[MWTFood alloc] init];

    // Then expect initializers to be chained and init to call MWTFood's designated initializer with empty/zero values
    XCTAssertEqualObjects(food.name, @"");
    XCTAssertEqual(food.calories, 0);
    XCTAssertEqual(food.servingNumber, 0);
    XCTAssertEqual(food.carbGrams, 0);
    XCTAssertEqual(food.proteinGrams, 0);
    XCTAssertEqual(food.fatGrams, 0);
    XCTAssertEqual(food.totalCarbGrams, 0);
    XCTAssertEqual(food.totalProteinGrams, 0);
    XCTAssertEqual(food.totalFatGrams, 0);

    // Given any state

    // When an instance of MWTFood is initialized using the designated initializers
    food = [[MWTFood alloc] initWithName:kMWTFoodName
                                calories:kMWTFoodCalories
                           servingNumber:kMWTServingNumber
                               carbGrams:kMWTCarbGrams
                            proteinGrams:kMWTProteinGrams
                                fatGrams:kMWTFatGrams
                          totalCarbGrams:kMWTTotalCarbGrams
                       totalProteinGrams:kMWTTotalProteinGrams
                           totalFatGrams:kMWTTotalFatGrams];

    // Then expect all of the instance's properties to be set correctly
    XCTAssertEqualObjects(food.name, kMWTFoodName);
    XCTAssertEqual(food.calories, kMWTFoodCalories);
    XCTAssertEqual(food.servingNumber, kMWTServingNumber);
    XCTAssertEqual(food.carbGrams, kMWTCarbGrams);
    XCTAssertEqual(food.proteinGrams, kMWTProteinGrams);
    XCTAssertEqual(food.fatGrams, kMWTFatGrams);
    XCTAssertEqual(food.totalCarbGrams, kMWTTotalCarbGrams);
    XCTAssertEqual(food.totalProteinGrams, kMWTTotalProteinGrams);
    XCTAssertEqual(food.totalFatGrams, kMWTTotalFatGrams);
}



@end
