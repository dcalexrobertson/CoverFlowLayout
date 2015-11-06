//
//  CoverFlowLayout.h
//  Cover Flow Layout
//
//  Created by Alex on 2015-11-05.
//  Copyright © 2015 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoverFlowLayout : UICollectionViewFlowLayout

@property (strong, nonatomic) NSIndexPath *currentCellPath;
@property (nonatomic) CGPoint currentCellCenter;
@property (nonatomic) CGFloat currentCellScale;

@end
