//
//  DescriptionViewController.m
//  MeusApps
//
//  Created by Guilherme Bayma on 2/26/15.
//  Copyright (c) 2015 Guilherme Bayma. All rights reserved.
//

#import "DescriptionViewController.h"

@interface DescriptionViewController ()

@end

@implementation DescriptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super viewDidLoad];
    [_appName setText:_AppDetail[0]];
    [_appCategory setText:_AppDetail[1]];
    [_appDescription setText:_AppDetail[2]];
    [_appImage setImage:[UIImage imageNamed:_AppDetail[3]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
