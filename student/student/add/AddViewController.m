//
//  AddViewController.m
//  student
//
//  Created by 房彤 on 2020/7/29.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "AddViewController.h"
#import "Student.h"
@interface AddViewController ()
@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bz.jpg"]];
    
    _nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(45, 220, 324, 45)];
    _classTextField = [[UITextField alloc] initWithFrame:CGRectMake(45, 280, 324, 45)];
    _numTextField = [[UITextField alloc] initWithFrame:CGRectMake(45, 340, 324, 45)];
    _scoreTextField = [[UITextField alloc] initWithFrame:CGRectMake(45, 400, 324, 45)];
    
    _nameTextField.placeholder = @"请输入学生姓名";
    _classTextField.placeholder = @"请输入班级";
    _numTextField.placeholder = @"请输入学号";
    _scoreTextField.placeholder = @"请输入分数";
    
    
    _nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    _classTextField.borderStyle = UITextBorderStyleRoundedRect;
    _numTextField.borderStyle = UITextBorderStyleRoundedRect;
    _scoreTextField.borderStyle = UITextBorderStyleRoundedRect;
    
    _nameTextField.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    _classTextField.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    _numTextField.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    _scoreTextField.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    
    _nameTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"学生.png"]];
    _classTextField.leftViewMode = UITextFieldViewModeAlways;
    _classTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"班级1.png"]];
    _numTextField.leftViewMode = UITextFieldViewModeAlways;
    _numTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"学号.png"]];
    _scoreTextField.leftViewMode = UITextFieldViewModeAlways;
    _scoreTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"成绩.png"]];
    _nameTextField.leftViewMode = UITextFieldViewModeAlways;
    
    
    [self.view addSubview:_nameTextField];
    [self.view addSubview:_classTextField];
    [self.view addSubview:_numTextField];
    [self.view addSubview:_scoreTextField];
    
    
    _sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _sureButton.frame = CGRectMake(180, 485, 50, 50);
    [_sureButton setImage:[UIImage imageNamed:@"确定1.png"] forState:UIControlStateNormal];
    [_sureButton addTarget:self action:@selector(pressBack) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.sureButton];
    
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

//返回按钮
- (void)pressFanHui {
    [self dismissViewControllerAnimated:YES completion:nil];
}


//确定按钮
- (void)pressBack {
    //判断内容是否为空
    if(_nameTextField.text.length == 0 || _classTextField.text.length == 0 || _numTextField.text.length == 0 || _scoreTextField.text.length == 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警告" message:@"信息能不能输完整！！" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
     
    } else {
        int t = 0;
        for(int i = 0; i < _numArr.count; i++) {
            
            if([_numArr[i] isEqualToString:_numTextField.text] ) {
                t = 1;
            }
            if([_nameArr[i] isEqualToString:_nameTextField.text]) {
                t = 2;
            }
            if(t != 0) {
                break;
            }
            
        }
        if(t == 1) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"学号重复" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:sure];
            [self presentViewController:alert animated:NO completion:nil];
            _nameTextField.text = @"";
            _classTextField.text = @"";
            _numTextField.text = @"";
            _scoreTextField.text = @"";
        } else if(t == 2) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"姓名重复" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:sure];
            [self presentViewController:alert animated:NO completion:nil];
            _nameTextField.text = @"";
            _classTextField.text = @"";
            _numTextField.text = @"";
            _scoreTextField.text = @"";
        } else {
            
            Student *student = [[Student alloc] init];
            student.nameStr = _nameTextField.text;
            student.classStr = _classTextField.text;
            student.numStr = _numTextField.text;
            student.scoreStr = _scoreTextField.text;
            [self.addDelegate content:student];
            [self dismissViewControllerAnimated:YES    completion:nil];
        }
    }

    
}

//回收键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

// 键盘出现 视图上移事件
- (void)keyboardWillDisAppear:(NSNotification *)notification{
    [UIView animateWithDuration:1 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, 0);}];
}

- (void)keyboardWillAppear:(NSNotification *)notification{

    [UIView animateWithDuration:1.0 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, - 40);}];
}

@end
