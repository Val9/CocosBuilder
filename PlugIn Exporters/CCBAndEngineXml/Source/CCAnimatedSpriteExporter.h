//
//  CCAnimatedSpriteExporter.h
//  CCBAndEngineXml
//
//  Created by Nicolas Gramlich on 5/18/12.
//  Copyright (c) 2012 Zynga. All rights reserved.
//

#import "CCSpriteExporter.h"

#define CCB_CCANIMATEDSPRITE_CLASS_NAME @"CCAnimatedSprite"

#define CCB_CCANIMATEDSPRITE_PROPERTY_ANIMATION @"animation"
#define CCB_CCANIMATEDSPRITE_PROPERTY_SPEED @"speed"

#define CCBAEX_TAG_CCANIMATEDSPRITE_ANIMATIONPACK @"animationPack"
#define CCBAEX_TAG_CCANIMATEDSPRITE_ANIMATION_NAME @"animationName"
#define CCBAEX_TAG_CCANIMATEDSPRITE_ANIMATION_SPEED @"animationSpeed"

@interface CCAnimatedSpriteExporter : CCSpriteExporter

- (void) exportCCAnimatedSpriteProperties:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;

- (void) exportCCAnimatedSpriteAnimation:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;
- (void) exportCCAnimatedSpriteSpeed:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;

@end
