//
//  NSData+JOAdditions.m
//  liulianclient
//
//  Created by Joost💟Blair on 5/6/13.
//  Copyright (c) 2013 joojoo. All rights reserved.
//

#import "NSData+JOAdditions.h"

@implementation NSData(JOAdditions)
- (NSString *) hexString
{
    const char * bytes = self.bytes;
    const char hexbase[] = "0123456789abcdef";
    char * hexval = malloc(sizeof(char) * self.length*2+1);
    NSString * t = nil;
    if (hexval)
    {
        for (int i =0; i< self.length; ++i)
        {
            hexval[2*i] =hexbase[bytes[i]>>4 & 0xf];
            hexval[2*i+1] = hexbase[bytes[i] & 0x0f];
        }
        hexval[self.length*2+1]='\0';
        t = [NSString stringWithCString:hexval encoding:NSASCIIStringEncoding];
        free(hexval);
    }
    return t;
}
@end
