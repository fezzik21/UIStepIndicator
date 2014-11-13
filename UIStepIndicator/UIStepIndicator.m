//
//  UIStepIndicator.m
//  StepIndicator
//
//  Created by Adam Hunter on 10/28/14.
//  Copyright (c) 2014 None. All rights reserved.
//

#import "UIStepIndicator.h"

@interface UIStepIndicator ()

@property (nonatomic, strong) NSArray *imageViews;
@property (nonatomic, strong) NSArray *labels;
@property (nonatomic, assign) int numShown;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *contentHolderView;

@end

@implementation UIStepIndicator

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
                             allowScrolling:(BOOL)allowScrolling
{
    return [[UIStepIndicator alloc] initWithFrame:frame
                                         andCount:count
                   andCurrentHighestStepCompleted:currentHighestStepCompleted
                                     andStepWidth:stepWidth
                               andSeperationWidth:seperationWidth
                                andCompletedImage:completedImage
                                   andUpNextImage:upNextImage
                                   andFutureImage:futureImage
                                          andFont:font
                                     andTextColor:textColor
                                   allowScrolling:allowScrolling];
}

- (UIStepIndicator*)initWithFrame:(CGRect)frame
                         andCount:(int)count
   andCurrentHighestStepCompleted:(int)currentHighestStepCompleted
                     andStepWidth:(int)stepWidth
               andSeperationWidth:(int)seperationWidth
                andCompletedImage:(UIImage*)completedImage
                   andUpNextImage:(UIImage*)upNextImage
                   andFutureImage:(UIImage*)futureImage
                          andFont:(UIFont*)font
                     andTextColor:(UIColor*)textColor
                   allowScrolling:(BOOL)allowScrolling
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *holderView;
        if (allowScrolling) {
            int frameWidth = (stepWidth + seperationWidth) * count - seperationWidth;
            _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
            _contentHolderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frameWidth, frame.size.height)];
            _scrollView.contentSize = CGSizeMake(frameWidth, self.frame.size.height);
            _numShown = count;
            holderView = _contentHolderView;
            [_scrollView addSubview:_contentHolderView];
            [self addSubview:_scrollView];
        } else {
            _numShown = 1 + (int)((frame.size.width - stepWidth) / (stepWidth + seperationWidth));
            holderView = self;
        }
        _imageViews = [NSMutableArray arrayWithCapacity:_numShown];
        _labels = [NSMutableArray arrayWithCapacity:_numShown];
        int startNumber = 0;
        startNumber = currentHighestStepCompleted + 1 - (_numShown / 2);
        if (startNumber < 1) {
            startNumber = 1;
        }
        if (startNumber > (count - _numShown + 1)) {
            startNumber = count - _numShown + 1;
        }
        for (int i = 0; i < _numShown; ++i) {
            UIImageView *newImageView = [[UIImageView alloc] initWithFrame:CGRectMake((stepWidth + seperationWidth) * i,
                                                                                      (frame.size.height - stepWidth) / 2,
                                                                                      stepWidth,
                                                                                      stepWidth)];
            BOOL showLabel = YES;
            if (startNumber + i <= currentHighestStepCompleted) {
                newImageView.image = completedImage;
                showLabel = NO;
            } else if (startNumber + i == (currentHighestStepCompleted + 1)) {
                newImageView.image = upNextImage;
                if (allowScrolling) {
                    int numActuallyShown = 1 + (int)((frame.size.width - stepWidth) / (stepWidth + seperationWidth));
                    int offset = currentHighestStepCompleted - numActuallyShown / 2;
                    [_scrollView setContentOffset:CGPointMake((stepWidth + seperationWidth) * offset, 0) animated:NO];
                }
            } else {
                newImageView.image = futureImage;
            }
            UILabel *newLabel = [[UILabel alloc] initWithFrame:CGRectMake((stepWidth + seperationWidth) * i,
                                                                          (frame.size.height - stepWidth) / 2,
                                                                          stepWidth,
                                                                          stepWidth)];
            newLabel.font = font;
            newLabel.text = [NSString stringWithFormat:@"%d", startNumber + i];
            newLabel.textColor = textColor;
            newLabel.textAlignment = NSTextAlignmentCenter;
            newLabel.hidden = !showLabel;
            
            [(NSMutableArray *)_imageViews addObject:newImageView];
            [holderView addSubview:newImageView];
            [(NSMutableArray *)_labels addObject:newLabel];
            [holderView addSubview:newLabel];
        }
    }
    return self;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


@end
