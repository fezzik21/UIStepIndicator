//
//  UIStepIndicator.h
//  StepIndicator
//
//  Created by Adam Hunter on 10/28/14.
//  Copyright (c) 2014 None. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIStepIndicator : UIView

+ (UIStepIndicator *)stepIndicatorWithFrame:(CGRect)frame
                                   andCount:(int)count
             andCurrentHighestStepCompleted:(int)currentHighestStepCompleted
                               andStepWidth:(int)stepWidth
                         andSeperationWidth:(int)seperationWidth
                          andCompletedImage:(UIImage*)completedImage
                             andUpNextImage:(UIImage*)upNextImage
                             andFutureImage:(UIImage*)futureImage
                                    andFont:(UIFont*)font
                               andTextColor:(UIColor*)textColor
                             allowScrolling:(BOOL)allowScrolling;

@end
