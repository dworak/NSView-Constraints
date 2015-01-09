//
//  NSView+Constraint.m
//  CollaborationStandalone
//
//  Created by Lukasz Dworakowski on 07/01/14.
//  Copyright (c) 2014 Lukasz Dworakowski. All rights reserved.
//

#import "NSView+Constraint.h"

@implementation NSView (Constraint)

#pragma mark - Constraint

- (NSArray *)addConstraintFill {
  return [self addConstraintFillWithInsets:NSEdgeInsetsMake(0, 0, 0, 0)];
}

- (NSArray *)addConstraintFillWithInsets:(NSEdgeInsets)insets {
  NSArray *constraints1 = [self addConstraintFromTop:insets.top toBottom:insets.bottom];
  NSArray *constraints2 = [self addConstraintFromLeft:insets.left toRight:insets.right];
  NSArray *constraints = @[constraints1[0], // top
                           constraints2[0], // left
                           constraints1[1], // bottom
                           constraints2[1]  // right
                           ];
  return constraints;
}

- (NSArray *)addConstraintFromTop:(CGFloat)top toBottom:(CGFloat)bottom {
  NSView *superview = self.superview;
  if (!superview) return nil;
  self.translatesAutoresizingMaskIntoConstraints = NO;
  NSArray *constraints = [NSLayoutConstraint
                          constraintsWithVisualFormat:@"V:|-top-[self]-bottom-|"
                          options:NSLayoutFormatDirectionLeadingToTrailing
                          metrics:@{@"top":@(top),
                                    @"bottom":@(bottom)}
                          views:NSDictionaryOfVariableBindings(self)];
  [superview addConstraints:constraints];
  return constraints;
}

- (NSArray *)addConstraintFromLeft:(CGFloat)left toRight:(CGFloat)right {
  NSView *superview = self.superview;
  if (!superview) return nil;
  self.translatesAutoresizingMaskIntoConstraints = NO;
  NSArray *constraints = [NSLayoutConstraint
                          constraintsWithVisualFormat:@"H:|-left-[self]-right-|"
                          options:NSLayoutFormatDirectionLeadingToTrailing
                          metrics:@{@"left":@(left),
                                    @"right":@(right)}
                          views:NSDictionaryOfVariableBindings(self)];
  [superview addConstraints:constraints];
  return constraints;
}
// inner method
- (NSLayoutConstraint *)addConstraintWithVisualFormat:(NSString *)format distance:(CGFloat)distance {
  NSView *superview = self.superview;
  if (!superview) return nil;
  self.translatesAutoresizingMaskIntoConstraints = NO;
  NSArray *constraints = [NSLayoutConstraint
                          constraintsWithVisualFormat:format
                          options:NSLayoutFormatDirectionLeadingToTrailing
                          metrics:@{@"distance":@(distance)}
                          views:NSDictionaryOfVariableBindings(self)];
  [superview addConstraints:constraints];
  if (constraints.count != 1) return nil;
  return (NSLayoutConstraint *)constraints.firstObject;
}

- (NSLayoutConstraint *)addConstraintFromTop:(CGFloat)distance {
  return [self addConstraintWithVisualFormat:@"V:|-(distance)-[self]" distance:distance];
}

- (NSLayoutConstraint *)addConstraintFromBottom:(CGFloat)distance {
  return [self addConstraintWithVisualFormat:@"V:[self]-(distance)-|" distance:distance];
}

- (NSLayoutConstraint *)addConstraintFromLeft:(CGFloat)distance {
  return [self addConstraintWithVisualFormat:@"H:|-(distance)-[self]" distance:distance];
}

- (NSLayoutConstraint *)addConstraintFromRight:(CGFloat)distance {
  return [self addConstraintWithVisualFormat:@"H:[self]-(distance)-|" distance:distance];
}

- (NSLayoutConstraint *)addConstraintWidth:(CGFloat)width {
  self.translatesAutoresizingMaskIntoConstraints = NO;
  NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self
                                                                attribute:NSLayoutAttributeWidth
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:0
                                                               multiplier:1.0
                                                                 constant:width];
  [self addConstraint:constraint];
  return constraint;
}

- (NSLayoutConstraint *)addConstraintHeight:(CGFloat)height {
  self.translatesAutoresizingMaskIntoConstraints = NO;
  NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:0
                                                               multiplier:1.0
                                                                 constant:height];
  [self addConstraint:constraint];
  return constraint;
}

- (NSArray *)addConstraintWidth:(CGFloat)width height:(CGFloat)height {
  NSLayoutConstraint *constraint1 = [self addConstraintWidth:width];
  NSLayoutConstraint *constraint2 = [self addConstraintHeight:height];
  if (constraint1 && constraint2) {
    return @[constraint1, constraint2];
  } else {
    return nil;
  }
}

- (NSLayoutConstraint *)addConstraintCenteringX {
  return [self addConstraintCenteringXWithOffset:0];
}

- (NSLayoutConstraint *)addConstraintCenteringY {
  return [self addConstraintCenteringYWithOffset:0];
}

- (NSArray *)addConstraintCenteringXY {
  return [self addConstraintCenteringXYWithOffset:CGSizeZero];
}

- (NSLayoutConstraint *)addConstraintCenteringXWithOffset:(CGFloat)offsetX {
  NSView *superview = self.superview;
  if (!superview) return nil;
  self.translatesAutoresizingMaskIntoConstraints = NO;
  NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self
                                                                attribute:NSLayoutAttributeCenterX
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:superview
                                                                attribute:NSLayoutAttributeCenterX
                                                               multiplier:1.0
                                                                 constant:offsetX];
  [superview addConstraint:constraint];
  return constraint;
}

- (NSLayoutConstraint *)addConstraintCenteringYWithOffset:(CGFloat)offsetY {
  NSView *superview = self.superview;
  if (!superview) return nil;
  self.translatesAutoresizingMaskIntoConstraints = NO;
  NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self
                                                                attribute:NSLayoutAttributeCenterY
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:superview
                                                                attribute:NSLayoutAttributeCenterY
                                                               multiplier:1.0
                                                                 constant:offsetY];
  [superview addConstraint:constraint];
  return constraint;
}

- (NSArray *)addConstraintCenteringXYWithOffset:(CGSize)offset {
  NSLayoutConstraint *constraint1 = [self addConstraintCenteringXWithOffset:offset.width];
  NSLayoutConstraint *constraint2 = [self addConstraintCenteringYWithOffset:offset.height];
  if (constraint1 && constraint2) {
    return @[constraint1, constraint2];
  } else {
    return nil;
  }
}

// inner method
- (NSLayoutConstraint *)addConstraintFromView:(NSView *)fromView format:(NSString *)format distance:(CGFloat)distance {
  NSView *superview = self.superview;
  if (!superview) return nil;
  self.translatesAutoresizingMaskIntoConstraints = NO;
  NSArray *constraints = [NSLayoutConstraint
                          constraintsWithVisualFormat:format
                          options:NSLayoutFormatDirectionLeadingToTrailing
                          metrics:@{@"distance":@(distance)}
                          views:NSDictionaryOfVariableBindings(self, fromView)];
  [superview addConstraints:constraints];
  return constraints.firstObject;
}

- (NSLayoutConstraint *)addConstraintFromViewTop:(NSView *)fromView distance:(CGFloat)distance {
  return [self addConstraintFromView:fromView format:@"V:[self]-(distance)-[fromView]" distance:distance];
}

- (NSLayoutConstraint *)addConstraintFromViewBottom:(NSView *)fromView distance:(CGFloat)distance {
  return [self addConstraintFromView:fromView format:@"V:[fromView]-(distance)-[self]" distance:distance];
}

- (NSLayoutConstraint *)addConstraintFromViewLeft:(NSView *)fromView distance:(CGFloat)distance {
  return [self addConstraintFromView:fromView format:@"H:[self]-(distance)-[fromView]" distance:distance];
}

- (NSLayoutConstraint *)addConstraintFromViewRight:(NSView *)fromView distance:(CGFloat)distance {
  return [self addConstraintFromView:fromView format:@"H:[fromView]-(distance)-[self]" distance:distance];
}

- (NSLayoutConstraint *)addConstraintAlignView:(NSView *)baseView layoutAttribute:(NSLayoutAttribute)attribute offset:(CGFloat)offset {
  NSView *superview = self.superview;
  if (!superview) return nil;
  self.translatesAutoresizingMaskIntoConstraints = NO;
  NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self
                                                                attribute:attribute
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:baseView
                                                                attribute:attribute
                                                               multiplier:1.0
                                                                 constant:offset];
  [superview addConstraint:constraint];
  return constraint;
}

- (NSLayoutConstraint *)addConstraintAlignViewTop:(NSView *)baseView offset:(CGFloat)offset {
  return [self addConstraintAlignView:baseView layoutAttribute:NSLayoutAttributeTop offset:offset];
}

- (NSLayoutConstraint *)addConstraintAlignViewBottom:(NSView *)baseView offset:(CGFloat)offset {
  return [self addConstraintAlignView:baseView layoutAttribute:NSLayoutAttributeBottom offset:offset];
}

- (NSLayoutConstraint *)addConstraintAlignViewLeft:(NSView *)baseView offset:(CGFloat)offset {
  return [self addConstraintAlignView:baseView layoutAttribute:NSLayoutAttributeLeft offset:offset];
}

- (NSLayoutConstraint *)addConstraintAlignViewRight:(NSView *)baseView offset:(CGFloat)offset {
  return [self addConstraintAlignView:baseView layoutAttribute:NSLayoutAttributeRight offset:offset];
}

- (void)removeAllConstraints {
  if (self.constraints.count > 0) {
    [self removeConstraints:self.constraints];
  }
}

@end