//
//  NSView+Constraint.h
//  CollaborationStandalone
//
//  Created by Lukasz Dworakowski on 07/01/14.
//  Copyright (c) 2014 Lukasz Dworakowski. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSView (Constraint)

/// Return an array of NSLayoutConstraint @[top, left, bottom, right]
- (NSArray *)addConstraintFill;
/// Return an array of NSLayoutConstraint @[top, left, bottom, right]
- (NSArray *)addConstraintFillWithInsets:(NSEdgeInsets)insets;
/// Return an array of NSLayoutConstraint @[top, bottom]
- (NSArray *)addConstraintFromTop:(CGFloat)top toBottom:(CGFloat)bottom;
/// Return an array of NSLayoutConstraint @[left, right]
- (NSArray *)addConstraintFromLeft:(CGFloat)left toRight:(CGFloat)right;

- (NSLayoutConstraint *)addConstraintFromTop:(CGFloat)distance;
- (NSLayoutConstraint *)addConstraintFromBottom:(CGFloat)distance;
- (NSLayoutConstraint *)addConstraintFromLeft:(CGFloat)distance;
- (NSLayoutConstraint *)addConstraintFromRight:(CGFloat)distance;

- (NSLayoutConstraint *)addConstraintWidth:(CGFloat)width;
- (NSLayoutConstraint *)addConstraintHeight:(CGFloat)height;
/// Return an array of NSLayoutConstraint @[width, height]
- (NSArray *)addConstraintWidth:(CGFloat)width height:(CGFloat)height;

- (NSLayoutConstraint *)addConstraintCenteringX;
- (NSLayoutConstraint *)addConstraintCenteringY;
/// Return an array of NSLayoutConstraint @[centerX, centerY]
- (NSArray *)addConstraintCenteringXY;

- (NSLayoutConstraint *)addConstraintCenteringXWithOffset:(CGFloat)offsetX;
- (NSLayoutConstraint *)addConstraintCenteringYWithOffset:(CGFloat)offsetY;
/// Return an array of NSLayoutConstraint @[centerX, centerY]
- (NSArray *)addConstraintCenteringXYWithOffset:(CGSize)offset;

- (NSLayoutConstraint *)addConstraintFromViewTop:(NSView *)fromView distance:(CGFloat)distance;
- (NSLayoutConstraint *)addConstraintFromViewBottom:(NSView *)fromView distance:(CGFloat)distance;
- (NSLayoutConstraint *)addConstraintFromViewLeft:(NSView *)fromView distance:(CGFloat)distance;
- (NSLayoutConstraint *)addConstraintFromViewRight:(NSView *)fromView distance:(CGFloat)distance;

- (NSLayoutConstraint *)addConstraintAlignViewTop:(NSView *)baseView offset:(CGFloat)offset;
- (NSLayoutConstraint *)addConstraintAlignViewBottom:(NSView *)baseView offset:(CGFloat)offset;
- (NSLayoutConstraint *)addConstraintAlignViewLeft:(NSView *)baseView offset:(CGFloat)offset;
- (NSLayoutConstraint *)addConstraintAlignViewRight:(NSView *)baseView offset:(CGFloat)offset;

- (void)removeAllConstraints;



@end
