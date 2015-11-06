//
//  CoverFlowLayout.m
//  Cover Flow Layout
//
//  Created by Alex on 2015-11-05.
//  Copyright © 2015 Alex. All rights reserved.
//

#import "CoverFlowLayout.h"

@implementation CoverFlowLayout


-(void)prepareLayout
{
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.minimumInteritemSpacing = 30;
    self.itemSize = CGSizeMake(250, 250);
    
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    
    NSArray* attributes = [super layoutAttributesForElementsInRect:rect];
    
    CGRect visibleRegion;
    visibleRegion.origin = self.collectionView.contentOffset;
    visibleRegion.size   = self.collectionView.bounds.size;
    
    CGPoint visibleCenter = CGPointMake(visibleRegion.origin.x + visibleRegion.size.width / 2, visibleRegion.size.height / 2);
    
    for (UICollectionViewLayoutAttributes *attribute in attributes) {
        
        if (CGRectIntersectsRect(attribute.frame, rect)) {
            
            CGFloat distanceFromCenter = fabs(visibleCenter.x - attribute.center.x);
            
            CGFloat scaleFacter = 1 - (distanceFromCenter / (visibleRegion.size.width / 2));
            
            attribute.alpha = scaleFacter;
            
            CATransform3D rotate = CATransform3DMakeRotation(M_2_PI, 0, 0, scaleFacter * 2);
            
            attribute.transform3D = CATransform3DScale(rotate, scaleFacter, scaleFacter, 1);
        }
    }
    
    return attributes;
}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

@end
