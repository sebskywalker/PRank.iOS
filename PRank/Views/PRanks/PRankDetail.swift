//
//  PRankDetail.swift
//  PRank
//
//  Created by seb's on 11/14/24.
//
import SwiftUI

struct PRankDetail: View {
    @EnvironmentObject var modelData: ModelData
    var PRank: PRank
    var isForMen: Bool

    var PRankIndex: Int {
        if isForMen {
            return modelData.menPRanks.firstIndex(where: { $0.id == PRank.id }) ?? 0
        } else {
            return modelData.womenPRanks.firstIndex(where: { $0.id == PRank.id }) ?? 0
        }
    }

    var body: some View {
        ScrollView {
            MapView(coordinate: PRank.locationCoordinates)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)

            CircleImage(image: PRank.image)
                .frame(width: 250, height: 250)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
                .offset(y: -125)
                .padding(.bottom, -125)

            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(PRank.name)
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                    FavoriteButton(isSet: isForMen
                        ? $modelData.menPRanks[PRankIndex].isFavorite
                        : $modelData.womenPRanks[PRankIndex].isFavorite
                    )
                }

                HStack {
                    Text(PRank.nickname)
                        .font(.subheadline)
                        .italic()
                    Spacer()
                    Text(PRank.state)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }

                Divider()

                Text("About \(PRank.name)")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(PRank.description)

                Divider()

                Text("Basic Information")
                    .font(.headline)
                VStack(alignment: .leading, spacing: 8) {
                    if let trainingSpot = PRank.trainingSpot {
                        Text("Training Spot: \(trainingSpot)")
                    }
                    if isForMen, let primeAge = PRank.primeAge {
                        Text("Prime Age: \(primeAge)")
                    } else if let currentAge = PRank.currentAge {
                        Text("Current Age: \(currentAge)")
                    }
                    Text("Weight: \(PRank.weightKg, specifier: "%.1f") kg (\(PRank.weightLbs, specifier: "%.1f") lbs)")
                    Text("Height: \(PRank.heightFt, specifier: "%.2f") ft")
                }

                Divider()

                Text("Personal Records (PRs)")
                    .font(.headline)
                VStack(alignment: .leading, spacing: 8) {
                    if isForMen {
                        if let benchPressKg = PRank.prBenchPressKg, let benchPressLbs = PRank.prBenchPressLbs {
                            Text("Bench Press: \(benchPressKg, specifier: "%.1f") kg (\(benchPressLbs, specifier: "%.1f") lbs)")
                        }
                    } else if let hipThrustKg = PRank.prHipThrustKg {
                        Text("Hip Thrust: \(hipThrustKg, specifier: "%.1f") kg (\(hipThrustKg * 2.20462, specifier: "%.1f") lbs)")
                    }
                    if let squatKg = PRank.prBarbellSquatKg, let squatLbs = PRank.prBarbellSquatLbs {
                        Text("Barbell Squat: \(squatKg, specifier: "%.1f") kg (\(squatLbs, specifier: "%.1f") lbs)")
                    }
                }
            }
            .padding()
        }
        .navigationTitle(PRank.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
