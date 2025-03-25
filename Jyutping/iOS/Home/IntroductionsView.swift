#if os(iOS)

import SwiftUI

struct IntroductionsView: View {
        var body: some View {
                List {
                        Section {
                                Text("IOSHomeTab.IntroductionsView.Heading.ClearPreEdit").font(.headline)
                                Text("IOSHomeTab.IntroductionsView.Body.ClearPreEdit")
                        }
                        Section {
                                Text("IOSHomeTab.IntroductionsView.Heading.ForgetCandidate").font(.headline)
                                Text("IOSHomeTab.IntroductionsView.Body.ForgetCandidate")
                        }
                        Section {
                                Text("IOSHomeTab.IntroductionsView.Heading.PositionInsertionPoint").font(.headline)
                                Text("IOSHomeTab.IntroductionsView.Body.PositionInsertionPoint")
                        }

                        // TODO: Double-space shortcut
                        #if DEBUG
                        Section {
                                Text("IOSHomeTab.IntroductionsView.Heading.SpaceDoubleTapping").font(.headline)
                                Text("IOSHomeTab.IntroductionsView.Body.SpaceDoubleTapping")
                        }
                        #endif

                        Section {
                                Text("IOSHomeTab.IntroductionsView.Heading.TripleStrokeKeyboard").font(.headline)
                                Text("IOSHomeTab.IntroductionsView.Body.TripleStrokeKeyboard.Row1")
                                Text("IOSHomeTab.IntroductionsView.Body.TripleStrokeKeyboard.Row2")
                        }
                }
                .textSelection(.enabled)
                .navigationTitle("IOSHomeTab.NavigationTitle.MoreIntroductions")
                .navigationBarTitleDisplayMode(.inline)
        }
}

#endif
