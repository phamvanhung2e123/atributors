//
//  TextStatsViewController.m
//  ;
//
//  Created by phamvanhung on 2014/10/14.
//  Copyright (c) 2014年 phamvanhung. All rights reserved.
//

#import "TextStatsViewController.h"

@interface TextStatsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *colorfulCharacterLabel;
@property (weak, nonatomic) IBOutlet UILabel *outlineCharacterLabel;

@end

@implementation TextStatsViewController

- (void)setTextToAnalyze:(NSAttributedString *)textToAnalyze
{
    _textToAnalyze = textToAnalyze;
    if(self.view.window) [self updateUI];
}

- (void)updateUI
{
    self.outlineCharacterLabel.text = [NSString stringWithFormat: @"%lu colorful characters", [[self charactersWithAttribute:NSForegroundColorAttributeName] length]];
    self.colorfulCharacterLabel.text = [NSString stringWithFormat: @"%lu outline characters", [[self charactersWithAttribute:NSStrokeWidthAttributeName] length]];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUI];
}


- (NSAttributedString *)charactersWithAttribute:(NSString *)attributeName
{
    NSMutableAttributedString *characters = [[NSMutableAttributedString alloc] init];
    int index = 0;
    while ((index < [self.textToAnalyze length])) {
        NSRange range;
        id value = [self.textToAnalyze attribute:attributeName atIndex:index effectiveRange:&range];
        if(value){
            [characters appendAttributedString:[self.textToAnalyze attributedSubstringFromRange:range]];
            index = (int)(range.location + range.length);
            
        }else{
            index++;
            
        }
        
    }
    return characters;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
