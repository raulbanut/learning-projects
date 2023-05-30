//
//  Font+Extensions.swift
//  MoneyTracker
//
//  Created by Banut Raul on 30.05.2023.
//

import Foundation
import UIKit
import SwiftUI

fileprivate enum MainFontName: String {
    case roboto_regular = "Roboto-Regular"
    case roboto_medium = "Roboto-Medium"
    case roboto_bold = "Roboto-Bold"
}

extension Font {
    
    /// Roboto
    struct Main {
        static func regular(_ size: CGFloat) -> Font {
            Font.custom(MainFontName.roboto_regular.rawValue, size: size)
        }
        
        static func medium(_ size: CGFloat) -> Font {
            Font.custom(MainFontName.roboto_medium.rawValue, size: size)
        }
        
        static func bold(_ size: CGFloat = 34) -> Font {
            Font.custom(MainFontName.roboto_bold.rawValue, size: size)
        }
        
        //MARK: - Regular
        struct Regular {
            /// Roboto-Regular
            /// 44px
            static var largeTitle: Font {
                regular(44)
            }
            
            /// Roboto-Regular
            /// 38px
            static var title1: Font {
                regular(38)
            }
            
            /// Roboto-Regular
            /// 34px
            static var title2: Font {
                regular(34)
            }
            
            /// Roboto-Regular
            /// 31px
            static var title3: Font {
                regular(31)
            }
            
            /// Roboto-Regular
            /// 28px
            static var body: Font {
                regular(28)
            }
            
            /// Roboto-Regular
            /// 23px
            static var footnote: Font {
                regular(23)
            }
            
            /// Roboto-Regular
            /// 22px
            static var caption1: Font {
                regular(22)
            }
            
            /// Roboto-Regular
            /// 20px
            static var caption2: Font {
                regular(20)
            }
        }
        
        //MARK: - Medium
        struct Medium {
            /// Roboto-Medium
            /// 44px
            static var largeTitle: Font {
                medium(44)
            }
            
            /// Roboto-Medium
            /// 38px
            static var title1: Font {
                medium(38)
            }
            
            /// Roboto-Medium
            /// 34px
            static var title2: Font {
                medium(34)
            }
            
            /// Roboto-Medium
            /// 31px
            static var title3: Font {
                medium(31)
            }
            
            /// Roboto-Medium
            /// 28px
            static var body: Font {
                medium(28)
            }
            
            /// Roboto-Medium
            /// 23px
            static var footnote: Font {
                medium(23)
            }
            
            /// Roboto-Medium
            /// 22px
            static var caption1: Font {
                medium(22)
            }
            
            /// Roboto-Medium
            /// 20px
            static var caption2: Font {
                medium(20)
            }
        }
        
        //MARK: - Bold
        
        struct Bold {
            /// Roboto-Medium
            /// 34px
            static var title2: Font {
                bold(34)
            }
            
            /// Roboto-Medium
            /// 31px
            static var title3: Font {
                bold(31)
            }
            
            /// Roboto-Medium
            /// 28px
            static var body: Font {
                bold(28)
            }
            
            /// Roboto-Medium
            /// 20px
            static var caption2: Font {
                bold(20)
            }
        }
    }
}
