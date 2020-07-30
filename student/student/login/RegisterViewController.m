//
//  RegisterViewController.m
//  student
//
//  Created by 房彤 on 2020/7/28.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //背景
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bz.jpg"]];
    
    //textField
    self.userTextField = [[UITextField alloc] initWithFrame:CGRectMake(45, 230, 324, 53)];
    self.passTextField = [[UITextField alloc] initWithFrame:CGRectMake(45, 310, 324, 53)];
    
    self.userTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.userTextField.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    self.userTextField.layer.cornerRadius = 7;
    self.userTextField.keyboardType = UIKeyboardTypeDefault;
    self.userTextField.placeholder = @"请输入用户名";
    
    self.passTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.passTextField.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    self.passTextField.layer.cornerRadius = 7;
    self.passTextField.keyboardType = UIKeyboardTypeDefault;
    self.passTextField.placeholder = @"请输入密码";
    self.passTextField.secureTextEntry = YES;
    
    
    UIImageView *user = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user1.png"]];
    self.userTextField.leftView = user;
    self.userTextField.leftViewMode = UITextFieldViewModeAlways;
    
    UIImageView *pass = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pass1.png"]];
    self.passTextField.leftView = pass;
    self.passTextField.leftViewMode = UITextFieldViewModeAlways;
    
    [self.view addSubview:self.userTextField];
    [self.view addSubview:self.passTextField];
    
    //button
    self.btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.btn.frame = CGRectMake(150, 430, 110, 40);
    self.btn.layer.borderColor = [UIColor whiteColor].CGColor;
    self.btn.layer.cornerRadius = 7;
    self.btn.tintColor = [UIColor whiteColor];
    self.btn.titleLabel.font = [UIFont systemFontOfSize:21];
    self.btn.layer.borderWidth = 1.3;
    [self.btn setTitle:@"确定注册" forState:UIControlStateNormal];
    [self.btn addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn];
    
    //键盘上移
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisAppear:) name:UIKeyboardWillHideNotification object:nil];
    
}


- (void)press:(UIButton *)btn {
    [self.delegate passContent:self.userTextField.text andPass:self.passTextField.text];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}


//键盘上移

- (void)keyboardWillDisAppear:(NSNotification *)notification {

    [UIView animateWithDuration:1 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, 0);}];

}

- (void)keyboardWillAppear:(NSNotification *)notification {
    [UIView animateWithDuration:1.0 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, - 40);}];
}

//点击空白处 收键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}


@end
