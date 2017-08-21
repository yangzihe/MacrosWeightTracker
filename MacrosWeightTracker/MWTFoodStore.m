//
//  MWTFoodStore.m
//  MacrosWeightTracker
//
//  Created by Yangzi He on 3/20/17.
//  Copyright © 2017 Yangzi He. All rights reserved.
//

#import "MWTFoodStore.h"
#import "MWTFood.h"

@interface MWTFoodStore ()
@property (nonatomic) NSMutableArray *foods;
@end

@implementation MWTFoodStore

#pragma mark - Initializers

- (instancetype)init {
    if (self = [super init]) {
        _foods = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *)allFoods {
    return [self.foods copy];
}

- (void)addFood:(MWTFood *)food {
    if (food != nil) {
        [self.foods addObject:food];
    }
}

- (void)deleteFood:(MWTFood *)food {
    [self.foods removeObject:food];
}

@end
