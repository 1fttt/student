//
//  StartViewController.m
//  student
//
//  Created by 房彤 on 2020/7/29.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "StartViewController.h"
#import "StuTableViewCell.h"
#import "AddViewController.h"
#import "DeleteViewController.h"
#import "SearchViewController.h"
#import "ModifyViewController.h"


@interface StartViewController () 


@end

@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bz.jpg"]];
     
     
     
   
     //初始信息
     self.nameArr = [[NSMutableArray alloc] init];
     self.classArr = [[NSMutableArray alloc] init];
     self.numArr = [[NSMutableArray alloc] init];
     self.scoreArr = [[NSMutableArray alloc] init];
     [self.nameArr addObject:@"小红"];
     [self.nameArr addObject:@"小橙"];
     [self.nameArr addObject:@"小黄"];
     [self.nameArr addObject:@"小绿"];
     [self.classArr addObject:@"1班"];
     [self.classArr addObject:@"1班"];
     [self.classArr addObject:@"3班"];
     [self.classArr addObject:@"3班"];
     [self.numArr addObject:@"1001"];
     [self.numArr addObject:@"1003"];
     [self.numArr addObject:@"1006"];
     [self.numArr addObject:@"1009"];
     [self.scoreArr addObject:@"100"];
     [self.scoreArr addObject:@"98"];
     [self.scoreArr addObject:@"78"];
     [self.scoreArr addObject:@"98"];
     
    
    
    
     //addButton
     self.addButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
     self.addButton.frame = CGRectMake(60, 470, 90, 37);
     self.addButton.layer.cornerRadius = 7;
     self.addButton.layer.borderColor = [UIColor whiteColor].CGColor;
     [self.addButton.layer setMasksToBounds:YES];
     self.addButton.layer.borderWidth = 1.3;
     self.addButton.titleLabel.font = [UIFont systemFontOfSize:17];
     self.addButton.tintColor = [UIColor whiteColor];
     
     
     [self.addButton setTitle:@"增加" forState:UIControlStateNormal];
     [self.addButton addTarget:self action:@selector(pressAdd) forControlEvents:UIControlEventTouchUpInside];
     [self.view addSubview:self.addButton];
     
     //deleteButton
     self.deleteButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
     self.deleteButton.frame = CGRectMake(264, 470, 90, 37);
     self.deleteButton.layer.cornerRadius = 7;
     self.deleteButton.layer.borderColor = [UIColor whiteColor].CGColor;
     [self.deleteButton.layer setMasksToBounds:YES];
     self.deleteButton.layer.borderWidth = 1.3;
     self.deleteButton.titleLabel.font = [UIFont systemFontOfSize:17];
     self.deleteButton.tintColor = [UIColor whiteColor];
     
     [self.deleteButton setTitle:@"删除" forState:UIControlStateNormal];
     [self.deleteButton addTarget:self action:@selector(pressDelete) forControlEvents:UIControlEventTouchUpInside];
     [self.view addSubview:self.deleteButton];
     
     //modifyButton
     self.modifyButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
     self.modifyButton.frame = CGRectMake(60, 525, 90, 37);
     self.modifyButton.layer.cornerRadius = 7;
     self.modifyButton.layer.borderColor = [UIColor whiteColor].CGColor;
     [self.modifyButton.layer setMasksToBounds:YES];
     self.modifyButton.layer.borderWidth = 1.3;
     self.modifyButton.titleLabel.font = [UIFont systemFontOfSize:17];
     self.modifyButton.tintColor = [UIColor whiteColor];
     
     [self.modifyButton setTitle:@"修改" forState:UIControlStateNormal];
     [self.modifyButton addTarget:self action:@selector(pressModify) forControlEvents:UIControlEventTouchUpInside];
     [self.view addSubview:self.modifyButton];
     
     
     //searchButton
     self.searchButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
     self.searchButton.frame =CGRectMake(264, 525, 90, 37);
     self.searchButton.layer.cornerRadius = 7;
     self.searchButton.layer.borderWidth = 1.3;
     [self.searchButton.layer setMasksToBounds:YES];
     self.searchButton.layer.borderColor = [UIColor whiteColor].CGColor;
     self.searchButton.titleLabel.font = [UIFont systemFontOfSize:17];
     self.searchButton.tintColor= [UIColor whiteColor];
     
     [self.searchButton setTitle:@"查询" forState:UIControlStateNormal];
     [self.searchButton addTarget:self action:@selector(pressSearch) forControlEvents:UIControlEventTouchUpInside];
     [self.view addSubview:self.searchButton];
     
     //退出
     self.quitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
     self.quitButton.frame = CGRectMake(150, 585, 115, 40);
     self.quitButton.layer.cornerRadius = 7;
     self.quitButton.layer.borderWidth = 1.3;
    // self.quitButton.layer.borderColor = [UIColor whiteColor].CGColor;
     [self.quitButton.layer setMasksToBounds:YES];
     self.quitButton.titleLabel.font = [UIFont systemFontOfSize:18];
     self.quitButton.tintColor = [UIColor whiteColor];
     self.quitButton.backgroundColor = [UIColor colorWithRed:0.8 green:0.1 blue:0.1 alpha:1];
     
     [self.quitButton setTitle:@"退出" forState:UIControlStateNormal];
     [self.quitButton addTarget:self action:@selector(pressQuit) forControlEvents:UIControlEventTouchUpInside];
     [self.view addSubview:self.quitButton];
     
    
    
    UILabel *titlelabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 60, 394, 40)];
    titlelabel.text = @"       姓名          班级            学号             分数";
    titlelabel.textColor = [UIColor whiteColor];
    titlelabel.font = [UIFont systemFontOfSize:19];
    [self.view addSubview:titlelabel];
    
    //tableView
     self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(35, 102, 374, 355) style:UITableViewStylePlain];
     self.tableView.backgroundColor = [UIColor clearColor];
     self.tableView.delegate = self;
     self.tableView.dataSource = self;
     [self.tableView registerClass:[StuTableViewCell class] forCellReuseIdentifier:@"ft"];
    self.tableView.backgroundColor = [UIColor clearColor];
  
    
     [self.view addSubview:self.tableView];
     
    
}




- (void)pressAdd {
    
    AddViewController *addView = [[AddViewController  alloc] init];
    
    addView.addDelegate = self;
    addView.nameArr = _nameArr;
    addView.classArr = _classArr;
    addView.numArr = _numArr;
    addView.scoreArr = _scoreArr;
    
    addView.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:addView animated:YES completion:nil];
    
}

- (void)content:(Student *)student {
    [self.nameArr addObject:student.nameStr];
    [self.classArr addObject:student.classStr];
    [self.numArr addObject:student.numStr];
    [self.scoreArr addObject:student.scoreStr];
    [self.tableView reloadData];
}

//删除点击事件
- (void)pressDelete {
    DeleteViewController *deleteView = [[DeleteViewController alloc] init];
    deleteView.modalPresentationStyle = UIModalPresentationFullScreen;
    //设置代理人
    deleteView.delegate = self;
    //属性传值
    deleteView.nameArr = _nameArr;
    deleteView.classArr = _classArr;
    deleteView.numArr = _numArr;
    deleteView.scoreArr = _scoreArr;
    [self presentViewController:deleteView animated:YES completion:nil];
    
}

//实现删除协议方法
- (void)deleteContent:(NSMutableArray *)nameArr andClass:(NSMutableArray *)classArr andNum:(NSMutableArray *)numArr andScore:(NSMutableArray *)scoreArr {
    
    _nameArr = nameArr;
    _classArr = classArr;
    _numArr = numArr;
    _scoreArr = scoreArr;
    [_tableView reloadData];
    
}



//修改 点击事件
- (void)pressModify {

     //警告框
     UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"输入要修改的学生姓名" preferredStyle:UIAlertControllerStyleAlert];

     //确定按钮
     [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
             //获取输入框
             UITextField *nameField = alert.textFields.firstObject;

             //判断是否存在该学生
             int i = 0;
         for(; i < self.nameArr.count; i++) {
                 if([nameField.text isEqualToString:_nameArr[i]]) {
                     break;
                 }
             }


             if(i == _nameArr.count) {
                 UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"未找到该学生" preferredStyle:UIAlertControllerStyleAlert];
                 UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                     // [self dismissViewControllerAnimated:YES completion:nil];
                 }];
                 [alert addAction:sure];
                 [self presentViewController:alert animated:NO completion:nil];
             } else {
                 ModifyViewController *modifyView = [[ModifyViewController alloc] init];
                 modifyView.modalPresentationStyle = UIModalPresentationFullScreen;
                 //设置代理
                 modifyView.delegate = self;
                 //属性传值
                 modifyView.nameStr = nameField.text;
                 modifyView.numstr = [NSString stringWithString:_numArr[i]];
                 modifyView.t = i;

                 modifyView.nameArr = _nameArr;
                 modifyView.classArr = _classArr;
                 modifyView.numArr = _numArr;
                 modifyView.scoreArr = _scoreArr;

                 modifyView.modalPresentationStyle = UIModalPresentationFullScreen;
                 [self presentViewController:modifyView animated:YES completion:nil];
             }
         }]];

     //取消按钮
     [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];

     //定义输入框
     [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
         textField.placeholder = @"请输入学生姓名";
     }];

     [self presentViewController:alert animated:YES completion:nil];
}


//修改协议方法
- (void)modifyContent:(NSMutableArray *)nameArr andClass:(NSMutableArray *)classArr andNum:(NSMutableArray *)numArr andScore:(NSMutableArray *)scoreArr {
    _nameArr = nameArr;
    _classArr = classArr;
    _numArr = numArr;
    _scoreArr = scoreArr;
    [_tableView reloadData];
}


// 查找的点击事件
- (void)pressSearch {
    
    //警告框
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"输入要查找的学生姓名" preferredStyle:UIAlertControllerStyleAlert];

    //确定按钮
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //获取输入框
            UITextField *nameField = alert.textFields.firstObject;

            //判断是否存在该学生
            int i = 0;
            for(; i < _nameArr.count; i++) {
                if([nameField.text isEqualToString:_nameArr[i]]) {
                    break;
                }
            }


            if(i == _nameArr.count) {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"未找到该学生" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                    // [self dismissViewControllerAnimated:YES completion:nil];
                }];
                [alert addAction:sure];
                [self presentViewController:alert animated:NO completion:nil];
            } else {
                SearchViewController *searchView = [[SearchViewController alloc] init];
                searchView.modalPresentationStyle = UIModalPresentationFullScreen;
                //属性传值
                searchView.nameStr = nameField.text;
                searchView.classStr = _classArr[i];
                searchView.numStr = _numArr[i];
                searchView.scoreStr = [NSString stringWithString:_scoreArr[i]];
                
                searchView.modalPresentationStyle = UIModalPresentationFullScreen;
                [self presentViewController:searchView animated:YES completion:nil];
            }
        }]];

    //取消按钮
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];

    //定义输入框
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入学生姓名";
    }];

    [self presentViewController:alert animated:YES completion:nil];
   
}




//退出
- (void)pressQuit {
    exit(0);
    //[self dismissViewControllerAnimated:YES completion:nil];
    
}
 
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   // NSLog(@"%ld", [self.name count]);
    return [self.nameArr count];
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    StuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ft" forIndexPath:indexPath];
    //cell.nameLabel.text = @"小红";
    //cell.classLabel.text = @"1";
//    cell.numLabel.text = @"1001";
//    cell.scoreLabel.text = @"12";

    cell.nameLabel.text = self.nameArr[indexPath.row];
    cell.classLabel.text = self.classArr[indexPath.row];
    cell.numLabel.text = self.numArr[indexPath.row];
    cell.scoreLabel.text = self.scoreArr[indexPath.row];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}


@end
