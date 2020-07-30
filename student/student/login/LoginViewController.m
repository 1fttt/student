//
//  LoginViewController.m
//  student
//
//  Created by 房彤 on 2020/7/28.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "StartViewController.h"



//签订协议
@interface LoginViewController () <PassValueDelegate>

@property NSString *userStr;
@property NSString *passStr;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //背景
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bz.jpg"]];
    
    //textField
    self.userTextField = [[UITextField alloc] initWithFrame:CGRectMake(45, 290, 324, 53)];
    self.passTextField = [[UITextField alloc] initWithFrame:CGRectMake(45, 370, 324, 53)];
    self.userTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.userTextField.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
   // self.userTextField.borderStyle = UITextBorderStyleLine;
   // self.userTextField.layer.borderColor = [[UIColor whiteColor] CGColor];
   // self.userTextField.layer.borderWidth = 1.7;
    self.userTextField.layer.cornerRadius = 7;
    self.userTextField.placeholder = @"请输入用户名";
    self.userTextField.keyboardType = UIKeyboardTypeDefault;
    
    self.passTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.passTextField.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
  //  self.passTextField.borderStyle = UITextBorderStyleLine;
  //  self.passTextField.layer.borderColor = [[UIColor whiteColor] CGColor];
    //self.passTextField.layer.borderWidth = 1.7;
    self.passTextField.layer.cornerRadius = 7;
    self.passTextField.placeholder = @"请输入密码";
    self.passTextField.secureTextEntry = YES;
    self.passTextField.keyboardType = UIKeyboardTypeDefault;
    

    
    //小标
    UIImageView *userImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
    userImageView.image = [UIImage imageNamed:@"user1.png"];
    self.userTextField.leftView = userImageView;
    self.userTextField.leftViewMode = UITextFieldViewModeAlways;
    
    UIImageView *passImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 10, 10)];
    passImageView.image = [UIImage imageNamed:@"pass1.png"];
    self.passTextField.leftView = passImageView;
    self.passTextField.leftViewMode = UITextFieldViewModeAlways;
    
    [self.view addSubview:self.userTextField];
    [self.view addSubview:self.passTextField];
       
    
    //button
    self.loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.loginButton.frame = CGRectMake(78, 480, 95, 37);
    [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginButton addTarget:self action:@selector(pressLogin) forControlEvents:UIControlEventTouchUpInside];
    
    self.registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.registerButton.frame = CGRectMake(230, 480, 95, 37);
    [self.registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [self.registerButton addTarget:self action:@selector(pressRegister) forControlEvents:UIControlEventTouchUpInside];
    
    //边框
    [self.loginButton.layer setMasksToBounds:YES];
    self.loginButton.layer.cornerRadius = 9.0;
    self.loginButton.layer.borderWidth = 1.3;
    self.loginButton.titleLabel.font = [UIFont systemFontOfSize:22];
    self.loginButton.tintColor = [UIColor whiteColor];
    self.loginButton.layer.borderColor = [UIColor whiteColor].CGColor;
    
    [self.registerButton.layer setMasksToBounds:YES];
    self.registerButton.layer.cornerRadius = 9.0;
    self.registerButton.layer.borderWidth = 1.3;
    self.registerButton.titleLabel.font = [UIFont systemFontOfSize:22];
    self.registerButton.tintColor = [UIColor whiteColor];
    self.registerButton.layer.borderColor = [UIColor whiteColor].CGColor;
    
    [self.view addSubview:self.loginButton];
    [self.view addSubview:self.registerButton];
    
    
    //键盘上移
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisAppear:) name:UIKeyboardWillHideNotification object:nil];
    
    
    
}

- (void)pressLogin {
    
   // if([self.userStr.text isEqualToString:self.userTextField.text ] && [self.passStr.text isEqualToString:self.passTextField.text]) {
    if([self.userTextField.text isEqualToString:self.userStr] && [self.passTextField.text isEqualToString:self.passStr]) {
        
         StartViewController *firstView = [[StartViewController alloc] init];
        firstView.modalPresentationStyle = UIModalPresentationFullScreen;
        
        [self presentViewController:firstView animated:YES completion:nil];
        
        
    } else {
        self.userTextField.text = @"";
        self.passTextField.text = @"";
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"账号或密码错误" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"重新输入" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (void)pressRegister {
    RegisterViewController *registerView = [[RegisterViewController alloc] init];
    
    //设置代理人
    registerView.delegate = self;
    //registerView.userStr = self.userStr;
    //registerView.passStr = self.passStr;
    //registerView.userStr = self.userTextField.text;
    //registerView.passStr = self.passTextField.text;
    
    [self presentViewController: registerView animated:YES completion:nil];
}

- (void)passContent:(NSString *)user andPass:(NSString *)pass {
    self.userStr = user;
    self.passStr = pass;
    self.userTextField.text = user;
    self.passTextField.text = pass;
}


//键盘上移

- (void)keyboardWillDisAppear:(NSNotification *)notification {

    [UIView animateWithDuration:1 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, 0);}];

}

- (void)keyboardWillAppear:(NSNotification *)notification {
    [UIView animateWithDuration:1.0 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, - 40);}];
}


// 点击空白处，收回键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
