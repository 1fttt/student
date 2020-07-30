//
//  SearchViewController.m
//  student
//
//  Created by 房彤 on 2020/7/30.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bz.jpg"]];
    
    UILabel *titlelabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 280, 394, 50)];
    titlelabel.text = @"   姓名          班级            学号             分数";
    titlelabel.textColor = [UIColor whiteColor];
    titlelabel.font = [UIFont systemFontOfSize:22];
    [self.view addSubview:titlelabel];
    
    
    //学生信息
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(38, 340, 394, 45)];
    nameLabel.text = [NSString stringWithString:_nameStr];
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:nameLabel];
    
    UILabel *classLabel = [[UILabel alloc] initWithFrame:CGRectMake(132, 340, 394, 45)];
    classLabel.text = [NSString stringWithString:_classStr];
    classLabel.textColor = [UIColor whiteColor];
    classLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:classLabel];
    
    UILabel *numLabel = [[UILabel alloc] initWithFrame:CGRectMake(233, 340, 394, 45)];
       numLabel.text = [NSString stringWithString:_numStr];
       numLabel.textColor = [UIColor whiteColor];
       numLabel.font = [UIFont systemFontOfSize:20];
       [self.view addSubview:numLabel];
    
    UILabel *scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(345, 340, 394, 45)];
    scoreLabel.text = [NSString stringWithString:_scoreStr];
    scoreLabel.textColor = [UIColor whiteColor];
    scoreLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:scoreLabel];

    
    
    
//
//    //学生信息
//    UILabel *xinxiLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 340, 394, 45)];
//    xinxiLabel.text = [NSString stringWithFormat:@"    %@            %@               %@               %@", _nameStr, _classStr, _numStr, _scoreStr];
//    xinxiLabel.textColor = [UIColor whiteColor];
//    xinxiLabel.font = [UIFont systemFontOfSize:20];
//    [self.view addSubview:xinxiLabel];
//
//
    
    //返回按钮
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(170, 480, 50, 50);
    [backBtn setImage:[UIImage imageNamed:@"确定1.png"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(pressBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
}

- (void)pressBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
