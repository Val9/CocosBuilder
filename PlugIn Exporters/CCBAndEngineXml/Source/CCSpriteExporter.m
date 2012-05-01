//
//  CCSpriteExporter.m
//  CCBAndEngineXml
//
//  Created by Nicolas Gramlich on 4/30/12.
//  Copyright (c) 2012 Zynga. All rights reserved.
//

#import "CCSpriteExporter.h"

@implementation CCSpriteExporter

- (id) init
{
    return [super initWithNodeName:CCB_CCSPRITE_CLASS_NAME];
}

- (void) exportNodeProperties:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    [super exportNodeProperties:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];

    [self exportCCSpriteProperties:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
}

- (void) exportCCSpriteProperties:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml 
{
    [self exportCCNodeBlendFunction:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
    [self exportCCNodeColor:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
    [self exportCCSpriteDisplayFrame:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
    [self exportCCSpriteFlip:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
}

- (void) exportCCSpriteDisplayFrame:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    NSString * spriteSheet = [self findProperty:CCB_CCSPRITE_PROPERTY_DISPLAYFRAME withProperties:pProperties withIndex:0];
    NSString * displayFrame = [self findProperty:CCB_CCSPRITE_PROPERTY_DISPLAYFRAME withProperties:pProperties withIndex:1];

    if(spriteSheet != nil && [spriteSheet length] > 0) {
        NSString * andEngineTexturePack = [spriteSheet stringByReplacingOccurrencesOfString:@".plist" withString:@".xml"];
        [pXMLWriter writeAttribute:CCBAEX_TAG_CCSPRITE_ATTRIBUTE_TEXTUREPACK value:andEngineTexturePack];
    }
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCSPRITE_ATTRIBUTE_TEXTUREREGION value:displayFrame];
}

- (void) exportCCSpriteFlip:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    BOOL flipX = [[self findProperty:CCB_CCSPRITE_PROPERTY_FLIP withProperties:pProperties withIndex:0] boolValue];
    BOOL flipY = [[self findProperty:CCB_CCSPRITE_PROPERTY_FLIP withProperties:pProperties withIndex:1] boolValue];

    [pXMLWriter writeAttribute:CCBAEX_TAG_CCSPRITE_ATTRIBUTE_FLIPPED_HORIZONTAL value:(flipX) ? @"true" : @"false"];
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCSPRITE_ATTRIBUTE_FLIPPED_VERTICAL value:(flipY) ? @"true" : @"false"];
}

@end
