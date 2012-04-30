//
//  CCBXAndEngineXml.h
//  CCBAndEngineXml
//
//  Created by Nicolas Gramlich on 4/27/12.
//  Copyright (c) 2012 Zynga. All rights reserved.
//

#import "CCBX.h"
#import "XMLWriter.h"

#define CCB_VERSION 3
#define CCB_FILEVERSION @"fileVersion"
#define CCB_STAGE_WIDTH @"stageWidth"
#define CCB_STAGE_HEIGHT @"stageHeight"
#define CCB_CENTEREDORIGIN @"centeredOrigin"

#define CCB_BASECLASS @"baseClass"
#define CCB_CUSTOMCLASS @"customClass"

#define CCBAEX_VERSION 1
#define CCBAEX_FILE_EXTENSION @"ccbaex"

#define CCBAEX_TAG_CCB @"CCB"
#define CCBAEX_TAG_CCB_ATTRIBUTE_STAGE_HEIGHT @"stageHeight"
#define CCBAEX_TAG_CCB_ATTRIBUTE_STAGE_WIDTH @"stageWidth"
#define CCBAEX_TAG_CCB_ATTRIBUTE_CENTERED_ORIGIN @"centeredOrigin"
#define CCBAEX_TAG_CCB_ATTRIBUTE_VERSION @"version"

@interface CCBXAndEngineXml : CCBX

- (void) exportNodes:(NSArray *)pNodes withXMLWriter:(XMLWriter *)pXMLWriter;
- (void) exportNode:(NSDictionary *)pNode withXMLWriter:(XMLWriter *)pXMLWriter;

@end
