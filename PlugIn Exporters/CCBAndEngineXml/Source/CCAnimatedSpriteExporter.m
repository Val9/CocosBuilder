//
//  CCAnimatedSpriteExporter.m
//  CCBAndEngineXml
//
//  Created by Nicolas Gramlich on 5/18/12.
//  Copyright (c) 2012 Zynga. All rights reserved.
//

#import "CCAnimatedSpriteExporter.h"

@implementation CCAnimatedSpriteExporter

- (void) exportNodeProperties:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    [super exportNodeProperties:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];

    [self exportCCAnimatedSpriteProperties:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
}

- (void) exportCCAnimatedSpriteProperties:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml 
{
    [self exportCCAnimatedSpriteAnimation:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
    [self exportCCAnimatedSpriteSpeed:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
}

- (void) exportCCAnimatedSpriteAnimation:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    NSString * animationSheet = [self findProperty:CCB_CCANIMATEDSPRITE_PROPERTY_ANIMATION withProperties:pProperties withIndex:0];
    NSString * animationName = [self findProperty:CCB_CCANIMATEDSPRITE_PROPERTY_ANIMATION withProperties:pProperties withIndex:1];
    
    NSString * animationPack = [animationSheet stringByReplacingOccurrencesOfString:[@"." stringByAppendingString:CCB_ANIMATIONPLIST_EXTENSION] withString:[@"." stringByAppendingString:CCBAEX_ANIMATIONPACK_EXTENSION]];
    
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCANIMATEDSPRITE_ANIMATIONPACK value:animationPack];
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCANIMATEDSPRITE_ANIMATION_NAME value:animationName];
}

- (void) exportCCAnimatedSpriteSpeed:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    float speed = [[self findProperty:CCB_CCANIMATEDSPRITE_PROPERTY_SPEED withProperties:pProperties] floatValue];

    [pXMLWriter writeAttribute:CCBAEX_TAG_CCANIMATEDSPRITE_ANIMATION_SPEED value:[[NSNumber numberWithFloat:speed] stringValue]];
}

@end
