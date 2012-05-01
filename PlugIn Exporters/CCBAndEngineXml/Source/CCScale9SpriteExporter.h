//
//  CCScale9SpriteExporter.h
//  CCBAndEngineXml
//
//  Created by Nicolas Gramlich on 5/01/12.
//  Copyright (c) 2012 Zynga. All rights reserved.
//

#import "CCNodeExporter.h"

#define CCB_CCSCALE9SPRITE_CLASS_NAME @"CCScale9Sprite"

#define CCB_CCSCALE9SPRITE_PROPERTY_SPRITEFRAME @"spriteFrame"
#define CCB_CCSCALE9SPRITE_PROPERTY_INSET_LEFT @"insetLeft"
#define CCB_CCSCALE9SPRITE_PROPERTY_INSET_TOP @"insetTop"
#define CCB_CCSCALE9SPRITE_PROPERTY_INSET_RIGHT @"insetRight"
#define CCB_CCSCALE9SPRITE_PROPERTY_INSET_BOTTOM @"insetBottom"
#define CCB_CCSCALE9SPRITE_PROPERTY_PREFERRED_SIZE @"preferedSize"

#define CCBAEX_TAG_CCSCALE9SPRITE_ATTRIBUTE_TEXTUREPACK @"texturePack"
#define CCBAEX_TAG_CCSCALE9SPRITE_ATTRIBUTE_TEXTUREREGION @"textureRegion"

#define CCBAEX_TAG_CCSCALE9SPRITE_ATTRIBUTE_PREFERRED_SIZE_WIDTH @"preferredSizeWidth"
#define CCBAEX_TAG_CCSCALE9SPRITE_ATTRIBUTE_PREFERRED_SIZE_HEIGHT @"preferredSizeHeight"
#define CCBAEX_TAG_CCSCALE9SPRITE_ATTRIBUTE_PREFERRED_SIZE_TYPE @"preferredSizeType"

#define CCBAEX_TAG_CCSCALE9SPRITE_ATTRIBUTE_INSET_LEFT @"insetLeft"
#define CCBAEX_TAG_CCSCALE9SPRITE_ATTRIBUTE_INSET_TOP @"insetTop"
#define CCBAEX_TAG_CCSCALE9SPRITE_ATTRIBUTE_INSET_RIGHT @"insetRight"
#define CCBAEX_TAG_CCSCALE9SPRITE_ATTRIBUTE_INSET_BOTTOM @"insetBottom"

@interface CCScale9SpriteExporter : CCNodeExporter

- (void) exportCCScale9SpriteProperties:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;

- (void) exportCCScale9SpritePreferredSize:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;
- (void) exportCCScale9SpriteSpriteFrame:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;
- (void) exportCCScale9SpriteInsets:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;

@end
