//
//  MWTFood.h
//  MacrosWeightTracker
//
//  Created by Yangzi He on 3/20/17.
//  Copyright © 2017 Yangzi He. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MWTFood : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *uid;
@property (nonatomic) int calories;
@property (nonatomic) double servingNumber;
@property (nonatomic) int carbGrams;
@property (nonatomic) int proteinGrams;
@property (nonatomic) int fatGrams;
@property (nonatomic) int totalCarbGrams;
@property (nonatomic) int totalProteinGrams;
@property (nonatomic) int totalFatGrams;
@property (nonatomic) BOOL seen;

- (instancetype)initWithName:(NSString *)name
                    calories:(int)calories
               servingNumber:(double)servingNumber
                   carbGrams:(int)carbGrams
                proteinGrams:(int)proteinGrams
                    fatGrams:(int)fatGrams
              totalCarbGrams:(int)totalCarbGrams
           totalProteinGrams:(int)totalProteinGrams
               totalFatGrams:(int)totalFatGrams NS_DESIGNATED_INITIALIZER;
@end
