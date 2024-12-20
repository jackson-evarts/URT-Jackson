//
//  GameSimulationViewManager.swift
//  UltimateRugbyTrainer
//
//  Created by Jackson Evarts on 10/9/24.
//

import SwiftUI
import Foundation

struct BouncingSlider: View {
    @Binding var value: Double // The current value of the slider (1-5)
    
    var range: ClosedRange<Double> = 1...5 // Default range from 1 to 5
    var step: Double = 1 // Slider step size
    
    var thumbSize: CGFloat = 20 // Size of the thumb
    
    @State private var isDragging: Bool = false // To track if the user is dragging
    
    var body: some View {
        GeometryReader { geometry in
            let sliderWidth = geometry.size.width - thumbSize // Width of the track minus the thumb's width
            let thumbPosition = CGFloat((value - range.lowerBound) / (range.upperBound - range.lowerBound)) * sliderWidth
            
            ZStack(alignment: .leading) {
                // Track background
                Rectangle()
                    .fill(Color.lightGrey.opacity(0.5))
                    .frame(height: 6)
                    .cornerRadius(3)
                
                // Filled track
                Rectangle()
                    .fill(Color.primaryGold)
                    .frame(width: thumbPosition + thumbSize / 2, height: 6)
                    .cornerRadius(3)
                
                // Thumb (draggable)
                Circle()
                    .fill(Color.primaryGold)
                    .frame(width: thumbSize, height: thumbSize)
                    .overlay(
                        Circle().stroke(Color.charcoalGrey, lineWidth: 3.5) // Add border to thumb
                    )
                    .offset(x: thumbPosition)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                // Calculate new value based on drag position
                                let newValue = min(max(gesture.location.x / sliderWidth * (range.upperBound - range.lowerBound) + range.lowerBound, range.lowerBound), range.upperBound)
                                value = newValue
                                isDragging = true
                            }
                            .onEnded { _ in
                                // Snap to nearest value and animate
                                withAnimation(.interpolatingSpring(stiffness: 300, damping: 10)) {
                                    value = round(value / step) * step // Snap to nearest step
                                }
                                isDragging = false
                            }
                    )
            }
            .padding(.horizontal, thumbSize / 2) // Padding to keep thumb within bounds
        }
        .frame(height: 40) // Height of the slider
    }
}
