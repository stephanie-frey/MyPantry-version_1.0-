//
//  ViewController.h
//  MyPantry(version_1.0)
//
//  Created by Stephanie Frey on 2/19/19.
//  Copyright © 2019 Stephanie Frey. All rights reserved.
//

#import <UIKit/UIKit.h>
NSArray *recipes;
NSArray *ID;
NSArray *images;
NSArray *allIngredients;
NSArray *allIngredients2;

NSArray *missed;
NSArray *used;

NSMutableArray *instructions;
Boolean instructionsProvided;

@interface ViewController : UIViewController

+ (void) start2;

@end

