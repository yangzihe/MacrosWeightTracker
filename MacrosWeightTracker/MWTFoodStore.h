//
//  MWTFoodStore.h
//  MacrosWeightTracker
//
//  Created by Yangzi He on 3/20/17.
//  Copyright © 2017 Yangzi He. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MWTFood;

@interface MWTFoodStore : NSObject
- (NSArray *)allFoods;
- (void)addFood:(MWTFood *)food;
- (void)deleteFood:(MWTFood *)food;
@end
