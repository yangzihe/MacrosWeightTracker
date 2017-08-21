//
//  MWTFood.m
//  MacrosWeightTracker
//
//  Created by Yangzi He on 3/20/17.
//  Copyright © 2017 Yangzi He. All rights reserved.
//

#import "MWTFood.h"

@implementation MWTFood

#pragma mark - Initializers

- (instancetype)initWithName:(NSString *)name
                    calories:(int)calories
               servingNumber:(double)servingNumber
                   carbGrams:(int)carbGrams
                proteinGrams:(int)proteinGrams
                    fatGrams:(int)fatGrams
              totalCarbGrams:(int)totalCarbGrams
           totalProteinGrams:(int)totalProteinGrams
               totalFatGrams:(int)totalFatGrams{
    if (self = [super init]) {
        _name = [name copy];
        _uid = [[NSUUID UUID] UUIDString];
        _calories = calories;
        _servingNumber = servingNumber;
        _carbGrams = carbGrams;
        _proteinGrams = proteinGrams;
        _fatGrams = fatGrams;
        _totalCarbGrams = totalCarbGrams;
        _totalProteinGrams = totalProteinGrams;
        _totalFatGrams = totalFatGrams;
        _seen = NO;
    }
    return self;
}

- (instancetype)init {
    return [self initWithName:@""
                     calories:0
                servingNumber:0
                    carbGrams:0
                 proteinGrams:0
                     fatGrams:0
               totalCarbGrams:0
            totalProteinGrams:0
                totalFatGrams:0];
}

@end
