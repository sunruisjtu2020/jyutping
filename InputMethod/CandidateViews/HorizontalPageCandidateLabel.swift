import SwiftUI
import CoreIME
import CommonExtensions

struct HorizontalPageCandidateLabel: View {
        init(isHighlighted: Bool, index: Int, candidate: DisplayCandidate, commentStyle: CommentDisplayStyle, toneStyle: ToneDisplayStyle, toneColor: ToneDisplayColor, labelSet: LabelSet, isLabelLastZero: Bool, compatibleMode: Bool) {
                self.label = LabelSet.labelText(for: index, labelSet: labelSet, isLabelLastZero: isLabelLastZero)
                self.labelOpacity = isHighlighted ? 1 : 0.75
                self.candidate = candidate
                self.commentStyle = commentStyle
                self.toneStyle = toneStyle
                self.shallowTone = toneColor.isShallow
                self.compatibleMode = compatibleMode
        }
        private let label: String
        private let labelOpacity: Double
        private let candidate: DisplayCandidate
        private let commentStyle: CommentDisplayStyle
        private let toneStyle: ToneDisplayStyle
        private let shallowTone: Bool
        private let compatibleMode: Bool
        var body: some View {
                switch candidate.candidate.type {
                case .cantonese:
                        switch commentStyle {
                        case .top:
                                HStack(alignment: .lastTextBaseline, spacing: 2) {
                                        Text(verbatim: label).font(.label).opacity(labelOpacity)
                                        TopCommentStackView(text: candidate.text, romanization: candidate.comment ?? String.space, toneStyle: toneStyle, shallowTone: shallowTone, compatibleMode: compatibleMode)
                                }
                        case .bottom:
                                HStack(alignment: .firstTextBaseline, spacing: 2) {
                                        Text(verbatim: label).font(.label).opacity(labelOpacity)
                                        BottomCommentStackView(text: candidate.text, romanization: candidate.comment ?? String.space, toneStyle: toneStyle, shallowTone: shallowTone, compatibleMode: compatibleMode)
                                }
                        case .right:
                                HStack(spacing: 4) {
                                        Text(verbatim: label).font(.label).opacity(labelOpacity)
                                        Text(verbatim: candidate.text).font(.candidate)
                                        RightStackRomanizationLabel(romanization: candidate.comment ?? String.space, toneStyle: toneStyle, shallowTone: shallowTone, compatibleMode: compatibleMode)
                                }
                        case .noComments:
                                HStack(spacing: 4) {
                                        Text(verbatim: label).font(.label).opacity(labelOpacity)
                                        Text(verbatim: candidate.text).font(.candidate)
                                }
                        }
                case .text:
                        HStack(spacing: 4) {
                                Text(verbatim: label).font(.label).opacity(labelOpacity)
                                Text(verbatim: candidate.text).font(.candidate)
                        }
                        .padding(.top, commentStyle == .top ? 8 : 0)
                        .padding(.bottom, commentStyle == .bottom ? 8 : 0)
                case .emoji, .symbol:
                        HStack(spacing: 4) {
                                Text(verbatim: label).font(.label).opacity(labelOpacity)
                                Text(verbatim: candidate.text).font(.candidate)
                                Text(verbatim: candidate.comment ?? String.empty).font(.annotation)
                        }
                        .padding(.top, commentStyle == .top ? 8 : 0)
                        .padding(.bottom, commentStyle == .bottom ? 8 : 0)
                case .compose:
                        HStack(spacing: 4) {
                                Text(verbatim: label).font(.label).opacity(labelOpacity)
                                Text(verbatim: candidate.text).font(.candidate)
                                if let comment = candidate.comment {
                                        Text(verbatim: comment).font(.annotation).opacity(0.8)
                                }
                                if let secondaryComment = candidate.secondaryComment {
                                        Text(verbatim: secondaryComment).font(.annotation).opacity(0.8)
                                }
                        }
                }
        }
}
