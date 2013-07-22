//
//  AppDelegate.m
//  Partitioner
//
//  Created by Jon Hester on 11/11/12.
//  Copyright (c) 2012 Jon Hester. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
   
}

-(void)copyToClipboard:(NSString*)str
{
    NSPasteboard *pb = [NSPasteboard generalPasteboard];
    NSArray *types = [NSArray     arrayWithObjects:NSStringPboardType, nil];
    [pb declareTypes:types owner:self];
    [pb setString: str forType:NSStringPboardType];
}


- (NSString*)genLine {
    
    NSString *output = [NSString stringWithFormat:@"diskutil partitionDisk %@ %ld GPT ",[_mount stringValue],[_numPartitions integerValue]*2+[_numTriages integerValue]];
    NSString *temp;
    
    NSInteger numTriage = [_numTriages integerValue];
    for (int i = 0; i < numTriage; i++) {
        temp = [NSString stringWithFormat:@"HFS+ %@%d %dG ",[_namingSchemeTriage stringValue],i+1,[_sizeTriage intValue]];
        output = [output stringByAppendingString:temp];
    }
    
    NSInteger parts = [_numPartitions integerValue];
    for (int i = 0; i < parts; i++) {
        temp = [NSString stringWithFormat:@"HFS+ %@%d %dG HFS+ %@%d %dG ",[_namingScheme stringValue],i+1,[_size intValue],[_namingScheme2 stringValue],i+1,[_sizeEFI intValue]];
        output = [output stringByAppendingString:temp];
    }
    
    return output;
}

- (IBAction)generate:(id)sender {
    NSLog(@"Generate Button Pressed");
    
    [_output setString:[self genLine]];
    
    
}

- (IBAction)clip:(id)sender {
    NSLog(@"Clipboard Button Pressed");
    
    NSString *result = [self genLine];
    
    [_output setString:result];
    [self copyToClipboard:result];
    
}

- (IBAction)runTerm:(id)sender {
    NSLog(@"Run Button Pressed");
        
    NSString *result = [self genLine];
    
    [_output setString:result];
    [self copyToClipboard:result];
    
    NSString *s = [NSString stringWithFormat:@"tell application \"Terminal\" to do script \"%@\"", result];
    NSAppleScript *as = [[NSAppleScript alloc] initWithSource: s];
    [as executeAndReturnError:nil];
}
@end
