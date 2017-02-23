//
//  ViewController.m
//  TextField
//
//  Created by 朱明灿 on 17/2/22.
//  Copyright © 2017年 张佳强. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property(strong,nonatomic)UITextField * textField;
@property(strong,nonatomic)UITextView * textView1;
@property(strong,nonatomic)UITextView * textView2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.textField.placeholder = @"限制长度为5";
    [_textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self textView2];
    [self textView1];
    
}


-(UITextField *)textField{
    if (!_textField) {
        _textField = [[UITextField alloc]initWithFrame:CGRectMake(100, 50, 180, 40)];
        _textField.delegate = self;
        [self.view addSubview:_textField];
    }
    return _textField;
}

-(UITextView *)textView1{
    if (!_textView1) {
        _textView1 = [[UITextView alloc]initWithFrame:CGRectMake(60, 100, 200, 200)];
        _textView1.backgroundColor = [UIColor brownColor];
        [self.view addSubview:_textView1];
    }
    return _textView1;
}
-(UITextView *)textView2{
    if (!_textView2) {
        _textView2 = [[UITextView alloc]initWithFrame:CGRectMake(60, 350, 200, 150)];
        _textView2.backgroundColor = [UIColor brownColor];
        [self.view addSubview:_textView2];
    }
    return _textView2;
}
-(void)textFieldDidChange:(UITextField *)textField{
    NSString * str = textField.text;
    NSString * lang = textField.textInputMode.primaryLanguage;
    if ([lang isEqualToString:@"zh-Hans"]) {
        UITextRange * selectedRange = [textField markedTextRange];
        if (!selectedRange && str.length>5) {
            textField.text = [str substringToIndex:5];
        }
    }else if (str.length>5){
        textField.text = [str substringToIndex:5];
    }
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_textField resignFirstResponder];
    [_textView1 resignFirstResponder];
    [_textView2 resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
