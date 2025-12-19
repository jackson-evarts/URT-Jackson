//
//  BroncoWorkoutSummaryView.swift
//  URT-Jackson
//
//  Created by Jackson Evarts on 1/11/25.
//

import SwiftUI

struct BroncoWorkoutSummaryView: View {
    let splits: [String]
    @Environment(\.dismiss) var dismiss
    let workout: String
    // Binding used to signal the parent PlayView to also dismiss when returning to workout selection
    @Binding var dismissToWorkoutSelection: Bool

    @State private var capturedImage: UIImage? = nil
    @State private var showCamera: Bool = false

    var body: some View {

        ZStack{

            Color.lightGrey // Background color
                .edgesIgnoringSafeArea(.all) // Fill entire background

            ScrollView {
                VStack {
                    TitlePage(title: "Workout Summary")

                    // Display the workout type
                    Text("Workout: \(workout)")
                        .font(.custom("Futura-Bold", size: 24))
                        .foregroundColor(.charcoalGrey)
                        .padding(.top, 10)
                        .padding(.bottom, 5)

                    // Display splits
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(Array(splits.enumerated()), id: \.offset) { index, split in
                            HStack {
                                Text("Set \(index + 1):")
                                    .font(.custom("Futura-Bold", size: 18))
                                    .foregroundColor(.charcoalGrey)
                                Spacer()
                                Text(split)
                                    .font(.custom("Futura", size: 20))
                                    .foregroundColor(.charcoalGrey)
                            }
                            .padding(.horizontal, UIScreen.main.bounds.width * 0.1)
                            .padding(.vertical, 5)
                            .background(Color.white)
                            .cornerRadius(8)
                        }
                    }
                    .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
                    .padding(.top, 5)

                // Camera button
                Button(action: {
                    showCamera = true
                }) {
                    HStack {
                        Image(systemName: "camera.fill")
                            .font(.system(size: 20))
                        Text("Take a Selfie")
                            .font(.custom("Futura", size: 18))
                    }
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.charcoalGrey)
                    .cornerRadius(10)
                    .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
                }
                .padding(.top, 10)

                // Display captured image if available
                if let image = capturedImage {
                    VStack {
                        Text("Your Victory Selfie:")
                            .font(.custom("Futura-Bold", size: 18))
                            .foregroundColor(.charcoalGrey)
                            .padding(.top, 10)

                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width * 0.9, height: 300)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.charcoalGrey, lineWidth: 3)
                            )
                            .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
                    }
                }


                    Button(action: {
                        // Two-step dismissal to return to BroncoWorkoutsView:
                        dismiss() // 1. Dismiss this SummaryView
                        dismissToWorkoutSelection = true // 2. Signal PlayView to also dismiss via binding
                    }) {
                        Text("Return to Workout Selection")
                            .font(.custom("Futura", size: 24))
                            .foregroundColor(.lightGrey)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.primaryGold)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.charcoalGrey, lineWidth: 5)
                            )
                            .padding(.horizontal, UIScreen.main.bounds.width * 0.05) // Dynamic horizontal padding
                    }
                    .padding(.bottom, 20)
                    .padding(.top, 10)

                    // TODO: [Feature] Make this share button sexy and functional. Maybe it should work kind of like spotify's share button where it pops up with the option to save the image somewhere? Far out idea.
                    /*
                    Button(action: {
                        // Handle share or save logic here
                    }) {
                        Text("Share Your Splits!")
                            .font(.custom("Futura", size: 20))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.gray)
                            .cornerRadius(10)
                    }
                    .padding(.top, 20)
                    */


                } // End VStack
            } // End ScrollView
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("Good Job!", displayMode: .inline)
        .sheet(isPresented: $showCamera) {
            CameraPickerView(image: $capturedImage)
        }
    }
}


// Camera Picker wrapper for UIImagePickerController
struct CameraPickerView: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.dismiss) var dismiss

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.cameraDevice = .front // Use front camera for selfies
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: CameraPickerView

        init(_ parent: CameraPickerView) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                parent.image = selectedImage
            }
            parent.dismiss()
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.dismiss()
        }
    }
}


#Preview {
    BroncoWorkoutSummaryView(splits: ["00:50","00:43","00:51","00:43","1:02"], workout: "1-1-1-1-1", dismissToWorkoutSelection: .constant(false))
        .environmentObject(GlobalAudioTimerManager())
}
