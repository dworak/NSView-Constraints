//
//  ViewController.m
//  TestConstraints
//
//  Created by Lukasz Dworakowski on 09/01/15.
//  Copyright (c) 2015 Lukasz Dworakowski. All rights reserved.
//

#import "ViewController.h"
#import "NSView+Constraint.h"

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  NSView *v1 = [[NSView alloc] initWithFrame:CGRectZero];
  [v1 setWantsLayer:YES];
  v1.layer.backgroundColor = [NSColor redColor].CGColor;
  v1.translatesAutoresizingMaskIntoConstraints = NO;
  [self.view addSubview:v1];
  [self.view setWantsLayer:YES];
  self.view.layer.backgroundColor = [NSColor blueColor].CGColor;
  [v1 addConstraintFillWithInsets:NSEdgeInsetsMake(20, 20, 20, 20)];
  
  NSView *v2 = [[NSView alloc] initWithFrame:CGRectZero];
  [v1 addSubview:v2];
  [v2 setWantsLayer:YES];
  v2.layer.backgroundColor = [NSColor yellowColor].CGColor;
  v2.translatesAutoresizingMaskIntoConstraints = NO;
  [v2 addConstraintCenteringXWithOffset:20];
  [v2 addConstraintWidth:300 height:30];
  
  NSView *v3 = [[NSView alloc] initWithFrame:CGRectZero];
  [v2 addSubview:v3];
  [v3 setWantsLayer:YES];
  v3.layer.backgroundColor = [NSColor greenColor].CGColor;
  v3.translatesAutoresizingMaskIntoConstraints = NO;
  [v3 addConstraintFillWithInsets:NSEdgeInsetsMake(10, 10, 10, 10)];
  
  NSView *v4 = [[NSView alloc] initWithFrame:CGRectZero];
  [v1 addSubview:v4];
  [v4 setWantsLayer:YES];
  v4.layer.backgroundColor = [NSColor blackColor].CGColor;
  v4.translatesAutoresizingMaskIntoConstraints = NO;
  [v4 addConstraintCenteringX];
  [v4 addConstraintFromViewBottom:v3 distance:-300];
  [v4 addConstraintWidth:100 height:100];
  
  // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
  [super setRepresentedObject:representedObject];

  // Update the view, if already loaded.
}

@end
