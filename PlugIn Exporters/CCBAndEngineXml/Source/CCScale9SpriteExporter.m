//
//  CCScale9SpriteExporter.m
//  CCBAndEngineXml
//
//  Created by Nicolas Gramlich on 5/01/12.
//  Copyright (c) 2012 Zynga. All rights reserved.
//

#import "CCScale9SpriteExporter.h"

@implementation CCScale9SpriteExporter

- (void) exportNodeProperties:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    [super exportNodeProperties:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];

    [self exportCCScale9SpriteProperties:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
}

- (void) exportCCScale9SpriteProperties:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml 
{
//  [self exportCCNodeBlendFunction:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
    [self exportCCNodeColor:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
    [self exportCCScale9SpritePreferredSize:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
    [self exportCCScale9SpriteSpriteFrame:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
    [self exportCCScale9SpriteInsets:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
}

- (void) exportCCNodeContentSize:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    /* Nothing. */
}

- (void) exportCCScale9SpritePreferredSize:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    float preferredSizeWidth = [[self findProperty:CCB_CCSCALE9SPRITE_PROPERTY_PREFERRED_SIZE withProperties:pProperties withIndex:0] floatValue];
    float preferredSizeHeight = [[self findProperty:CCB_CCSCALE9SPRITE_PROPERTY_PREFERRED_SIZE withProperties:pProperties withIndex:1] floatValue];
    int preferredSizeTypeValue = [[self findProperty:CCB_CCSCALE9SPRITE_PROPERTY_PREFERRED_SIZE withProperties:pProperties withIndex:2] intValue];
    NSString * preferredSizeType = [self convertSizeTypeValueToSizeType:preferredSizeTypeValue];

    [pXMLWriter writeAttribute:CCBAEX_TAG_CCSCALE9SPRITE_ATTRIBUTE_PREFERRED_SIZE_WIDTH value:[[NSNumber numberWithFloat:preferredSizeWidth] stringValue]];
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCSCALE9SPRITE_ATTRIBUTE_PREFERRED_SIZE_HEIGHT value:[[NSNumber numberWithFloat:preferredSizeHeight] stringValue]];
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCSCALE9SPRITE_ATTRIBUTE_PREFERRED_SIZE_TYPE value:preferredSizeType];
}

- (void) exportCCScale9SpriteSpriteFrame:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    NSString * spriteSheet = [self findProperty:CCB_CCSCALE9SPRITE_PROPERTY_SPRITEFRAME withProperties:pProperties withIndex:0];
    NSString * spriteFrame = [self findProperty:CCB_CCSCALE9SPRITE_PROPERTY_SPRITEFRAME withProperties:pProperties withIndex:1];

    if(spriteSheet != nil && [spriteSheet length] > 0) {
        NSString * andEngineTexturePack = [spriteSheet stringByReplacingOccurrencesOfString:@".plist" withString:@".xml"];
        [pXMLWriter writeAttribute:CCBAEX_TAG_CCSCALE9SPRITE_ATTRIBUTE_TEXTUREPACK value:andEngineTexturePack];
    }
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCSCALE9SPRITE_ATTRIBUTE_TEXTUREREGION value:spriteFrame];
}

- (void) exportCCScale9SpriteInsets:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    float left = [[self findProperty:CCB_CCSCALE9SPRITE_PROPERTY_INSET_LEFT withProperties:pProperties] floatValue];
    float top = [[self findProperty:CCB_CCSCALE9SPRITE_PROPERTY_INSET_TOP withProperties:pProperties] floatValue];
    float right = [[self findProperty:CCB_CCSCALE9SPRITE_PROPERTY_INSET_RIGHT withProperties:pProperties] floatValue];
    float bottom = [[self findProperty:CCB_CCSCALE9SPRITE_PROPERTY_INSET_BOTTOM withProperties:pProperties] floatValue];

    [pXMLWriter writeAttribute:CCBAEX_TAG_CCSCALE9SPRITE_ATTRIBUTE_INSET_LEFT value:[[NSNumber numberWithFloat:left] stringValue]];
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCSCALE9SPRITE_ATTRIBUTE_INSET_TOP value:[[NSNumber numberWithFloat:top] stringValue]];
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCSCALE9SPRITE_ATTRIBUTE_INSET_RIGHT value:[[NSNumber numberWithFloat:right] stringValue]];
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCSCALE9SPRITE_ATTRIBUTE_INSET_BOTTOM value:[[NSNumber numberWithFloat:bottom] stringValue]];
}

@end
