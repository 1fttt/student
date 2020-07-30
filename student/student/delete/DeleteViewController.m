//
//  DeleteViewController.m
//  student
//
//  Created by 房彤 on 2020/7/29.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "DeleteViewController.h"
#import "Student.h"
@interface DeleteViewController ()

@end

@implementation DeleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bz.jpg"]];
    
    _deleteTextField = [[UITextField alloc] initWithFrame:CGRectMake(45, 280, 324, 50)];
    _deleteTextField.placeholder = @"请输入学生姓名";
    _deleteTextField.borderStyle = UITextBorderStyleRoundedRect;
     _deleteTextField.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    _deleteTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"学生.png"]];
    _deleteTextField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_deleteTextField];
    
    //button
    _sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _sureButton.frame = CGRectMake(180, 380, 50, 50);
    [_sureButton setImage:[UIImage imageNamed:@"确定1.png"] forState:UIControlStateNormal];
    [_sureButton addTarget:self action:@selector(pressDelete) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_sureButton];
    
    
    //返回button

    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(23, 43, 60, 50);
    [backBtn setImage:[UIImage imageNamed:@"返回5.png"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(pressFanHui) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
          
    
    // 键盘出现 视图上移事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisAppear:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)pressDelete {
    int i = 0;
    for(; i < _nameArr.count; i++) {
        if([_deleteTextField.text isEqualToString:_nameArr[i]]) {
            break;
        }
    }
    

    if(i == _nameArr.count) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"未找到该学生" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
        [alert addAction:sure];
        [self presentViewController:alert animated:NO completion:nil];
        
    } else {
        
        [_nameArr removeObjectAtIndex:i];
        [_classArr removeObjectAtIndex:i];
        [_numArr removeObjectAtIndex:i];
        [_scoreArr removeObjectAtIndex:i];
        
        [self.delegate deleteContent:_nameArr andClass:_classArr andNum:_numArr andScore:_scoreArr];
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"已删除" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
        //两秒后执行该方法
        //[self performSelector:@selector(disAlert:) withObject:alert afterDelay:2];
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
            
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
        //[self presentViewController:alert animated:YES completion:^{
        //           [ dismissViewControllerAnimated:YES completion:nil];
         //      }];
      //  [self dismissViewControllerAnimated:YES completion:nil];
        
    
    }
     
    
 
}


//两秒后执行该方法
- (void)disAlert:(UIAlertController *)alert {
    
    [alert dismissViewControllerAnimated:YES completion:nil];
}

//收键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

    //返回按钮
- (void)pressFanHui {
    [self dismissViewControllerAnimated:YES completion:nil];
}


// 键盘出现 视图上移事件
- (void)keyboardWillDisAppear:(NSNotification *)notification{
    [UIView animateWithDuration:1 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, 0);}];
}

- (void)keyboardWillAppear:(NSNotification *)notification{

    [UIView animateWithDuration:1.0 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, - 40);}];
}

@end
